<?php
/**
 * User: Derek
 * Date: 2018-02-20
 * Time: 11:20 AM
 */

class Checkout extends JiaBase
{
    private $userId;
    private $uuid;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'checkout' => []
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
        $maxSize = 100;
        // get goods in the cart
        $cartList = db_get_my_cart_list($this->userId, $maxSize);
        if ($cartList) {
            $i = 0;
            $totalFee = 0.0;
            $goodsList = array();
            foreach ($cartList as $goods) {
                $goodsList[$i]['rec_id'] = $goods['rec_id'];
                $goodsList[$i]['goods_id'] = $goods['goods_id'];
                $goodsList[$i]['goods_sn'] = $goods['goods_sn'];
                $goodsList[$i]['goods_name'] = $goods['goods_name'];
                $goodsList[$i]['goods_number'] = $goods['goods_number'];
                $goodsList[$i]['goods_attr'] = explode("\n", $goods['goods_attr']);
                $goodsList[$i]['shop_price'] = $this->adapterPrice( $goods['shop_price'] );
                $goodsList[$i]['goods_price'] = $this->adapterPrice( $goods['goods_price'] );
                $promotePrice = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                $goodsList[$i]['promote_price'] = $this->adapterPrice($promotePrice);
                $goodsList[$i]['goods_thumb'] = $goods['goods_thumb'];
                
                // shipping fee and duty
                $shippingFee = $this->getShippingFeeByGoodsId($goods['goods_id'], $goods['shop_price'], $goods['goods_number']);
                $goodsList[$i]['shipping_fee'] = $this->adapterPrice( $shippingFee['shipping_fee'] );
                $goodsList[$i]['duty'] = $this->adapterPrice( $shippingFee['duty'] );
                
                // total fee
                $promotePrice = floatval($promotePrice);
                if ($promotePrice > 0.0) {
                    $totalFee = $totalFee + $promotePrice;
                } else {
                    $totalFee = $totalFee + floatval($goodsList[$i]['shop_price']);
                }
                $totalFee = $totalFee + floatval($goodsList[$i]['shipping_fee']);
                $totalFee = $totalFee + floatval($goodsList[$i]['duty']);
                $i++;
            }
            $this->return['checkout']['cartlist'] = $goodsList;
            $this->return['checkout']['total'] = $totalFee;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['cart_empty'];
            return true;
        }
        
        // get default consignee
        $address = db_get_default_address($this->userId);
        if ($address) {
            $this->return['checkout']['address'][0] = $address;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['address_empty'];
            return true;
        }
        
        // get all payments enabled
        $payments = db_get_payment_list_enabled();
        if ($payments) {
            $i = 0;
            $paymentList = array();
            foreach ($payments as $pay) {
                $paymentList[$i]['pay_id'] = $pay['pay_id'];
                $paymentList[$i]['pay_code'] = $pay['pay_code'];
                $paymentList[$i]['pay_name'] = $pay['pay_name'];
                $paymentList[$i]['pay_fee'] = $pay['pay_fee'];
                $paymentList[$i]['pay_desc'] = $pay['pay_desc'];
                $paymentList[$i]['is_online'] = $pay['is_online'];
                $i++;
            }
            $this->return['checkout']['paymentlist'] = $paymentList;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['payment_not_exist'];
            return true;
        }
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['checkout']);
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
    
    private function getShippingFeeByGoodsId($goodsId, $goodsPrice, $number) {
        $fee = array(
            'free' => true,
            'shipping_fee' => 0.0,
            'duty' => 0.0
        );
        $goodsId = intval($goodsId);
        $goods = db_get_goods_info($goodsId);
        if ($goods) {
            if ($goods['is_shipping'] == '0') {
                // 获取运费参数
                $feeId = intval( $goods['shipfee_id'] );
                $feeSet = db_get_shipping_feeset($feeId);
                if ($feeSet) {
                    $fee['free'] = false;
                    $fee['shipping_fee'] = $this->priceShippingFee($goods['goods_weight'], $number, $feeSet);
                    $fee['duty']         = floatval($goodsPrice) * floatval($feeSet['tax']) / 100;
                }
            }
        }
        
        return $fee;
    }
    
    private function priceShippingFee($weight, $number, $feeSet) {
        $price = 0.0;
        $weight         = floatval($weight);
        $number         = floatval($number);
        $baseWeight     = floatval($feeSet['base_weight']);
        $baseFee        = floatval($feeSet['base_fee']);
        $increaseWeight = floatval($feeSet['increase_weitht']);
        $increaseFee    = floatval($feeSet['increase_fee']);

        $weight = $weight * $number;
        if ($weight > $baseWeight) {
            $inc = $weight - $baseWeight;
            $price = $baseFee + (ceil($inc / $increaseWeight) * $increaseFee);
        } else {
            $price = $baseFee;
        }

        return $price;
    }
    
}