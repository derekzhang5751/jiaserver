<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class ModifyPassword extends JiaBase
{
    private $userId;
    private $oldPasswd;
    private $newPasswd;
    private $uuid;

    private $return = [
        'result' => false,
        'msg' => ''
    ];

    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : '';
        $this->oldPasswd = isset($_POST['oldpassword']) ? trim($_POST['oldpassword']) : '';
        $this->newPasswd = isset($_POST['newpassword']) ? trim($_POST['newpassword']) : '';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';

        if (empty($this->userId)) {
            return false;
        }
        if (empty($this->oldPasswd)) {
            return false;
        }
        if (empty($this->newPasswd)) {
            return false;
        }
        if (empty($this->uuid)) {
            return false;
        }
        
        return true;
    }

    protected function process() {
        // get user password info
        $passInfo = db_get_user_passwd_info_by_userid($this->userId);
        if (!$passInfo || $passInfo['is_validated'] != '1') {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['user_not_exist'];
            return true;
        }
        
        // check old password
        $ec_salt = $passInfo['ec_salt'];
        if (empty($passInfo['salt'])) {
            if ($passInfo['password'] == compile_password(array('password'=>$this->oldPasswd, 'ec_salt'=>$ec_salt))) {
                if (empty($ec_salt)) {
                    $ec_salt = rand(1, 9999);
                }
                $new_password = md5(md5($this->newPasswd).$ec_salt);
                db_update_user_password_ecsalt($passInfo['user_id'], $new_password, $ec_salt);
                $this->return['result'] = true;
            } else {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['old_password_error'];
            }
        } else {
            /* 如果salt存在，使用salt方式加密验证，验证通过洗白用户密码 */
            $encrypt_type = substr($passInfo['salt'], 0, 1);
            $encrypt_salt = substr($passInfo['salt'], 1);

            /* 计算加密后密码 */
            $encrypt_password = '';
            switch ($encrypt_type)
            {
                case ENCRYPT_ZC :
                    $encrypt_password = md5($encrypt_salt.$this->oldPasswd);
                    break;
                /* 如果还有其他加密方式添加到这里  */
                //case other :
                //  ----------------------------------
                //  break;
                case ENCRYPT_UC :
                    $encrypt_password = md5(md5($this->oldPasswd).$encrypt_salt);
                    break;

                default:
                    $encrypt_password = '';
            }

            if ($passInfo['password'] != $encrypt_password) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['old_password_error'];
            } else {
                $newPassword = compile_password( array('password' => $this->newPasswd) );
                db_update_user_password_salt($passInfo['user_id'], $newPassword, '');

                $this->return['result'] = true;
            }
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