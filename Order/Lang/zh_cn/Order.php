<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-11
 * Time: 1:06 PM
 */

$GLOBALS['LANG']['accessories_no_alone_sale'] = '配件不能单独销售 !!!';
$GLOBALS['LANG']['products_no_alone_sale'] = '该商品不能单独销售 !!!';
$GLOBALS['LANG']['products_stop_sale'] = '该商品已停止销售 !!!';
$GLOBALS['LANG']['products_not_enough'] = '该商品库存不足 !!!';
$GLOBALS['LANG']['order_list_empty'] = '订单列表为空 !!!';
$GLOBALS['LANG']['cart_empty'] = '购物车为空 !!!';
$GLOBALS['LANG']['specification_empty'] = '请选择希望需要的商品规格 !!!';
$GLOBALS['LANG']['goods_id_not_exist'] = '商品ID不存在 !!!';
$GLOBALS['LANG']['accessories_no_alone_sale'] = '配件不能单独购买 !!!';
$GLOBALS['LANG']['delete_error'] = '删除失败，请稍后再试 !!!';
$GLOBALS['LANG']['user_not_exist'] = '该用户不存在 !!!';
$GLOBALS['LANG']['goods_not_exist'] = '该商品不存在 !!!';
$GLOBALS['LANG']['collect_error'] = '收藏失败，请稍后再试 !!!';
$GLOBALS['LANG']['address_empty'] = '收货人地址为空，请在我的地址中添加一个收货地址 !!!';
$GLOBALS['LANG']['order_save_error'] = '写入订单失败，请稍后再试 !!!';
$GLOBALS['LANG']['consignee_not_exist'] = '收件人不存在 !!!';
$GLOBALS['LANG']['payment_not_exist'] = '支付方式不存在 !!!';

/* 订单状态 */
$GLOBALS['LANG']['os'][OS_UNCONFIRMED] = '未确认';
$GLOBALS['LANG']['os'][OS_CONFIRMED] = '已确认';
$GLOBALS['LANG']['os'][OS_SPLITED] = '已确认';
$GLOBALS['LANG']['os'][OS_SPLITING_PART] = '已确认';
$GLOBALS['LANG']['os'][OS_CANCELED] = '已取消';
$GLOBALS['LANG']['os'][OS_INVALID] = '无效';
$GLOBALS['LANG']['os'][OS_RETURNED] = '退货';

$GLOBALS['LANG']['ss'][SS_UNSHIPPED] = '未发货';
$GLOBALS['LANG']['ss'][SS_PREPARING] = '配货中';
$GLOBALS['LANG']['ss'][SS_SHIPPED] = '已发货';
$GLOBALS['LANG']['ss'][SS_RECEIVED] = '收货确认';
$GLOBALS['LANG']['ss'][SS_SHIPPED_PART] = '已发货(部分商品)';
$GLOBALS['LANG']['ss'][SS_SHIPPED_ING] = '配货中'; // 已分单

$GLOBALS['LANG']['ps'][PS_UNPAYED] = '未付款';
$GLOBALS['LANG']['ps'][PS_PAYING] = '付款中';
$GLOBALS['LANG']['ps'][PS_PAYED] = '已付款';

/* 缺货处理 */
$GLOBALS['oos'][OOS_WAIT] = '等待所有商品备齐后再发';
$GLOBALS['oos'][OOS_CANCEL] = '取消订单';
$GLOBALS['oos'][OOS_CONSULT] = '与店主协商';
