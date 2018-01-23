<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class ForgetPassword extends \Bricker\RequestLifeCircle
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
        
        $user = db_get_user_info('email', $toEmail);
        if ($user) {
            $toName = $user['user_name'];
        }
        
        $template = db_get_mail_template('send_password');
        
        $content = $template['template_content'];
        
        $config = get_mail_config();
        
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