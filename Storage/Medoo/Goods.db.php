<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-11
 * Time: 9:23 PM
 */

function db_get_goods_attr($goods_attr_id_array, $sort = 'asc')
{
    $sql = "SELECT a.attr_type, v.attr_value, v.goods_attr_id
            FROM ecs_attribute AS a
            LEFT JOIN ecs_goods_attr AS v
                ON v.attr_id = a.attr_id
                AND a.attr_type = 1
            WHERE v.goods_attr_id " . db_create_in($goods_attr_id_array) . "
            ORDER BY a.attr_id $sort";

    return $GLOBALS['db']->query($sql)->fetchAll();
}

function db_get_products_info($goods_id, $goods_attr)
{
    //$sql = "SELECT * FROM " .$GLOBALS['ecs']->table('products'). " WHERE goods_id = '$goods_id' AND goods_attr = '$goods_attr' LIMIT 0, 1";
    $return_array = $GLOBALS['db']->get('products',
        ['product_id', 'goods_id', 'goods_attr', 'product_sn', 'product_number'],
        ['goods_id' => $goods_id, 'goods_attr' => $goods_attr]);
    return $return_array;
}

function db_get_volume_price_list($goods_id, $price_type = '1')
{
    $sql = "SELECT `volume_number` , `volume_price`".
        " FROM ecs_volume_price".
        " WHERE `goods_id` = '" . $goods_id . "' AND `price_type` = '" . $price_type . "'".
        " ORDER BY `volume_number`";

    return $GLOBALS['db']->query($sql)->fetchAll();
}

function db_get_final_price($goods_id)
{
    $_SESSION['discount'] = 1;
    $_SESSION['user_rank'] = '';

    $sql = "SELECT g.promote_price, g.promote_start_date, g.promote_end_date, ".
        "IFNULL(mp.user_price, g.shop_price * '" . $_SESSION['discount'] . "') AS shop_price ".
        " FROM ecs_goods AS g ".
        " LEFT JOIN ecs_member_price AS mp ".
        "ON mp.goods_id = g.goods_id AND mp.user_rank = '" . $_SESSION['user_rank']. "' ".
        " WHERE g.goods_id = '" . $goods_id . "'" .
        " AND g.is_delete = 0";

    $res = $GLOBALS['db']->query($sql)->fetchAll();
    if ($res) {
        $goods = $res[0];
        return $goods;
    } else {
        return false;
    }
}

function db_get_goodslist_best($maxSize)
{
    $goodsList = $GLOBALS['db']->select('goods',
        ['goods_id','goods_name','shop_price','promote_price','promote_start_date','promote_end_date','goods_thumb','goods_img'],
        ['is_on_sale' => 1,
            'is_alone_sale' => 1,
            'is_delete' => 0,
            'is_best' => 1,
            'ORDER' => ['sort_order'=>'DESC', 'last_update'=>'DESC'],
            'LIMIT' => $maxSize]);
    return $goodsList;
}

function db_get_goods_category($parentId, $maxSize)
{
    $categoryList = $GLOBALS['db']->select('category',
        ['cat_id','cat_name'],
        ['is_show' => 1,
            'parent_id' => $parentId,
            'ORDER' => ['sort_order'=>'ASC'],
            'LIMIT' => $maxSize]);
    return $categoryList;
}

function db_get_goods_detail($goodsId)
{
    $goods = $GLOBALS['db']->get('goods',
        ['goods_id','goods_sn','goods_name','shop_price','promote_price','promote_start_date','promote_end_date','goods_desc', 'goods_thumb','goods_img'],
        ['goods_id' => $goodsId]);
    return $goods;
}

function db_get_goods_gallery($goodsId, $maxSize)
{
    $imgList = $GLOBALS['db']->select('goods_gallery',
        ['img_url','img_original','img_desc'],
        ['goods_id' => $goodsId,
            'ORDER' => ['img_id'=>'ASC'],
            'LIMIT' => $maxSize]);
    return $imgList;
}

function db_has_child_category($categoryId)
{
    $where = array(
        'parent_id' => $categoryId
    );
    return $GLOBALS['db']->has('category', $where);
}


/**
 * Database Assistant Functions
 */

/**
 * 创建像这样的查询: "IN('a','b')";
 *
 * @access   public
 * @param    mix      $item_list      列表数组或字符串
 * @param    string   $field_name     字段名称
 *
 * @return   void
 */
function db_create_in($item_list, $field_name = '')
{
    if (empty($item_list))
    {
        return $field_name . " IN ('') ";
    }
    else
    {
        if (!is_array($item_list))
        {
            $item_list = explode(',', $item_list);
        }
        $item_list = array_unique($item_list);
        $item_list_tmp = '';
        foreach ($item_list AS $item)
        {
            if ($item !== '')
            {
                $item_list_tmp .= $item_list_tmp ? ",'$item'" : "'$item'";
            }
        }
        if (empty($item_list_tmp))
        {
            return $field_name . " IN ('') ";
        }
        else
        {
            return $field_name . ' IN (' . $item_list_tmp . ') ';
        }
    }
}
