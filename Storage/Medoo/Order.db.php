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

function db_delete_all_goods_in_cart($userId, $sessionId)
{
    $stat = $GLOBALS['db']->delete('cart',
        [
            'user_id' => $userId,
            'session_id' => $sessionId
        ]
    );
    $row = $stat->rowCount();
    if ($row > 0) {
        return $row;
    } else {
        return false;
    }
}
