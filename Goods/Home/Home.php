<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 10:07 PM
 */

class Home extends \Bricker\RequestLifeCircle
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
        $maxSize = 100;
        $goodsList = db_get_goodslist_best($maxSize);

        if ($goodsList) {
            $this->return['result'] = true;
            $index = 0;
            foreach ($goodsList as $goods) {
                $this->return['goodslist'][$index]['goods_id'] = $goods['goods_id'];
                $this->return['goodslist'][$index]['goods_name'] = $goods['goods_name'];
                $this->return['goodslist'][$index]['shop_price'] = $goods['shop_price'];
                $this->return['goodslist'][$index]['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $this->return['goodslist'][$index]['goods_thumb'] = $goods['goods_thumb'];
                $this->return['goodslist'][$index]['goods_img'] = $goods['goods_img'];

                $index++;
            }
            return true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_empty'];
            //$gBricker->applog('goods', 'get_goodslist_best ERROR:'.$error);
            return false;
        }
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