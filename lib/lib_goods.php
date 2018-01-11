<?php
require_once dirname(__FILE__) . '/lib_common.php';

function get_category_list() {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'categorylist' => []
    ];

    $categoryList = $gBricker->db->select('category',
        ['cat_id','cat_name'],
        ['is_show' => 1,
            'parent_id' => 0,
            'ORDER' => ['sort_order'=>'DESC'],
            'LIMIT' => 500]);

    if ($categoryList) {
        $return['result'] = true;
        $return['categorylist'] = $categoryList;
    } else {
        $error = print_r( $gBricker->db->error(), true );
        $return['result'] = false;
        $return['msg'] = $error;
        $gBricker->applog('goods', 'get_category_list ERROR:'.$error);
    }

    return $return;
}

function get_goodslist_best() {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'goodslist' => []
    ];

    $goodsList = $gBricker->db->select('goods',
        ['goods_id','goods_name','shop_price','promote_price','promote_start_date','promote_end_date','goods_thumb','goods_img'],
        ['is_on_sale' => 1,
            'is_alone_sale' => 1,
            'is_delete' => 0,
            'is_best' => 1,
            'ORDER' => ['sort_order'=>'DESC', 'last_update'=>'DESC'],
            'LIMIT' => 100]);

    if ($goodsList) {
        $return['result'] = true;
        $index = 0;
        foreach ($goodsList as $goods) {
            $return['goodslist'][$index]['goods_id'] = $goods['goods_id'];
            $return['goodslist'][$index]['goods_name'] = $goods['goods_name'];
            $return['goodslist'][$index]['shop_price'] = $goods['shop_price'];
            $return['goodslist'][$index]['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
            $return['goodslist'][$index]['goods_thumb'] = $goods['goods_thumb'];
            $return['goodslist'][$index]['goods_img'] = $goods['goods_img'];

            $index++;
        }
    } else {
        $error = print_r( $gBricker->db->error(), true );
        $return['result'] = false;
        $return['msg'] = $error;
        $gBricker->applog('goods', 'get_goodslist_best ERROR:'.$error);
    }

    return $return;
}

function get_goodslist_new() {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'goodslist' => []
    ];

    $goodsList = $gBricker->db->select('goods',
        ['goods_id','goods_name','shop_price','promote_price','promote_start_date','promote_end_date','goods_thumb','goods_img'],
        ['is_on_sale' => 1,
            'is_alone_sale' => 1,
            'is_delete' => 0,
            'is_new' => 1,
            'ORDER' => ['sort_order'=>'DESC', 'last_update'=>'DESC'],
            'LIMIT' => 100]);

    if ($goodsList) {
        $return['result'] = true;
        $index = 0;
        foreach ($goodsList as $goods) {
            $return['goodslist'][$index]['goods_id'] = $goods['goods_id'];
            $return['goodslist'][$index]['goods_name'] = $goods['goods_name'];
            $return['goodslist'][$index]['shop_price'] = $goods['shop_price'];
            $return['goodslist'][$index]['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
            $return['goodslist'][$index]['goods_thumb'] = $goods['goods_thumb'];
            $return['goodslist'][$index]['goods_img'] = $goods['goods_img'];

            $index++;
        }
    } else {
        $error = print_r( $gBricker->db->error(), true );
        $return['result'] = false;
        $return['msg'] = $error;
        $gBricker->applog('goods', 'get_goodslist_new ERROR:'.$error);
    }

    return $return;
}

function get_goods_detail($goodsId) {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'goods' => []
    ];

    $goods = $gBricker->db->get('goods',
        ['goods_id','goods_sn','goods_name','shop_price','promote_price','promote_start_date','promote_end_date','goods_desc', 'goods_thumb','goods_img'],
        ['goods_id' => $goodsId]);

    if ($goods) {
        $return['result'] = true;

        $return['goods']['goods_id'] = $goods['goods_id'];
        $return['goods']['goods_sn'] = $goods['goods_sn'];
        $return['goods']['goods_name'] = $goods['goods_name'];
        $return['goods']['shop_price'] = $goods['shop_price'];
        $return['goods']['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
        $return['goods']['goods_thumb'] = $goods['goods_thumb'];
        $return['goods']['goods_img'] = $goods['goods_img'];
        $return['goods']['goods_gallery'] = array();

        $desc = filterAddSelfDomain( $goods['goods_desc'] );
        $return['goods']['goods_desc'] = $desc;

        // 获取图片库
        $imgList = $gBricker->db->select('goods_gallery',
            ['img_url','img_original','img_desc'],
            ['goods_id' => $goodsId,
                'ORDER' => ['img_id'=>'ASC'],
                'LIMIT' => 10]);
        if ($imgList) {
            $index = 0;
            foreach ($imgList as $img) {
                $return['goods']['goods_gallery'][$index]['img_url'] = $img['img_url'];
                $return['goods']['goods_gallery'][$index]['img_original'] = $img['img_original'];
                $return['goods']['goods_gallery'][$index]['img_desc'] = $img['img_desc'];
                $index++;
            }
        }

    } else {
        $error = print_r( $gBricker->db->error(), true );
        $return['result'] = false;
        $return['msg'] = $error;
        $gBricker->applog('goods', 'get_goods_detail ERROR:'.$error);
    }

    return $return;
}

/**
 * 判断某个商品是否正在特价促销期
 *
 * @access  public
 * @param   float   $price      促销价格
 * @param   string  $start      促销开始日期
 * @param   string  $end        促销结束日期
 * @return  float   如果还在促销期则返回促销价，否则返回0
 */
function promote_price($price, $start, $end) {
    if ($price == 0) {
        return 0;
    } else {
        $time = time();
        if ($time >= $start && $time <= $end) {
            return $price;
        } else {
            return 0;
        }
    }
}

/**
 * 将 goods_attr_id 的序列按照 attr_id 重新排序
 *
 * 注意：非规格属性的id会被排除
 *
 * @access      public
 * @param       array       $goods_attr_id_array        一维数组
 * @param       string      $sort                       序号：asc|desc，默认为：asc
 *
 * @return      string
 */
function sort_goods_attr_id_array($goods_attr_id_array, $sort = 'asc')
{
    global $gBricker;
    if (empty($goods_attr_id_array))
    {
        return $goods_attr_id_array;
    }

    //重新排序
    $sql = "SELECT a.attr_type, v.attr_value, v.goods_attr_id
            FROM ecs_attribute AS a
            LEFT JOIN ecs_goods_attr AS v
                ON v.attr_id = a.attr_id
                AND a.attr_type = 1
            WHERE v.goods_attr_id " . db_create_in($goods_attr_id_array) . "
            ORDER BY a.attr_id $sort";

    $row = $gBricker->db->query($sql)->fetchAll();

    $return_arr = array();
    foreach ($row as $value)
    {
        $return_arr['sort'][]   = $value['goods_attr_id'];

        $return_arr['row'][$value['goods_attr_id']]    = $value;
    }

    return $return_arr;
}

/**
 * 取指定规格的货品信息
 *
 * @access      public
 * @param       string      $goods_id
 * @param       array       $spec_goods_attr_id
 * @return      array
 */
function get_products_info($goods_id, $spec_goods_attr_id)
{
    global $gBricker;
    $return_array = array();

    if (empty($spec_goods_attr_id) || !is_array($spec_goods_attr_id) || empty($goods_id))
    {
        return $return_array;
    }

    $goods_attr_array = sort_goods_attr_id_array($spec_goods_attr_id);

    if (isset($goods_attr_array['sort']))
    {
        $goods_attr = implode('|', $goods_attr_array['sort']);

        //$sql = "SELECT * FROM " .$GLOBALS['ecs']->table('products'). " WHERE goods_id = '$goods_id' AND goods_attr = '$goods_attr' LIMIT 0, 1";
        $return_array = $gBricker->db->get('products',
            ['product_id', 'goods_id', 'goods_attr', 'product_sn', 'product_number'],
            ['goods_id' => $goods_id, 'goods_attr' => $goods_attr]);
    }
    return $return_array;
}

/**
 * 获得指定的规格的价格
 *
 * @access  public
 * @param   mix     $spec   规格ID的数组或者逗号分隔的字符串
 * @return  void
 */
function spec_price($spec)
{
    global $gBricker;
    if (!empty($spec))
    {
        $where = db_create_in($spec, 'goods_attr_id');
        $sql = 'SELECT SUM(attr_price) AS attr_price FROM ' . $GLOBALS['ecs']->table('goods_attr') . " WHERE $where";

        $res = $gBricker->db->query($sql)->fetchAll();
        if ($res) {
            $price = floatval($res[0]['attr_price']);
        }
    }
    else
    {
        $price = 0;
    }

    return $price;
}

/**
 * 取得商品最终使用价格
 *
 * @param   string  $goods_id      商品编号
 * @param   string  $goods_num     购买数量
 * @param   boolean $is_spec_price 是否加入规格价格
 * @param   mix     $spec          规格ID的数组或者逗号分隔的字符串
 *
 * @return  商品最终购买价格
 */
function get_final_price($goods_id, $goods_num = '1', $is_spec_price = false, $spec = array())
{
    global $gBricker;
    $final_price   = '0'; //商品最终购买价格
    $volume_price  = '0'; //商品优惠价格
    $promote_price = '0'; //商品促销价格
    $user_price    = '0'; //商品会员价格

    //取得商品优惠价格列表
    $price_list   = get_volume_price_list($goods_id, '1');

    if (!empty($price_list))
    {
        foreach ($price_list as $value)
        {
            if ($goods_num >= $value['number'])
            {
                $volume_price = $value['price'];
            }
        }
    }

    //取得商品促销价格列表
    /* 取得商品信息 */
    $sql = "SELECT g.promote_price, g.promote_start_date, g.promote_end_date, ".
        "IFNULL(mp.user_price, g.shop_price * '" . $_SESSION['discount'] . "') AS shop_price ".
        " FROM ecs_goods AS g ".
        " LEFT JOIN ecs_member_price AS mp ".
        "ON mp.goods_id = g.goods_id AND mp.user_rank = '" . $_SESSION['user_rank']. "' ".
        " WHERE g.goods_id = '" . $goods_id . "'" .
        " AND g.is_delete = 0";

    $res = $gBricker->db->query($sql)->fetchAll();
    $goods = $res[0];

    /* 计算商品的促销价格 */
    if ($goods['promote_price'] > 0)
    {
        $promote_price = bargain_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
    }
    else
    {
        $promote_price = 0;
    }

    //取得商品会员价格列表
    $user_price    = $goods['shop_price'];

    //比较商品的促销价格，会员价格，优惠价格
    if (empty($volume_price) && empty($promote_price))
    {
        //如果优惠价格，促销价格都为空则取会员价格
        $final_price = $user_price;
    }
    elseif (!empty($volume_price) && empty($promote_price))
    {
        //如果优惠价格为空时不参加这个比较。
        $final_price = min($volume_price, $user_price);
    }
    elseif (empty($volume_price) && !empty($promote_price))
    {
        //如果促销价格为空时不参加这个比较。
        $final_price = min($promote_price, $user_price);
    }
    elseif (!empty($volume_price) && !empty($promote_price))
    {
        //取促销价格，会员价格，优惠价格最小值
        $final_price = min($volume_price, $promote_price, $user_price);
    }
    else
    {
        $final_price = $user_price;
    }

    //如果需要加入规格价格
    if ($is_spec_price)
    {
        if (!empty($spec))
        {
            $spec_price   = spec_price($spec);
            $final_price += $spec_price;
        }
    }

    //返回商品最终购买价格
    return $final_price;
}

/**
 * 取得商品优惠价格列表
 *
 * @param   string  $goods_id    商品编号
 * @param   string  $price_type  价格类别(0为全店优惠比率，1为商品优惠价格，2为分类优惠比率)
 *
 * @return  优惠价格列表
 */
function get_volume_price_list($goods_id, $price_type = '1')
{
    global $gBricker;
    $volume_price = array();
    $temp_index   = '0';

    $sql = "SELECT `volume_number` , `volume_price`".
        " FROM ecs_volume_price".
        " WHERE `goods_id` = '" . $goods_id . "' AND `price_type` = '" . $price_type . "'".
        " ORDER BY `volume_number`";

    $res = $gBricker->db->query($sql)->fetchAll();

    foreach ($res as $k => $v)
    {
        $volume_price[$temp_index]                 = array();
        $volume_price[$temp_index]['number']       = $v['volume_number'];
        $volume_price[$temp_index]['price']        = $v['volume_price'];
        $volume_price[$temp_index]['format_price'] = price_format($v['volume_price']);
        $temp_index ++;
    }
    return $volume_price;
}

/**
 * 判断某个商品是否正在特价促销期
 *
 * @access  public
 * @param   float   $price      促销价格
 * @param   string  $start      促销开始日期
 * @param   string  $end        促销结束日期
 * @return  float   如果还在促销期则返回促销价，否则返回0
 */
function bargain_price($price, $start, $end)
{
    if ($price == 0)
    {
        return 0;
    }
    else
    {
        $time = time(); // gmtime();
        if ($time >= $start && $time <= $end)
        {
            return $price;
        }
        else
        {
            return 0;
        }
    }
}

/**
 * 获得指定的商品属性
 *
 * @access      public
 * @param       array       $arr        规格、属性ID数组
 * @param       type        $type       设置返回结果类型：pice，显示价格，默认；no，不显示价格
 *
 * @return      string
 */
function get_goods_attr_info($arr, $type = 'pice')
{
    global $gBricker;
    $attr   = '';

    if (!empty($arr))
    {
        $fmt = "%s:%s[%s] \n";

        $sql = "SELECT a.attr_name, ga.attr_value, ga.attr_price ".
            "FROM ecs_goods_attr AS ga, ecs_attribute AS a ".
            "WHERE " .db_create_in($arr, 'ga.goods_attr_id')." AND a.attr_id = ga.attr_id";

        $res = $gBricker->db->query($sql)->fetchAll();

        foreach($res as $row) {
            $attr_price = round(floatval($row['attr_price']), 2);
            $attr .= sprintf($fmt, $row['attr_name'], $row['attr_value'], $attr_price);
        }

        $attr = str_replace('[0]', '', $attr);
    }

    return $attr;
}

/**
 *
 * 是否存在规格
 *
 * @access      public
 * @param       array       $goods_attr_id_array        一维数组
 *
 * @return      string
 */
function is_spec($goods_attr_id_array, $sort = 'asc')
{
    global $gBricker;
    if (empty($goods_attr_id_array))
    {
        return $goods_attr_id_array;
    }

    //重新排序
    $sql = "SELECT a.attr_type, v.attr_value, v.goods_attr_id
            FROM ecs_attribute AS a
            LEFT JOIN ecs_goods_attr AS v
                ON v.attr_id = a.attr_id
                AND a.attr_type = 1
            WHERE v.goods_attr_id " . db_create_in($goods_attr_id_array) . "
            ORDER BY a.attr_id $sort";

    $row = $gBricker->db->query($sql)->fetchAll();

    $return_arr = array();
    foreach ($row as $value)
    {
        $return_arr['sort'][]   = $value['goods_attr_id'];
        $return_arr['row'][$value['goods_attr_id']]    = $value;
    }

    if (!empty($return_arr)) {
        return true;
    } else {
        return false;
    }
}
