<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 10:50 PM
 */

class Category extends \Bricker\RequestLifeCircle
{
    private $return = [
        'result' => false,
        'msg' => '',
        'categorylist' => []
    ];

    protected function prepareRequestParams() {
        return true;
    }

    protected function process() {
        $categoryList = db_get_goods_category(0, 500);

        if ($categoryList) {
            $this->return['result'] = true;
            $this->return['categorylist'] = $categoryList;
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['category_empty'];
        }
        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['categorylist']);
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