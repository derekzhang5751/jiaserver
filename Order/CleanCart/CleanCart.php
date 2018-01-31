<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-30
 * Time: 1:02 PM
 */
class CleanCart extends \Bricker\RequestLifeCircle
{
    private $userId = 0;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => ''
    ];
    
    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : 0;
        $this->uuid   = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        
        if ($this->userId <= 0)
            return false;
        
        return true;
    }
    
    protected function process() {
        $count = db_delete_all_goods_in_cart($this->userId);
        if ($count > 0) {
            $this->return['msg'] = "Delete $count items.";
        } else {
            //$this->return['msg'] = $GLOBALS['db']->last();
            $this->return['msg'] = $GLOBALS['db']->error();
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
