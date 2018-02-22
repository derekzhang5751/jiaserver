<?php
/**
 * User: Derek
 * Date: 2018-02-22
 * Time: 10:19 AM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Order',
    'REQUEST_NAME'   => 'Done',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Common', 'User', 'Goods', 'Order'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'common/JiaBase.php',
        'lib/lib_goods.php',
        'lib/lib_order.php'
    ),
    'NEED_EXCHANGE_RATE' => true
);

require '../../Bricklayer/Bricker.php';
