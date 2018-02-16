<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-27
 * Time: 7:47 PM
 */

class Collect extends JiaBase
{
    private $userId;
    private $goodsId;
    private $collect;
    
    private $return = [
        'result' => false,
        'msg'    => '',
        'data'   => [
            'collect' => 'no'
        ]
    ];
    
    protected function prepareRequestParams() {
        $userId = isset($_REQUEST['userid']) ? trim($_REQUEST['userid']) : '0';
        $userId = intval($userId);
        if ($userId <= 0) {
            return false;
        }
        
        $goodsId = isset($_REQUEST['goodsid']) ? trim($_REQUEST['goodsid']) : '0';
        $goodsId = intval($goodsId);
        if ($goodsId <= 0) {
            return false;
        }
        
        $collect = isset($_REQUEST['collect']) ? trim($_REQUEST['collect']) : 'add';
        if ($collect == 'del') {
            $this->collect = 'del';
        } else {
            $this->collect = 'add';
        }
        
        $this->userId = $userId;
        $this->goodsId = $goodsId;
        return true;
    }
    
    protected function process() {
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
        if ($exist) {
            if ($this->collect == 'del') {
                // cannel collection
                $ret = db_delete_from_collection($this->userId, $this->goodsId);
                if ($ret === false) {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['uncollect_error'];
                } else {
                    $this->return['result'] = true;
                    $this->return['data']['collect'] = 'no';
                }
            } else {
                $this->return['result'] = true;
                $this->return['data']['collect'] = 'yes';
            }
        } else {
            if ($this->collect == 'add') {
                // add to collection
                $ret = db_insert_to_collection($this->userId, $this->goodsId);
                if ($ret === false) {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['collect_error'];
                } else {
                    $this->return['result'] = true;
                    $this->return['data']['collect'] = 'yes';
                }
            } else {
                $this->return['result'] = true;
                $this->return['data']['collect'] = 'no';
            }
        }
        
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['data']);
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