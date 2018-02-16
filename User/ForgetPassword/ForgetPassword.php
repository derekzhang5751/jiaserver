<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class ForgetPassword extends JiaBase
{
    private $userName;
    private $email;
    private $uuid;

    private $return = [
        'result' => false,
        'msg' => ''
    ];

    protected function prepareRequestParams() {
        $this->userName = isset($_POST['username']) ? trim($_POST['username']) : '';
        $this->email = isset($_POST['email']) ? trim($_POST['email']) : '';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        
        /*if (empty($this->userName)) {
            return false;
        }*/
        if (empty($this->email)) {
            return false;
        }
        if (empty($this->uuid)) {
            return false;
        }
        
        return true;
    }

    protected function process() {
        $toEmail = $this->email;
        $toName = '';
        $userId = '0';
        $regTime = '';
        
        $user = db_get_user_info('email', $toEmail);
        if ($user) {
            $toName = $user['user_name'];
            $userId = $user['user_id'];
            $regTime = $user['reg_time'];
        }
        
        $template = db_get_mail_template('send_password');
        
        $config = get_mail_config();
        
        $code = md5($userId . $config['HASH_CODE'] . $regTime);
        $reset_email = 'http://' . $_SERVER['SERVER_NAME'] . '/user.php?act=get_password&uid=' . $userId . '&code=' . $code;
        
        $content = $template['template_content'];
        $content = str_replace('{$user_name}',   $toName, $content);
        $content = str_replace('{$reset_email}', $reset_email, $content);
        $content = str_replace('{$shop_name}',   $config['SENDER_NAME'], $content);
        $content = str_replace('{$send_date}',   date('Y-m-d'), $content);
        $content = str_replace('{$sent_date}',   date('Y-m-d'), $content);
        
        //$GLOBALS['log']->log('user', 'Send mail, To Name: '.$toName);
        //$GLOBALS['log']->log('user', 'Send mail, To Email: '.$toEmail);
        //$GLOBALS['log']->log('user', 'Send mail, Subject: '.$template['template_subject']);
        //$GLOBALS['log']->log('user', 'Send mail, Content: '.$content);
        //$GLOBALS['log']->log('user', 'Send mail, IsHtml: '.$template['is_html']);
        //$GLOBALS['log']->log('user', 'Send mail, Config: '. print_r($config, true));
        
        $ret = \Bricker\send_mail($toName, $toEmail, $template['template_subject'], $content, $config, $template['is_html']);
        if ($ret) {
            $this->return['result'] = true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['send_email_error'];
        }
        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '');
        } else {
            $this->jsonResponse('fail', $this->return['msg']);
        }
    }

    protected function responseWeb() {
        exit('Not support !!');
    }

    protected function responseMobile() {
        exit('Not support !!');
    }
}