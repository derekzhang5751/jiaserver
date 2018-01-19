<?php
define('USE_BRICKER', true);

$LifeCfg = array(
    'MODULE_NAME'    => 'User',
    'REQUEST_NAME'   => 'Address',
    'LANG'           => 'zh_cn',
    'SESSION_CLASS'  => 'JiaSession',
    'DB_TYPE'        => 'Medoo',
    'LOAD_DB'        => array(
        'Session', 'User'
    ),
    'LOAD_LIB'       => array(
        'Bricklayer/Lib/network.php',
        //'Bricklayer/Lib/email.php',
        'common/constants.php',
        'common/JiaSession.php',
        //'lib/lib_goods.php'
    )
);

require '../../Bricklayer/Bricker.php';
