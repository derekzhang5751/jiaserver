<?php

define('USE_BRICKER', true);

require '../Bricklayer/Bricker.php';
require '../lib/lib_user.php';
require './common.php';


$action  = isset($_REQUEST['act']) ? trim($_REQUEST['act']) : 'error';

if ($action == 'signin') {
    // User sign in
    $userName = $_POST['username'];
    $password = $_POST['password'];
    $uuid     = $_POST['uuid'];
    
    $gBricker->applog('user', 'User signin with username='.$userName.', password='.$password);
    
    $retUser = user_signin_check($userName, $password);
    
    if ($retUser['result'] == true) {
        $userId = $retUser['userid'];
        user_signin_update($userId);
        
        jsonResponse('success', '', ['userid' => $userId]);
    } else {
        jsonResponse('fail', $retUser['msg']);
    }
}
elseif ($action == 'signup') {
    // User sign up
}
elseif ($action == 'userinfo') {
    // get user info
    $userName = $_POST['username'];
    $uuid     = $_POST['uuid'];

    if (isset($userName) && !empty($userName)) {
        $ret = get_user_info($userName);
        if ($ret['result'] == true) {
            jsonResponse('success', '', $ret['user']);
        } else {
            jsonResponse('fail', $ret['msg']);
        }
    } else {
        jsonResponse('fail', 'Invalid Request !');
    }
}
else {
    // error
    exit("Invalid Request !!");
}
