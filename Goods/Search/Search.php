<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 8:40 PM
 */

class Search extends JiaBase
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
        $maxSize = 200;
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
                $goodsList = db_search_goods_list($this->searchValue, $maxSize);
            }
        }
        
        if ($goodsList) {
            $this->return['result'] = true;
            $index = 0;
            foreach ($goodsList as $goods) {
                $this->return['goodslist'][$index]['goods_id'] = $goods['goods_id'];
                $this->return['goodslist'][$index]['goods_sn'] = $goods['goods_sn'];
                $this->return['goodslist'][$index]['goods_name'] = $goods['goods_name'];
                $this->return['goodslist'][$index]['shop_price'] = $this->adapterPrice( $goods['shop_price'] );
                $promotePrice = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $this->return['goodslist'][$index]['promote_price'] = $this->adapterPrice( $promotePrice );
                $this->return['goodslist'][$index]['goods_thumb'] = $goods['goods_thumb'];
                $this->return['goodslist'][$index]['goods_img'] = $goods['goods_img'];
                $this->return['goodslist'][$index]['cat_name'] = $goods['cat_name'];
                $this->return['goodslist'][$index]['brand_name'] = $goods['brand_name'];

                $index++;
            }
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_empty'];
            //$this->return['msg'] = $GLOBALS['db']->last();
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