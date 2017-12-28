<?php

/**
 * 方圆支付基础类
 */

class ottpay
{
    protected $logPath = '/Users/derek/WebProjects/jiajiajia/jiaserver/log/home/error.log';
    //protected $logPath = '/usr/local/apache2/htdocs/log/home/error.log';
    /**
     * 生成支付代码
     * @param   array   $order      订单信息
     * @param   array   $payment    支付方式信息
     */
    public function get_code($order, $payment) {return false;}

    /**
     * 响应操作
     */
    public function respond() {return false;}

    /**
     * 查询汇率
     */
    public function getRealtimeExRate($currency='') {
        $code = 'CAD';
        if ($currency) {
            $code = $currency;
        }
        $data = array(
            'fee_type' => $code,
        );
        $param = '';
        foreach ($data AS $key => $val) {
            $param = $param . $val;
        }
        $sign = strtoupper( md5($param) );
        $merchantKey = '92FCB317059B87EB';
        $aesKey = strtoupper( substr( md5($sign . $merchantKey), 8, 16 ) );
        reset($data);
        $jsonStr = json_encode($data);
        $dataEncrypted = $this->aesEncrypt($jsonStr, $aesKey);

        $parameter = array(
            'action'        => 'EX_RATE_QUERY',
            'version'       => '1.0',
            'merchant_id'   => 'ON00002896',
            'data'          => $dataEncrypted,
            'md5'           => $sign
        );

        $output = $this->postRequest($parameter);
        //error_log("\n[OTTPAY]EXCHANGE_RATE: " . $output, 3, $this->logPath);
        if ($output === false) {
            return false;
        }

        $fields = json_decode($output, true);
        $respCode = $fields['rsp_code'];
        $respMsg = $fields['rsp_msg'];
        $respData = $fields['data'];
        $respMd5 = $fields['md5'];

        if ($respCode == 'SUCCESS') {
            $respAesKey = strtoupper(substr(md5($respMd5 . $merchantKey), 8, 16));
            $dataResp = $this->aesDecrypt($respData, $respAesKey);
            //error_log("\n[OTTPAY]DATA: " . $dataResp, 3, $this->logPath);

            $dataFields = json_decode($dataResp, true);
            if (is_array($dataFields)) {
                return $dataFields['rate'];
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * AES 加密方法
     * @param string $str
     * @return string
     */
    protected function aesEncrypt($str, $aesKey) {
        $screct_key = $aesKey;

        $str = trim($str);
        $str = $this->addPKCS7Padding($str);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
        $encrypt_str = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $screct_key, $str, MCRYPT_MODE_ECB, $iv);
        $date = base64_encode($encrypt_str);
        return $date;
    }

    protected function aesDecrypt($str, $key) {
        $date = base64_decode($str);
        $screct_key = $key;
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
        $encrypt_str =  mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $screct_key, $date, MCRYPT_MODE_ECB, $iv);
        $encrypt_str = preg_replace('/[\x00-\x1F]/','', $encrypt_str);
        return $encrypt_str;
    }

    protected function addPKCS7Padding($source) {
        $source = trim($source);
        $block = mcrypt_get_block_size('rijndael-128', 'ecb');
        $pad = $block - (strlen($source) % $block);
        if ($pad <= $block) {
            $char = chr($pad);
            $source .= str_repeat($char, $pad);
        }
        return $source;
    }

    protected function formatAmount($amount) {
        $f = floatval($amount) * 100;
        $i = intval($f);
        return strval($i);
    }
    protected function unFormatAmount($amount) {
        $f = floatval($amount) / 100;
        $amt = number_format($f, 2, '.', '');
        return $amt;
    }

    protected function postRequest($parameter, $url=false) {
        $dstUrl = 'https://frontapi.ottpay.com:443/process';
        if ($url) {
            $dstUrl = $url;
        }

        $postData = json_encode($parameter);
        $headers = array(
            'Content-Type: application/json',
        );
        //error_log("\n[WECHATPAY]PostData: ".$postData, 3, $this->logPath);

        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $dstUrl );
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, $headers );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
        curl_setopt ( $ch, CURLOPT_POST, true );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $postData );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, 2 );
        $output = curl_exec ( $ch );
        //error_log("\n[WECHATPAY]Response: ".$output, 3, $this->logPath);
        if (curl_errno($ch) || $output === false) {
            curl_close($ch);
            return false;
        }
        curl_close($ch);
        return $output;
    }
}

?>