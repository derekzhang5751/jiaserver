<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-31
 * Time: 3:32 PM
 */
class DeleteFromCart extends JiaBase
{
    private $userId;
    private $uuid;
    private $cartId;
    private $goodsId;
    private $isCollect;

    private $return = [
        'result' => false,
        'msg' => ''
    ];
    
    protected function prepareRequestParams() {
        $this->userId    = isset($_POST['userid']) ? trim($_POST['userid']) : 0;
        $this->uuid      = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        $this->cartId    = isset($_POST['cartid']) ? trim($_POST['cartid']) : 0;
        $this->goodsId   = isset($_POST['goodsid']) ? trim($_POST['goodsid']) : 0;
        $this->isCollect = isset($_POST['collect']) ? trim($_POST['collect']) : 'no';
        
        $this->userId  = intval($this->userId);
        $this->cartId  = intval($this->cartId);
        $this->goodsId = intval($this->goodsId);
        
        if ($this->userId <= 0)
            return false;
        if ($this->cartId <= 0)
            return false;
        if ($this->goodsId <= 0)
            return false;
        
        return true;
    }
    
    protected function process() {
        if ($this->isCollect == 'Yes') {
            // add goods to collection
            if (!db_exist_user_id($this->userId)) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['user_not_exist'];
                return true;
            }
            if (!db_exist_goods_id($this->goodsId)) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['goods_not_exist'];
                return true;
            }
            $exist = db_exist_in_collection($this->userId, $this->goodsId);
            if (!$exist) {
                $ret = db_insert_to_collection($this->userId, $this->goodsId);
                if ($ret === false) {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['collect_error'];
                    return true;
                }
            }
        }
        
        // delete goods from cart
        $count = db_delete_goods_in_cart($this->userId, $this->cartId, $this->goodsId);
        if ($count === false) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['delete_error'];
            //$this->return['msg'] = $GLOBALS['db']->error();
            return true;
        }
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', $this->return['msg']);
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
