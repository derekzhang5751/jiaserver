<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:59 PM
 */

function db_get_user_signin_info($name_or_email, $value)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'user_name', 'password', 'salt', 'ec_salt'],
        [
            $name_or_email => $value,
            'is_validated' => 1
        ]
    );
    return $user;
}

function db_get_user_info($name_or_email, $value)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'email', 'user_name', 'sex', 'birthday', 'reg_time'],
        [$name_or_email => $value]);
    return $user;
}

function db_get_user_passwd_info_by_userid($userId)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'user_name', 'password', 'salt', 'ec_salt', 'is_validated'],
        [
            'user_id' => $userId
        ]
    );
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

function db_get_my_cart_list($userId, $maxSize)
{
    $cartList = $GLOBALS['db']->select('cart',
        [
            '[>]goods' => ['goods_id' => 'goods_id'],
        ],
        [
            'cart.rec_id','cart.goods_id','cart.goods_sn','cart.goods_name','cart.goods_price',
            'cart.goods_number','cart.goods_attr','goods.shop_price','goods.goods_thumb'
        ],
        [
            'user_id' => $userId,
            'ORDER' => ['rec_id' => 'ASC'],
            'LIMIT' => $maxSize
        ]
    );
    return $cartList;
}

function db_has_user_name_takenup($userName)
{
    return $GLOBALS['db']->has('users', 
            [
                'user_name' => $userName,
                'is_validated' => 1
            ]);
}

function db_has_user_email_takenup($email)
{
    return $GLOBALS['db']->has('users', 
            [
                'email' => $email,
                'is_validated' => 1
            ]);
}

function db_has_admin_name_takenup($userName)
{
    return $GLOBALS['db']->has('admin_user', 
            [
                'user_name' => $userName
            ]);
}

function db_delete_user_invalidate($userName)
{
    $data = $GLOBALS['db']->delete('users', 
            [
                'user_name' => $userName,
                'is_validated' => 0
            ]);
    return $data->rowCount();
}

function db_insert_user($user)
{
    $data = [
        'email' => $user['email'],
        'user_name' => $user['user_name'],
        'password' => $user['password'],
        'birthday' => $user['birthday'],
        'sex' => $user['sex'],
        'mobile_phone' => $user['mobile'],
        'reg_time' => time()
    ];
    $stat = $GLOBALS['db']->insert('users', $data);
    if ($stat->rowCount() == 1) {
        return $GLOBALS['db']->id();
    } else {
        return false;
    }
}

/**
 * 获取邮件模板
 *
 * @access  public
 * @param:  $tpl_name[string]       模板代码
 *
 * @return array
 */
function db_get_mail_template($tpl_name)
{
    $template = $GLOBALS['db']->get('mail_templates',
        ['template_subject', 'is_html', 'template_content'],
        [
            'template_code' => $tpl_name
        ]
    );
    return $template;
}

function db_get_mail_config($code)
{
    $rec = $GLOBALS['db']->get('shop_config', ['value'], ['code' => $code]);
    if ($rec) {
        return $rec['value'];
    } else {
        return '';
    }
}
