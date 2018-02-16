<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-13
 * Time: 2:58 PM
 */

class Signout extends JiaBase
{
    private $userId;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'data' => []
    ];
    
    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : '0';
        $this->uuid   = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        
        $this->userId = intval($this->userId);
        if ($this->userId <= 0) {
            return false;
        }
        
        return true;
    }
    
    protected function process() {
        db_update_user_session(SESSION_ID, 0, '');
        
        $this->return['result'] = true;
        
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '');
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