<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-16
 * Time: 11:30 AM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Order',
    'REQUEST_NAME'   => 'MyList',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Common', 'Goods'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'common/JiaBase.php',
        'lib/lib_goods.php'
    ),
    'NEED_EXCHANGE_RATE' => true
);

require '../../Bricklayer/Bricker.php';
