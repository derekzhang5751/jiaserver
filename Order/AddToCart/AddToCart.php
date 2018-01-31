<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-01-11
 * Time: 1:03 PM
 */

class AddToCart extends \Bricker\RequestLifeCircle
{
    private $userId = 0;
    private $uuid;
    private $goodsId = 0;
    private $num = 0;
    private $parentId = 0;
    private $specifications = array();
    
    private $return = [
        'result' => false,
        'msg' => ''
    ];
    
    protected function prepareRequestParams() {
        $this->userId = isset($_POST['userid']) ? trim($_POST['userid']) : 0;
        $this->uuid   = isset($_POST['uuid']) ? trim($_POST['uuid']) : '';
        
        if (isset($_POST['goodsid'])) {
            $this->goodsId = intval($_POST['goodsid']);
        }
        
        if (isset($_POST['num'])) {
            $this->num = intval($_POST['num']);
        }
        
        if (isset($_POST['spec']) && !empty($_POST['spec'])) {
            $specstr =  trim($_POST['spec'], ",");
            $this->specifications = explode(",", $specstr);
            //$GLOBALS['log']->log('order', 'input specifications='. print_r($this->specifications, true) );
        }
        
        if ($this->goodsId <= 0) return false;
        if ($this->num <= 0) return false;
        
        return true;
    }

    /**
     * 添加商品到购物车
     *
     * @access  public
     * @param   integer $goods_id      商品编号
     * @param   integer $num           商品数量
     * @param   array   $specIdArray   规格值对应的id数组
     * @param   integer $parent        基本件
     * @return  boolean
     */
    protected function process() {
        $goodsId = $this->goodsId;
        $num = $this->num;
        $specIdArray = $this->specifications;
        $parentId = intval($this->parentId);
        
        /* 检查：如果商品有规格，而post的数据没有规格，把商品的规格属性通过JSON传到前台 */
        if ( !$this->goodsSpecificationMatched() ) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['specification_empty'];
            $GLOBALS['log']->log('order', 'no specification inputed.');
            $GLOBALS['log']->log('order', 'LANG=' . $GLOBALS['LANG']['specification_empty']);
            return true;
        }
        
        /* 取得商品信息 */
        $goods = db_get_goods_sell_info($goodsId);
        if ( empty($goods) ) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_id_not_exist'];
            $GLOBALS['log']->log('order', 'goods id is not exist.');
            return true;
        }
        
        /* 如果是作为配件添加到购物车的，需要先检查购物车里面是否已经有基本件 */
        if ($parentId > 0) {
            if ( !db_if_parent_goods_exist_in_cart($parentId, SESSION_ID) ) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['accessories_no_alone_sale'];
                $GLOBALS['log']->log('order', 'accessories no alone sale 1.');
                return true;
            }
        }
        
        /* 是否正在销售 */
        if ($goods['is_on_sale'] == 0) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['products_stop_sale'];
            $GLOBALS['log']->log('order', 'products stop sale.');
            return true;
        }
        
        /* 不是配件时检查是否允许单独销售 */
        if ($parentId <= 0 && $goods['is_alone_sale'] == 0) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['products_no_alone_sale'];
            $GLOBALS['log']->log('order', 'products no alone sale 2.');
            return true;
        }
        
        /* 如果商品有规格则取规格商品信息 配件除外 */
        //$sql = "SELECT * FROM " .$GLOBALS['ecs']->table('products'). " WHERE goods_id = '$goods_id' LIMIT 0, 1";
        $prod = array();
        /*
        $prod = $this->db->get('products',
            ['product_id', 'goods_id', 'goods_attr', 'product_sn', 'product_number'],
            ['goods_id' => $goodsId]);

        if (is_spec($specIdArray) && !empty($prod))
        {
            $product_info = get_products_info($goodsId, $specIdArray);
        }
        if (empty($product_info))
        {
            $product_info = array('product_number' => '', 'product_id' => 0);
        }
        */
        $product_info = array('product_number' => '', 'product_id' => 0);

        /* 检查：库存 */
        //if ($GLOBALS['_CFG']['use_storage'] == 1)
        {
            //检查：商品购买数量是否大于总库存
            if ($num > $goods['goods_number']) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['products_not_enough'];
                $GLOBALS['log']->log('order', 'products not enough.');
                return true;
            }
            
            //商品存在规格 是货品 检查该货品库存
            if (!empty($specIdArray) && !empty($prod)) {
                /* 取规格的货品库存 */
                if ($num > $product_info['product_number']) {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['products_not_enough'];
                    $GLOBALS['log']->log('order', 'products not enough.');
                    return true;
                }
            }
        }
        
        /* 计算商品的促销价格 */
        $spec_price             = $this->getSpecificationPrice();
        $goods_price            = get_final_price($goodsId, $num, true, $spec_price);
        $goods['market_price'] += $spec_price;
        $goods_attr             = get_goods_attr_info($specIdArray);
        $goods_attr_id          = join(',', $specIdArray);
        
        /* 初始化要插入购物车的基本件数据 */
        $parent = array(
            'user_id'       => $this->userId,
            'session_id'    => SESSION_ID,
            'goods_id'      => $goodsId,
            'goods_sn'      => addslashes($goods['goods_sn']),
            'product_id'    => $product_info['product_id'],
            'goods_name'    => addslashes($goods['goods_name']),
            'market_price'  => $goods['market_price'],
            'goods_attr'    => addslashes($goods_attr),
            'goods_attr_id' => $goods_attr_id,
            'is_real'       => $goods['is_real'],
            'extension_code'=> $goods['extension_code'],
            'is_gift'       => 0,
            'is_shipping'   => $goods['is_shipping'],
            'rec_type'      => CART_GENERAL_GOODS
        );
        
        /* 如果该配件在添加为基本件的配件时，所设置的“配件价格”比原价低，即此配件在价格上提供了优惠， */
        /* 则按照该配件的优惠价格卖，但是每一个基本件只能购买一个优惠价格的“该配件”，多买的“该配件”不享 */
        /* 受此优惠 */
        $basic_list = array();
        $res = db_get_goods_group_price($goodsId, $goods_price, $parentId);
        foreach ($res as $row) {
            $basic_list[$row['parent_id']] = $row['goods_price'];
        }
        
        /* 取得购物车中该商品每个基本件的数量 */
        $basic_count_list = array();
        if ($basic_list) {
            $res = db_get_basic_count_list($basic_list);
            foreach ($res as $row) {
                $basic_count_list[$row['goods_id']] = $row['count'];
            }
        }
        
        /* 取得购物车中该商品每个基本件已有该商品配件数量，计算出每个基本件还能有几个该商品配件 */
        /* 一个基本件对应一个该商品配件 */
        if ($basic_count_list) {
            $sql = "SELECT parent_id, SUM(goods_number) AS count " .
                "FROM ecs_cart" .
                " WHERE session_id = '" . SESSION_ID . "'" .
                " AND goods_id = '$goodsId'" .
                " AND extension_code <> 'package_buy' " .
                " AND parent_id " . db_create_in(array_keys($basic_count_list)) .
                " GROUP BY parent_id";
            $res = $this->db->query($sql)->fetchAll();
            foreach ($res as $row) {
                $basic_count_list[$row['parent_id']] -= $row['count'];
            }
        }
        
        /* 循环插入配件 如果是配件则用其添加数量依次为购物车中所有属于其的基本件添加足够数量的该配件 */
        foreach ($basic_list as $parent_id => $fitting_price)
        {
            /* 如果已全部插入，退出 */
            if ($num <= 0)
            {
                break;
            }

            /* 如果该基本件不再购物车中，执行下一个 */
            if (!isset($basic_count_list[$parent_id]))
            {
                continue;
            }

            /* 如果该基本件的配件数量已满，执行下一个基本件 */
            if ($basic_count_list[$parent_id] <= 0)
            {
                continue;
            }
            
            /* 作为该基本件的配件插入 */
            $parent['goods_price']  = max($fitting_price, 0) + $spec_price; //允许该配件优惠价格为0
            $parent['goods_number'] = min($num, $basic_count_list[$parent_id]);
            $parent['parent_id']    = $parent_id;
            
            /* 添加 */
            //$GLOBALS['db']->autoExecute($GLOBALS['ecs']->table('cart'), $parent, 'INSERT');
            $this->db->insert('cart', $parent);
            
            /* 改变数量 */
            $num -= $parent['goods_number'];
        }
        
        /* 如果数量不为0，作为基本件插入 */
        if ($num > 0)
        {
            $GLOBALS['log']->log('order', 'Goods NUM = '.$num);
            /* 检查该商品是否已经存在在购物车中 */
            $sql = "SELECT goods_number FROM cart" .
                " WHERE session_id = '" .SESSION_ID. "' AND goods_id = '$goodsId' ".
                " AND parent_id = 0 AND goods_attr = '" .get_goods_attr_info($specIdArray). "' " .
                " AND extension_code <> 'package_buy' " .
                " AND rec_type = " . CART_GENERAL_GOODS;
            $GLOBALS['log']->log('order', 'SQL: '.$sql);
            $row = false;
            $res = $this->db->query($sql)->fetchAll();
            if ($res) {
                $row = $res[0];
            }
            $GLOBALS['log']->log('order', 'row = '. print_r($res,true));
            if ($row) //如果购物车已经有此物品，则更新
            {
                $GLOBALS['log']->log('order', 'Goods exist, UPDATE cart.');
                $num += $row['goods_number'];
                if (!empty($prod) )
                {
                    $goods_storage = $product_info['product_number'];
                }
                else
                {
                    $goods_storage = $goods['goods_number'];
                }
                //if ($GLOBALS['_CFG']['use_storage'] == 0 || $num <= $goods_storage)
                if ($num <= $goods_storage)
                {
                    $goods_price = get_final_price($goodsId, $num, true, $spec_price);
                    $sql = "UPDATE ecs_cart SET goods_number = '$num'" .
                        " , goods_price = '$goods_price'".
                        " WHERE session_id = '" .SESSION_ID. "' AND goods_id = '$goodsId' ".
                        " AND parent_id = 0 AND goods_attr = '" .get_goods_attr_info($specIdArray). "' " .
                        " AND extension_code <> 'package_buy' " .
                        "AND rec_type = 'CART_GENERAL_GOODS'";
                    
                    $this->db->query($sql);
                }
                else
                {
                    $this->return['result'] = false;
                    $this->return['msg'] = $GLOBALS['LANG']['products_not_enough'];
                    return true;
                }
            }
            else //购物车没有此物品，则插入
            {
                $GLOBALS['log']->log('order', 'Goods not exist, INSERT cart.');
                $goods_price = get_final_price($goodsId, $num, true, $spec_price);
                $parent['goods_price']  = max($goods_price, 0);
                $parent['goods_number'] = $num;
                $parent['parent_id']    = 0;
                
                $this->db->insert('cart', $parent);
            }
        }
        
        /* 把赠品删除 */
        db_delete_all_gift_in_cart($this->userId, SESSION_ID);
        
        $this->return['result'] = true;
        $GLOBALS['log']->log('order', 'Add to cart completed.');
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
    
    private function goodsSpecificationMatched() {
        $matched = true;
        $attrs = db_get_goods_attr_full($this->goodsId);
        if ( $attrs ) {
            // match goods attr id
            foreach ($this->specifications as $specSelected) {
                $found = false;
                foreach ($attrs as $attr) {
                    if ($specSelected == $attr['goods_attr_id']) {
                        $found = true;
                        break;
                    }
                }
                if (!$found) {
                    $matched = false;
                    break;
                }
            }
        }
        return $matched;
    }
    
    private function getSpecificationPrice() {
        if ($this->specifications) {
            return db_get_specification_price($this->specifications);
        } else {
            return 0.0;
        }
    }
}
