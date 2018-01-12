<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-11
 * Time: 1:03 PM
 */

class AddToCart extends \Bricker\RequestLifeCircle
{
    private $goodsId = 0;
    private $num = 0;
    private $parentId = 0;
    private $spec = array();

    private $return = [
        'result' => false,
        'msg' => ''
    ];

    protected function prepareRequestParams() {
        if (isset($_POST['goodsid'])) {
            $this->goodsId = intval($_POST['goodsid']);
        }

        if (isset($_POST['num'])) {
            $this->num = intval($_POST['num']);
        }

        $this->spec    = array();

        if ($this->goodsId <= 0) return false;
        if ($this->num <= 0) return false;

        return true;
    }

    /**
     * 添加商品到购物车
     *
     * @access  public
     * @param   integer $goods_id   商品编号
     * @param   integer $num        商品数量
     * @param   array   $spec       规格值对应的id数组
     * @param   integer $parent     基本件
     * @return  boolean
     */
    protected function process() {
        $parent = 0;
        $goodsId = $this->goodsId;
        $num = $this->num;
        $spec = $this->spec;
        $parentId = intval($parent);
        $discount = $_SESSION['discount'];
        $userRank = $_SESSION['user_rank'];

        /* 取得商品信息 */
        $sql = "SELECT g.goods_name, g.goods_sn, g.is_on_sale, g.is_real, ".
            "g.market_price, g.shop_price AS org_price, g.promote_price, g.promote_start_date, ".
            "g.promote_end_date, g.goods_weight, g.integral, g.extension_code, ".
            "g.goods_number, g.is_alone_sale, g.is_shipping,".
            "IFNULL(mp.user_price, g.shop_price * '$discount') AS shop_price ".
            " FROM ecs_goods AS g ".
            " LEFT JOIN ecs_member_price AS mp ".
            "ON mp.goods_id = g.goods_id AND mp.user_rank = '$userRank' ".
            " WHERE g.goods_id = '$goodsId'" .
            " AND g.is_delete = 0";

        $res = $this->db->query($sql)->fetchAll();
        if (empty($res)) {
            $return['result'] = false;
            $return['msg'] = '商品ID不存在 !!!';
            return $return;
        }
        $goods = $res[0];

        /* 如果是作为配件添加到购物车的，需要先检查购物车里面是否已经有基本件 */
        if ($parentId > 0)
        {
            if ($this->db->has('cart',
                    [
                        'goods_id' => $parentId,
                        'session_id' => SESSION_ID,
                        'extension_code' => 'package_buy'
                    ]) == false)
            {
                $return['result'] = false;
                $return['msg'] = $GLOBALS['LANG']['accessories_no_alone_sale'];
                return $return;
            }
        }

        /* 是否正在销售 */
        if ($goods['is_on_sale'] == 0)
        {
            $return['result'] = false;
            $return['msg'] = $GLOBALS['LANG']['products_stop_sale'];
            return $return;
        }

        /* 不是配件时检查是否允许单独销售 */
        if (empty($parentId) && $goods['is_alone_sale'] == 0)
        {
            $return['result'] = false;
            $return['msg'] = $GLOBALS['LANG']['products_no_alone_sale'];
            return $return;
        }

        /* 如果商品有规格则取规格商品信息 配件除外 */
        //$sql = "SELECT * FROM " .$GLOBALS['ecs']->table('products'). " WHERE goods_id = '$goods_id' LIMIT 0, 1";
        $prod = $this->db->get('products',
            ['product_id', 'goods_id', 'goods_attr', 'product_sn', 'product_number'],
            ['goods_id' => $goodsId]);

        if (is_spec($spec) && !empty($prod))
        {
            $product_info = get_products_info($goodsId, $spec);
        }
        if (empty($product_info))
        {
            $product_info = array('product_number' => '', 'product_id' => 0);
        }

        /* 检查：库存 */
        //if ($GLOBALS['_CFG']['use_storage'] == 1)
        {
            //检查：商品购买数量是否大于总库存
            if ($num > $goods['goods_number'])
            {
                $return['result'] = false;
                $return['msg'] = $GLOBALS['LANG']['products_not_enough'];
                return $return;
            }

            //商品存在规格 是货品 检查该货品库存
            if (is_spec($spec) && !empty($prod))
            {
                if (!empty($spec))
                {
                    /* 取规格的货品库存 */
                    if ($num > $product_info['product_number'])
                    {
                        $return['result'] = false;
                        $return['msg'] = $GLOBALS['LANG']['products_not_enough'];
                        return $return;
                    }
                }
            }
        }

        /* 计算商品的促销价格 */
        $spec_price             = spec_price($spec);
        $goods_price            = get_final_price($goodsId, $num, true, $spec);
        $goods['market_price'] += $spec_price;
        $goods_attr             = get_goods_attr_info($spec);
        $goods_attr_id          = join(',', $spec);

        /* 初始化要插入购物车的基本件数据 */
        $parent = array(
            'user_id'       => $_SESSION['user_id'],
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
        $sql = "SELECT parent_id, goods_price " .
            "FROM ecs_group_goods" .
            " WHERE goods_id = '$goodsId'" .
            " AND goods_price < '$goods_price'" .
            " AND parent_id = '$parentId'" .
            " ORDER BY goods_price";
        $res = $this->db->query($sql)->fetchAll();
        foreach ($res as $row) {
            $basic_list[$row['parent_id']] = $row['goods_price'];
        }

        /* 取得购物车中该商品每个基本件的数量 */
        $basic_count_list = array();
        if ($basic_list)
        {
            $sql = "SELECT goods_id, SUM(goods_number) AS count " .
                "FROM ecs_cart" .
                " WHERE session_id = '" . SESSION_ID . "'" .
                " AND parent_id = 0" .
                " AND extension_code <> 'package_buy' " .
                " AND goods_id " . db_create_in(array_keys($basic_list)) .
                " GROUP BY goods_id";
            $res = $this->db->query($sql)->fetchAll();
            foreach ($res as $row) {
                $basic_count_list[$row['goods_id']] = $row['count'];
            }
        }

        /* 取得购物车中该商品每个基本件已有该商品配件数量，计算出每个基本件还能有几个该商品配件 */
        /* 一个基本件对应一个该商品配件 */
        if ($basic_count_list)
        {
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
            /* 检查该商品是否已经存在在购物车中 */
            $sql = "SELECT goods_number FROM ecs_cart" .
                " WHERE session_id = '" .SESSION_ID. "' AND goods_id = '$goodsId' ".
                " AND parent_id = 0 AND goods_attr = '" .get_goods_attr_info($spec). "' " .
                " AND extension_code <> 'package_buy' " .
                " AND rec_type = 'CART_GENERAL_GOODS'";

            //$row = $GLOBALS['db']->getRow($sql);
            $row = null;
            $res = $this->db->query($sql)->fetchAll();
            if ($res) {
                $row = $res[0];
            }

            if ($row) //如果购物车已经有此物品，则更新
            {
                $num += $row['goods_number'];
                if(is_spec($spec) && !empty($prod) )
                {
                    $goods_storage = $product_info['product_number'];
                }
                else
                {
                    $goods_storage=$goods['goods_number'];
                }
                //if ($GLOBALS['_CFG']['use_storage'] == 0 || $num <= $goods_storage)
                if ($num <= $goods_storage)
                {
                    $goods_price = get_final_price($goodsId, $num, true, $spec);
                    $sql = "UPDATE ecs_cart SET goods_number = '$num'" .
                        " , goods_price = '$goods_price'".
                        " WHERE session_id = '" .SESSION_ID. "' AND goods_id = '$goodsId' ".
                        " AND parent_id = 0 AND goods_attr = '" .get_goods_attr_info($spec). "' " .
                        " AND extension_code <> 'package_buy' " .
                        "AND rec_type = 'CART_GENERAL_GOODS'";
                    //$GLOBALS['db']->query($sql);
                    $this->db->query($sql);
                }
                else
                {
                    $return['result'] = false;
                    $return['msg'] = '该商品库存不足 !!!';
                    return $return;
                }
            }
            else //购物车没有此物品，则插入
            {
                $goods_price = get_final_price($goodsId, $num, true, $spec);
                $parent['goods_price']  = max($goods_price, 0);
                $parent['goods_number'] = $num;
                $parent['parent_id']    = 0;
                //$GLOBALS['db']->autoExecute($GLOBALS['ecs']->table('cart'), $parent, 'INSERT');
                $this->db->insert('cart', $parent);
            }
        }

        /* 把赠品删除 */
        $sql = "DELETE FROM ecs_cart WHERE session_id = '" . SESSION_ID . "' AND is_gift <> 0";
        $this->db->query($sql);

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
}
