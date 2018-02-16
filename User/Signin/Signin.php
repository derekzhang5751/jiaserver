<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class Signin extends JiaBase
{
    private $userName;
    private $password;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'user' => [
            'userid' => 0
        ]
    ];
    
    protected function prepareRequestParams() {
        $this->userName = isset($_POST['username']) ? trim($_POST['username']) : '';
        $this->password = isset($_POST['password']) ? trim($_POST['password']) : '';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';

        if (empty($this->userName)) {
            return false;
        }
        if (empty($this->password)) {
            return false;
        }
        if (empty($this->uuid)) {
            return false;
        }

        return true;
    }
    
    protected function process() {
        $isEmail = \Bricker\email_address_check($this->userName);
        if ($isEmail === true) {
            $checkFieldName = 'email';
        } else {
            $checkFieldName = 'user_name';
        }
        
        $user = db_get_user_signin_info($checkFieldName, $this->userName);
        
        if ($user) {
            $loginOk = false;
            $ec_salt = $user['ec_salt'];
            if (empty($user['salt'])) {
                if ($user['password'] == compile_password(array('password'=>$this->password, 'ec_salt'=>$ec_salt))) {
                    if (empty($ec_salt)) {
                        $ec_salt = rand(1, 9999);
                        $new_password = md5(md5($this->password).$ec_salt);
                        
                        db_update_user_password_ecsalt($user['user_id'], $new_password, $ec_salt);
                    }
                    $this->return['result'] = true;
                    $this->return['user']['userid'] = $user['user_id'];
                    $loginOk = true;
                } else {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['password_error'];
                }
            } else {
                /* 如果salt存在，使用salt方式加密验证，验证通过洗白用户密码 */
                $encrypt_type = substr($user['salt'], 0, 1);
                $encrypt_salt = substr($user['salt'], 1);
                
                /* 计算加密后密码 */
                $encrypt_password = '';
                switch ($encrypt_type)
                {
                    case ENCRYPT_ZC :
                        $encrypt_password = md5($encrypt_salt.$this->password);
                        break;
                    /* 如果还有其他加密方式添加到这里  */
                    //case other :
                    //  ----------------------------------
                    //  break;
                    case ENCRYPT_UC :
                        $encrypt_password = md5(md5($this->password).$encrypt_salt);
                        break;

                    default:
                        $encrypt_password = '';
                }
                
                if ($user['password'] != $encrypt_password) {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['password_error'];
                } else {
                    $newPassword = compile_password( array('password' => $this->password) );
                    db_update_user_password_salt($user['user_id'], $newPassword, '');
                    
                    $this->return['result'] = true;
                    $this->return['user']['userid'] = $user['user_id'];
                    $loginOk = true;
                }
            }
            
            if ($loginOk) {
                $GLOBALS['_SESSION']['user_id'] = $user['user_id'];
                $GLOBALS['_SESSION']['user_name'] = $user['user_name'];
                $GLOBALS['_SESSION']['discount'] = 1;
                db_update_user_session(SESSION_ID, $user['user_id'], $user['user_name']);
                db_update_user_signin_info($user['user_id']);
            }
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['user_not_exist'];
        }
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['user']);
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