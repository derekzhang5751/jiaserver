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
    'REQUEST_NAME'   => 'Signin',
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
        'common/JiaSession.php',
        'common/JiaBase.php',
        'lib/lib_common.php'
    ),
    'NEED_EXCHANGE_RATE' => false
);

require '../../Bricklayer/Bricker.php';
