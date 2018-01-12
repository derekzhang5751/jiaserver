<?php
/**
 * Created by PhpStorm.
 * User: derek
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
        'Session', 'Goods'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
