<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-06
 * Time: 09:00 PM
 */
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'Goods',
    'REQUEST_NAME'   => 'CommentPost',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'Comment', 'Goods'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        'common/constants.php',
        'common/JiaSession.php'
    )
);

require '../../Bricklayer/Bricker.php';
