<?php

function get_goodslist_best() {
    global $gBricker;
    $return = [
        'result' => false,
        'msg' => '',
        'goodslist' => []
    ];

    $goodsList = $gBricker->db->select('goods',
        ['goods_id','goods_name','market_price','shop_price','goods_thumb','goods_img'],
        ['is_on_sale' => 1,
            'is_alone_sale' => 1,
            'is_delete' => 0,
            'is_best' => 1,
            'ORDER' => ['sort_order'=>'DESC', 'last_update'=>'DESC'],
            'LIMIT' => 10]);

    if ($goodsList) {
        $return['result'] = true;
        $return['goodslist'] = $goodsList;
    } else {
        $error = print_r( $gBricker->db->error(), true );
        $return['result'] = false;
        $return['msg'] = $error;
        $gBricker->applog('goods', 'get_goodslist_best ERROR:'.$error);
    }

    return $return;
}
