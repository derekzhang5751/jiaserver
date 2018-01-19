<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-13
 * Time: 2:59 PM
 */

function db_get_user_signin_info($name_or_email, $value)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'user_name', 'password', 'salt', 'ec_salt'],
        [$name_or_email => $value]);
    return $user;
}

function db_update_user_password_ecsalt($userId, $password, $ec_salt)
{
    $GLOBALS['db']->update('users',
        [
            'password' => $password,
            'ec_salt'  => $ec_salt
        ], [
            'user_id'  => $userId
        ]
    );
}

function db_update_user_password_salt($userId, $password, $salt)
{
    $GLOBALS['db']->update('users',
        [
            'password' => $password,
            'salt'  => $salt
        ], [
            'user_id'  => $userId
        ]
    );
}

function db_update_user_signin_info($userId)
{
    $state = $GLOBALS['db']->update('users', [
        'visit_count[+]' => 1,
        'last_ip' => \Bricker\client_real_ip(),
        'last_login' => time()
    ], [
        'user_id' => $userId
    ]);

    if ($state->rowCount() > 0) {
        return true;
    } else {
        return false;
    }
}

function db_get_user_info($name_or_email, $value)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'email', 'user_name', 'sex', 'birthday'],
        [$name_or_email => $value]);
    return $user;
}

function db_get_my_collection($userId, $maxSize)
{
    $collection = $GLOBALS['db']->select('collect_goods',
        [
            '[>]goods' => ['goods_id' => 'goods_id'],
            //'[>]member_price' => ['goods_id' => 'goods_id']
        ],
        [
            'collect_goods.rec_id', 'goods.goods_id','goods.goods_name','goods.shop_price',
            'goods.promote_price','goods.promote_start_date','goods.promote_end_date',
            'goods.goods_thumb'
        ],
        [
            'collect_goods.user_id' => $userId,
            'ORDER' => ['collect_goods.rec_id'=>'DESC'],
            'LIMIT' => $maxSize
        ]
    );
    return $collection;
}

function db_get_my_address($userId, $maxSize)
{
    $address = $GLOBALS['db']->select('user_address',
        [
            'address_id','consignee','email','address','tel','idcard_a'
        ],
        [
            'user_id' => $userId,
            'ORDER' => ['address_id' => 'ASC'],
            'LIMIT' => $maxSize
        ]
    );
    return $address;
}
