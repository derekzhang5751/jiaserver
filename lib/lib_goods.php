<?php

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
