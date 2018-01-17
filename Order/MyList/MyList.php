<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-16
 * Time: 11:30 AM
 */

class MyList extends \Bricker\RequestLifeCircle
{
    private $userId;
    private $uuid;

    private $return = [
        'result' => false,
        'msg' => '',
        'orderlist' => []
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
        $orderList = db_get_order_list($this->userId, $maxSize);

        if ($orderList) {
            $i = 0;
            foreach ($orderList as $order) {
                $status = $GLOBALS['LANG']['os'][$order['order_status']] . ',' .
                    $GLOBALS['LANG']['ps'][$order['pay_status']] . ',' .
                    $GLOBALS['LANG']['ss'][$order['shipping_status']];

                $this->return['orderlist'][$i]['order_id'] = $order['order_id'];
                $this->return['orderlist'][$i]['order_sn'] = $order['order_sn'];
                $this->return['orderlist'][$i]['order_status'] = $status;
                $this->return['orderlist'][$i]['order_amount'] = $order['order_amount'];
                $this->return['orderlist'][$i]['add_time'] = date('Y-m-d H:i:s', $order['add_time']);

                $thumb = db_get_order_thumb($order['order_id']);
                if ($thumb) {
                    $this->return['orderlist'][$i]['thumb'] = $thumb['thumb'];
                } else {
                    $this->return['orderlist'][$i]['thumb'] = '';
                }

                $i++;
            }
            $this->return['result'] = true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['order_list_empty'];
        }
        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['orderlist']);
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