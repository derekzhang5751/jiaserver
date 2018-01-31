<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-30
 * Time: 1:02 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Order',
    'REQUEST_NAME'   => 'CleanCart',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Order'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
