<?php

/**
 * 微信支付插件
 */

if (!defined('IN_ECS'))
{
    die('Hacking attempt');
}

require(dirname(__FILE__) . '/ottpay.php');

$payment_lang = ROOT_PATH . 'languages/' .$GLOBALS['_CFG']['lang']. '/payment/wechatpay.php';

if (file_exists($payment_lang))
{
    global $_LANG;

    include_once($payment_lang);
}

/* 模块的基本信息 */
if (isset($set_modules) && $set_modules == TRUE)
{
    $i = isset($modules) ? count($modules) : 0;

    /* 代码 */
    $modules[$i]['code']    = basename(__FILE__, '.php');

    /* 描述对应的语言项 */
    $modules[$i]['desc']    = 'wechatpay_desc';

    /* 是否支持货到付款 */
    $modules[$i]['is_cod']  = '0';

    /* 是否支持在线支付 */
    $modules[$i]['is_online']  = '1';

    /* 作者 */
    $modules[$i]['author']  = 'JIA TEAM';

    /* 网址 */
    $modules[$i]['website'] = 'https://pay.weixin.qq.com';

    /* 版本号 */
    $modules[$i]['version'] = '1.0.0';

    /* 配置信息 */
    $modules[$i]['config']  = array(
        array('name' => 'wechatpay_account',           'type' => 'text',   'value' => ''),
        array('name' => 'wechatpay_key',               'type' => 'text',   'value' => ''),
        array('name' => 'wechatpay_partner',           'type' => 'text',   'value' => ''),
        array('name' => 'wechatpay_pay_method',        'type' => 'select', 'value' => '')
    );

    return;
}

/**
 * 类
 */
class wechatpay extends ottpay
{
    /**
     * 构造函数
     *
     * @access  public
     * @param
     *
     * @return void
     */
    
    function __construct()
    {
    }

    /**
     * 生成支付代码
     * @param   array   $order      订单信息
     * @param   array   $payment    支付方式信息
     */
    public function get_code($order, $payment)
    {
        //$amount = $this->RMB2CAD( $order['order_amount'] );
        $amount = $this->formatAmount( $order['order_amount'] );
        $data = array(
            'order_id'      => $order['order_sn'],
            'amount'        => $amount,
            'biz_type'      => 'WECHATPAY',
            'call_back_url' => return_url(basename(__FILE__, '.php')),
        );

        ksort($data);
        reset($data);

        $param = '';
        foreach ($data AS $key => $val) {
            $param = $param . $val;
        }
        $sign = strtoupper( md5($param) );

        $aesKey = strtoupper( substr( md5($sign . $payment['wechatpay_key']), 8, 16 ) );
        reset($data);
        $jsonStr = json_encode($data);
        $dataEncrypted = $this->aesEncrypt($jsonStr, $aesKey);

        $parameter = array(
            'action'        => 'ACTIVEPAY',
            'version'       => '1.0',
            'merchant_id'   => $payment['wechatpay_partner'],
            'data'          => $dataEncrypted,
            'md5'           => $sign
        );

        $output = $this->postRequest($parameter);
        if ($output === false) {
            return false;
        }

        $fields = json_decode($output, true);
        $respCode = $fields['rsp_code'];
        $respMsg = $fields['rsp_msg'];
        $respData = $fields['data'];
        $respMd5 = $fields['md5'];

        global $smarty;
        if ($respCode == 'SUCCESS') {
            $respAesKey = strtoupper(substr(md5($respMd5 . $payment['wechatpay_key']), 8, 16));
            $dataResp = $this->aesDecrypt($respData, $respAesKey);
            //error_log("\n[WECHATPAY]Resp Decrypt Data: ".$dataResp, 3, $this->logPath);

            $dataFields = json_decode($dataResp, true);
            $qrUrl = $dataFields['code_url'];
            $orderId = $dataFields['order_id'];
            error_log("\n[WECHATPAY]Resp Code Url: " . $qrUrl, 3, $this->logPath);
            error_log("\n[WECHATPAY]Resp Order Id: " . $orderId, 3, $this->logPath);

            if ($orderId == $order['order_sn']) {
                $smarty->assign('qrUrl', $qrUrl);
                $button = '<div style="text-align:center">' .
                    '<div id="output"></div>' .
                    '<br><h2>请扫描二维码进行支付</h2>' .
                    '</div>';
            } else {
                $smarty->assign('qrUrl', '');
                $button = '<div style="text-align:center">' .
                    '<div id="output"></div>' .
                    '<br><h2>获取二维码失败：订单号不匹配!</h2>' .
                    '</div>';
            }
        } else {
            $smarty->assign('qrUrl', '');
            $button = '<div style="text-align:center">' .
                '<div id="output"></div>' .
                '<br><h2>获取二维码失败：'.$respMsg.'</h2>' .
                '</div>';
        }

        return $button;
    }

    /**
     * 响应操作
     */
    public function respond()
    {
        $postData = file_get_contents('php://input', 'r');
        //error_log("\n[WECHATPAY]POST BODY: ".$postData, 3, $this->logPath);

        $postFields = json_decode($postData, true);
        $md5 = $postFields['md5'];
        $data = $postFields['data'];
        $rsp_code = $postFields['rsp_code'];
        $merchant_id = $postFields['merchant_id'];
        $rsp_msg = $postFields['rsp_msg'];

        $payment  = get_payment($_GET['code']);
        $aesKey = strtoupper( substr( md5($md5 . $payment['wechatpay_key']), 8, 16 ) );
        $dataResp = $this->aesDecrypt($data, $aesKey);

        //echo $dataResp . "\n";
        $dataFields = json_decode($dataResp, true);
        $amount = $dataFields['amount'];
        $finish_time = $dataFields['finish_time'];
        $order_id = $dataFields['order_id'];
        $tip = $dataFields['tip'];

        $order_sn = trim($order_id);
        $logId = get_order_id_by_sn($order_sn);

        /* 检查支付的金额是否相符 */
        $amount = $this->unFormatAmount( $amount );
        if (!check_money($logId, $amount)) {
            error_log("\n[WECHATPAY]Amount is not match: " . $amount, 3, $this->logPath);
            return false;
        }

        /* 检查数字签名是否正确 */
        ksort($dataFields);
        reset($dataFields);

        $sign = '';
        foreach ($dataFields AS $key => $val) {
            if ($key != 'md5' && $key != 'code') {
                $sign = $sign . $val;
            }
        }
        $sign = strtoupper( md5($sign) );
        if ($sign != $md5) {
            error_log("\n[WECHATPAY]Sign is error: " . $sign, 3, $this->logPath);
            return false;
        }

        if ($rsp_code == 'SUCCESS') {
            /* 改变订单状态 */
            order_paid($logId, PS_PAYED);

            return true;
        }
        else
        {
            return false;
        }
    }

}

?>