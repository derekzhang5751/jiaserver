<?php

/* 密码加密方法 */
define('PWD_MD5',                   1);  //md5加密方式
define('PWD_PRE_SALT',              2);  //前置验证串的加密方式
define('PWD_SUF_SALT',              3);  //后置验证串的加密方式
/* 加密方式 */
define('ENCRYPT_ZC',                1); //zc加密方式
define('ENCRYPT_UC',                2); //uc加密方式

/**
 *  编译密码函数
 *
 * @access  public
 * @param   array   $cfg 包含参数为 $password, $md5password, $salt, $type
 *
 * @return void
 */
function compile_password ($cfg)
{
    if (isset($cfg['password']))
    {
        $cfg['md5password'] = md5($cfg['password']);
    }
    if (empty($cfg['type']))
    {
        $cfg['type'] = PWD_MD5;
    }

    switch ($cfg['type'])
    {
        case PWD_MD5 :
            if(!empty($cfg['ec_salt']))
            {
                return md5($cfg['md5password'].$cfg['ec_salt']);
            }
            else
            {
                return $cfg['md5password'];
            }

        case PWD_PRE_SALT :
            if (empty($cfg['salt']))
            {
                $cfg['salt'] = '';
            }

            return md5($cfg['salt'] . $cfg['md5password']);

        case PWD_SUF_SALT :
            if (empty($cfg['salt']))
            {
                $cfg['salt'] = '';
            }

            return md5($cfg['md5password'] . $cfg['salt']);

        default:
            return '';
    }
}
