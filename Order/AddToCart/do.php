<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-11
 * Time: 1:02 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Order',
    'REQUEST_NAME'   => 'AddToCart',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Goods', 'Order'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'common/JiaBase.php',
        'lib/lib_goods.php'
    ),
    'NEED_EXCHANGE_RATE' => false
);

require '../../Bricklayer/Bricker.php';
