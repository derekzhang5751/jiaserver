<?php
/**
 * Description of Collection
 *
 * @author Derek
 */
class Collection extends \Bricker\RequestLifeCircle {
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
            $i = 0;
            foreach ($collection as $goods) {
                $this->return['collection'][$i]['rec_id'] = $goods['rec_id'];
                $this->return['collection'][$i]['goods_id'] = $goods['goods_id'];
                $this->return['collection'][$i]['goods_name'] = $goods['goods_name'];
                $this->return['collection'][$i]['goods_thumb'] = $goods['goods_thumb'];
                $this->return['collection'][$i]['shop_price'] = number_format($goods['shop_price'], 2, '.', '');
                
                $promotePrice = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $this->return['collection'][$i]['promote_price'] = number_format($promotePrice, 2, '.', '');
                
                $i++;
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
