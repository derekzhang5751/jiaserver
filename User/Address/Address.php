<?php
/**
 * Description of Address
 *
 * @author Derek
 */
class Address extends JiaBase {
    private $userId;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'addresslist' => []
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
        $maxSize = 5;
        $addressList = db_get_my_address($this->userId, $maxSize);
        
        if ($addressList) {
            $this->return['addresslist'] = $addressList;
            $this->return['result'] = true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['address_empty'];
            //$this->return['msg'] = $GLOBALS['db']->error();
        }
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['addresslist']);
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
