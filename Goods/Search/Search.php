<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-13
 * Time: 8:40 PM
 */

class Search extends \Bricker\RequestLifeCircle
{
    private $searchType;
    private $searchValue;

    private $return = [
        'result' => false,
        'msg' => '',
        'goodslist' => []
    ];

    protected function prepareRequestParams() {
        $searchType = isset($_POST['search_type']) ? trim($_POST['search_type']) : '0';
        $this->searchType = intval($searchType);
        if ($this->searchType < SEARCH_TEXT) {
            $this->searchType = SEARCH_TEXT;
        }

        $this->searchValue = isset($_POST['search_value']) ? trim($_POST['search_value']) : '';

        return true;
    }

    protected function process() {
        $maxSize = 100;
        $goodsList = array();

        if ( empty($this->searchValue) ) {
            // default goods list that recommended
            $goodsList = db_get_goodslist_new($maxSize);
        } else {
            if ($this->searchType == SEARCH_CATEGORY) {
                // search goods by category
                $categoryId = intval($this->searchValue);
                $goodsList = db_get_goodslist_by_category($categoryId, $maxSize);
            } else {
                // search goods by content
            }
        }

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