<?php
/**
 * Description of Collection
 *
 * @author Derek
 */
class Collection extends JiaBase {
    private $userId;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'collection' => []
    ];
    
    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : '0';
        $this->uuid     = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        
        $this->userId = intval($this->userId);
        if ($this->userId <= 0) {
            return false;
        }
        if (empty($this->uuid)) {
            return false;
        }
        
        return true;
    }
    
    protected function process() {
        $maxSize = 200;
        $collection = db_get_my_collection($this->userId, $maxSize);
        
        if ($collection) {
            $index = 0;
            foreach ($collection as $goods) {
                $this->return['collection'][$index]['goods_id'] = $goods['goods_id'];
                $this->return['collection'][$index]['goods_sn'] = $goods['goods_sn'];
                $this->return['collection'][$index]['goods_name'] = $goods['goods_name'];
                $this->return['collection'][$index]['shop_price'] = $this->adapterPrice( $goods['shop_price'] );
                $promotePrice = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $this->return['collection'][$index]['promote_price'] = $this->adapterPrice( $promotePrice );
                $this->return['collection'][$index]['goods_thumb'] = $goods['goods_thumb'];
                $this->return['collection'][$index]['goods_img'] = $goods['goods_img'];
                $this->return['collection'][$index]['cat_name'] = $goods['cat_name'];
                $this->return['collection'][$index]['brand_name'] = $goods['brand_name'];

                $index++;
            }
            $this->return['result'] = true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['collection_empty'];
            //$this->return['msg'] = $GLOBALS['db']->error();
        }
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['collection']);
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
