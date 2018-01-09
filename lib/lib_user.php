<?php

require_once BRICKER_PATH . '/Lib/email.php';
require_once BRICKER_PATH . '/Lib/network.php';
require_once dirname(__FILE__) . '/lib_common.php';


function user_signin_check($username, $password) {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'userid' => ''
    ];
    $isEmail = \Bricker\email_address_check($username);
    if ($isEmail === true) {
        $checkFieldName = 'email';
    } else {
        $checkFieldName = 'user_name';
    }

    $user = $gBricker->db->get('users',
        ['user_id', 'user_name', 'password', 'salt', 'ec_salt'],
        [$checkFieldName => $username]);

    if ($user) {
        $ec_salt = $user['ec_salt'];
        if (empty($user['salt'])) {
            if ($user['password'] == compile_password(array('password'=>$password,'ec_salt'=>$ec_salt))) {
                if (empty($ec_salt)) {
                    $ec_salt = rand(1, 9999);
                    $new_password = md5(md5($password).$ec_salt);
                    $gBricker->db->update('users',
                        [
                            'password' => $new_password,
                            'ec_salt' => $ec_salt
                        ], [
                            'user_id' => $user['user_id']
                        ]);
                }
                $return['result'] = true;
                $return['userid'] = $user['user_id'];
            } else {
                $return['result'] = false;
                $return['msg'] = '密码错误 !!!';
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
                    $encrypt_password = md5($encrypt_salt.$password);
                    break;
                /* 如果还有其他加密方式添加到这里  */
                //case other :
                //  ----------------------------------
                //  break;
                case ENCRYPT_UC :
                    $encrypt_password = md5(md5($password).$encrypt_salt);
                    break;

                default:
                    $encrypt_password = '';
            }

            if ($user['password'] != $encrypt_password) {
                $return['result'] = false;
                $return['msg'] = '密码错误 !!!';
            } else {
                $gBricker->db->update('users',
                    [
                        'password' => compile_password(array('password' => $password)),
                        'salt' => ''
                    ], [
                        'user_id' => $user['user_id']
                    ]);
                $return['result'] = true;
                $return['userid'] = $user['user_id'];
            }
        }
    } else {
        $return['result'] = false;
        $return['msg'] = '用户不存在 !!!';
    }
    return $return;
}

function user_signin_update($userId) {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => ''
    ];
    
    $state = $gBricker->db->update('users', [
        'visit_count[+]' => 1,
        'last_ip' => \Bricker\client_real_ip(),
        'last_login' => time()
    ], [
        'user_id' => $userId
    ]);
    
    if ($state->rowCount() > 0) {
        $return['result'] = true;
    } else {
        $return['result'] = false;
    }
    return $return;
}

function get_user_info($username)
{
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'user' => []
    ];
    $isEmail = \Bricker\email_address_check($username);
    if ($isEmail === true) {
        $checkFieldName = 'email';
    } else {
        $checkFieldName = 'user_name';
    }

    $user = $gBricker->db->get('users',
        ['user_id', 'email', 'user_name', 'sex', 'birthday'],
        [$checkFieldName => $username]);

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

    if ($user) {
        $return['result'] = true;
        $return['user'] = $user;
    } else {
        $return['result'] = false;
        $return['msg'] = '用户不存在 !!!';
    }
    return $return;
}
