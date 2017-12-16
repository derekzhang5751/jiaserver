<?php

/**
 * 微信支付插件
 */

if (!defined('IN_ECS'))
{
    die('Hacking attempt');
}

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
//        array('name' => 'wechatpay_real_method',       'type' => 'select', 'value' => '0'),
//        array('name' => 'wechatpay_virtual_method',    'type' => 'select', 'value' => '0'),
//        array('name' => 'is_instant',               'type' => 'select', 'value' => '0')
        array('name' => 'wechatpay_pay_method',        'type' => 'select', 'value' => '')
    );

    return;
}

/**
 * 类
 */
class wechatpay
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
    function get_code($order, $payment)
    {
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

        $dstUrl = 'https://frontapi.ottpay.com:443/process';
        $postData = json_encode($parameter);
        $headers = array(
            'Content-Type: application/json',
        );
        //error_log("\n[WECHATPAY]PostData: ".$postData, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');

        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $dstUrl );
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, $headers );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
        curl_setopt ( $ch, CURLOPT_POST, true );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $postData );
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        $output = curl_exec ( $ch );
        //error_log("\n[WECHATPAY]Response: ".$output, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');
        if (curl_errno($ch) || $output === false) {
            curl_close($ch);
            return false;
        }
        curl_close($ch);

        $fields = json_decode($output, true);
        $respCode = $fields['rsp_code'];
        $respMsg = $fields['rsp_msg'];
        $respData = $fields['data'];
        $respMd5 = $fields['md5'];

        global $smarty;
        if ($respCode == 'SUCCESS') {
            $respAesKey = strtoupper(substr(md5($respMd5 . $payment['wechatpay_key']), 8, 16));
            $dataResp = $this->aesDecrypt($respData, $respAesKey);
            //error_log("\n[WECHATPAY]Resp Decrypt Data: ".$dataResp, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');

            $dataFields = json_decode($dataResp, true);
            $qrUrl = $dataFields['code_url'];
            $orderId = $dataFields['order_id'];
            error_log("\n[WECHATPAY]Resp Code Url: " . $qrUrl, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');
            error_log("\n[WECHATPAY]Resp Order Id: " . $orderId, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');

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
    function respond()
    {
        if (!empty($_POST)) {
            foreach($_POST as $key => $data) {
                $_GET[$key] = $data;
                error_log("\n[WECHATPAY]CALL_BACK: ".$key."=".$data, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');
            }
        }
        $payment  = get_payment($_GET['code']);
        //$seller_email = rawurldecode($_GET['seller_email']);
        $order_sn = $_GET['order_id'];
        $order_sn = trim($order_sn);

        /* 检查支付的金额是否相符 */
        $amount = $this->unFormatAmount( $_GET['amount'] );
        if (!check_money($order_sn, $amount)) {
            error_log("\n[WECHATPAY]Amount is not match: " . $amount, 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');
            return false;
        }

        /* 检查数字签名是否正确 */
        ksort($_GET);
        reset($_GET);

        $sign = '';
        foreach ($_GET AS $key => $val) {
            if ($key != 'md5' && $key != 'code') {
                $sign = $sign . $val;
            }
        }
        $sign = $sign . $payment['wechatpay_key'];
        $sign = strtoupper( md5($sign) );
        if ($sign != $_GET['md5']) {
            error_log("\n[WECHATPAY]Sign is error: " . $_GET['md5'], 3, '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log');
            //return false;
        }

        if ($_GET['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
            /* 改变订单状态 */
            order_paid($order_sn, 2);

            return true;
        }
        elseif ($_GET['trade_status'] == 'TRADE_FINISHED')
        {
            /* 改变订单状态 */
            order_paid($order_sn);

            return true;
        }
        elseif ($_GET['trade_status'] == 'TRADE_SUCCESS')
        {
            /* 改变订单状态 */
            order_paid($order_sn, 2);

            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * AES 加密方法
     * @param string $str
     * @return string
     */
    private function aesEncrypt($str, $aesKey) {
        $screct_key = $aesKey;

        $str = trim($str);
        $str = $this->addPKCS7Padding($str);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
        $encrypt_str = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $screct_key, $str, MCRYPT_MODE_ECB, $iv);
        $date = base64_encode($encrypt_str);
        return $date;
    }

    private function aesDecrypt($str, $key) {
        $date = base64_decode($str);
        $screct_key = $key;
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
        $encrypt_str =  mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $screct_key, $date, MCRYPT_MODE_ECB, $iv);
        $encrypt_str = preg_replace('/[\x00-\x1F]/','', $encrypt_str);
        return $encrypt_str;
    }

    private function addPKCS7Padding($source) {
        $source = trim($source);
        $block = mcrypt_get_block_size('rijndael-128', 'ecb');
        $pad = $block - (strlen($source) % $block);
        if ($pad <= $block) {
            $char = chr($pad);
            $source .= str_repeat($char, $pad);
        }
        return $source;
    }

    private function formatAmount($amount) {
        $f = floatval($amount) * 100;
        $i = intval($f);
        return strval($i);
    }
    private function unFormatAmount($amount) {
        $f = floatval($amount);
        $amt = number_format($f, 2, '.', '');
        return $amt;
    }
}

?>