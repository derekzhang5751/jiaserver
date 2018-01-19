<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-19
 * Time: 11:30 AM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Order',
    'REQUEST_NAME'   => 'CartList',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'User'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
