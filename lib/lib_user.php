<?php

require_once BRICKER_PATH . '/Lib/email.php';
require_once BRICKER_PATH . '/Lib/network.php';

function user_signin_check($username, $password) {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'userid' => ''
    ];
    $isEmail = \Bricker\email_address_check($username);
    
    if ($isEmail === true) {
        // email address
        $user = $gBricker->db->get('users', ['user_id', 'user_name'], [
            'email'    => $username,
            'password' => $password]);
    } else {
        // username
        $user = $gBricker->db->get('users', ['user_id', 'email'], [
            'user_name' => $username,
            'password'  => $password]);
    }
    if ($user) {
        $return['result'] = true;
        $return['userid'] = $user['user_id'];
    } else {
        $return['result'] = false;
        $return['msg'] = 'User is not exist or the password error!';
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
