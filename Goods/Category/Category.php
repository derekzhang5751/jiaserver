<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-12
 * Time: 10:50 PM
 */

class Category extends \Bricker\RequestLifeCircle
{
    private $parentId;

    private $return = [
        'result' => false,
        'msg' => '',
        'categorylist' => []
    ];

    protected function prepareRequestParams() {
        $parentId = isset($_POST['parentid']) ? trim($_POST['parentid']) : '0';
        $this->parentId = intval($parentId);
        if ($this->parentId < 0) {
            $this->parentId = 0;
        }
        return true;
    }

    protected function process() {
        $categoryList = db_get_goods_category($this->parentId, 500);

        if ($categoryList) {
            $i = 0;
            foreach ($categoryList as $category) {
                $this->return['categorylist'][$i]['cat_id'] = $category['cat_id'];
                $this->return['categorylist'][$i]['cat_name'] = $category['cat_name'];
                if ( db_has_child_category($category['cat_id']) ) {
                    $this->return['categorylist'][$i]['has_child'] = true;
                } else {
                    $this->return['categorylist'][$i]['has_child'] = false;
                }
                $i++;
            }
            $this->return['result'] = true;
            //$this->return['categorylist'] = $categoryList;
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