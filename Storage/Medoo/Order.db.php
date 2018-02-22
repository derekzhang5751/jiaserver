<?php
/**
 * User: Derek
 * Date: 2018-01-11
 * Time: 9:23 PM
 */

function db_get_goods_sell_info($goodsId)
{
    $goods = $GLOBALS['db']->get('goods',
        [
            '[>]member_price' => ['goods_id' => 'goods_id']
        ],
        [
            'goods.goods_name','goods.goods_sn','goods.is_on_sale','goods.is_real','goods.market_price','goods.shop_price',
            'goods.promote_price','goods.promote_start_date','goods.promote_end_date','goods.goods_weight',
            'goods.integral','goods.extension_code','goods.goods_number','goods.is_alone_sale','goods.is_shipping',
            'member_price.user_price'
        ],
        [
            'goods.goods_id' => $goodsId,
            'goods.is_delete' => 0
        ]
    );
    return $goods;
}

function db_if_parent_goods_exist_in_cart($parentId, $sessionId)
{
    return $GLOBALS['db']->has('cart',
                    [
                        'goods_id' => $parentId,
                        'session_id' => $sessionId,
                        'extension_code' => 'package_buy'
                    ]);
}

function db_get_specification_price($specIdArray)
{
    $total = $GLOBALS['db']->sum('goods_attr', 'attr_price',
        [
            "goods_attr_id" => $specIdArray,
        ]
    );
    return $total;
}

function db_get_goods_attr_info($attrArray)
{
    $attrInfo = $GLOBALS['db']->select('goods_attr',
        [
            '[>]attribute' => ['attr_id' => 'attr_id']
        ],
        [
            'attribute.attr_name',
            'goods_attr.attr_value','goods_attr.attr_price'
        ],
        [
            'goods_attr.goods_attr_id' => $attrArray
        ]
    );
    return $attrInfo;
}

function db_get_goods_group_price($goodsId, $goods_price, $parentId)
{
    $group = $GLOBALS['db']->select('group_goods',
        [
            'parent_id', 'goods_price'
        ],
        [
            'goods_id' => $goodsId,
            'parent_id' => $parentId,
            'goods_price[<]' => $goods_price,
            'ORDER' => [
                'goods_price' => 'ASC'
            ]
        ]
    );
    return $group;
}

function db_get_basic_count_list($basic_list)
{
    $sql = "SELECT goods_id, SUM(goods_number) AS count " .
                "FROM ecs_cart" .
                " WHERE session_id = '" . SESSION_ID . "'" .
                " AND parent_id = 0" .
                " AND extension_code <> 'package_buy' " .
                " AND goods_id " . db_create_in(array_keys($basic_list)) .
                " GROUP BY goods_id";
    //
    $basicCount = $GLOBALS['db']->query($sql)->fetchAll();
    return $basicCount;
}

function db_delete_all_gift_in_cart($userId, $sessionId)
{
    $stat = $GLOBALS['db']->delete('cart',
        [
            'user_id' => $userId,
            'session_id' => $sessionId,
            'is_gift[!]' => 0
        ]
    );
    $row = $stat->rowCount();
    if ($row > 0) {
        return $row;
    } else {
        return false;
    }
}

function db_delete_all_goods_in_cart($userId)
{
    $stat = $GLOBALS['db']->delete('cart',
        [
            'user_id' => $userId
        ]
    );
    $row = $stat->rowCount();
    if ($row > 0) {
        return $row;
    } else {
        return false;
    }
}

function db_delete_goods_in_cart($userId, $recId, $goodsId)
{
    $stat = $GLOBALS['db']->delete('cart',
        [
            'rec_id' => $recId,
            'user_id' => $userId,
            'goods_id' => $goodsId
        ]
    );
    $row = $stat->rowCount();
    if ($row > 0) {
        return $row;
    } else {
        return false;
    }
}

function db_insert_order($order)
{
    $stat = $GLOBALS['db']->insert('order_info', $order);
    if ($stat->rowCount() == 1) {
        return $GLOBALS['db']->id();
    } else {
        return false;
    }
}

function db_insert_order_goods_from_cart($orderId, $userId)
{
    $sql = "INSERT INTO ecs_order_goods( " .
            "order_id, goods_id, goods_name, goods_sn, product_id, goods_number, market_price, ".
            "goods_price, goods_attr, is_real, extension_code, parent_id, is_gift, goods_attr_id) ".
            " SELECT '$orderId', goods_id, goods_name, goods_sn, product_id, goods_number, market_price, ".
            "goods_price, goods_attr, is_real, extension_code, parent_id, is_gift, goods_attr_id".
            " FROM ecs_cart WHERE user_id = '".$userId."'";
    return $GLOBALS['db']->query($sql);
}

function db_get_payment_by_id($paymentId)
{
    $address = $GLOBALS['db']->get('payment',
        [
            'pay_id','pay_code','pay_name','pay_fee','pay_desc','pay_config','is_cod','is_online'
        ],
        [
            'pay_id' => $paymentId,
            'enabled' => 1
        ]
    );
    return $address;
}

function db_get_payment_list_enabled()
{
    $group = $GLOBALS['db']->select('payment',
        [
            'pay_id','pay_code','pay_name','pay_fee','pay_desc','pay_config','is_cod','is_online'
        ],
        [
            'enabled' => 1,
            'ORDER' => ['pay_order' => 'ASC']
        ]
    );
    return $group;
}

function db_insert_pay_log($orderId, $amount, $type=PAY_ORDER, $isPaid=0, $qrUrl='')
{
    $data = array(
        'order_id' => $orderId,
        'order_amount' => $amount,
        'order_type' => $type,
        'is_paid' => $isPaid,
        'qrurl' => $qrUrl
    );
    $stat = $GLOBALS['db']->insert('pay_log', $data);
    if ($stat->rowCount() == 1) {
        return $GLOBALS['db']->id();
    } else {
        return false;
    }
}
