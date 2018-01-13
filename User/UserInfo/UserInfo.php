<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class UserInfo extends \Bricker\RequestLifeCircle
{
    private $userName;
    private $uuid;

    private $return = [
        'result' => false,
        'msg' => '',
        'user' => []
    ];

    protected function prepareRequestParams() {
        $this->userName = isset($_POST['username']) ? trim($_POST['username']) : '';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';

        if (empty($this->userName)) {
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

        $user = db_get_user_info($checkFieldName, $this->userName);

        if ($user) {
            $sex = intval( $user['sex'] );
            switch ($sex) {
                case 1:
                    $user['sex'] = '男';
                    break;
                case 2:
                    $user['sex'] = '女';
                    break;
                default:
                    $user['sex'] = '保密';
                    break;
            }

            $this->return['result'] = true;
            $this->return['user'] = $user;
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