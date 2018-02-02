<?php
/**
 * Description of EditAddress
 *
 * @author Derek
 */
class EditAddress extends \Bricker\RequestLifeCircle {
    private $userId;
    private $uuid;
    private $address = array(
        'address_id' => '',
        'user_id' => '',
        'consignee' => '',
        'email' => '',
        'country' => '',
        'province' => '',
        'city' => '',
        'district' => '',
        'address' => '',
        'zipcode' => '',
        'tel' => '',
        'idcard_a' => '',
        'idcard_b' => ''
    );
    
    private $return = [
        'result' => false,
        'msg' => '',
        'data' => [
            'addressid' => 0
        ]
    ];
    
    protected function prepareRequestParams() {
        $this->userId    = isset($_POST['userid']) ? trim($_POST['userid']) : '0';
        $this->uuid      = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        $addressId = isset($_POST['addressid']) ? trim($_POST['addressid']) : '0';
        $country   = isset($_POST['country']) ? trim($_POST['country']) : '0';
        $province  = isset($_POST['province']) ? trim($_POST['province']) : '0';
        $city      = isset($_POST['city']) ? trim($_POST['city']) : '0';
        $district  = isset($_POST['district']) ? trim($_POST['district']) : '0';
        $consignee = isset($_POST['consignee']) ? trim($_POST['consignee']) : '';
        $address   = isset($_POST['address']) ? trim($_POST['address']) : '';
        $tel       = isset($_POST['tel']) ? trim($_POST['tel']) : '';
        $zipcode   = isset($_POST['zipcode']) ? trim($_POST['zipcode']) : '';
        $email     = isset($_POST['email']) ? trim($_POST['email']) : '';
        
        $this->userId = intval($this->userId);
        if ($this->userId <= 0) {
            return false;
        }
        $this->address['user_id'] = $this->userId;
        
        $addressId = intval($addressId);
        if ($addressId < 0) {
            return false;
        }
        $this->address['address_id'] = $addressId;
        
        $country = intval($country);
        if ($country <= 0) {
            return false;
        }
        $this->address['country'] = $country;
        
        $province = intval($province);
        if ($province <= 0) {
            return false;
        }
        $this->address['province'] = $province;
        
        $city = intval($city);
        if ($city <= 0) {
            return false;
        }
        $this->address['city'] = $city;
        
        $district = intval($district);
        if ($district <= 0) {
            return false;
        }
        $this->address['district'] = $district;
        
        if (empty($consignee)) {
            return false;
        }
        $this->address['consignee'] = $consignee;
        
        if (empty($address)) {
            return false;
        }
        $this->address['address'] = $address;
        
        if (empty($tel)) {
            return false;
        }
        $this->address['tel'] = $tel;
        
        if (empty($zipcode)) {
            return false;
        }
        $this->address['zipcode'] = $zipcode;
        
        $this->address['email'] = $email;
        
        return true;
    }
    
    protected function process() {
        if ($this->address['address_id'] === 0) {
            // add a new address
            $addressId = db_insert_my_address($this->address);
            if ($addressId) {
                $this->return['result'] = true;
                $this->return['data']['addressid'] = $addressId;
            } else {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['insert_address_error'];
            }
        } else {
            // update the address
            $ret = db_update_my_address($this->address);
            if ($ret) {
                $this->return['result'] = true;
                $this->return['data']['addressid'] = $this->address['address_id'];
            } else {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['update_address_error'];
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
