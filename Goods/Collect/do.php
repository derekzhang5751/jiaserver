<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-27
 * Time: 7:47 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Goods',
    'REQUEST_NAME'   => 'Collect',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'User', 'Goods'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        //'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
