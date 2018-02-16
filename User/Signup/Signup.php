<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class Signup extends JiaBase
{
    private $userName;
    private $email;
    private $password;
    private $uuid;
    private $birthday;
    private $sex;
    private $mobile;

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
        $this->email = isset($_POST['email']) ? trim($_POST['email']) : '';
        $this->birthday = isset($_POST['birthday']) ? trim($_POST['birthday']) : '';
        $this->sex = isset($_POST['sex']) ? trim($_POST['sex']) : '';
        $this->mobile = isset($_POST['mobile']) ? trim($_POST['mobile']) : '';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';

        if (empty($this->userName)) {
            return false;
        }
        if (empty($this->password)) {
            return false;
        }
        if (empty($this->email)) {
            return false;
        }
        if (empty($this->uuid)) {
            return false;
        }
        
        return true;
    }

    protected function process() {
        $isEmail = \Bricker\email_address_check($this->email);
        if ($isEmail === false) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['email_format_error'];
            return true;
        }
        
        if (db_has_user_name_takenup($this->userName) || db_has_admin_name_takenup($this->userName)) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['username_taken_up'];
            return true;
        }
        
        if (db_has_user_name_takenup($this->email)) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['email_taken_up'];
            return true;
        }
        
        // delete user which invalidate
        db_delete_user_invalidate($this->userName);
        
        // insert a new user record
        $user = array(
            'email'      => $this->email,
            'user_name'  => $this->userName,
            'password'   => compile_password(array('password'=>$this->password, 'ec_salt'=>'')),
            'birthday'   => '1980-01-01',
            'sex'        => 0,
            'mobile'     => ''
        );
        
        if (!empty($this->birthday)) {
            $user['birthday'] = $this->birthday;
        }
        if (!empty($this->sex)) {
            $user['sex'] = $this->sex;
        }
        if (!empty($this->mobile)) {
            $user['mobile'] = $this->mobile;
        }
        
        $userId = db_insert_user($user);
        if ($userId === false) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['signup_error'];
        } else {
            $this->return['result'] = true;
            $this->return['user']['userid'] = $userId;
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