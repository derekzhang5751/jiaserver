<?php
/**
 * User: Derek
 * Date: 2018-02-22
 * Time: 10:20 AM
 */

class Done extends JiaBase {
    private $userId;
    private $uuid;
    private $consigneeId;
    private $postScript;
    private $payment;
    private $howOos;
    private $order;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'orderId' => '0'
    ];
    
    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : '0';
        $this->userId = intval($this->userId);
        if ($this->userId <= 0) {
            return false;
        }
        
        $this->uuid = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        if (empty($this->uuid)) {
            return false;
        }
        
        $this->consigneeId = isset($_POST['consignee']) ? trim($_POST['consignee']) : '0';
        $this->consigneeId = intval($this->consigneeId);
        if ($this->consigneeId <= 0) {
            return false;
        }
        
        $this->postScript = isset($_POST['postscript']) ? htmlspecialchars($_POST['postscript']) : '';
        if ($this->postScript == 'undefined') {
            $this->postScript = '';
        }
        
        $this->payment = isset($_POST['payment']) ? trim($_POST['payment']) : '0';
        $this->payment = intval($this->payment);
        if ($this->payment <= 0) {
            return false;
        }
        
        $this->howOos = isset($_POST['howoos']) ? intval($_POST['howoos']) : 0;
        
        return true;
    }
    
    protected function process() {
        $this->order['user_id'] = $this->userId;
        $this->order['order_status'] = OS_UNCONFIRMED;
        $this->order['shipping_status'] = SS_UNSHIPPED;
        $this->order['pay_status'] = PS_UNPAYED;
        $this->order['shipping_id'] = -1;
        $this->order['shipping_name'] = '国际快递';
        $this->order['from_ad'] = 0;
        $this->order['referer'] = 'MOBILE';
        $this->order['add_time'] = time();
        
        // prepare consignee and address
        $address = db_get_address_by_id( $this->consigneeId );
        if ( $address ) {
            $this->order['consignee'] = $address['consignee'];
            $this->order['country']   = $address['country'];
            $this->order['province']  = $address['province'];
            $this->order['city']      = $address['city'];
            $this->order['district']  = $address['district'];
            $this->order['address']   = $address['address'];
            $this->order['zipcode']   = $address['zipcode'];
            $this->order['tel']       = $address['tel'];
            $this->order['mobile']    = $address['mobile'];
            $this->order['email']     = $address['email'];
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['consignee_not_exist'];
            return true;
        }
        
        // prepare post script 0 ~ 255
        $this->order['postscript'] = substr($this->postScript, 0, 255);
        
        // prepare payment
        $payment = db_get_payment_by_id( $this->payment );
        if ( $payment ) {
            $this->order['pay_id'] = $payment['pay_id'];
            $this->order['pay_name'] = $payment['pay_name'];
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['payment_not_exist'];
            return true;
        }
        
        // prepare status description
        $this->order['how_oos'] = isset($_LANG['oos'][$this->howOos]) ? addslashes($_LANG['oos'][$this->howOos]) : '';
        
        // prepare goods's price
        $cartList = db_get_my_cart_list($this->userId, 100);
        if ($cartList) {
            $i = 0;
            $totalGoods = 0.0;
            $totalShipping = 0.0;
            $totalDuty = 0.0;
            $totalAmount = 0.0;
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
                    $totalGoods = $totalGoods + $promotePrice;
                } else {
                    $totalGoods = $totalGoods + floatval($goodsList[$i]['shop_price']);
                }
                $totalShipping = $totalShipping + floatval($goodsList[$i]['shipping_fee']);
                $totalDuty = $totalDuty + floatval($goodsList[$i]['duty']);
                $i++;
            }
            $totalAmount = $totalGoods + $totalShipping + $totalDuty;
            $this->order['goods_amount'] = $totalGoods;
            $this->order['shipping_fee'] = $totalShipping + $totalDuty;
            $this->order['order_amount'] = $totalAmount;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['cart_empty'];
            return true;
        }
        
        /* Save order info */
        $this->order['order_sn'] = generate_order_sn();
        $orderId = db_insert_order($this->order);
        if ($orderId) {
            $this->return['orderId'] = $orderId;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['order_save_error'];
            $GLOBALS['log']->log('order', 'Insert order error: '.$GLOBALS['db']->error());
            return true;
        }
        
        /* Save order goods */
        $ret = db_insert_order_goods_from_cart($orderId, $this->userId);
        if (!$ret) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['order_save_error'];
            $GLOBALS['log']->log('order', 'Insert goods in the order error: '.$GLOBALS['db']->error());
            return true;
        }
        
        /* If need, send notify email */
        
        /* Clean cart */
        db_delete_all_goods_in_cart($this->userId);
        
        /* Insert order log */
        db_insert_pay_log($orderId, $this->order['order_amount']);
        
        /* 取得支付信息，生成支付代码 */
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['orderId']);
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
