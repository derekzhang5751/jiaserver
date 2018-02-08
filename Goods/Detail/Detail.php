<?php
/**
 * Created by PhpStorm.
 * User: Derek
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
            
            // goods basic information
            $this->return['goods']['goods_id'] = $goods['goods_id'];
            $this->return['goods']['goods_sn'] = $goods['goods_sn'];
            $this->return['goods']['goods_name'] = $goods['goods_name'];
            $this->return['goods']['shop_price'] = $goods['shop_price'];
            $this->return['goods']['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
            $this->return['goods']['cat_name'] = $goods['cat_name'];
            $this->return['goods']['brand_name'] = $goods['brand_name'];
            
            // goods description
            $desc = filter_add_self_domain( $goods['goods_desc'] );
            $this->return['goods']['goods_desc'] = $desc;
            
            // goods images
            $this->return['goods']['goods_thumb'] = $goods['goods_thumb'];
            $this->return['goods']['goods_img'] = $goods['goods_img'];
            $this->return['goods']['goods_gallery'] = array();
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
            
            // goods attributes
            $properties = $this->getGoodsProperties($this->goodId);
            $this->return['goods']['pro'] = $properties['pro'];
            $this->return['goods']['spe'] = $properties['spe'];
            $this->return['goods']['lnk'] = $properties['lnk'];
            
            // if the goods is in collection
            if (isset($GLOBALS['_SESSION']['user_id']) && !empty($GLOBALS['_SESSION']['user_id'])) {
                if ( db_if_goods_in_collection($GLOBALS['_SESSION']['user_id'], $this->goodId) ) {
                    $this->return['goods']['collect'] = 'yes';
                } else {
                    $this->return['goods']['collect'] = 'no';
                }
            } else {
                $this->return['goods']['collect'] = 'unknown';
            }
            
            // user comments
            $this->return['goods']['comment'] = array();
            $rankList = db_comment_rank_list($this->goodId);
            $tmpArray = array();
            if ($rankList) {
                foreach ($rankList as $rank) {
                    $rank = $rank['comment_rank'];
                    $count = db_count_comment_rank($this->goodId, $rank);
                    $tmpArray[$rank] = $count;
                }
                arsort($tmpArray);
            }
            $total = db_count_comment_total($this->goodId);
            foreach ($tmpArray as $key => $value) {
                $this->return['goods']['comment']['rank'] = $key;
                $this->return['goods']['comment']['number'] = $total;
                break;
            }
            
            // linked goods
            $linkedGoods = db_get_linked_goods($this->goodId, 10);
            if ($linkedGoods) {
                $index = 0;
                foreach ($linkedGoods as $goods) {
                    $this->return['goods']['linked'][$index]['goods_id'] = $goods['goods_id'];
                    $this->return['goods']['linked'][$index]['goods_name'] = $goods['goods_name'];
                    $this->return['goods']['linked'][$index]['shop_price'] = $goods['shop_price'];
                    $this->return['goods']['linked'][$index]['promote_price'] = promote_price($goods['promote_price'], $goods['promote_start_date'], $goods['promote_end_date']);
                    $this->return['goods']['linked'][$index]['goods_thumb'] = $goods['goods_thumb'];
                    $this->return['goods']['linked'][$index]['goods_img'] = $goods['goods_img'];
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
            // adpat properties format
            $properties = array();
            foreach ($this->return['goods']['pro'] as $groupName => $groups) {
                $a['group_name'] = $groupName;
                $a['values'] = array();
                foreach ($groups as $proId => $prop) {
                    $b['value'] = $prop;
                    $b['attr_id'] = $proId;
                    array_push($a['values'], $b);
                }
                array_push($properties, $a);
            }
            $this->return['goods']['pro'] = $properties;
            
            // adapt spectification format
            $specification = array();
            foreach ($this->return['goods']['spe'] as $speId => $spec) {
                $a = $spec;
                $a['attr_id'] = $speId;
                array_push($specification, $a);
            }
            $this->return['goods']['spe'] = $specification;
            
            $this->jsonResponse('success', $this->return['msg'], $this->return['goods']);
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
    
    /**
     * 获得商品的属性和规格
     *
     * @access  public
     * @param   integer $goods_id
     * @return  array
     */
    static function getGoodsProperties($goodsId) {
        /* 对属性进行重新排序和分组 */
        $grp = db_get_goods_attr_group($goodsId);
        if (!empty($grp)) {
            $groups = explode("\n", strtr($grp['attr_group'], "\r", ''));
        }
        
        /* 获得商品的规格 */
        $res = db_get_goods_attr_full($goodsId);
        
        $arr['pro'] = array();     // 属性
        $arr['spe'] = array();     // 规格
        $arr['lnk'] = array();     // 关联的属性
        
        foreach ($res as $row) {
            $row['attr_value'] = str_replace("\n", '<br />', $row['attr_value']);
            
            if ($row['attr_type'] == 0) {
                $group = (isset($groups[$row['attr_group']])) ? $groups[$row['attr_group']] : $GLOBALS['LANG']['goods_attr'];
                
                $arr['pro'][$group][$row['attr_id']]['name']  = $row['attr_name'];
                $arr['pro'][$group][$row['attr_id']]['value'] = $row['attr_value'];
            } else {
                $f = floatval($row['attr_price']);
                $formatPrice = number_format($f, 2, '.', '');
                $arr['spe'][$row['attr_id']]['attr_type'] = $row['attr_type'];
                $arr['spe'][$row['attr_id']]['name']      = $row['attr_name'];
                $arr['spe'][$row['attr_id']]['values'][]  = array(
                                                            'label'        => $row['attr_value'],
                                                            'price'        => $row['attr_price'],
                                                            'format_price' => $formatPrice,
                                                            'id'           => $row['goods_attr_id']);
            }
            
            if ($row['is_linked'] == 1) {
                /* 如果该属性需要关联，先保存下来 */
                $arr['lnk'][$row['attr_id']]['name']  = $row['attr_name'];
                $arr['lnk'][$row['attr_id']]['value'] = $row['attr_value'];
            }
        }
        
        return $arr;
    }
    
}