<?php

define('USE_BRICKER', true);

require '../Bricklayer/Bricker.php';
require '../lib/lib_goods.php';
require './common.php';


$action  = isset($_REQUEST['act']) ? trim($_REQUEST['act']) : 'error';

if ($action == 'home') {
    // home page
    $gBricker->applog('goods', 'Mobile User go to home page.');

    $goodsList = get_goodslist_best();

    if ($goodsList['result'] === false) {
        jsonResponse('fail', 'Goods list is empty!');
    } else {
        jsonResponse('success', '', ['goodslist' => $goodsList['goodslist']]);
    }
}
elseif ($action == 'category') {
    // get category info
}
else {
    // error
    exit("Invalid Request !!");
}
