<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-06
 * Time: 09:23 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Goods',
    'REQUEST_NAME'   => 'CommentList',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Comment'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php',
        'common/JiaBase.php',
    ),
    'NEED_EXCHANGE_RATE' => false
);

require '../../Bricklayer/Bricker.php';
