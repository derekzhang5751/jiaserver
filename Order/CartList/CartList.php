<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-19
 * Time: 11:30 AM
 */

class CartList extends \Bricker\RequestLifeCircle
{
    private $return = [
        'result' => false,
        'msg' => '',
        'cartlist' => []
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
        $cartList = db_get_my_cart_list($this->userId, $maxSize);

        if ($cartList) {
            $i = 0;
            foreach ($cartList as $goods) {
                $this->return['cartlist'][$i]['rec_id'] = $goods['rec_id'];
                $this->return['cartlist'][$i]['goods_id'] = $goods['goods_id'];
                $this->return['cartlist'][$i]['goods_sn'] = $goods['goods_sn'];
                $this->return['cartlist'][$i]['goods_name'] = $goods['goods_name'];
                $this->return['cartlist'][$i]['goods_number'] = $goods['goods_number'];
                $this->return['cartlist'][$i]['goods_attr'] = $goods['goods_attr'];
                $this->return['cartlist'][$i]['shop_price'] = number_format($goods['shop_price'], 2, '.', '');
                $this->return['cartlist'][$i]['goods_price'] = number_format($goods['goods_price'], 2, '.', '');
                $this->return['cartlist'][$i]['goods_thumb'] = $goods['goods_thumb'];

                $i++;
            }
            $this->return['result'] = true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['cart_empty'];
            //$this->return['msg'] = $GLOBALS['db']->error();
        }
        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['cartlist']);
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