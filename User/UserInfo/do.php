<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'User',
    'REQUEST_NAME'   => 'UserInfo',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'User'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'Bricklayer/Lib/email.php',
        'common/constants.php',
        'common/JiaSession.php'
    )
);

require '../../Bricklayer/Bricker.php';
