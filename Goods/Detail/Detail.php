<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-13
 * Time: 2:30 PM
 */

class Detail extends \Bricker\RequestLifeCircle
{
    private $goodId;
    private $return = [
        'result' => false,
        'msg' => '',
        'goods' => []
    ];

    protected function prepareRequestParams() {
        $goodsId  = isset($_REQUEST['goodsid']) ? trim($_REQUEST['goodsid']) : '0';
        $goodsId = intval($goodsId);
        if ($goodsId <= 0) {
            return false;
        }

        $this->goodId = $goodsId;
        return true;
    }

    protected function process() {
        $goods = db_get_goods_detail($this->goodId);

        if ($goods) {
            $this->return['result'] = true;

            $this->return['goods']['goods_id'] = $goods['goods_id'];
            $this->return['goods']['goods_sn'] = $goods['goods_sn'];
            $this->return['goods']['goods_name'] = $goods['goods_name'];
            $this->return['goods']['shop_price'] = $goods['shop_price'];
            $this->return['goods']['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
            $this->return['goods']['goods_thumb'] = $goods['goods_thumb'];
            $this->return['goods']['goods_img'] = $goods['goods_img'];
            $this->return['goods']['goods_gallery'] = array();

            $desc = filter_add_self_domain( $goods['goods_desc'] );
            $this->return['goods']['goods_desc'] = $desc;

            // 获取图片库
            $imgList = db_get_goods_gallery($this->goodId, 10);

            if ($imgList) {
                $index = 0;
                foreach ($imgList as $img) {
                    $this->return['goods']['goods_gallery'][$index]['img_url'] = $img['img_url'];
                    $this->return['goods']['goods_gallery'][$index]['img_original'] = $img['img_original'];
                    $this->return['goods']['goods_gallery'][$index]['img_desc'] = $img['img_desc'];
                    $index++;
                }
            }
            return true;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_detail_empty'];
            return false;
        }
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['goods']);
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