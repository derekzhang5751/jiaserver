<?php

define('USE_BRICKER', true);

require '../Bricklayer/Bricker.php';
require '../lib/lib_goods.php';
require '../lib/lib_order.php';
require './common.php';


$action  = isset($_REQUEST['act']) ? trim($_REQUEST['act']) : 'error';

if ($action == 'addtocart') {

    $goodsId = $_POST['goodsid'];
    $num     = $_POST['num'];
    $spec    = array();

    if (isset($goodsId) && !empty($goodsId)) {
        $ret = add_to_cart($goodsId, $num, $spec);
        if ($ret['result'] == true) {
            jsonResponse('success', '');
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
