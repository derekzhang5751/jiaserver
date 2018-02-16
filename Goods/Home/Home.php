<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-12
 * Time: 10:07 PM
 */

class Home extends JiaBase
{
    private $return = [
        'result' => false,
        'msg' => '',
        'goodslist' => []
    ];
    
    protected function prepareRequestParams() {
        return true;
    }
    
    protected function process() {
        $maxSize = 200;
        $goodsList = db_get_goodslist_best($maxSize);
        
        if ($goodsList) {
            $this->return['result'] = true;
            $index = 0;
            foreach ($goodsList as $goods) {
                $this->return['goodslist'][$index]['goods_id'] = $goods['goods_id'];
                $this->return['goodslist'][$index]['goods_sn'] = $goods['goods_sn'];
                $this->return['goodslist'][$index]['goods_name'] = $goods['goods_name'];
                $this->return['goodslist'][$index]['shop_price'] = $this->adapterPrice( $goods['shop_price'] );
                $promotePrice = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $this->return['goodslist'][$index]['promote_price'] = $this->adapterPrice($promotePrice);
                $this->return['goodslist'][$index]['goods_thumb'] = $goods['goods_thumb'];
                $this->return['goodslist'][$index]['goods_img'] = $goods['goods_img'];
                $this->return['goodslist'][$index]['cat_name'] = $goods['cat_name'];
                $this->return['goodslist'][$index]['brand_name'] = $goods['brand_name'];
                
                $index++;
            }
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_empty'];
        }
        
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['goodslist']);
        } else {
            $this->jsonResponse('fail', $this->return['msg']);
        }
    }
    
    protected function responseWeb() {
        exit('Not support !!');
    }
    
    protected function responseMobile() {
        exit('Not support !!');
    }
}