<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 10:07 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Article',
    'REQUEST_NAME'   => 'Find',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Article'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        //'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
