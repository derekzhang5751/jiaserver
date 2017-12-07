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
    $gBricker->applog('goods', 'Mobile User go to category page.');

    $categoryList = get_category_list();

    if ($categoryList['result'] === false) {
        jsonResponse('fail', 'Category list is empty!');
    } else {
        jsonResponse('success', '', ['categorylist' => $categoryList['categorylist']]);
    }
}
elseif ($action == 'find') {
    // get find info
    $gBricker->applog('goods', 'Mobile User go to find page.');

    $findList = get_goodslist_new();

    if ($findList['result'] === false) {
        jsonResponse('fail', 'Find list is empty!');
    } else {
        jsonResponse('success', '', ['findlist' => $findList['goodslist']]);
    }
}
elseif ($action == 'detail') {
    // get goods detail info
    $gBricker->applog('goods', 'Mobile User go to detail page.');

    $goodsId  = isset($_REQUEST['goodsid']) ? trim($_REQUEST['goodsid']) : '0';
    $goodsId = intval($goodsId);
    if ($goodsId <= 0) {
        exit("Invalid Request !!");
    }

    $goodsDetail = get_goods_detail($goodsId);

    if ($goodsDetail['result'] === false) {
        jsonResponse('fail', 'The goods is not exist!');
    } else {
        jsonResponse('success', '', ['goods' => $goodsDetail['goods']]);
    }
}
else {
    // error
    exit("Invalid Request !!");
}
