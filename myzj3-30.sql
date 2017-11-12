/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50128
Source Host           : 127.0.0.1:3306
Source Database       : myzj

Target Server Type    : MYSQL
Target Server Version : 50128
File Encoding         : 65001

Date: 2015-03-30 18:30:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ecs_account_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_account_log`;
CREATE TABLE `ecs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_ad`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad`;
CREATE TABLE `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad
-- ----------------------------
INSERT INTO ecs_ad VALUES ('193', '159', '0', '首页左侧广告', 'http://mj.xiaoyuok.com/myzj/goods.php?id=134', '1427701514983952383.jpg', '1381161600', '1983369600', '', '', '', '7', '1');

-- ----------------------------
-- Table structure for `ecs_admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_action`;
CREATE TABLE `ecs_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(20) NOT NULL DEFAULT '',
  `relevance` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`action_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_action
-- ----------------------------
INSERT INTO ecs_admin_action VALUES ('1', '0', 'goods', '');
INSERT INTO ecs_admin_action VALUES ('2', '0', 'cms_manage', '');
INSERT INTO ecs_admin_action VALUES ('3', '0', 'users_manage', '');
INSERT INTO ecs_admin_action VALUES ('4', '0', 'priv_manage', '');
INSERT INTO ecs_admin_action VALUES ('5', '0', 'sys_manage', '');
INSERT INTO ecs_admin_action VALUES ('6', '0', 'order_manage', '');
INSERT INTO ecs_admin_action VALUES ('7', '0', 'promotion', '');
INSERT INTO ecs_admin_action VALUES ('8', '0', 'email', '');
INSERT INTO ecs_admin_action VALUES ('9', '0', 'templates_manage', '');
INSERT INTO ecs_admin_action VALUES ('10', '0', 'db_manage', '');
INSERT INTO ecs_admin_action VALUES ('11', '0', 'sms_manage', '');
INSERT INTO ecs_admin_action VALUES ('21', '1', 'goods_manage', '');
INSERT INTO ecs_admin_action VALUES ('22', '1', 'remove_back', '');
INSERT INTO ecs_admin_action VALUES ('23', '1', 'cat_manage', '');
INSERT INTO ecs_admin_action VALUES ('24', '1', 'cat_drop', 'cat_manage');
INSERT INTO ecs_admin_action VALUES ('25', '1', 'attr_manage', '');
INSERT INTO ecs_admin_action VALUES ('26', '1', 'brand_manage', '');
INSERT INTO ecs_admin_action VALUES ('27', '1', 'comment_priv', '');
INSERT INTO ecs_admin_action VALUES ('84', '1', 'tag_manage', '');
INSERT INTO ecs_admin_action VALUES ('30', '2', 'article_cat', '');
INSERT INTO ecs_admin_action VALUES ('31', '2', 'article_manage', '');
INSERT INTO ecs_admin_action VALUES ('32', '2', 'shopinfo_manage', '');
INSERT INTO ecs_admin_action VALUES ('33', '2', 'shophelp_manage', '');
INSERT INTO ecs_admin_action VALUES ('34', '2', 'vote_priv', '');
INSERT INTO ecs_admin_action VALUES ('35', '7', 'topic_manage', '');
INSERT INTO ecs_admin_action VALUES ('74', '4', 'template_manage', '');
INSERT INTO ecs_admin_action VALUES ('73', '3', 'feedback_priv', '');
INSERT INTO ecs_admin_action VALUES ('38', '3', 'integrate_users', '');
INSERT INTO ecs_admin_action VALUES ('39', '3', 'sync_users', 'integrate_users');
INSERT INTO ecs_admin_action VALUES ('40', '3', 'users_manage', '');
INSERT INTO ecs_admin_action VALUES ('41', '3', 'users_drop', 'users_manage');
INSERT INTO ecs_admin_action VALUES ('42', '3', 'user_rank', '');
INSERT INTO ecs_admin_action VALUES ('85', '3', 'surplus_manage', 'account_manage');
INSERT INTO ecs_admin_action VALUES ('43', '4', 'admin_manage', '');
INSERT INTO ecs_admin_action VALUES ('44', '4', 'admin_drop', 'admin_manage');
INSERT INTO ecs_admin_action VALUES ('45', '4', 'allot_priv', 'admin_manage');
INSERT INTO ecs_admin_action VALUES ('46', '4', 'logs_manage', '');
INSERT INTO ecs_admin_action VALUES ('47', '4', 'logs_drop', 'logs_manage');
INSERT INTO ecs_admin_action VALUES ('48', '5', 'shop_config', '');
INSERT INTO ecs_admin_action VALUES ('49', '5', 'ship_manage', '');
INSERT INTO ecs_admin_action VALUES ('50', '5', 'payment', '');
INSERT INTO ecs_admin_action VALUES ('51', '5', 'shiparea_manage', '');
INSERT INTO ecs_admin_action VALUES ('52', '5', 'area_manage', '');
INSERT INTO ecs_admin_action VALUES ('53', '6', 'order_os_edit', '');
INSERT INTO ecs_admin_action VALUES ('54', '6', 'order_ps_edit', 'order_os_edit');
INSERT INTO ecs_admin_action VALUES ('55', '6', 'order_ss_edit', 'order_os_edit');
INSERT INTO ecs_admin_action VALUES ('56', '6', 'order_edit', 'order_os_edit');
INSERT INTO ecs_admin_action VALUES ('57', '6', 'order_view', '');
INSERT INTO ecs_admin_action VALUES ('58', '6', 'order_view_finished', '');
INSERT INTO ecs_admin_action VALUES ('59', '6', 'repay_manage', '');
INSERT INTO ecs_admin_action VALUES ('60', '6', 'booking', '');
INSERT INTO ecs_admin_action VALUES ('61', '6', 'sale_order_stats', '');
INSERT INTO ecs_admin_action VALUES ('62', '6', 'client_flow_stats', '');
INSERT INTO ecs_admin_action VALUES ('78', '7', 'snatch_manage', '');
INSERT INTO ecs_admin_action VALUES ('83', '7', 'ad_manage', '');
INSERT INTO ecs_admin_action VALUES ('80', '7', 'gift_manage', '');
INSERT INTO ecs_admin_action VALUES ('81', '7', 'card_manage', '');
INSERT INTO ecs_admin_action VALUES ('70', '1', 'goods_type', '');
INSERT INTO ecs_admin_action VALUES ('82', '7', 'pack', '');
INSERT INTO ecs_admin_action VALUES ('79', '7', 'bonus_manage', '');
INSERT INTO ecs_admin_action VALUES ('75', '5', 'friendlink', '');
INSERT INTO ecs_admin_action VALUES ('76', '5', 'db_backup', '');
INSERT INTO ecs_admin_action VALUES ('77', '5', 'db_renew', 'db_backup');
INSERT INTO ecs_admin_action VALUES ('86', '4', 'agency_manage', '');
INSERT INTO ecs_admin_action VALUES ('87', '3', 'account_manage', '');
INSERT INTO ecs_admin_action VALUES ('88', '5', 'flash_manage', '');
INSERT INTO ecs_admin_action VALUES ('89', '5', 'navigator', '');
INSERT INTO ecs_admin_action VALUES ('90', '7', 'auction', '');
INSERT INTO ecs_admin_action VALUES ('91', '7', 'group_by', '');
INSERT INTO ecs_admin_action VALUES ('92', '7', 'favourable', '');
INSERT INTO ecs_admin_action VALUES ('93', '7', 'whole_sale', '');
INSERT INTO ecs_admin_action VALUES ('94', '1', 'goods_auto', '');
INSERT INTO ecs_admin_action VALUES ('95', '2', 'article_auto', '');
INSERT INTO ecs_admin_action VALUES ('96', '5', 'cron', '');
INSERT INTO ecs_admin_action VALUES ('97', '5', 'affiliate', '');
INSERT INTO ecs_admin_action VALUES ('98', '5', 'affiliate_ck', '');
INSERT INTO ecs_admin_action VALUES ('99', '8', 'attention_list', '');
INSERT INTO ecs_admin_action VALUES ('100', '8', 'email_list', '');
INSERT INTO ecs_admin_action VALUES ('101', '8', 'magazine_list', '');
INSERT INTO ecs_admin_action VALUES ('102', '8', 'view_sendlist', '');
INSERT INTO ecs_admin_action VALUES ('103', '1', 'virualcard', '');
INSERT INTO ecs_admin_action VALUES ('104', '7', 'package_manage', '');
INSERT INTO ecs_admin_action VALUES ('105', '1', 'picture_batch', '');
INSERT INTO ecs_admin_action VALUES ('106', '1', 'goods_export', '');
INSERT INTO ecs_admin_action VALUES ('107', '1', 'goods_batch', '');
INSERT INTO ecs_admin_action VALUES ('108', '1', 'gen_goods_script', '');
INSERT INTO ecs_admin_action VALUES ('109', '5', 'sitemap', '');
INSERT INTO ecs_admin_action VALUES ('110', '5', 'file_priv', '');
INSERT INTO ecs_admin_action VALUES ('111', '5', 'file_check', '');
INSERT INTO ecs_admin_action VALUES ('112', '9', 'template_select', '');
INSERT INTO ecs_admin_action VALUES ('113', '9', 'template_setup', '');
INSERT INTO ecs_admin_action VALUES ('114', '9', 'library_manage', '');
INSERT INTO ecs_admin_action VALUES ('115', '9', 'lang_edit', '');
INSERT INTO ecs_admin_action VALUES ('116', '9', 'backup_setting', '');
INSERT INTO ecs_admin_action VALUES ('117', '9', 'mail_template', '');
INSERT INTO ecs_admin_action VALUES ('118', '10', 'db_backup', '');
INSERT INTO ecs_admin_action VALUES ('119', '10', 'db_renew', '');
INSERT INTO ecs_admin_action VALUES ('120', '10', 'db_optimize', '');
INSERT INTO ecs_admin_action VALUES ('121', '10', 'sql_query', '');
INSERT INTO ecs_admin_action VALUES ('122', '10', 'convert', '');
INSERT INTO ecs_admin_action VALUES ('124', '11', 'sms_send', '');
INSERT INTO ecs_admin_action VALUES ('128', '7', 'exchange_goods', '');
INSERT INTO ecs_admin_action VALUES ('129', '6', 'delivery_view', '');
INSERT INTO ecs_admin_action VALUES ('130', '6', 'back_view', '');
INSERT INTO ecs_admin_action VALUES ('131', '5', 'reg_fields', '');
INSERT INTO ecs_admin_action VALUES ('132', '5', 'shop_authorized', '');
INSERT INTO ecs_admin_action VALUES ('133', '5', 'webcollect_manage', '');
INSERT INTO ecs_admin_action VALUES ('134', '4', 'suppliers_manage', '');
INSERT INTO ecs_admin_action VALUES ('135', '4', 'role_manage', '');

-- ----------------------------
-- Table structure for `ecs_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_log`;
CREATE TABLE `ecs_admin_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_log
-- ----------------------------
INSERT INTO ecs_admin_log VALUES ('1', '1427685410', '1', '添加商品分类: 美颜系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('2', '1427685470', '1', '添加商品分类: 美肤系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('3', '1427685498', '1', '添加商品分类: 足浴系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('4', '1427685651', '1', '添加商品分类: 其他分类', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('5', '1427685700', '1', '添加商品分类: 产品分类', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('6', '1427685787', '1', '添加商品分类: 美颜系列小分类', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('7', '1427685806', '1', '编辑商品分类: 美颜系列小分类', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('8', '1427685830', '1', '编辑商品分类: 美颜系列小分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('9', '1427685842', '1', '添加商品分类: 美颜系列小分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('10', '1427685883', '1', '删除商品类型: aa', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('11', '1427687342', '1', '添加商品分类: 分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('12', '1427687354', '1', '添加商品分类: 分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('13', '1427687400', '1', '添加商品分类: 分类3', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('14', '1427687409', '1', '添加商品分类: 分类4', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('15', '1427687496', '1', '添加商品分类: 美肤系列小分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('16', '1427687508', '1', '添加商品分类: 美肤系列小分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('17', '1427687620', '1', '添加商品分类: 分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('18', '1427687628', '1', '添加商品分类: 分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('19', '1427687633', '1', '添加商品分类: 分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('20', '1427687639', '1', '添加商品分类: 分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('21', '1427687662', '1', '编辑商品分类: 分类5', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('22', '1427687669', '1', '编辑商品分类: 分类6', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('23', '1427687675', '1', '编辑商品分类: 分类7', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('24', '1427687681', '1', '编辑商品分类: 分类8', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('25', '1427687740', '1', '添加商品分类: 足浴系列小分类1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('26', '1427687778', '1', '添加商品分类: 足浴系列小分类2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('27', '1427687798', '1', '添加商品分类: 分类9', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('28', '1427687805', '1', '添加商品分类: 分类10', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('29', '1427687810', '1', '添加商品分类: 分类11', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('30', '1427687816', '1', '添加商品分类: 分类12', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('31', '1427689402', '1', '删除文章: 余额支付 ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('32', '1427689405', '1', '删除文章: 货到付款 ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('33', '1427689408', '1', '删除商品分类: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('34', '1427692349', '1', '编辑商品分类: 化妆品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('35', '1427692373', '1', '编辑商品分类: 个人护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('36', '1427692390', '1', '编辑商品分类: 居家母婴', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('37', '1427692776', '1', '删除商品分类: 谁都不', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('38', '1427692795', '1', '删除商品分类: 美容/美发', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('39', '1427692798', '1', '删除商品分类: 剃须刀', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('40', '1427692801', '1', '删除商品分类: 个人护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('41', '1427692805', '1', '删除商品分类: 榨汁机', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('42', '1427692808', '1', '删除商品分类: 煮蛋器', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('43', '1427692817', '1', '删除商品分类: 照明', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('44', '1427692820', '1', '删除商品分类: 挂烫机/烘干', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('45', '1427692822', '1', '删除商品分类: 加湿器/净化', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('46', '1427692824', '1', '删除商品分类: 电风扇', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('47', '1427692827', '1', '删除商品分类: 厨房', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('48', '1427692829', '1', '删除商品分类: 电饭煲', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('49', '1427692831', '1', '删除商品分类: 豆浆机', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('50', '1427692847', '1', '删除商品分类: 电压力锅', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('51', '1427692850', '1', '删除商品分类: 日用', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('52', '1427692852', '1', '删除商品分类: 家电', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('53', '1427692909', '1', '删除商品分类: 国内机票', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('54', '1427692918', '1', '删除商品分类: 机票', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('55', '1427692920', '1', '删除商品分类: 国内酒店', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('56', '1427692923', '1', '删除商品分类: 酒店', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('57', '1427692925', '1', '删除商品分类: QQ充值', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('58', '1427692937', '1', '删除商品分类: 游戏充值', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('59', '1427692939', '1', '删除商品分类: 手机充值', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('60', '1427692942', '1', '删除商品分类: 充值', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('61', '1427692944', '1', '删除商品分类: 话剧歌剧', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('62', '1427692947', '1', '删除商品分类: 舞蹈芭蕾', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('63', '1427692949', '1', '删除商品分类: 戏曲综艺', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('64', '1427692952', '1', '删除商品分类: 体育赛事', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('65', '1427692954', '1', '删除商品分类: 演唱会', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('66', '1427692956', '1', '删除商品分类: 音乐会', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('67', '1427692958', '1', '删除商品分类: 票务', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('68', '1427692960', '1', '删除商品分类: 福彩3D', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('69', '1427692963', '1', '删除商品分类: 排列三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('70', '1427692965', '1', '删除商品分类: 排列五', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('71', '1427692967', '1', '删除商品分类: 七星彩', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('72', '1427692969', '1', '删除商品分类: 七乐彩', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('73', '1427692970', '1', '删除商品分类: 竞彩足球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('74', '1427692974', '1', '删除商品分类: 竞彩篮球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('75', '1427692976', '1', '删除商品分类: 大乐透', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('76', '1427692978', '1', '删除商品分类: 双色球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('77', '1427692980', '1', '删除商品分类: 彩票', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('78', '1427692984', '1', '删除商品分类: 电脑办公', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('79', '1427693020', '1', '删除商品分类: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('80', '1427693505', '1', '编辑商品分类: 个人护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('81', '1427694935', '1', '编辑商品分类: 个人护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('82', '1427695004', '1', '删除商品分类: 改善睡眠', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('83', '1427695027', '1', '删除商品分类: 肝肾养护', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('84', '1427695029', '1', '删除商品分类: 免疫调节', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('85', '1427695031', '1', '删除商品分类: 更多调理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('86', '1427695032', '1', '删除商品分类: 心脑养护', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('87', '1427695034', '1', '删除商品分类: 调节三高', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('88', '1427695035', '1', '删除商品分类: 亚健康', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('89', '1427695036', '1', '删除商品分类: 更多礼品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('90', '1427695038', '1', '删除商品分类: 参茸礼品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('91', '1427695039', '1', '删除商品分类: 健康礼品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('92', '1427695040', '1', '删除商品分类: 海鲜水产', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('93', '1427695041', '1', '删除商品分类: 禽蛋', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('94', '1427695042', '1', '删除商品分类: 鲜肉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('95', '1427695044', '1', '删除商品分类: 加工类肉食', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('96', '1427695045', '1', '删除商品分类: 冻品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('97', '1427695046', '1', '删除商品分类: 半成品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('98', '1427695047', '1', '删除商品分类: 蔬菜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('99', '1427695048', '1', '删除商品分类: 水果', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('100', '1427695049', '1', '删除商品分类: 生鲜食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('101', '1427695050', '1', '删除商品分类: 洋酒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('102', '1427695051', '1', '删除商品分类: 啤酒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('103', '1427695052', '1', '删除商品分类: 饮料', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('104', '1427695053', '1', '删除商品分类: 冲调', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('105', '1427695055', '1', '删除商品分类: 咖啡/奶茶', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('106', '1427695056', '1', '删除商品分类: 茗茶', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('107', '1427695057', '1', '删除商品分类: 葡萄酒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('108', '1427695058', '1', '删除商品分类: 白酒/黄酒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('109', '1427695059', '1', '删除商品分类: 酒饮冲调', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('110', '1427695060', '1', '删除商品分类: 滋补调养', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('111', '1427695061', '1', '删除商品分类: 骨骼健康', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('112', '1427695062', '1', '删除商品分类: 保健茶饮', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('113', '1427695064', '1', '删除商品分类: 成分保健', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('114', '1427695065', '1', '删除商品分类: 美体养颜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('115', '1427695066', '1', '删除商品分类: 基础营养', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('116', '1427695067', '1', '删除商品分类: 营养健康', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('117', '1427695068', '1', '删除商品分类: 调味品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('118', '1427695069', '1', '删除商品分类: 南北干货', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('119', '1427695070', '1', '删除商品分类: 方便食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('120', '1427695072', '1', '删除商品分类: 有机食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('121', '1427695073', '1', '删除商品分类: 食用油', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('122', '1427695074', '1', '删除商品分类: 米面杂粮', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('123', '1427695075', '1', '删除商品分类: 粮油调味', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('124', '1427695076', '1', '删除商品分类: 休闲零食', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('125', '1427695077', '1', '删除商品分类: 坚果炒货', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('126', '1427695079', '1', '删除商品分类: 肉干肉松', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('127', '1427695080', '1', '删除商品分类: 蜜饯果脯', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('128', '1427695081', '1', '删除商品分类: 糖果/巧克力', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('129', '1427695082', '1', '删除商品分类: 饼干蛋糕', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('130', '1427695083', '1', '删除商品分类: 休闲食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('131', '1427695084', '1', '删除商品分类: 华东', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('132', '1427695085', '1', '删除商品分类: 华中', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('133', '1427695086', '1', '删除商品分类: 西北', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('134', '1427695087', '1', '删除商品分类: 西南', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('135', '1427695088', '1', '删除商品分类: 东北', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('136', '1427695089', '1', '删除商品分类: 华南', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('137', '1427695090', '1', '删除商品分类: 华北', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('138', '1427695091', '1', '删除商品分类: 地方特产', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('139', '1427695092', '1', '删除商品分类: 糖果巧克力', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('140', '1427695093', '1', '删除商品分类: 休闲零食', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('141', '1427695094', '1', '删除商品分类: 冲调饮品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('142', '1427695095', '1', '删除商品分类: 粮油调味', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('143', '1427695096', '1', '删除商品分类: 饼干蛋糕', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('144', '1427695097', '1', '删除商品分类: 进口食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('145', '1427695098', '1', '删除商品分类: 食品酒饮', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('146', '1427695099', '1', '删除商品分类: DIY玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('147', '1427695100', '1', '删除商品分类: 创意减压', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('148', '1427695102', '1', '删除商品分类: 乐器相关', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('149', '1427695103', '1', '删除商品分类: 毛绒布艺', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('150', '1427695104', '1', '删除商品分类: 娃娃玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('151', '1427695105', '1', '删除商品分类: 模型玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('152', '1427695106', '1', '删除商品分类: 健身玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('153', '1427695107', '1', '删除商品分类: 动漫玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('154', '1427695107', '1', '删除商品分类: 益智玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('155', '1427695108', '1', '删除商品分类: 积木拼插', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('156', '1427695109', '1', '删除商品分类: 遥控/电动', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('157', '1427695110', '1', '删除商品分类: 适用年龄', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('158', '1427695110', '1', '删除商品分类: 玩具乐器', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('159', '1427695112', '1', '删除商品分类: 洗发沐浴', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('160', '1427695113', '1', '删除商品分类: 清洁用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('161', '1427695115', '1', '删除商品分类: 婴儿床品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('162', '1427695116', '1', '删除商品分类: 安全用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('163', '1427695118', '1', '删除商品分类: 其他', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('164', '1427695119', '1', '删除商品分类: 婴儿鞋袜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('165', '1427695120', '1', '删除商品分类: 婴儿服装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('166', '1427695121', '1', '删除商品分类: 寝具服饰', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('167', '1427695122', '1', '删除商品分类: 孕服/内衣', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('168', '1427695124', '1', '删除商品分类: 防辐射服', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('169', '1427695125', '1', '删除商品分类: 洗护/祛纹', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('170', '1427695126', '1', '删除商品分类: 产后塑身', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('171', '1427695127', '1', '删除商品分类: 包/背婴带', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('172', '1427695128', '1', '删除商品分类: 妈妈护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('173', '1427695129', '1', '删除商品分类: 妈妈食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('174', '1427695130', '1', '删除商品分类: 妈妈专区', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('175', '1427695131', '1', '删除商品分类: 护理用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('176', '1427695132', '1', '删除商品分类: 洗浴用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('177', '1427695134', '1', '删除商品分类: 护肤用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('178', '1427695135', '1', '删除商品分类: 洗护用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('179', '1427695136', '1', '删除商品分类: 电动车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('180', '1427695137', '1', '删除商品分类: 健身车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('181', '1427695138', '1', '删除商品分类: 婴儿床', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('182', '1427695139', '1', '删除商品分类: 学步车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('183', '1427695139', '1', '删除商品分类: 三轮车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('184', '1427695140', '1', '删除商品分类: 自行车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('185', '1427695141', '1', '删除商品分类: 餐椅摇椅', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('186', '1427695142', '1', '删除商品分类: 婴儿推车', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('187', '1427695143', '1', '删除商品分类: 童车童床', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('188', '1427695143', '1', '删除商品分类: 湿巾纸巾', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('189', '1427695144', '1', '删除商品分类: 尿布/尿垫', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('190', '1427695145', '1', '删除商品分类: 吸奶器', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('191', '1427695146', '1', '删除商品分类: 消毒用具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('192', '1427695147', '1', '删除商品分类: 餐具饮具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('193', '1427695148', '1', '删除商品分类: 牙胶', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('194', '1427695149', '1', '删除商品分类: 辅助用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('195', '1427695150', '1', '删除商品分类: 奶瓶/奶嘴', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('196', '1427695151', '1', '删除商品分类: 喂养用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('197', '1427695152', '1', '删除商品分类: M号', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('198', '1427695153', '1', '删除商品分类: L号', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('199', '1427695155', '1', '删除商品分类: XL/XXL号', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('200', '1427695156', '1', '删除商品分类: 裤型尿裤', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('201', '1427695157', '1', '删除商品分类: S号', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('202', '1427695158', '1', '删除商品分类: 新生儿', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('203', '1427695159', '1', '删除商品分类: 尿裤湿巾', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('204', '1427695160', '1', '删除商品分类: 营养品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('205', '1427695160', '1', '删除商品分类: 初乳', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('206', '1427695161', '1', '删除商品分类: 米粉/菜粉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('207', '1427695162', '1', '删除商品分类: 泥糊/果汁', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('208', '1427695163', '1', '删除商品分类: 肉松/饼干', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('209', '1427695164', '1', '删除商品分类: 辅食/零食', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('210', '1427695165', '1', '删除商品分类: 营养辅食', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('211', '1427695166', '1', '删除商品分类: 羊奶粉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('212', '1427695167', '1', '删除商品分类: 特殊配方', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('213', '1427695168', '1', '删除商品分类: 1段', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('214', '1427695169', '1', '删除商品分类: 2段', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('215', '1427695170', '1', '删除商品分类: 3段', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('216', '1427695171', '1', '删除商品分类: 4段', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('217', '1427695172', '1', '删除商品分类: 奶粉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('218', '1427695172', '1', '删除商品分类: 手机数码', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('219', '1427695223', '1', '删除商品分类: 拖鞋', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('220', '1427695241', '1', '删除商品分类: 童鞋', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('221', '1427695273', '1', '删除商品分类: 防护器具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('222', '1427695279', '1', '删除商品分类: 骑行运动', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('223', '1427695280', '1', '删除商品分类: 极限运动', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('224', '1427695280', '1', '删除商品分类: 武术搏击', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('225', '1427695281', '1', '删除商品分类: 运动器材', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('226', '1427695282', '1', '删除商品分类: 健身器械', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('227', '1427695283', '1', '删除商品分类: 运动器械', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('228', '1427695284', '1', '删除商品分类: 瑜伽配件', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('229', '1427695284', '1', '删除商品分类: 瑜伽套装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('230', '1427695285', '1', '删除商品分类: 舞蹈鞋服', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('231', '1427695285', '1', '删除商品分类: 瑜伽服', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('232', '1427695286', '1', '删除商品分类: 瑜伽垫', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('233', '1427695287', '1', '删除商品分类: 纤体瑜伽', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('234', '1427695288', '1', '删除商品分类: 篮球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('235', '1427695288', '1', '删除商品分类: 足球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('236', '1427695290', '1', '删除商品分类: 网球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('237', '1427695291', '1', '删除商品分类: 排球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('238', '1427695294', '1', '删除商品分类: 高尔夫球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('239', '1427695295', '1', '删除商品分类: 棋牌麻将', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('240', '1427695296', '1', '删除商品分类: 其他', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('241', '1427695298', '1', '删除商品分类: 乒乓球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('242', '1427695300', '1', '删除商品分类: 羽毛球', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('243', '1427695301', '1', '删除商品分类: 体育娱乐', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('244', '1427695303', '1', '删除商品分类: 人体润滑', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('245', '1427695306', '1', '删除商品分类: 情爱玩具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('246', '1427695307', '1', '删除商品分类: 情趣内衣', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('247', '1427695309', '1', '删除商品分类: 组合套装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('248', '1427695310', '1', '删除商品分类: 验孕测孕', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('249', '1427695311', '1', '删除商品分类: 安全避孕', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('250', '1427695312', '1', '删除商品分类: 成人用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('251', '1427695313', '1', '删除商品分类: 康复辅助', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('252', '1427695315', '1', '删除商品分类: 家庭护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('253', '1427695316', '1', '删除商品分类: 保健用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('254', '1427695317', '1', '删除商品分类: 养生器械', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('255', '1427695318', '1', '删除商品分类: 保健器械', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('256', '1427695319', '1', '删除商品分类: 防裂抗冻', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('257', '1427695320', '1', '删除商品分类: 口腔咽部', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('258', '1427695321', '1', '删除商品分类: 眼部保健', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('259', '1427695322', '1', '删除商品分类: 鼻炎健康', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('260', '1427695323', '1', '删除商品分类: 风湿骨痛', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('261', '1427695323', '1', '删除商品分类: 生殖泌尿', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('262', '1427695324', '1', '删除商品分类: 美体塑身', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('263', '1427695325', '1', '删除商品分类: 烫伤止痒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('264', '1427695325', '1', '删除商品分类: 跌打损伤', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('265', '1427695326', '1', '删除商品分类: 急救卫生', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('266', '1427695327', '1', '删除商品分类: 睡袋', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('267', '1427695327', '1', '删除商品分类: 登山攀岩', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('268', '1427695328', '1', '删除商品分类: 户外背包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('269', '1427695329', '1', '删除商品分类: 户外照明', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('270', '1427695330', '1', '删除商品分类: 户外垫子', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('271', '1427695332', '1', '删除商品分类: 户外仪表', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('272', '1427695333', '1', '删除商品分类: 户外工具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('273', '1427695334', '1', '删除商品分类: 望远镜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('274', '1427695335', '1', '删除商品分类: 垂钓用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('275', '1427695336', '1', '删除商品分类: 旅游用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('276', '1427695337', '1', '删除商品分类: 便携桌椅床', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('277', '1427695337', '1', '删除商品分类: 烧烤用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('278', '1427695338', '1', '删除商品分类: 野餐炊具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('279', '1427695339', '1', '删除商品分类: 军迷用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('280', '1427695339', '1', '删除商品分类: 游泳用具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('281', '1427695340', '1', '删除商品分类: 泳衣', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('282', '1427695341', '1', '删除商品分类: 帐篷', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('283', '1427695342', '1', '删除商品分类: 户外装备', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('284', '1427695343', '1', '删除商品分类: 户外鞋袜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('285', '1427695343', '1', '删除商品分类: 户外配饰', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('286', '1427695344', '1', '删除商品分类: 户外服装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('287', '1427695344', '1', '删除商品分类: 户外鞋服', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('288', '1427695345', '1', '删除商品分类: 家居', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('289', '1427695384', '1', '编辑商品分类: 美颜系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('290', '1427695430', '1', '编辑商品分类: 美肤系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('291', '1427695485', '1', '编辑商品分类: 足浴系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('292', '1427695531', '1', '删除商品分类: 银饰', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('293', '1427695532', '1', '删除商品分类: 录音笔', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('294', '1427695536', '1', '删除商品分类: 单肩包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('295', '1427695536', '1', '删除商品分类: 旅行包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('296', '1427695537', '1', '删除商品分类: 旅行配件', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('297', '1427695538', '1', '删除商品分类: 运动包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('298', '1427695538', '1', '删除商品分类: Dolce&Gabbana', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('299', '1427695539', '1', '删除商品分类: 日本品牌', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('300', '1427695539', '1', '删除商品分类: 时尚品牌', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('301', '1427695540', '1', '删除商品分类: 闹钟挂钟', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('302', '1427695541', '1', '删除商品分类: 儿童手表', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('303', '1427695542', '1', '删除商品分类: 国产品牌', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('304', '1427695542', '1', '删除商品分类: 瑞士品牌', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('305', '1427695543', '1', '删除商品分类: 面部护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('306', '1427695543', '1', '删除商品分类: 爽肤水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('307', '1427695544', '1', '删除商品分类: 乳液面霜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('308', '1427695545', '1', '删除商品分类: 精华', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('309', '1427695545', '1', '删除商品分类: 洁面', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('310', '1427695546', '1', '删除商品分类: 个人洗护', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('311', '1427695546', '1', '删除商品分类: 洗发/护发', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('312', '1427695547', '1', '删除商品分类: 美发造型', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('313', '1427695548', '1', '删除商品分类: 口腔护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('314', '1427695548', '1', '删除商品分类: 沐浴/润肤', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('315', '1427695549', '1', '删除商品分类: 其他护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('316', '1427695549', '1', '删除商品分类: 腮红', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('317', '1427695550', '1', '删除商品分类: 美甲', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('318', '1427695550', '1', '删除商品分类: 唇部彩妆', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('319', '1427695551', '1', '删除商品分类: 眉笔眉粉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('320', '1427695551', '1', '删除商品分类: 时尚彩妆', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('321', '1427695552', '1', '删除商品分类: 粉底粉饼', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('322', '1427695552', '1', '删除商品分类: 眼影/眼线', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('323', '1427695553', '1', '删除商品分类: 睫毛膏', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('324', '1427695553', '1', '删除商品分类: 隔离/BB霜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('325', '1427695554', '1', '删除商品分类: 面部护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('326', '1427695554', '1', '删除商品分类: 美妆团购', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('327', '1427695555', '1', '删除商品分类: 钻石饰品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('328', '1427695555', '1', '删除商品分类: 翡翠玉石', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('329', '1427695556', '1', '删除商品分类: 水晶玛瑙', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('330', '1427695557', '1', '删除商品分类: 宝石珍珠', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('331', '1427695558', '1', '删除商品分类: 时尚饰品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('332', '1427695559', '1', '删除商品分类: 金银投资', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('333', '1427695560', '1', '删除商品分类: 纯金K金饰品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('334', '1427695560', '1', '删除商品分类: 彩妆', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('335', '1427695561', '1', '删除商品分类: MARC JACOBS', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('336', '1427695562', '1', '删除商品分类: COACH', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('337', '1427695562', '1', '删除商品分类: 更多品牌', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('338', '1427695563', '1', '删除商品分类: FENDI', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('339', '1427695563', '1', '删除商品分类: BURBERRY', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('340', '1427695564', '1', '删除商品分类: BOTTEGA VENETA', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('341', '1427695564', '1', '删除商品分类: DIOR', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('342', '1427695565', '1', '删除商品分类: Ferragamo', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('343', '1427695565', '1', '删除商品分类: MONTBLANC', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('344', '1427695566', '1', '删除商品分类: ARMANI', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('345', '1427695566', '1', '删除商品分类: RIMOWA', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('346', '1427695567', '1', '删除商品分类: MIUMIU', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('347', '1427695568', '1', '删除商品分类: BALENCIAGA', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('348', '1427695568', '1', '删除商品分类: PRADA', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('349', '1427695569', '1', '删除商品分类: GUCCI', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('350', '1427695569', '1', '删除商品分类: 奢侈品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('351', '1427695570', '1', '删除商品分类: 登山包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('352', '1427695570', '1', '删除商品分类: 妈咪包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('353', '1427695570', '1', '删除商品分类: 书包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('354', '1427695571', '1', '删除商品分类: 拉杆箱', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('355', '1427695571', '1', '删除商品分类: 电脑数码包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('356', '1427695572', '1', '删除商品分类: 功能箱包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('357', '1427695572', '1', '删除商品分类: 瑞士军刀', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('358', '1427695573', '1', '删除商品分类: 收藏品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('359', '1427695573', '1', '删除商品分类: 工艺摆件', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('360', '1427695574', '1', '删除商品分类: 创意礼品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('361', '1427695575', '1', '删除商品分类: 礼卡礼券', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('362', '1427695576', '1', '删除商品分类: 鲜花速递', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('363', '1427695578', '1', '删除商品分类: 婚庆用品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('364', '1427695578', '1', '删除商品分类: 礼品文具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('365', '1427695579', '1', '删除商品分类: 火机烟具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('366', '1427695579', '1', '删除商品分类: 香水精油', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('367', '1427695580', '1', '删除商品分类: 双肩包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('368', '1427695580', '1', '删除商品分类: 手提包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('369', '1427695581', '1', '删除商品分类: 斜挎包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('370', '1427695581', '1', '删除商品分类: 手拿包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('371', '1427695581', '1', '删除商品分类: 钱包/卡包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('372', '1427695582', '1', '删除商品分类: 个人洗护', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('373', '1427695582', '1', '删除商品分类: 腰带/礼盒', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('374', '1427695583', '1', '删除商品分类: 商务公文包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('375', '1427695583', '1', '删除商品分类: 休闲包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('376', '1427695584', '1', '删除商品分类: 腰包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('377', '1427695584', '1', '删除商品分类: 男士手包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('378', '1427695584', '1', '删除商品分类: 钱包/手包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('379', '1427695585', '1', '删除商品分类: 时尚男包', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('380', '1427695586', '1', '删除商品分类: 美妆采购', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('381', '1427695770', '1', '编辑商品分类: 美颜系列1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('382', '1427695783', '1', '编辑商品分类: 美颜系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('383', '1427695797', '1', '编辑商品分类: 美肤系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('384', '1427695881', '1', '删除商品分类: 眼影/眼线', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('385', '1427695881', '1', '删除商品分类: 组合套装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('386', '1427695882', '1', '删除商品分类: 迷你香水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('387', '1427695882', '1', '删除商品分类: 香体走珠', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('388', '1427695883', '1', '删除商品分类: 男士香水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('389', '1427695884', '1', '删除商品分类: 女士香水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('390', '1427695884', '1', '删除商品分类: 帽子', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('391', '1427695885', '1', '删除商品分类: 眉笔', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('392', '1427695885', '1', '删除商品分类: 睫毛膏', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('393', '1427695886', '1', '删除商品分类: 唇膏唇彩', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('394', '1427695887', '1', '删除商品分类: 彩妆组合', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('395', '1427695887', '1', '删除商品分类: 腮红', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('396', '1427695888', '1', '删除商品分类: 粉底/遮瑕', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('397', '1427695888', '1', '删除商品分类: 魅力彩妆', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('398', '1427695889', '1', '删除商品分类: 卸妆', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('399', '1427695889', '1', '删除商品分类: 美甲', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('400', '1427695890', '1', '删除商品分类: 彩妆工具', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('401', '1427695890', '1', '删除商品分类: 卫生巾', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('402', '1427695891', '1', '删除商品分类: 卫生护垫', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('403', '1427695891', '1', '删除商品分类: 男士香水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('404', '1427695892', '1', '删除商品分类: 剃须', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('405', '1427695892', '1', '删除商品分类: 防脱洗护', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('406', '1427695893', '1', '删除商品分类: 唇膏', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('407', '1427695893', '1', '删除商品分类: 身体护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('408', '1427695894', '1', '删除商品分类: 眼部', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('409', '1427695894', '1', '删除商品分类: 脸部', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('410', '1427695894', '1', '删除商品分类: 男士护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('411', '1427695895', '1', '删除商品分类: 洗液', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('412', '1427695895', '1', '删除商品分类: 美容食品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('413', '1427695896', '1', '删除商品分类: 其它', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('414', '1427695896', '1', '删除商品分类: 女性护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('415', '1427695897', '1', '删除商品分类: 纤体瘦身', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('416', '1427695897', '1', '删除商品分类: 牙刷/牙线', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('417', '1427695898', '1', '删除商品分类: 漱口水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('418', '1427695898', '1', '删除商品分类: 牙膏/牙粉', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('419', '1427695898', '1', '删除商品分类: 手表', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('420', '1427695899', '1', '删除商品分类: 脱毛膏', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('421', '1427695900', '1', '删除商品分类: 手足护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('422', '1427695900', '1', '删除商品分类: 洗护套装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('423', '1427695901', '1', '删除商品分类: 洗发护发', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('424', '1427695901', '1', '删除商品分类: 染发/造型', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('425', '1427695901', '1', '删除商品分类: 沐浴', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('426', '1427695902', '1', '删除商品分类: 磨砂/浴盐', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('427', '1427695903', '1', '删除商品分类: 身体乳', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('428', '1427695903', '1', '删除商品分类: 手工/香皂', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('429', '1427695905', '1', '删除商品分类: 香薰精油', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('430', '1427695906', '1', '删除商品分类: 配饰', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('431', '1427695906', '1', '删除商品分类: 精华露', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('432', '1427695907', '1', '删除商品分类: 乳液面霜', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('433', '1427695908', '1', '删除商品分类: 面膜面贴', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('434', '1427695908', '1', '删除商品分类: 眼部护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('435', '1427696026', '1', '删除商品分类: 颈部护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('436', '1427696027', '1', '删除商品分类: T区护理', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('437', '1427696027', '1', '删除商品分类: 护肤套装', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('438', '1427696028', '1', '删除商品分类: 防晒隔离', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('439', '1427696028', '1', '删除商品分类: 爽肤水', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('440', '1427696029', '1', '删除商品分类: 洁面乳', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('441', '1427696030', '1', '删除商品分类: 饰品', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('442', '1427696031', '1', '删除商品分类: 鞋包配饰', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('443', '1427700053', '1', '编辑商品: 商品1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('444', '1427700298', '1', '编辑商品: 商品1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('445', '1427700330', '1', '编辑商品: 商品2', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('446', '1427700354', '1', '编辑商品: 商品3', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('447', '1427700373', '1', '编辑商品: 商品4', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('448', '1427700386', '1', '编辑商品: 商品5', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('449', '1427700399', '1', '编辑商品: 商品6', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('450', '1427700476', '1', '编辑文章: 投诉与建议', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('451', '1427700592', '1', '编辑文章: 三星电子宣布将在中国发布15款3G手机', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('452', '1427701468', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('453', '1427701491', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('454', '1427701514', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('455', '1427701533', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('456', '1427701552', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('457', '1427701564', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('458', '1427701582', '1', '编辑广告: 首页左侧广告', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('459', '1427701688', '1', '编辑商店设置: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('460', '1427701949', '1', '删除友情链接: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('461', '1427702037', '1', '删除友情链接: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('462', '1427702068', '1', '编辑友情链接: 免费开独立网店', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('463', '1427702073', '1', '编辑友情链接: 买否网', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('464', '1427703445', '1', '编辑品牌管理: 美的', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('465', '1427703460', '1', '编辑品牌管理: 有讯网络', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('466', '1427703614', '1', '编辑商品: 商品1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('467', '1427703658', '1', '编辑商品: 商品1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('468', '1427703801', '1', '编辑商品分类: 美肤系列', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('469', '1427703866', '1', '编辑商品: 商品1', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('470', '1427705482', '1', '编辑会员账号: admin123', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('471', '1427705492', '1', '编辑会员账号: admin123', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('472', '1427705803', '1', '编辑商店设置: ', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('473', '1427708906', '1', '编辑商品分类: 分类一', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('474', '1427708916', '1', '编辑商品分类: 分类二', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('475', '1427708925', '1', '编辑商品分类: 分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('476', '1427708935', '1', '编辑商品分类: 分类四', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('477', '1427708965', '1', '编辑商品分类: 分类五', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('478', '1427708981', '1', '编辑商品分类: 分类六', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('479', '1427709002', '1', '编辑商品分类: 分类七', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('480', '1427709019', '1', '编辑商品分类: 分类八', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('481', '1427709035', '1', '编辑商品分类: 分类一', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('482', '1427709044', '1', '编辑商品分类: 分类二', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('483', '1427709079', '1', '编辑商品分类: 分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('484', '1427709195', '1', '编辑商品分类: 分类四', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('485', '1427709210', '1', '编辑商品分类: 分类五', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('486', '1427709239', '1', '编辑商品分类: 分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('487', '1427709251', '1', '编辑商品分类: 分类四', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('488', '1427709267', '1', '编辑商品分类: 分类五', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('489', '1427709282', '1', '编辑商品分类: 分类六', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('490', '1427709299', '1', '编辑商品分类: 分类七', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('491', '1427709314', '1', '编辑商品分类: 分类一', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('492', '1427709332', '1', '编辑商品分类: 分类二', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('493', '1427709362', '1', '编辑商品分类: 分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('494', '1427709374', '1', '编辑商品分类: 分类四', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('495', '1427709392', '1', '编辑商品分类: 分类五', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('496', '1427709445', '1', '编辑商品分类: 导航分类一', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('497', '1427709454', '1', '编辑商品分类: 导航分类二', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('498', '1427709465', '1', '编辑商品分类: 导航分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('499', '1427709994', '1', '编辑商品分类: 分类一', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('500', '1427710006', '1', '编辑商品分类: 分类二', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('501', '1427710018', '1', '编辑商品分类: 分类三', '127.0.0.1');
INSERT INTO ecs_admin_log VALUES ('502', '1427710056', '1', '编辑商品分类: 分类四', '127.0.0.1');

-- ----------------------------
-- Table structure for `ecs_admin_message`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_message`;
CREATE TABLE `ecs_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(11) unsigned NOT NULL DEFAULT '0',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_message
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_user`;
CREATE TABLE `ecs_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `ec_salt` varchar(10) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `role_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_user
-- ----------------------------
INSERT INTO ecs_admin_user VALUES ('1', 'admin', '1025512459@qq.com', '0975a7658b215155496227a856689f23', '2936', '1427683186', '1427711371', '127.0.0.1', 'all', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', '0', '0', null, null);

-- ----------------------------
-- Table structure for `ecs_adsense`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_adsense`;
CREATE TABLE `ecs_adsense` (
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `from_ad` (`from_ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_adsense
-- ----------------------------
INSERT INTO ecs_adsense VALUES ('193', '本站', '7');

-- ----------------------------
-- Table structure for `ecs_ad_custom`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_custom`;
CREATE TABLE `ecs_ad_custom` (
  `ad_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ad_name` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `ad_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_position`;
CREATE TABLE `ecs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_position
-- ----------------------------
INSERT INTO ecs_ad_position VALUES ('159', '首页左侧广告', '240', '140', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');

-- ----------------------------
-- Table structure for `ecs_affiliate_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_affiliate_log`;
CREATE TABLE `ecs_affiliate_log` (
  `log_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) NOT NULL,
  `time` int(10) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(10) NOT NULL DEFAULT '0',
  `separate_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_affiliate_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_agency`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_agency`;
CREATE TABLE `ecs_agency` (
  `agency_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL,
  PRIMARY KEY (`agency_id`),
  KEY `agency_name` (`agency_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_agency
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_area_region`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_area_region`;
CREATE TABLE `ecs_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_area_region
-- ----------------------------
INSERT INTO ecs_area_region VALUES ('1', '1');
INSERT INTO ecs_area_region VALUES ('2', '1');
INSERT INTO ecs_area_region VALUES ('3', '1');
INSERT INTO ecs_area_region VALUES ('4', '3');
INSERT INTO ecs_area_region VALUES ('4', '4');
INSERT INTO ecs_area_region VALUES ('4', '6');
INSERT INTO ecs_area_region VALUES ('4', '9');
INSERT INTO ecs_area_region VALUES ('4', '30');
INSERT INTO ecs_area_region VALUES ('4', '32');

-- ----------------------------
-- Table structure for `ecs_article`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_article`;
CREATE TABLE `ecs_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '',
  `author_email` varchar(60) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_article
-- ----------------------------
INSERT INTO ecs_article VALUES ('1', '2', '免责条款', '免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款免责条款', '', '', '', '0', '1', '1247818970', '', '0', '', '');
INSERT INTO ecs_article VALUES ('2', '2', '隐私保护', '隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护', '', '', '', '0', '1', '1247818970', '', '0', '', '');
INSERT INTO ecs_article VALUES ('3', '2', '咨询热点', '咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点咨询热点', '', '', '', '0', '1', '1247818970', '', '0', '', '');
INSERT INTO ecs_article VALUES ('4', '2', '联系我们', '联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们', '', '', '', '0', '1', '1247818970', '', '0', '', '');
INSERT INTO ecs_article VALUES ('5', '2', '公司简介', '公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介', '', '', '', '0', '1', '1247818970', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('6', '-1', '用户协议', '用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议用户协议', '', '', '', '0', '1', '1247818970', '', '0', '', '');
INSERT INTO ecs_article VALUES ('7', '4', '3G资讯1', '3G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯13G资讯1', '', '', '', '0', '1', '1241426864', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('8', '4', '3G资讯2', '3G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯23G资讯2', '', '', '', '0', '1', '1241427051', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('9', '5', '售后流程', '售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程售后流程', '', '', '', '0', '1', '1242576700', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('10', '5', '购物流程', '购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程购物流程', '', '', '', '0', '1', '1242576717', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('11', '5', '订购方式', '订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式订购方式', '', '', '', '0', '1', '1242576727', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('12', '6', '购物常识 ', '购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 ', '', '', '', '1', '1', '1242576826', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('15', '7', '货到付款区域', '货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域货到付款区域', '', '', '', '0', '1', '1242577023', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('16', '7', '配送支付智能查询 ', '配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 配送支付智能查询 ', '', '', '', '0', '1', '1242577032', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('17', '7', '支付方式说明', ' 支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明支付方式说明', '', '', '', '0', '1', '1242577041', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('18', '10', '资金管理', ' ', '', '', '', '0', '1', '1242577127', '', '0', 'user.php?act=account_log', '');
INSERT INTO ecs_article VALUES ('19', '10', '我的收藏', ' ', '', '', '', '0', '1', '1242577178', '', '0', 'user.php?act=collection_list', '');
INSERT INTO ecs_article VALUES ('20', '10', '我的订单', '', '', '', '', '0', '1', '1242577199', '', '0', 'user.php?act=order_list', '');
INSERT INTO ecs_article VALUES ('21', '8', '退换货原则', '退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则退换货原则', '', '', '服务', '0', '1', '1242577293', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('22', '8', '售后服务保证 ', '售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 售后服务保证 ', '', '', '售后', '0', '1', '1242577308', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('23', '8', '产品质量保证 ', '产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 产品质量保证 ', '', '', '质量', '1', '1', '1242577326', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('27', '4', '3G资讯3', '3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯', '', '', '', '0', '1', '1242577702', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('28', '11', '手机促销1', '手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1手机促销1', '', '', '', '0', '0', '1242578199', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('29', '11', '手机促销2', '手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2手机促销2', '', '', '', '1', '0', '1242578676', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('30', '11', '手机促销3', '手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3手机促销3', '', '', '', '1', '0', '1242578826', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('13', '6', '购物常识 1', '购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 ', '', '', '', '0', '1', '1242576911', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('14', '6', '购物常识 2', '购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 购物常识 ', '', '', '', '0', '1', '1242576927', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('38', '12', '站内快讯1', '站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1站内快讯1', '', '', '', '1', '1', '1330561916', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('39', '12', '站内快讯2', '站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2站内快讯2', '', '', '', '1', '1', '1330561934', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('40', '12', '站内快讯3', '站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3站内快讯3', '', '', '', '1', '1', '1330561947', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('41', '12', '站内快讯4', '站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4站内快讯4', '', '', '', '1', '1', '1330561960', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('42', '13', '电脑资讯1', '电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1电脑资讯1', '', '', '', '0', '1', '1332292742', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('43', '13', '电脑资讯2', '电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2电脑资讯2', '', '', '', '0', '1', '1332292750', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('44', '13', '电脑资讯3', '电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3电脑资讯3', '', '', '', '0', '1', '1332292758', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('45', '13', '电脑资讯4', '电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4电脑资讯4', '', '', '', '0', '1', '1332292766', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('46', '13', '电脑资讯5', '电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5电脑资讯5', '', '', '', '0', '1', '1332292773', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('47', '14', '手机通讯1', '手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1手机通讯1', '', '', '', '0', '1', '1332455419', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('48', '14', '手机通讯2', '手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2手机通讯2', '', '', '', '0', '1', '1332455428', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('49', '14', '手机通讯3', '手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3手机通讯3', '', '', '', '0', '1', '1332455437', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('50', '14', '手机通讯4', '手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4手机通讯4', '', '', '', '0', '1', '1332455447', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('51', '14', '手机通讯5', '手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5手机通讯5', '', '', '', '0', '1', '1332455456', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('52', '15', '时尚资讯1', '时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1时尚资讯1', '', '', '', '0', '1', '1332628133', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('53', '15', '时尚资讯2', '时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2时尚资讯2', '', '', '', '0', '1', '1332628143', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('54', '15', '时尚资讯3', '时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3时尚资讯3', '', '', '', '0', '1', '1332628153', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('55', '15', '时尚资讯4', '时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4时尚资讯4', '', '', '', '0', '1', '1332628165', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('56', '15', '时尚资讯5', '时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5时尚资讯5', '', '', '', '0', '1', '1332628174', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('57', '16', '名仕资讯1', '名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1名仕资讯1', '', '', '', '0', '1', '1332633736', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('58', '16', '名仕资讯2', '名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2名仕资讯2', '', '', '', '0', '1', '1332633745', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('59', '16', '名仕资讯3', '名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3名仕资讯3', '', '', '', '0', '1', '1332633755', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('60', '16', '名仕资讯4', '名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4名仕资讯4', '', '', '', '0', '1', '1332633769', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('61', '16', '名仕资讯5', '名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5名仕资讯5', '', '', '', '0', '1', '1332633808', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('62', '17', '特价促销1', '特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1特价促销1', '', '', '', '0', '1', '1332640479', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('63', '17', '特价促销2', '特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2特价促销2', '', '', '', '0', '1', '1332640487', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('64', '17', '特价促销3', '特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3特价促销3', '', '', '', '0', '1', '1332640497', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('65', '17', '特价促销4', '特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4特价促销4', '', '', '', '0', '1', '1332640504', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('66', '17', '特价促销5', '特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5特价促销5', '', '', '', '0', '1', '1332640523', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('35', '4', '3G资讯', '3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯3G资讯', '', '', '', '0', '1', '1242974613', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('67', '9', '网站故障报告', '网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告网站故障报告', '', '', '', '0', '0', '1415315877', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('68', '9', '选机咨询', '选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询选机咨询', '', '', '', '0', '0', '1415315886', '', '0', 'http://', '');
INSERT INTO ecs_article VALUES ('69', '9', '投诉与建议', '投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议投诉与建议', '', '', '', '0', '0', '1415315895', '', '0', 'http://', '');

-- ----------------------------
-- Table structure for `ecs_article_cat`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_article_cat`;
CREATE TABLE `ecs_article_cat` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_article_cat
-- ----------------------------
INSERT INTO ecs_article_cat VALUES ('1', '系统分类', '2', '', '系统保留分类', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('2', '网店信息', '3', '', '网店信息分类', '50', '0', '1');
INSERT INTO ecs_article_cat VALUES ('3', '网店帮助分类', '4', '', '网店帮助分类', '50', '0', '1');
INSERT INTO ecs_article_cat VALUES ('4', '3G资讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('5', '新手上路 ', '5', '', '', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('6', '购物常识 ', '5', '', '购物常识 ', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('7', '配送与支付 ', '5', '', '配送与支付 ', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('8', '服务保证 ', '5', '', '', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('9', '联系我们 ', '5', '', '联系我们 ', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('10', '会员中心', '5', '', '', '50', '0', '3');
INSERT INTO ecs_article_cat VALUES ('11', '手机促销', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('12', '站内快讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('13', '电脑资讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('14', '手机通讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('15', '时尚资讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('16', '名仕资讯', '1', '', '', '50', '0', '0');
INSERT INTO ecs_article_cat VALUES ('17', '特价促销', '1', '', '', '50', '0', '0');

-- ----------------------------
-- Table structure for `ecs_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_attribute`;
CREATE TABLE `ecs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_attribute
-- ----------------------------
INSERT INTO ecs_attribute VALUES ('240', '12', '内置扬声器', '1', '0', '有', '0', '0', '0', '2');
INSERT INTO ecs_attribute VALUES ('234', '12', '颜色', '1', '1', '黑色\r\n红色\r\n黄色', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('233', '12', '型号', '1', '0', 'TLM42V66PK', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('232', '12', '品牌', '1', '0', '海信 Hisense', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('243', '14', '袖型', '1', '0', '长袖\r\n短袖\r\n七分袖\r\n无袖', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('242', '14', '风格', '1', '0', '欧美复古\r\n英伦学院\r\n原创\r\n通勤\r\n甜美淑女\r\n日韩\r\n简约\r\n民族\r\n街头\r\n卡通', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('245', '14', '颜色', '1', '1', '红\r\n蓝\r\n黄', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('246', '14', '尺寸', '1', '1', 'XL\r\nL\r\nM\r\nXXL', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('244', '14', '花型', '1', '0', '素色\r\n条纹\r\n大方格\r\n千鸟格\r\n波点\r\n拼接\r\n撞色\r\n小碎花\r\n印花/绣花', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('241', '12', '内置扬声器数量', '1', '0', '2个', '0', '0', '0', '2');
INSERT INTO ecs_attribute VALUES ('235', '12', '产品品类', '1', '0', '液晶电视', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('236', '12', '屏幕尺寸', '1', '1', '42英寸\r\n18村\r\n20寸', '0', '0', '0', '1');
INSERT INTO ecs_attribute VALUES ('237', '12', '屏幕比例', '1', '0', '16:9', '0', '0', '0', '1');
INSERT INTO ecs_attribute VALUES ('238', '12', '分辨率', '1', '0', '1920 x 1080', '0', '0', '0', '1');
INSERT INTO ecs_attribute VALUES ('239', '12', '刷屏率', '1', '0', '60HZ', '0', '0', '0', '1');
INSERT INTO ecs_attribute VALUES ('247', '14', '领型', '1', '0', '圆领', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('248', '14', '图案', '1', '0', '印花', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('249', '14', '款式', '1', '0', '套头', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('250', '14', '面料', '1', '0', '棉 聚酯纤维', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('251', '14', '衣门襟', '1', '0', '其他', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('252', '15', '颜色', '1', '1', '红色\r\n蓝色\r\n彩色', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('253', '15', '尺寸', '1', '1', '500ml\r\n600ml\r\n700ml', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('254', '15', '使用部位', '1', '0', '全身', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('255', '15', '使用肤质', '1', '0', '所有', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('256', '15', '品类', '1', '0', '润肤露/身体乳', '0', '0', '0', '0');
INSERT INTO ecs_attribute VALUES ('257', '15', '功效', '1', '0', '清洁 清爽', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `ecs_auction_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_auction_log`;
CREATE TABLE `ecs_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `act_id` (`act_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_auction_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_auto_manage`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_auto_manage`;
CREATE TABLE `ecs_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_auto_manage
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_back_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_back_goods`;
CREATE TABLE `ecs_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `back_id` mediumint(8) unsigned DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  PRIMARY KEY (`rec_id`),
  KEY `back_id` (`back_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_back_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_back_order`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_back_order`;
CREATE TABLE `ecs_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `return_time` int(10) unsigned DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_back_order
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_bonus_type`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_bonus_type`;
CREATE TABLE `ecs_bonus_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `send_start_date` int(11) NOT NULL DEFAULT '0',
  `send_end_date` int(11) NOT NULL DEFAULT '0',
  `use_start_date` int(11) NOT NULL DEFAULT '0',
  `use_end_date` int(11) NOT NULL DEFAULT '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_bonus_type
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_booking_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_booking_goods`;
CREATE TABLE `ecs_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_desc` varchar(255) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `booking_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_dispose` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dispose_user` varchar(30) NOT NULL DEFAULT '',
  `dispose_time` int(10) unsigned NOT NULL DEFAULT '0',
  `dispose_note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_booking_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_brand`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_brand`;
CREATE TABLE `ecs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_brand
-- ----------------------------
INSERT INTO ecs_brand VALUES ('1', '有讯网络', '1380685184117198956.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('2', 'APPLE', '1380685191110433994.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('3', '方正', '1380685198896536870.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('4', '希捷', '1380685206906148108.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('5', '漫步者', '1380685213383629650.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('6', '天翼', '1380685222792305410.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('7', '美的', '1380685232971191371.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('8', '惠普', '1380685242589017695.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('9', '联想', '1380685252873307833.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('10', '金立', '1380685292392455401.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('11', '  恒基伟业', '1380685907063087318.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('12', '夏普', '1380685309482040868.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('13', '索尼', '1380685318966924400.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('14', '创维', '1380685327309605456.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('15', '乐华', '1380685336300659451.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('20', '茵佳妮', '1380685345175448444.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('17', '爱普生', '1380685356455900353.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');
INSERT INTO ecs_brand VALUES ('18', 'AMD', '1380685367276048777.jpg', '#####', 'http://mj.xiaoyuok.com/myzj', '50', '1');

-- ----------------------------
-- Table structure for `ecs_card`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_card`;
CREATE TABLE `ecs_card` (
  `card_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_img` varchar(255) NOT NULL DEFAULT '',
  `card_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `card_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_card
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_cart`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_cart`;
CREATE TABLE `ecs_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_cart
-- ----------------------------
INSERT INTO ecs_cart VALUES ('1', '1', '2e611313614bf59d214ef86a97ea10d5', '140', 'ECS000140', '0', '商品2', '76.00', '69.00', '1', '颜色:红 \n尺寸:XL \n', '1', '', '0', '0', '0', '0', '0', '2265,2268');
INSERT INTO ecs_cart VALUES ('2', '1', '2e611313614bf59d214ef86a97ea10d5', '138', 'ECS000138', '0', '商品4', '60.00', '50.00', '1', '颜色:红 \n尺寸:M \n', '1', '', '0', '0', '0', '0', '0', '2225,2230');

-- ----------------------------
-- Table structure for `ecs_category`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_category`;
CREATE TABLE `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  `is_show_cate` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=684 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_category
-- ----------------------------
INSERT INTO ecs_category VALUES ('2', '分类1', '', '', '17', '50', '', '', '0', '', '1', '5', '6', '0');
INSERT INTO ecs_category VALUES ('19', '分类2', '', '', '17', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('20', '分类3', '', '', '17', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('6', '分类五', '', '耳机 电池 读卡内存卡 充 电 器 ', '16', '50', '', '', '0', '', '1', '5', '', '0');
INSERT INTO ecs_category VALUES ('7', '分类1', '', '', '6', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('8', '分类2', '', '', '6', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('9', '分类3', '', '', '6', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('11', '分类4', '', '', '6', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('12', '分类四', '', '联通充值卡 小灵通充值卡 移动充值卡 ', '16', '50', '', '', '0', '', '1', '5', '', '0');
INSERT INTO ecs_category VALUES ('13', '分类1', '', '', '12', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('14', '分类2', '', '', '12', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('15', '分类', '', '', '12', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('16', '足浴系列', '', '', '0', '11', '', '', '1', '', '1', '5', '', '0');
INSERT INTO ecs_category VALUES ('17', '分类二', '', '3G手机 GSM手机 CDMA手机 ', '16', '2', '', '', '0', '', '1', '5', '', '1');
INSERT INTO ecs_category VALUES ('18', '分类', '', '', '17', '50', '', '', '0', '', '1', '5', '0', '0');
INSERT INTO ecs_category VALUES ('21', '美颜系列', '', '', '0', '7', '', '个', '1', '', '1', '10', '243,246,245,242,244', '0');
INSERT INTO ecs_category VALUES ('22', '分类二', '', '电话机 电熨斗 清洁机 饮水机', '21', '50', '', '', '0', '', '1', '0', '238,239', '1');
INSERT INTO ecs_category VALUES ('23', '分类1', '', '', '22', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('26', '分类2', '', '', '22', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('27', '分类3', '', '', '22', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('29', '分类五', '', '燃气炉 电饭煲 电磁炉 电水壶 ', '21', '50', '', '', '0', '', '1', '0', '', '1');
INSERT INTO ecs_category VALUES ('30', '分类1', '', '', '29', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('624', '分类1', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('32', '分类2', '', '', '29', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('33', '分类3', '', '', '29', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('34', '分类八', '', '吹风机 血压计 剃须刀', '21', '50', '', '', '0', '', '1', '0', '', '1');
INSERT INTO ecs_category VALUES ('35', '分类1', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('36', '分类2', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('37', '分类3', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('38', '分类4', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('39', '分类七', '', '车载电源 GPS导航 汽车护理 ', '21', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('40', '分类2', '', '汽车护理 车内饰品 车载电源', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('41', '分类3', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('42', '分类4', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('43', '分类5', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('44', '导航分类二', '', '', '0', '13', '', '', '1', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('45', '分类三', '', '卫浴用品 家纺毛巾', '44', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('46', '分类1', '', '', '45', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('47', '分类2', '', '', '45', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('48', '分类3', '', '', '45', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('49', '分类4', '', '', '45', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('50', '分类六', '', '童鞋 腰带 休闲鞋 ', '44', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('51', '分类1', '', '', '50', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('52', '分类2', '', '', '50', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('53', '分类3', '', '', '50', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('54', '分类一', '', '瑞士军刀 工艺藏品 烟具 ', '44', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('55', '分类1', '', '', '54', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('56', '分类2', '', '', '54', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('57', '分类3', '', '', '54', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('58', '分类四', '', '国产表店 日本表店 流行饰品 ', '44', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('59', '分类1', '', '', '58', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('60', '分类2', '', '', '58', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('61', '分类3', '', '', '58', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('62', '分类五', '', '室内球类 运动器材 户外装备 ', '44', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('63', '分类1', '', '', '62', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('64', '分类2', '', '', '62', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('65', '分类3', '', '', '62', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('66', '分类七', '', '遥控玩具 电动玩具 ', '44', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('67', '分类1', '', '', '66', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('68', '分类2', '', '', '66', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('69', '导航分类一', '', '', '0', '12', '', '', '1', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('70', '分类二', '', '台式机 服务器 笔记本 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('71', '分类1', '', '', '70', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('72', '分类2', '', '', '70', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('73', '分类', '', '', '70', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('74', '分类五', '', '光驱 显卡 CPU 主板', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('75', '分类1', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('76', '分类2', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('77', '分类3', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('78', '分类4', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('79', '分类5', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('80', '分类6', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('81', '分类7', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('82', '分类8', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('83', '分类三', '', '显示器 电源 主机箱 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('84', '分类1', '', '', '83', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('111', '分类1', '', '', '101', '50', '', '个', '0', '', '1', '5', '230', '0');
INSERT INTO ecs_category VALUES ('86', '分类2', '', '', '83', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('87', '分类3', '', '', '83', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('88', '分类', '', '', '83', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('89', '分类一', '', '一体机  复印机 打印机 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('90', '分类1', '', '', '89', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('91', '分类2', '', '', '89', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('92', '分类', '', '', '89', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('93', '分类四', '', '路由器  网卡 交换机 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('94', '分类1', '', '', '93', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('95', '分类2', '', '', '93', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('96', '分类3', '', '', '93', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('97', '分类六', '', '游戏软件 杀毒软件 办公软件 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('98', '分类1', '', '', '97', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('99', '分类2', '', '', '97', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('100', '分类3', '', '', '97', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('101', '分类七', '', ' 色带  墨盒 墨粉 ', '69', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('102', '分类2', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('103', '分类3', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('104', '分类4', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('117', '分类1', '', '', '116', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('118', '分类2', '', '', '116', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('119', '分类3', '', '', '116', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('120', '分类一', '', 'MP3/MP4  MP3/MP4配件 苹果配件 录音笔', '16', '1', '', '', '0', '', '1', '0', '', '1');
INSERT INTO ecs_category VALUES ('110', '分类六', '', '电吹风 电蚊香', '21', '50', '', '3', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('112', '分类9', '', '', '74', '50', '', '', '0', '', '1', '0', '0', '0');
INSERT INTO ecs_category VALUES ('217', '分类1', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('625', '分类6', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('116', '分类三', '', '便携相机\r\n单反相机\r\n数码摄像机', '16', '3', '', '', '0', '', '1', '0', '', '1');
INSERT INTO ecs_category VALUES ('201', '分类1', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('132', '美肤系列', '', '', '0', '9', '', '', '1', '', '1', '0', '256,252,255,254', '0');
INSERT INTO ecs_category VALUES ('114', '分类1', '', '', '110', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('115', '分类2', '', '', '110', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('121', '分类二', '', '乳液/面霜 身体护理 彩妆 香水', '44', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('122', '分类1', '', '', '121', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('123', '分类', '', '', '121', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('124', '分类一', '', '动漫人物 遥控玩具 毛绒布艺 益智玩具', '21', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('125', '分类1', '', '', '124', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('126', '分类2', '', '', '124', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('127', '分类1', '', '', '124', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('216', '分类四', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('215', '导航分类三', '', '', '0', '14', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('634', '分类5', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('627', '分类7', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('626', '分类8', '', '', '39', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('138', '分类五', '', '', '132', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('139', '分类1', '', '', '138', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('140', '分类2', '', '', '138', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('141', '分类3', '', '', '138', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('628', '分类3', '', '', '110', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('629', '分类1', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('630', '分类6', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('631', '分类7', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('632', '分类8', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('633', '分类9', '', '', '34', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('154', '分类七', '', '', '132', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('635', '分类四', '', '', '21', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('156', '分类1', '', '', '154', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('157', '分类2', '', '', '154', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('158', '分类3', '', '', '154', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('159', '分类4', '', '', '154', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('160', '分类六', '', '', '132', '50', '', '', '0', '', '1', '0', '', '1');
INSERT INTO ecs_category VALUES ('161', '分类1', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('162', '分类2', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('163', '分类3', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('164', '分类4', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('166', '分类5', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('167', '分类6', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('168', '分类7', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('169', '分类8', '', '', '160', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('170', '分类四', '', '', '132', '50', '', '', '1', '', '1', '9', '246,245,242,244,243', '1');
INSERT INTO ecs_category VALUES ('171', '分类2', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('172', '分类3', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('173', '分类4', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('174', '分类5', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('175', '分类二', '', '', '132', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('176', '分类1', '', '', '175', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('178', '分类2', '', '', '175', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('179', '分类3', '', '', '175', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('639', '分类1', '', '', '635', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('638', '分类2', '', '', '635', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('182', '分类一', '', '', '132', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('185', '分类1', '', '', '182', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('636', '分类3', '', '', '635', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('188', '分类2', '', '', '182', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('637', '分类4', '', '', '635', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('190', '分类三', '', '', '132', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('193', '分类1', '', '', '190', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('194', '分类2', '', '', '190', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('623', '分类6', '', '', '170', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('202', '分类2', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('203', '分类', '', '', '116', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('204', '分类3', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('205', '分类4', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('206', '分类5', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('207', '分类6', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('208', '分类7', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('210', '分类8', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('211', '分类9', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('212', '分类10', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('213', '分类11', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('214', '分类12', '', '', '120', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('218', '分类2', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('219', '分类3', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('220', '分类4', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('221', '分类5', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('222', '分类6', '', '', '216', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('223', '分类二', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('224', '分类1', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('225', '分类2', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('226', '分类3', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('227', '分类4', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('228', '分类5', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('229', '分类6', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('230', '分类7', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('231', '分类8', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('232', '分类9', '', '', '223', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('233', '分类五', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('234', '分类1', '', '', '233', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('235', '分类2', '', '', '233', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('236', '分类3', '', '', '233', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('237', '分类六', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('238', '分类1', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('239', '分类2', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('240', '分类3', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('241', '分类4', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('242', '分类5', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('243', '分类6', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('244', '分类7', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('245', '分类8', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('246', '分类9', '', '', '237', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('247', '分类七', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('248', '分类1', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('249', '分类2', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('250', '分类3', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('251', '分类4', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('252', '分类5', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('253', '分类6', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('254', '分类7', '', '', '247', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('255', '分类三', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('256', '分类1', '', '', '255', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('257', '分类2', '', '', '255', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('260', '分类一', '', '', '215', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('261', '分类1', '', '', '260', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('262', '分类2', '', '', '260', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('263', '分类3', '', '', '260', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('264', '分类4', '', '', '260', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('640', '分类5', '', '', '635', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('641', '分类三', '', '', '21', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('642', '分类1', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('643', '分类2', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('644', '分类3', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('645', '分类4', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('646', '分类5', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');
INSERT INTO ecs_category VALUES ('647', '分类6', '', '', '641', '50', '', '', '0', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `ecs_cat_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_cat_recommend`;
CREATE TABLE `ecs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`,`recommend_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_cat_recommend
-- ----------------------------
INSERT INTO ecs_cat_recommend VALUES ('3', '1');
INSERT INTO ecs_cat_recommend VALUES ('3', '2');
INSERT INTO ecs_cat_recommend VALUES ('3', '3');
INSERT INTO ecs_cat_recommend VALUES ('5', '1');
INSERT INTO ecs_cat_recommend VALUES ('5', '2');
INSERT INTO ecs_cat_recommend VALUES ('5', '3');
INSERT INTO ecs_cat_recommend VALUES ('12', '1');
INSERT INTO ecs_cat_recommend VALUES ('12', '2');
INSERT INTO ecs_cat_recommend VALUES ('12', '3');
INSERT INTO ecs_cat_recommend VALUES ('13', '3');
INSERT INTO ecs_cat_recommend VALUES ('14', '2');
INSERT INTO ecs_cat_recommend VALUES ('14', '3');
INSERT INTO ecs_cat_recommend VALUES ('15', '1');
INSERT INTO ecs_cat_recommend VALUES ('15', '2');
INSERT INTO ecs_cat_recommend VALUES ('16', '3');
INSERT INTO ecs_cat_recommend VALUES ('17', '3');
INSERT INTO ecs_cat_recommend VALUES ('21', '3');
INSERT INTO ecs_cat_recommend VALUES ('22', '3');
INSERT INTO ecs_cat_recommend VALUES ('34', '3');
INSERT INTO ecs_cat_recommend VALUES ('69', '3');
INSERT INTO ecs_cat_recommend VALUES ('70', '3');
INSERT INTO ecs_cat_recommend VALUES ('83', '3');
INSERT INTO ecs_cat_recommend VALUES ('89', '3');
INSERT INTO ecs_cat_recommend VALUES ('101', '3');
INSERT INTO ecs_cat_recommend VALUES ('110', '2');
INSERT INTO ecs_cat_recommend VALUES ('110', '3');
INSERT INTO ecs_cat_recommend VALUES ('111', '1');
INSERT INTO ecs_cat_recommend VALUES ('120', '3');
INSERT INTO ecs_cat_recommend VALUES ('229', '2');

-- ----------------------------
-- Table structure for `ecs_collect_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_collect_goods`;
CREATE TABLE `ecs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_collect_goods
-- ----------------------------
INSERT INTO ecs_collect_goods VALUES ('13', '47', '134', '1380778630', '0');
INSERT INTO ecs_collect_goods VALUES ('14', '57', '136', '1421192329', '0');
INSERT INTO ecs_collect_goods VALUES ('15', '57', '140', '1421193144', '0');
INSERT INTO ecs_collect_goods VALUES ('16', '57', '208', '1421261148', '0');

-- ----------------------------
-- Table structure for `ecs_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_comment`;
CREATE TABLE `ecs_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_comment
-- ----------------------------
INSERT INTO ecs_comment VALUES ('1', '0', '139', 'admin@qq.com', 'admin123', '555', '5', '1427706128', '127.0.0.1', '0', '0', '1');

-- ----------------------------
-- Table structure for `ecs_crons`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_crons`;
CREATE TABLE `ecs_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL DEFAULT '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `run_once` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip` varchar(100) NOT NULL DEFAULT '',
  `alow_files` varchar(255) NOT NULL,
  PRIMARY KEY (`cron_id`),
  KEY `nextime` (`nextime`),
  KEY `enable` (`enable`),
  KEY `cron_code` (`cron_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_crons
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_delivery_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_delivery_goods`;
CREATE TABLE `ecs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `extension_code` varchar(30) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_delivery_goods
-- ----------------------------
INSERT INTO ecs_delivery_goods VALUES ('1', '1', '13', '诺基亚5320 XpressMusic', '诺基亚', 'ECS000013', '1', '', '0', '3', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('2', '1', '14', '诺基亚5800XM', '诺基亚', 'ECS000014', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('3', '2', '24', 'P806', '联想', 'ECS000024', '1', '', '0', '3', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('4', '2', '9', '诺基亚E66', '诺基亚', 'ECS000009', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('5', '3', '24', 'P806', '联想', 'ECS000024', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('6', '3', '8', '飞利浦9@9v', '飞利浦', 'ECS000008', '1', '', '0', '3', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('7', '4', '12', '摩托罗拉A810', '摩托罗拉', 'ECS000012', '1', '', '0', '2', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('8', '5', '24', 'P806', '联想', 'ECS000024', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('9', '6', '42', '乐华(ROWA)32英寸高清液晶电视LCD32M08', '乐华', 'ECS000042', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('10', '7', '91', '富士（FUJIFILM）Z71 数码相机（银色）', '天翼', 'ECS000091', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('11', '7', '90', '富士（FUJIFILM）Z71 数码相机（香槟色）', '漫步者', 'ECS000090', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('12', '8', '38', '三星（SAMSUNG）26英寸 高清液晶电视LA32B350F1', '天翼', 'ECS000038', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('13', '8', '39', '创维（Skyworth）37英寸液晶电视37L05HR（内置底座）', '创维', 'ECS000039', '1', '', '0', '1', '', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('14', '9', '55', '三洋（Sanyo）ECJ-DF115MC　微电脑电饭煲', 'AMD', 'ECS000055', '1', '', '0', '1', '颜色:黑色 \n屏幕尺寸:42英寸 \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('15', '9', '66', '飞科（FLYCO）浮动旋转式剃须刀-FS812', 'AMD', 'ECS000066', '1', '', '0', '1', '颜色:黑色 \n屏幕尺寸:42英寸 \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('16', '9', '88', '索尼（sony）HDR-XR350E高清数码摄像机', '漫步者', 'ECS000088', '1', '', '0', '1', '颜色:黑色 \n屏幕尺寸:42英寸 \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('17', '10', '92', '茵佳妮优雅公主风褶边修身轻盈衬衫 送胸花5121-1110045', '白领', 'ECS000092', '1', '', '0', '1', '颜色:红 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('18', '10', '123', '美亿佳懒人沙发SF0505咖啡色', '千弘', 'ECS000123', '1', '', '0', '1', '颜色:黄 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('19', '10', '121', '宝贝世家 儿童床品套件 海洋乐园 英国设计 精梳全棉 活性环保印染 儿童三件套', '千弘', 'ECS000121', '1', '', '0', '1', '颜色:黄 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('20', '11', '49', '美的（Midea）空气加湿器 S30U-M1', '乐华', 'ECS000049', '1', '', '0', '1', '颜色:黑色 \n屏幕尺寸:42英寸 \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('21', '12', '43', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '乐华', 'ECS000043', '1', '', '0', '1', '颜色:黑色 \n屏幕尺寸:42英寸 \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('22', '13', '134', '天使之城 新款 手工珍珠金线蕾丝衫雪纺衫LM0304 白色', '  恒基伟业', 'ECS000000', '1', '', '0', '3', '颜色:红 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('23', '13', '135', 'JIULALA 久拉拉 2013年夏装新款 女 撞色波浪装', '金立', 'ECS000135', '1', '', '0', '1', '颜色:黄 \n尺寸:XXL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('24', '13', '138', 'ANDO STORE 安都韩版显瘦女裙雪纺两件套连衣裙9', '希捷', 'ECS000138', '1', '', '0', '1', '颜色:红 \n尺寸:L \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('25', '13', '139', 'SDEER 圣迪奥 女夏装拼接感双层裙摆连衣裙22812', '漫步者', 'ECS000139', '1', '', '0', '1', '颜色:黄 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('26', '13', '136', 'Souline 素缕 《斑驳》2013秋款新女棉麻刺绣长', 'APPLE', 'ECS000136', '1', '', '0', '1', '颜色:红 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('27', '13', '137', '桑缇 2013秋季新款 韩版修身圆领外套ST133W540', '方正', 'ECS000137', '1', '', '0', '1', '颜色:黄 \n尺寸:XXL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('28', '13', '140', 'GOLDFARM 高梵 2013夏装新款 雪纺复古印花连衣', '天翼', 'ECS000140', '1', '', '0', '1', '颜色:红 \n尺寸:XL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('29', '13', '141', '茵克拉芙 2013夏装女装春款连衣裙碎花雪纺OL气', '美的', 'ECS000141', '1', '', '0', '1', '颜色:黄 \n尺寸:XXL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('30', '14', '141', '兰蔻清滢柔肤水400ml', '美的', 'ECS000141', '1', '', '0', '8', '颜色:黄 \n尺寸:XXL \n', '0', '');
INSERT INTO ecs_delivery_goods VALUES ('31', '15', '140', '完美芦荟胶一对 40g*2', '天翼', 'ECS000140', '1', '', '0', '1', '颜色: 红\r\n尺寸: XL', '1', 'ECS000140g_p1');

-- ----------------------------
-- Table structure for `ecs_delivery_order`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_delivery_order`;
CREATE TABLE `ecs_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_delivery_order
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_email_list`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_email_list`;
CREATE TABLE `ecs_email_list` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_email_list
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_email_sendlist`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_email_sendlist`;
CREATE TABLE `ecs_email_sendlist` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `template_id` mediumint(8) NOT NULL,
  `email_content` text NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `pri` tinyint(10) NOT NULL,
  `last_send` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_email_sendlist
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_error_log`;
CREATE TABLE `ecs_error_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_exchange_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_exchange_goods`;
CREATE TABLE `ecs_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_exchange_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_favourable_activity`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_favourable_activity`;
CREATE TABLE `ecs_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_favourable_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_feedback`;
CREATE TABLE `ecs_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_friend_link`;
CREATE TABLE `ecs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  `show_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`show_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_friend_link
-- ----------------------------
INSERT INTO ecs_friend_link VALUES ('2', '买否网', 'http://mj.xiaoyuok.com/myzj/', '', '51');
INSERT INTO ecs_friend_link VALUES ('3', '免费开独立网店', 'http://mj.xiaoyuok.com/myzj/', '', '52');

-- ----------------------------
-- Table structure for `ecs_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods
-- ----------------------------
INSERT INTO ecs_goods VALUES ('134', '29', 'ECS000000', '商品7', '+', '1482', '11', '', '97', '0.000', '50.00', '37.00', '110.00', '1380614400', '1948608000', '1', '', '国庆大促，下单再减10%', '商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '0', '1380647163', '1', '0', '1', '0', '1', '1', '0', '1427699085', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('136', '29', 'ECS000136', '商品6', '+', '559', '2', '', '99', '0.000', '26.40', '22.00', '110.00', '1380556800', '1980172800', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '0', '1380647873', '2', '0', '1', '0', '1', '1', '0', '1427700399', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('137', '29', 'ECS000137', '商品5', '+', '199', '3', '', '99', '0.000', '200.00', '87.00', '0.00', '0', '0', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '0', '1380647890', '100', '0', '0', '1', '1', '0', '0', '1427700386', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('138', '29', 'ECS000138', '商品4', '+', '313', '4', '', '99', '0.000', '60.00', '50.00', '0.00', '0', '0', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '0', '1380647918', '100', '0', '1', '1', '1', '0', '0', '1427700373', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('139', '29', 'ECS000139', '商品3', '+', '195', '5', '', '99', '0.000', '193.00', '155.00', '110.00', '1381161600', '1633622400', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '1', '1380647936', '100', '0', '1', '1', '0', '1', '0', '1427700354', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('140', '29', 'ECS000140', '商品2', '+', '366', '6', '', '99', '0.000', '76.00', '69.00', '110.00', '1380556800', '1664553600', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '0', '1380647948', '3', '0', '0', '1', '1', '1', '0', '1427700330', '14', '', '-1', '-1', '0', '0', '0');
INSERT INTO ecs_goods VALUES ('141', '138', 'ECS000141', '商品1', '+', '351', '31', '', '91', '0.000', '420.00', '309.00', '110.00', '1381161600', '1633622400', '1', '', '国庆大促，下单再减10%', '<p>商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍</p>', 'images/201501/thumb_img/134_thumb_G_1421183937155.jpg', 'images/201501/goods_img/134_G_1421183937845.jpg', 'images/201501/source_img/134_G_1421183937977.jpg', '1', '', '1', '1', '3', '1380647968', '100', '0', '1', '1', '0', '1', '0', '1427703866', '15', '', '-1', '-1', '0', '0', '0');

-- ----------------------------
-- Table structure for `ecs_goods_activity`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_activity`;
CREATE TABLE `ecs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_activity
-- ----------------------------
INSERT INTO ecs_goods_activity VALUES ('18', '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', '', '1', '134', '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', '1413878400', '1729843200', '0', 'a:4:{s:12:\"price_ladder\";a:1:{i:0;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:28;}}s:15:\"restrict_amount\";i:100;s:13:\"gift_integral\";i:30;s:7:\"deposit\";d:30;}', '0');
INSERT INTO ecs_goods_activity VALUES ('4', '拍卖活动——索爱C702c', '', '2', '10', '索爱C702c', '1242144000', '1242403200', '0', 'a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:20;s:6:\"no_top\";i:1;}', '0');
INSERT INTO ecs_goods_activity VALUES ('5', '摩托罗拉E8 大礼包', '礼包大优惠', '4', '31', '摩托罗拉E8 ', '1242110400', '1252046400', '0', 'a:1:{s:13:\"package_price\";s:4:\"1430\";}', '0');
INSERT INTO ecs_goods_activity VALUES ('6', '诺基亚N85大礼包', '诺基亚N85超值大礼包', '4', '32', '诺基亚N85', '1242110760', '1248936360', '0', 'a:1:{s:13:\"package_price\";s:4:\"3150\";}', '0');
INSERT INTO ecs_goods_activity VALUES ('16', '拍卖活动七', '', '2', '134', '韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装', '1415779200', '1478937600', '0', 'a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}', '0');
INSERT INTO ecs_goods_activity VALUES ('20', '光头强', '', '1', '208', '光头强', '1421136000', '1422604800', '0', 'a:4:{s:12:\"price_ladder\";a:1:{i:0;a:2:{s:6:\"amount\";i:1;s:5:\"price\";d:200;}}s:15:\"restrict_amount\";i:0;s:13:\"gift_integral\";i:0;s:7:\"deposit\";d:0;}', '0');

-- ----------------------------
-- Table structure for `ecs_goods_article`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_article`;
CREATE TABLE `ecs_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`article_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_article
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_attr`;
CREATE TABLE `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3801 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_attr
-- ----------------------------
INSERT INTO ecs_goods_attr VALUES ('3799', '141', '252', '蓝色', '');
INSERT INTO ecs_goods_attr VALUES ('3798', '141', '257', '清洁 清爽', '0');
INSERT INTO ecs_goods_attr VALUES ('3797', '141', '256', '润肤露/身体乳', '0');
INSERT INTO ecs_goods_attr VALUES ('3796', '141', '255', '所有', '0');
INSERT INTO ecs_goods_attr VALUES ('3795', '141', '254', '全身', '0');
INSERT INTO ecs_goods_attr VALUES ('2271', '140', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2270', '140', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2269', '140', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2268', '140', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2267', '140', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2266', '140', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2265', '140', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2835', '140', '244', '小碎花', '0');
INSERT INTO ecs_goods_attr VALUES ('2836', '140', '243', '短袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2837', '140', '242', '日韩', '0');
INSERT INTO ecs_goods_attr VALUES ('2251', '139', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2250', '139', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2249', '139', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2248', '139', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2247', '139', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2246', '139', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2245', '139', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2838', '139', '244', '印花/绣花', '0');
INSERT INTO ecs_goods_attr VALUES ('2839', '139', '243', '七分袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2840', '139', '242', '简约', '0');
INSERT INTO ecs_goods_attr VALUES ('2231', '138', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2230', '138', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2229', '138', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2228', '138', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2227', '138', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2226', '138', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2225', '138', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2224', '138', '244', '素色', '0');
INSERT INTO ecs_goods_attr VALUES ('2841', '138', '243', '无袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2842', '138', '242', '民族', '0');
INSERT INTO ecs_goods_attr VALUES ('2211', '137', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2210', '137', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2209', '137', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2208', '137', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2207', '137', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2206', '137', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2205', '137', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2843', '137', '244', '条纹', '0');
INSERT INTO ecs_goods_attr VALUES ('2203', '137', '243', '长袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2844', '137', '242', '街头', '0');
INSERT INTO ecs_goods_attr VALUES ('2191', '136', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2190', '136', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2189', '136', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2188', '136', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2187', '136', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2186', '136', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2185', '136', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2845', '136', '244', '大方格', '0');
INSERT INTO ecs_goods_attr VALUES ('2846', '136', '243', '短袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2847', '136', '242', '卡通', '0');
INSERT INTO ecs_goods_attr VALUES ('3550', '134', '251', '其他', '0');
INSERT INTO ecs_goods_attr VALUES ('2151', '134', '246', 'XXL', '');
INSERT INTO ecs_goods_attr VALUES ('2150', '134', '246', 'M', '');
INSERT INTO ecs_goods_attr VALUES ('2149', '134', '246', 'L', '');
INSERT INTO ecs_goods_attr VALUES ('2148', '134', '246', 'XL', '');
INSERT INTO ecs_goods_attr VALUES ('2147', '134', '245', '黄', '');
INSERT INTO ecs_goods_attr VALUES ('2146', '134', '245', '蓝', '');
INSERT INTO ecs_goods_attr VALUES ('2145', '134', '245', '红', '');
INSERT INTO ecs_goods_attr VALUES ('2850', '134', '244', '波点', '0');
INSERT INTO ecs_goods_attr VALUES ('2851', '134', '243', '七分袖', '0');
INSERT INTO ecs_goods_attr VALUES ('2852', '134', '242', '英伦学院', '0');
INSERT INTO ecs_goods_attr VALUES ('3549', '134', '250', '棉 聚酯纤维', '0');
INSERT INTO ecs_goods_attr VALUES ('3548', '134', '249', '套头', '0');
INSERT INTO ecs_goods_attr VALUES ('3547', '134', '248', '印花', '0');
INSERT INTO ecs_goods_attr VALUES ('3546', '134', '247', '圆领', '0');
INSERT INTO ecs_goods_attr VALUES ('3794', '208', '247', '圆领', '0');
INSERT INTO ecs_goods_attr VALUES ('3793', '208', '244', '素色', '0');
INSERT INTO ecs_goods_attr VALUES ('3792', '208', '243', '长袖', '0');
INSERT INTO ecs_goods_attr VALUES ('3791', '208', '242', '欧美复古', '0');
INSERT INTO ecs_goods_attr VALUES ('3800', '141', '253', '500ml', '');

-- ----------------------------
-- Table structure for `ecs_goods_cat`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_cat`;
CREATE TABLE `ecs_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_goods_gallery`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_gallery`;
CREATE TABLE `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_gallery
-- ----------------------------
INSERT INTO ecs_goods_gallery VALUES ('307', '140', 'images/201503/goods_img/140_P_1427700330393.jpg', '', 'images/201503/thumb_img/140_thumb_P_1427700331642.jpg', 'images/201503/source_img/140_P_1427700330459.jpg');
INSERT INTO ecs_goods_gallery VALUES ('304', '141', 'images/201503/goods_img/141_P_1427700298263.jpg', '', 'images/201503/thumb_img/141_thumb_P_1427700298649.jpg', 'images/201503/source_img/141_P_1427700298160.jpg');
INSERT INTO ecs_goods_gallery VALUES ('305', '141', 'images/201503/goods_img/141_P_1427700298856.jpg', '', 'images/201503/thumb_img/141_thumb_P_1427700298594.jpg', 'images/201503/source_img/141_P_1427700298976.jpg');
INSERT INTO ecs_goods_gallery VALUES ('303', '134', 'images/201501/goods_img/134_P_1421184078534.jpg', '', 'images/201501/thumb_img/134_thumb_P_1421184078573.jpg', 'images/201501/source_img/134_P_1421184078200.jpg');
INSERT INTO ecs_goods_gallery VALUES ('306', '141', 'images/201503/goods_img/141_P_1427700298283.jpg', '', 'images/201503/thumb_img/141_thumb_P_1427700298371.jpg', 'images/201503/source_img/141_P_1427700298096.jpg');
INSERT INTO ecs_goods_gallery VALUES ('308', '140', 'images/201503/goods_img/140_P_1427700331992.jpg', '', 'images/201503/thumb_img/140_thumb_P_1427700331918.jpg', 'images/201503/source_img/140_P_1427700331971.jpg');
INSERT INTO ecs_goods_gallery VALUES ('309', '140', 'images/201503/goods_img/140_P_1427700331560.jpg', '', 'images/201503/thumb_img/140_thumb_P_1427700331764.jpg', 'images/201503/source_img/140_P_1427700331344.jpg');
INSERT INTO ecs_goods_gallery VALUES ('312', '139', 'images/201503/goods_img/139_P_1427700354825.jpg', '', 'images/201503/thumb_img/139_thumb_P_1427700354730.jpg', 'images/201503/source_img/139_P_1427700354482.jpg');
INSERT INTO ecs_goods_gallery VALUES ('315', '138', 'images/201503/goods_img/138_P_1427700373102.jpg', '', 'images/201503/thumb_img/138_thumb_P_1427700373072.jpg', 'images/201503/source_img/138_P_1427700373772.jpg');
INSERT INTO ecs_goods_gallery VALUES ('319', '136', 'images/201503/goods_img/136_P_1427700399914.jpg', '', 'images/201503/thumb_img/136_thumb_P_1427700399707.jpg', 'images/201503/source_img/136_P_1427700399684.jpg');
INSERT INTO ecs_goods_gallery VALUES ('311', '139', 'images/201503/goods_img/139_P_1427700354666.jpg', '', 'images/201503/thumb_img/139_thumb_P_1427700354683.jpg', 'images/201503/source_img/139_P_1427700354025.jpg');
INSERT INTO ecs_goods_gallery VALUES ('314', '138', 'images/201503/goods_img/138_P_1427700373954.jpg', '', 'images/201503/thumb_img/138_thumb_P_1427700373906.jpg', 'images/201503/source_img/138_P_1427700373543.jpg');
INSERT INTO ecs_goods_gallery VALUES ('317', '137', 'images/201503/goods_img/137_P_1427700386744.jpg', '', 'images/201503/thumb_img/137_thumb_P_1427700386095.jpg', 'images/201503/source_img/137_P_1427700386767.jpg');
INSERT INTO ecs_goods_gallery VALUES ('302', '134', 'images/201501/goods_img/134_P_1421184078179.jpg', '', 'images/201501/thumb_img/134_thumb_P_1421184078769.jpg', 'images/201501/source_img/134_P_1421184078997.jpg');
INSERT INTO ecs_goods_gallery VALUES ('310', '139', 'images/201503/goods_img/139_P_1427700354497.jpg', '', 'images/201503/thumb_img/139_thumb_P_1427700354571.jpg', 'images/201503/source_img/139_P_1427700354845.jpg');
INSERT INTO ecs_goods_gallery VALUES ('313', '138', 'images/201503/goods_img/138_P_1427700373934.jpg', '', 'images/201503/thumb_img/138_thumb_P_1427700373410.jpg', 'images/201503/source_img/138_P_1427700373192.jpg');
INSERT INTO ecs_goods_gallery VALUES ('316', '137', 'images/201503/goods_img/137_P_1427700386037.jpg', '', 'images/201503/thumb_img/137_thumb_P_1427700386838.jpg', 'images/201503/source_img/137_P_1427700386395.jpg');
INSERT INTO ecs_goods_gallery VALUES ('318', '136', 'images/201503/goods_img/136_P_1427700399575.jpg', '', 'images/201503/thumb_img/136_thumb_P_1427700399988.jpg', 'images/201503/source_img/136_P_1427700399150.jpg');
INSERT INTO ecs_goods_gallery VALUES ('301', '134', 'images/201501/goods_img/134_P_1421184078825.jpg', '', 'images/201501/thumb_img/134_thumb_P_1421184078886.jpg', 'images/201501/source_img/134_P_1421184078815.jpg');
INSERT INTO ecs_goods_gallery VALUES ('300', '134', 'images/201501/goods_img/134_P_1421183937630.jpg', '', 'images/201501/thumb_img/134_thumb_P_1421183937025.jpg', 'images/201501/source_img/134_P_1421183937024.jpg');

-- ----------------------------
-- Table structure for `ecs_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_type`;
CREATE TABLE `ecs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_type
-- ----------------------------
INSERT INTO ecs_goods_type VALUES ('14', '服装', '1', '');
INSERT INTO ecs_goods_type VALUES ('12', '液晶电视', '1', '主体\r\n显示\r\n音频');
INSERT INTO ecs_goods_type VALUES ('15', '美妆', '1', '');

-- ----------------------------
-- Table structure for `ecs_group_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_group_goods`;
CREATE TABLE `ecs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_group_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_keywords`;
CREATE TABLE `ecs_keywords` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(90) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_keywords
-- ----------------------------
INSERT INTO ecs_keywords VALUES ('2009-04-21', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-04-27', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-04', 'ecshop', '斤', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-10', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-11', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-11', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-12', 'ecshop', '三星', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-12', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-12', 'ecshop', 'p806', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-12', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-12', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-05-18', 'ecshop', '52', '2');
INSERT INTO ecs_keywords VALUES ('2009-05-22', 'ecshop', 'p', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-18', 'ecshop', 'cpu', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-18', 'BAIDU', '联通充值卡1066828862', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-19', 'BAIDU', 'I908E', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-19', 'BAIDU', '移动50元充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-19', 'BAIDU', '三星f488e', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-20', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-20', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-20', 'GOOGLE CHINA', '\"ecshop\" \"三级分类\"', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-20', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-21', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '机杰士邦', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'GOOGLE CHINA', 'jindong  ecshop', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-22', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '卡西欧手', '5');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-23', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'BAIDU', '移动50元充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '电视机夏普', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-24', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-25', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-25', 'BAIDU', '移动50元充值卡', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-25', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-25', 'BAIDU', '三星f488e粉色报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-25', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '机杰士邦', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-26', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-27', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'BAIDU', 'i908e', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-28', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-29', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'GOOGLE CHINA', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-30', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-31', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-31', 'ecshop', '移动硬盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-07-31', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-07-31', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-01', 'BAIDU', '乐华lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-01', 'BAIDU', 'www.amobile.com.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'BAIDU', 'ecshop 充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'ecshop', '3G无线上网', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-02', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '机杰士邦', '10');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '瑞士军刀', '10');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'BAIDU', '联想ET860', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'BAIDU', 'ecshop品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'BAIDU', '乐华(ROWA)19英寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '宽屏笔记本', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '液晶电视', '10');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '佳能相机', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '移动硬盘', '9');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '电风扇', '9');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', 'U盘', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '卡西欧手', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '剃须刀', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '乐扣', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '吸油烟', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '3G无线上网', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '音乐手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', '\\\'', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-03', 'ecshop', 'tags[i].word', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '液晶电视', '10');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '佳能相机', '8');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '我的订单', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '卡西欧手', '12');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '宽屏笔记本', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '移动硬盘', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', 'U盘', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '瑞士军刀', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '剃须刀', '8');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '乐扣', '11');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '吸油烟', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '机杰士邦', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '安全套', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '3G无线上网', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '电风扇', '7');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', 'index', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', 'of', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', 'jindong', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'BAIDU', 'ecshop品牌页', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-04', 'GOOGLE CHINA', '乐华LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '吸油烟', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '乐扣', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '卡西欧手', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '剃须刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'BAIDU', '三星F488e', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '音乐手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-05', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'BAIDU', '新买的20元联通手机充值卡为什么充不上？', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '电风扇', '5');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-06', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'BAIDU', 'ecshop京东模板演示站', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'BAIDU', '诺基亚5800原装手机耳机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'BAIDU', '和三星BC01类型相似手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'BAIDU', '小灵通充值', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-07', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-08', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-08', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-08', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-08', 'BAIDU', '7610S', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-08', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'BAIDU', 'ecshop 设置 全部品牌  ', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'GOOGLE CHINA', '健康 ecshop 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'BAIDU', '诺基亚N85立体耳机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'BAIDU', '摩托罗拉v8手机价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-09', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-10', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-10', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-10', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-10', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-10', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'BAIDU', '充电宝多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-11', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '移动硬盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'BAIDU', 'n85原装充电', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-12', 'BAIDU', 'n85　原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-13', 'ecshop', '宽屏笔记本', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-13', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-13', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-13', 'BAIDU', 'ecshop全部品牌为什么没有链接', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-13', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'BAIDU', '京东模板', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-14', 'BAIDU', '免费京东商城模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-15', 'BAIDU', 'site:www.oioiec.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-15', 'GOOGLE CHINA', 'site:www.oioiec.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-15', 'BAIDU', '诺基亚n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-15', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'BAIDU', ' 京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'BAIDU', 'ecshop 联通充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-16', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-17', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-17', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-17', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-17', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-17', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'ecshop', '飞利浦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '京东网站模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '联想cdma手机有哪些', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '夏新T5怎么切换到2G卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '京东商城模板', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '32s550a', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'ecshop', 'LG', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-18', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', 'ecshop 品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '乐华42英寸全高清液晶电视LCD42M11', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'GOOGLE CHINA', 'ecshop京东商城模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '联想cdma手机有哪些', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '商务电池', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '京东  模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-19', 'BAIDU', '充电器包装 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'BAIDU', '360 模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-20', 'GOOGLE CHINA', '', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'BAIDU', '京东模板', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'ecshop', '三星', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'BAIDU', 'LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'BAIDU', '7610s', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-21', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '宽屏笔记本', '5');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'GOOGLE CHINA', '鞋帽商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-22', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '剃须刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '液晶电视', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-23', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'BAIDU', '续电宝', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'BAIDU', '诺基亚n85的充电器 和耳机', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'BAIDU', 'ecshop去品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-24', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'BAIDU', 'nokia5320手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'BAIDU', '诺基亚n85手机配件充电器和耳机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'GOOGLE CHINA', '360 模板 商城', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-25', 'BAIDU', '联想的CDMA手机专卖', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-26', 'BAIDU', '京东网站模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-26', 'ecshop', '飞利浦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-26', 'BAIDU', 'n85的充电器图片', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-26', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-26', 'BAIDU', '索爱有哪些双模手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'BAIDU', '360京东拍卖', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'BAIDU', 'ecshop去除品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-27', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'BAIDU', 'ecshop去掉品牌区', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'ecshop', '宽屏笔记本', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'BAIDU', '京东网站模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'ecshop', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'BAIDU', '京东模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-28', 'BAIDU', 'site:www.oioiec.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'BAIDU', 'ecshop模板京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'BAIDU', 'ecshop 270 模板 京东商城', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '吸油烟', '4');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'BAIDU', '手机快讯模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-29', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-30', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'BAIDU', '京东模版', '3');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'GOOGLE CHINA', 'ecshop 模板修改 本店售价', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'BAIDU', '京东 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'BAIDU', '金立CDMA手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-08-31', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-01', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-01', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-01', 'BAIDU', 'ecshop 京东商城', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-01', 'BAIDU', '索爱的cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-01', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'BAIDU', '三星f488e报价', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '卡西欧手', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '7610', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '7610s', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'ecshop', 'LG', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-02', 'GOOGLE CHINA', 'site:oioiec.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-03', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-03', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-03', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-03', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'BAIDU', '京东模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', '\\\'', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'ecshop', 'tags[i].word', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-04', 'BAIDU', '京东网站模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'GOOGLE CHINA', 'ecshop 模板 360 销售排行', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'GOOGLE', 'ecshop 款屏 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'BAIDU', '多普达', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-05', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'BAIDU', 'ecshop 京东商品分类', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '电风扇', '6');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', 'U盘', '6');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'BAIDU', '诺基亚cdma手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-06', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'BAIDU', '摩托罗拉cdma手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-07', 'BAIDU', '手机充电宝价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', 'apple', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'BAIDU', '免费防京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'BAIDU', '京东 最新模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'BAIDU', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-08', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'BAIDU', 'ecshop京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'BAIDU', '7610S', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'GOOGLE CHINA', 'ecshop 商品三级分类', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-09', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'YAHOO', '219.77.129.125', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'BAIDU', '500元左右的手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'BAIDU', 'ecshop模板制作', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-10', 'BAIDU', '360模板的拍卖', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '宽屏笔记本', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '液晶电视', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-11', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'BAIDU', '飞利浦CDMA', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'BAIDU', '乐华液晶LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'GOOGLE CHINA', '', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-12', 'BAIDU', '京东商城 最新模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-13', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'ecshop', '3G无线上网', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-14', 'BAIDU', '京东商城 ecshop模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-15', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-15', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-15', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-15', 'BAIDU', '三星f488e', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '音乐手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '剃须刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'GOOGLE CHINA', '京东360 模板加宽', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'GOOGLE CHINA', 'ecshop 360 模板加宽', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-16', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '佳能相机', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '液晶电视', '4');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-17', 'BAIDU', 'ecshop 京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'BAIDU', 'cdma摩托罗拉手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'BAIDU', '360模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-18', 'BAIDU', 'http://www.oioiec.cn/jindong/', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-19', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-19', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-19', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-19', 'BAIDU', 'cdma金立手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-19', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'BAIDU', '小灵通充值', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'BAIDU', ' 京东商城, 360, 模板', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'BAIDU', '多普达', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-20', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'GOOGLE CHINA', 'ecshop 模板制作360', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'GOOGLE CHINA', 'ecshop 模版制作 360', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'BAIDU', 'ECSHOP京东商城模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'GOOGLE CHINA', 'lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'BAIDU', '手机充电宝价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-21', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-22', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-22', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-22', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-22', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-22', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'BAIDU', '京东商城模板270版', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'BAIDU', '金立CDMA手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'GOOGLE CHINA', 'ecshop 模板 360', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-23', 'BAIDU', '乐华电水壶', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'GOOGLE CHINA', '京东商城模板270版', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'BAIDU', '联通充值兑换京东商城购物卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'GOOGLE CHINA', '乐华LCD42M19 参数', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-24', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-25', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-25', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-25', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-25', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-25', 'BAIDU', ' 乐华LCD42M19 质量怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'ecshop', '瑞士军刀', '5');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'BAIDU', 'n85耳机配件', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'BAIDU', '充电宝原理图', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'BAIDU', '诺基亚N85的手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'BAIDU', '诺基亚n85充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'BAIDU', '索爱笔记本的价钱与模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-26', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'BAIDU', '诺基亚n85充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'BAIDU', 'ECshop,家电，模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-09-27', 'BAIDU', 'N85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'BAIDU', 'n85电磁充电显示', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'BAIDU', '联通充值卡 样本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-28', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-29', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'BAIDU', '索爱cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'BAIDU', '京东 分类 ecshop', '1');
INSERT INTO ecs_keywords VALUES ('2009-09-30', 'BAIDU', '京东商城 小灵通', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-01', 'ecshop', '佳能相机', '5');
INSERT INTO ecs_keywords VALUES ('2009-10-01', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-01', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-01', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-01', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'BAIDU', '）32英寸高清液晶电视32PFL3409高清液晶显示屏 数码晶彩技术 灵智图像 动态低音', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-02', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', '42英寸液晶电视  乐华', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', '乐华  42液晶电视质量', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', '创维(Skyworth)37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR家电下乡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', 'kingmax 内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-03', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'BAIDU', 'ecshop 360商业模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'BAIDU', 'ROWA显示器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'BAIDU', '鍒涚淮锛圫kyworth锛', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', '移动硬盘', '6');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'ecshop', '瑞士军刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-04', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'GOOGLE CHINA', '360商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'BAIDU', '三星i6888', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'BAIDU', '夏普血压计好不好', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-05', 'BAIDU', 'LCD42M19', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-06', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-06', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-06', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-06', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-06', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'BAIDU', '京东 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-07', 'BAIDU', '联通充值卡样本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', 'LCD42M19 ', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', 'N85手机类型', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', '42pfl5609 能看高清电影吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '安全套', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '佳能相机', '5');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '乐扣', '5');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '机杰士邦', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-08', 'BAIDU', '胜创内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', '诺基亚耳机 HS-82', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', 'kingmax内存卡', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', '乐华LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', 'ecshop京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', '飞利浦cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', '胜创内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-09', 'BAIDU', '三星f488e报价', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '佳能相机', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', '夏普（AQUOS）26英寸 高清液晶电视LCD-26Z370A', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', 'kingmax内存卡', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', '7610S', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', 'V8', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-10', 'BAIDU', 'N85原装充电器图', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', '京东270', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', 'kingmax  内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', '移动20元充值卡', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', '三星I6888', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-11', 'BAIDU', '诺基亚N85原装直充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '三星', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', '32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', 'LCD42M19底座', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', 'ecshop 京东模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'BAIDU', '三星i6888', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-12', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'BAIDU', 'www.rowa', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'ecshop', '液晶电视', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-13', 'BAIDU', 'cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'BAIDU', '飞利浦32英寸高清液晶电视32PFL3409 可以挂墙吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'BAIDU', 'LCD42M19 怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'BAIDU', '夏普（AQUOS）32英寸 高清液晶电视 LCD-32Z370A', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '区域', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-14', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'BAIDU', '飞利浦32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'BAIDU', '三星f488e的报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'BAIDU', 'ecshop 商业模板下载', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-15', 'ecshop', 'LG', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', '飞利浦(PHILLIPS )32英寸高清液晶电视32PFL3409的参数', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', '乐华（ROWA）32英寸', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'GOOGLE CHINA', 'ecshop 模板 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', 'ecmoban', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', '飞利浦CDMA手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'GOOGLE CHINA', 'LCD42M19 说明书', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-16', 'BAIDU', '乐华(ROWA)LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', 'ecshop 360 增强', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '乐华高清液晶彩电lcd32m08报价特价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '乐华液晶电视32报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '5609用移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '胜创内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'BAIDU', '乐华电视机lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-17', 'ecshop', '适合汽车配件类类网店', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'BAIDU', 'lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'BAIDU', '涔愬崕(ROWA)42鑻卞', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'BAIDU', '联通充值赠送京东电子购物怎么用', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'BAIDU', '乐华(ROWA)32英寸高清液晶电视LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-18', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '机杰士邦', '5');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', '飞利浦液晶电视32英寸32pFL3409/93', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', 'n85新电磁充电', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', '椋炲埄娴︼紙PHILLIPS 锛', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'GOOGLE CHINA', 'Google G1 jingdong', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'YAHOO', 'ecshop 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', '三星的F488E', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '酷冷', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'BAIDU', 'N85原装手机充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-19', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', '三星f488e报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', '诺基亚n85 原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', 'lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609是硬屏吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'BAIDU', 'kingmax 内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-20', 'ecshop', 'ps2-5300', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'BAIDU', 'lcd42m19', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'BAIDU', 'ecmoban', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-21', 'BAIDU', 'ecshop京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'BAIDU', 'ecshop品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', 'trhtr', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'BAIDU', '创维（Skyworth）37英寸 液晶电视 37L02RM', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'BAIDU', '手机通讯', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-22', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '飞利浦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', 'trhtrht', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'BAIDU', '创维(Skyworth)37英寸 液晶电视 37L02RM货到付款', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'BAIDU', '乐华液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', 'U盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', 'LG', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '一体', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '电脑', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-23', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', '夏普液晶面板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '诺基亚', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', '胜创KINGMAX内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', '移动20元充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '夏新', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '飞利浦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '摩托罗拉', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '佳能相机', '6');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'BAIDU', 'ecshop京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '三星', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-24', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '多普达', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'BAIDU', '诺基亚n85充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '三星', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'BAIDU', 'KINGMAX内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-25', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', '办公耗材报价单模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', '询价单模板免费下载', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', 'kingmax内存卡', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', '新京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'BAIDU', '索尼电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-26', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '乐华液晶电视lcd32m08的价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', 'LCD32M08液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '诺基亚n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '京东手机充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '手机充值卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'GOOGLE CHINA', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-27', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', 'U盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '夏新', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'BAIDU', 'LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'BAIDU', '夏普（AQUOS）32英寸 高清液晶电视 LCD-32Z370A', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-28', 'BAIDU', '42PFL5609/93 360', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'BAIDU', '原装诺基亚N85充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'BAIDU', '乐华(ROWA)42英寸', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'BAIDU', 'rowa', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-29', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'GOOGLE', '42PFL5609 processor', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'BAIDU', '主机箱.cpu.内存.外设', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'BAIDU', 'ecshop仿京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-30', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', '3g手机频道模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', 'n85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', 'U盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', '联通充值卡 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', '飞利浦42pfl5609能上网吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', '飞利浦5609液晶电视与移动硬盘连接问题', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'BAIDU', '飞利浦42pfl5609 移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '乐扣', '4');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-10-31', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'BAIDU', 'LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', '飞利浦', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'GOOGLE CHINA', '京东商城模板270版 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-01', 'BAIDU', '360模板品牌', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '瑞士军刀', '9');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', '诺基亚n85的充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', '飞利浦 5609 32 分辨率如何做到1920 1080', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', '商城模板 360', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', '飞利浦42PFL5609液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'BAIDU', '创维液晶电视底座', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-02', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '安全套', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'GOOGLE CHINA', '京东商城模板270版 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '宽屏笔记本', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'BAIDU', 'LCD42M19的价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'BAIDU', 'LCD42M19的分辨率是多少', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', 'LC42GS80DC', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '42E9FE', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', 'L42E9FE', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', 'TCL42E9FE', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'BAIDU', 'skyworth无线上网账号', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-03', 'GOOGLE CHINA', '京东ECSHOP模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'BAIDU', '联通充值卡样板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'ecshop', '机杰士邦', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'BAIDU', 'kingmax内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-04', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', '电风扇', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', '乐华电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', 'M11', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', '乐华', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', 'kingmax 内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', '32pfl3409带移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', 'n85原装充电器型号', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'BAIDU', '夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-05', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'BAIDU', 'ecshop 360', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'BAIDU', '索尼液晶彩电', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'BAIDU', '夏普液晶电视32寸', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-06', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'BAIDU', '1920*1080液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'BAIDU', '京东商城 内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'BAIDU', '诺基亚n85充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'BAIDU', 'kingmax 内存卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-07', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'BAIDU', '索尼电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '摩托罗拉', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409高清液晶显示屏', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'BAIDU', 'ROWA显示器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'BAIDU', '京东 模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'BAIDU', '京东模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-08', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'BAIDU', 'ecshop 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-09', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'BAIDU', 'N85大陆行货 3G网卡', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'GOOGLE CHINA', '京东版ECSHOP模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-10', 'BAIDU', 'ecshop360模板修改', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'BAIDU', '37l05hr 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'ecshop', 'trhtrht', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'BAIDU', '乐华32电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-11', 'BAIDU', '诺基亚n85圆场电池和坐充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'BAIDU', 'LCD42M19 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'BAIDU', '创维(Skyworth)37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-12', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '显示器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'BAIDU', '高清电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'BAIDU', 'LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-13', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'BAIDU', '索尼电视机专卖店', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'BAIDU', 'rowa显示器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-14', 'GOOGLE CHINA', '360网店   促销页模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', 'ecshop 京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', '飞利浦5609液晶电视最大支持移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', '诺基亚N85手机原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-15', 'BAIDU', '飞利浦官方网站4008800008', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', 'trhtr', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'BAIDU', '高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', 'TCL', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'BAIDU', '乐华液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-16', 'ecshop', '剃须刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'ecshop', '移动硬盘', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'BAIDU', 'LA32B350F1', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'BAIDU', '诺基亚N85的立体声耳机什么样子', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'GOOGLE', ' 京东商城模板270版', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-17', 'BAIDU', '诺基亚N85原装充电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', '库存电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', 'U盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', 'ECSHOP 360  三级分类', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', 'ecshop 360 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', 'trhtrht', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', '\0\0淮锛\0kyworth锛\02\0卞\0 楂\0\0 娑叉\0\0佃\0 TFT32L01HM ', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', 'LCD42M19 报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', 'ROWA显示器', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'BAIDU', '乐华', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-18', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'ecshop', 'trhtrht', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'BAIDU', '模板堂  36', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'BAIDU', 'ecshop 京东 oioiec', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'ecshop', '机杰士邦', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-19', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-20', 'ecshop', 'trhtr', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-20', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-20', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-20', 'GOOGLE', '360 ecshop 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'GOOGLE CHINA', '电脑商城ecshop模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'BAIDU', 'ecmoban', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'BAIDU', 'LCD42M19', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-21', 'BAIDU', '飞利浦32英寸液晶电视32PFL3409 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-22', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-22', 'BAIDU', '32寸夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-22', 'BAIDU', '夏普液晶电视32\'\'', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-22', 'BAIDU', '创维37L02RM使用的液晶面板是0什么牌子的', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-22', 'BAIDU', 'lcd42m19 屏幕', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '乐扣', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '瑞士军刀', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'ecshop', '音乐手机', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'BAIDU', '32寸液晶电视尺寸', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-23', 'BAIDU', '创维(Skyworth)32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'BAIDU', '京东商城模板270版 下载', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-24', 'BAIDU', '乐华LCD32M08 报价', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'BAIDU', '椋\0\0娴\0\0PHILLIPS 锛\02\0卞\0楂\0\0娑叉\0\0佃\032PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-25', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '音乐手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', 'ecshop模板访京东网模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', '京东商城 ecshop模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', '京东360 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', 'Latitude Z作为全球第一台配有无线感应充电基座', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', '乐华42液晶电视能插u盘吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', '乐华电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-26', 'BAIDU', '1920 1080高清', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '宽屏笔记本', '8');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'BAIDU', '创维（Skyworth）37英寸 液晶电视 37L02RM', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'BAIDU', 'ecshop 2.7仿京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '移动硬盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-27', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '乐华', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '机杰士邦', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-28', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', 'trhtrht', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'BAIDU', '乐华lcd42m19', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2009-11-29', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'BAIDU', '夏普(AQUOS)高清液晶电视 19A35', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '音乐手机', '4');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'BAIDU', '模板京东36', '1');
INSERT INTO ecs_keywords VALUES ('2009-11-30', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '乐扣', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '家用电器网站模版', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '移动硬盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '佳能相机', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '夏普32寸液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'GOOGLE CHINA', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '乐华(ROWA)42英寸', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'BAIDU', '索尼电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-01', 'ecshop', '\\%E6\\%B6\\%B2\\%E6\\%99\\%B6\\%E7\\%94\\%B5\\%E8\\%A7\\%86', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'ecshop', '液晶电视', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'ecshop', '\\%E6\\%B6\\%B2\\%E6\\%99\\%B6\\%E7\\%94\\%B5\\%E8\\%A7\\%86', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '京东 ecshop', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', 'htt://www.rowa.com.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '32寸夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-02', 'BAIDU', '夏普（AQUOS）32英寸 高清液晶电视 LCD-32', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'BAIDU', 'ecshop模板京东商城270版 免费', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'BAIDU', 'ECShop模板 RO', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-03', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '吸油烟', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '餐饮', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'GOOGLE CHINA', 'ecshop 京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '瑞士军刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'BAIDU', '高清图片1920 108', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'BAIDU', 'Latitude Z自成一系', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-04', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'BAIDU', 'ecshop 京东 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-05', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '3G无线上网', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'BAIDU', '夏普32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-06', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-07', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-07', 'BAIDU', '创维p806', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-07', 'BAIDU', '乐华32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19TCL质量怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '安全套', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'GOOGLE CHINA', '笔记本网上ecshop商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'BAIDU', '夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-08', 'BAIDU', 'ecshop定制', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-09', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-09', 'ecshop', 'trhtr', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-09', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-09', 'BAIDU', '新京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-09', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '佳能相机', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'BAIDU', 'ecshop 360模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'GOOGLE CHINA', '360 商城 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-10', 'BAIDU', 'ecshop模板 京东 免费', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '宽屏笔记本', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '音乐手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'BAIDU', '夏普32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'SOSO', '澶\0\0锛\0QUOS锛\02\0卞\0 楂\0\0娑叉\0\0佃\0 LCD-32Z330A', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'BAIDU', 'C702c主板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-11', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'BAIDU', '创维37寸高清液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'BAIDU', 'www.360.jindong', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'ecshop', '6120', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-12', 'BAIDU', '乐华32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'BAIDU', '乐华32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'BAIDU', '创维模卡电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'BAIDU', 'ecshop模板 京东', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-13', 'BAIDU', '乐华彩电LCD32M08 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'GOOGLE CHINA', 'ecshop 360 商品分类 ', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'BAIDU', '飞利浦高清液晶电视32PFL3409是什么面板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'GOOGLE CHINA', 'ecshop 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'BAIDU', 'ecshop 模板36', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-14', 'BAIDU', '京东 ecshop 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'BAIDU', 'ecshop 京东网模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'BAIDU', '乐华电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'BAIDU', '乐华32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'BAIDU', '仿京东360 模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'BAIDU', 'ecshop 京东免费模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-15', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'BAIDU', '夏普（AQUOS）32英寸 高清液晶电视 LCD-32Z370A', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'GOOGLE CHINA', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'BAIDU', 'ecshop 京东商城', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'BAIDU', '360京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-16', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '电风扇', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'BAIDU', 'ecshop京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM价格', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'BAIDU', '270jindong', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'BAIDU', '360商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'BAIDU', '乐华（ROWA）32英寸高清液晶电视LCD32', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-17', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'BAIDU', '手机广告模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'GOOGLE CHINA', 'ecshop模板  京东商城模板270版', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '剃须刀', '8');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '机杰士邦', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'GOOGLE CHINA', 'f', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-18', 'BAIDU', 'www..rowa.com', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'ecshop', '液晶电视', '6');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'BAIDU', '飞利浦CDMA', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'YAHOO', 'skyworth 37 LCD', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'BAIDU', '飞利浦cdma手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'BAIDU', '乐华', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-19', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', 'QQ', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', '夏普 aquos', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', '高清大图', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', 'www;skyworth;com', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', 'ecshop模板 京东', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', '乐华 高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-20', 'BAIDU', '创维32英寸 高清 液晶电视 TFT32L01HM怎么样?', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'BAIDU', '索爱的cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '液晶电视', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'BAIDU', '37英寸液晶电视37L02RM(02系列', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-23', 'BAIDU', 'LCD42M19 1366*768', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', 'U盘', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', 'trhtr', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'GOOGLE CHINA', '商城用户中心模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'BAIDU', '京东商城家用电器网站模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-24', 'BAIDU', '乐华32寸高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '佳能相机', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '吸油烟', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '卡西欧手', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR是硬屏吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '飞利浦家用电器', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '乐华 LCD32 分辨率', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'GOOGLE CHINA', 'Samsung - 26\" 电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '乐华电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '夏普32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'BAIDU', '1920 1080', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'GOOGLE CHINA', 'site:www.oioiec.cn', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-25', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '宽屏笔记本', '6');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '剃须刀', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '联想', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'BAIDU', '京东 模板 ECSHOP', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '索爱', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'BAIDU', 'la32b350f1 电源管', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'GOOGLE CHINA', '索尼（SONY）40英寸 全高清液晶电视 KDL-40V5500', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'BAIDU', '\0\0淮锛\0kyworth锛\02\0卞\0 楂\0\0 娑叉\0\0佃\0 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'GOOGLE CHINA', 'skyworth 32\' 高分辨率', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'GOOGLE CHINA', 'LCD-32Z330A哪里有货', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'BAIDU', '创维（Skyworth）32英寸 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'BAIDU', '夏普46a63 JINDONG', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-26', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '安全套', '4');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', '飞利浦 42英寸 全高清 液晶电视 42PFL5609', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'GOOGLE CHINA', 'Sony', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', '诺基亚7610s', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', '32飞利浦液晶电视3409好吗', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', '创维37L02RM液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'BAIDU', 'www.jindong.com', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-27', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '高清大图', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '宽屏笔记本', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '剃须刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'ecshop', '智能手机', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '索尼推2999元32英寸液晶图', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '创维37l05hr如何查看液晶面板信息', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '乐华32液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '乐华 LCD32M08', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', 'ecshop 京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '金立 cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '乐华42电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-28', 'BAIDU', '夏普液晶面板代言人', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'BAIDU', '360 ecshop', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '3G无线上网', '5');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'BAIDU', 'www.jindong.com', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '宽屏笔记本', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '佳能相机', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'GOOGLE CHINA', 'ecshop 京东商城模版270版', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'BAIDU', '京东模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'BAIDU', '7610s', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'BAIDU', '创维（Skyworth）37英寸 液晶电视 37L02RM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-29', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', '飞利浦cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', 'sony电视机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', '创维（Skyworth）37英寸液晶电视37L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', 'LCD42M19', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'GOOGLE', 'ecshop 新手上路 修改 article_cat.php?id=5', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', '乐华lcd32m08说明书', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'BAIDU', '夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-30', 'GOOGLE CHINA', '5800耳机价钱', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '电风扇', '3');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '佳能相机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', 'ecshop商业模板', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', '创维32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', '7610s', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'GOOGLE CHINA', '飞利浦42PFL5609 jingdong', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '松下', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', '金立cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', '夏普LCD-32Z330A', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'BAIDU', '32PFL3409 LA32B350F1', '1');
INSERT INTO ecs_keywords VALUES ('2009-12-31', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '机杰士邦', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'BAIDU', '夏普32寸液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'BAIDU', '乐华液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '移动硬盘', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-01', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'ecshop', 'U盘', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'GOOGLE CHINA', 'sony 40v5500 jingdong', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'GOOGLE CHINA', '40v5500 检测', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'GOOGLE CHINA', '利浦 42英寸 全高清 液晶电视 42PFL5609', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'ecshop', '液晶电视', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'BAIDU', ' 乐华42寸液晶电视   ', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'BAIDU', 'SKYWORTH 37L02RM', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'BAIDU', '5800耳机', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-02', 'BAIDU', 'ECSHOP 京东', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'ecshop', '安全套', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'BAIDU', '金立cdma手机', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'BAIDU', '索尼彩电', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-03', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '乐华32寸液晶电视怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', 'phillips 电器', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '创维液晶电视京东价', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'GOOGLE CHINA', '0h', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'YAHOO', 'Sony KDL-40V5500如何更新', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '42寸液晶电视尺寸', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '京东商城 模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '索尼32寸高清超薄液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', '索尼（SONY）32英寸', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', 'KLV-32S550A', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '乐华(ROWA)42英寸高清液晶电视LCD42M19 怎么样', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'GOOGLE CHINA', '用户中心 模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-04', 'BAIDU', '模板名称 京东商城', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', '夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '液晶电视', '5');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', '如何判断 创维 37L05HR 液晶面板 是否是新的', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', '创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '佳能相机', '5');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '卡西欧手', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', 'U盘', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', '7610s诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '电风扇', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '瑞士军刀', '5');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '吸油烟', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'ecshop', '3G无线上网', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', 'c702c杀毒软件', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'GOOGLE CHINA', '乐华42液晶电士机价', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', '乐华lcd42m19', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'BAIDU', 'ecshop 模板 京东', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'GOOGLE CHINA', 'ecshop货到付款', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-05', 'GOOGLE CHINA', '', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'GOOGLE CHINA', '三星高清液晶电视26', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '联想商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '飞利浦cdma手机', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '飞利浦（PHILLIPS ）32英寸高清液晶电视32PFL3409 ', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '三星 高清 液晶电视机 26', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '安全套', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '高清大图', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '电风扇', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'ecshop', '3G无线上网', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '飞利浦32PFL3409 u盘升级', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-06', 'BAIDU', '1920 1080', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'BAIDU', '乐华液晶电视  U盘用不了', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '音乐手机', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'BAIDU', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'BAIDU', '夏普液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', 'trhtr', '4');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '移动硬盘', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '3G无线上网', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '瑞士军刀', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'GOOGLE CHINA', '用户中心模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'BAIDU', '飞利浦32pfl3409/93是高清电视吗', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '吸油烟', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-07', 'ecshop', '宽屏笔记本', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', '剃须刀', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'BAIDU', '创维（Skyworth）37英寸 液晶电视 37L02RM', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'BAIDU', 'ecshop 360宽屏模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'BAIDU', '高清', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'BAIDU', '高清液晶电视图片', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'BAIDU', '32寸高清液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', '安全套', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-08', 'ecshop', '诺基亚', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '机杰士邦', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '剃须刀', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '宽屏笔记本', '3');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '卡西欧手', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', 'U盘', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', 'trhtrht', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', 'trhtr', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '瑞士军刀', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '智能手机', '2');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'BAIDU', '\0\0淮锛\0kyworth锛\07\0卞\0娑叉\0\0佃\037L05HR', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'BAIDU', '京东商城模板', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-09', 'ecshop', '液晶电视', '1');
INSERT INTO ecs_keywords VALUES ('2010-01-22', 'ecshop', '乐扣', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-02', 'ecshop', '世家清洁', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-08', 'ecshop', '乐扣乐扣', '2');
INSERT INTO ecs_keywords VALUES ('2010-07-08', 'ecshop', '富士', '8');
INSERT INTO ecs_keywords VALUES ('2010-07-08', 'ecshop', '世家清洁', '2');
INSERT INTO ecs_keywords VALUES ('2010-07-08', 'ecshop', '雷达', '2');
INSERT INTO ecs_keywords VALUES ('2010-07-08', 'ecshop', 'OLAY黄飞红食品', '2');
INSERT INTO ecs_keywords VALUES ('2010-07-12', 'ecshop', '雷达', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-12', 'ecshop', '富士', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-12', 'ecshop', 'zippo', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-12', 'ecshop', '蚊帐凉席', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-14', 'ecshop', 'Gucci', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-14', 'ecshop', '富士', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-16', 'ecshop', '维生素', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-18', 'ecshop', '富士', '2');
INSERT INTO ecs_keywords VALUES ('2010-07-26', 'ecshop', '世家清洁', '1');
INSERT INTO ecs_keywords VALUES ('2010-07-26', 'ecshop', '富士', '1');
INSERT INTO ecs_keywords VALUES ('2010-08-05', 'ecshop', '智能手机', '1');
INSERT INTO ecs_keywords VALUES ('2010-11-01', 'ecshop', '美的（Midea）空气', '3');
INSERT INTO ecs_keywords VALUES ('2012-05-04', 'ecshop', '雷朋', '1');
INSERT INTO ecs_keywords VALUES ('2012-05-04', 'ecshop', '美的', '1');
INSERT INTO ecs_keywords VALUES ('2012-05-04', 'ecshop', '西部数据', '1');
INSERT INTO ecs_keywords VALUES ('2012-08-27', 'ecshop', '世家清洁', '1');
INSERT INTO ecs_keywords VALUES ('2012-11-30', 'ecshop', 'pingguo', '1');
INSERT INTO ecs_keywords VALUES ('2012-11-30', 'ecshop', '富士', '1');
INSERT INTO ecs_keywords VALUES ('2013-02-28', 'ecshop', '海信', '1');
INSERT INTO ecs_keywords VALUES ('2013-02-28', 'ecshop', '家电', '1');
INSERT INTO ecs_keywords VALUES ('2013-02-28', 'ecshop', '男士', '1');
INSERT INTO ecs_keywords VALUES ('2013-10-01', 'ecshop', '111', '1');
INSERT INTO ecs_keywords VALUES ('2013-10-01', 'ecshop', '奥派阿西', '1');
INSERT INTO ecs_keywords VALUES ('2013-10-03', 'ecshop', '6666', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-04', 'ecshop', 'http://localhost/mbjumei/index.php', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-04', 'ecshop', 'http://localhost/mbjumei/images/201501/goods\\_img/141\\_P\\_1420324798322.jpg', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-14', 'ecshop', '飘柔（Rejoice）倍瑞丝护理专研顺滑优惠装（洗发露450ML+护发素230ML）', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-15', 'ecshop', '光头强', '4');
INSERT INTO ecs_keywords VALUES ('2015-01-15', 'ecshop', '1', '6');
INSERT INTO ecs_keywords VALUES ('2015-01-19', 'ecshop', '1', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-23', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-23', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-23', 'ecshop', '兰蔻清滢柔肤水', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-24', 'ecshop', '化妆品', '3');
INSERT INTO ecs_keywords VALUES ('2015-01-24', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-01-26', 'ecshop', '6511', '2');
INSERT INTO ecs_keywords VALUES ('2015-01-26', 'ecshop', '-动静触点', '2');
INSERT INTO ecs_keywords VALUES ('2015-01-30', 'ecshop', '鞋', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-01', 'ecshop', '人', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-01', 'ecshop', 'a', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-03', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-03', 'ecshop', '个人护理', '2');
INSERT INTO ecs_keywords VALUES ('2015-02-04', 'ecshop', '完美', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-05', 'ecshop', '就', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-05', 'ecshop', '兰蔻清滢柔肤水400ml', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', 'zxc', '5');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', '葡萄酒', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', '酒', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', '', '4');
INSERT INTO ecs_keywords VALUES ('2015-02-09', 'ecshop', '????|????', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-10', 'ecshop', 'kk', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-10', 'ecshop', '花', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-10', 'ecshop', '佳洁士', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-11', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-14', 'ecshop', '??a?oo??', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-14', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-14', 'ecshop', '??a?oo??��???', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-14', 'ecshop', '????|????', '2');
INSERT INTO ecs_keywords VALUES ('2015-02-14', 'ecshop', '化妆品', '4');
INSERT INTO ecs_keywords VALUES ('2015-02-15', 'ecshop', 'tg', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-16', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-25', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-25', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-27', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-27', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-27', 'ecshop', '5', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-28', 'ecshop', '私密', '1');
INSERT INTO ecs_keywords VALUES ('2015-02-28', 'ecshop', '你更好吗', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-03', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-04', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-04', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-07', 'ecshop', '化妆品', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-07', 'ecshop', 'df', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-09', 'ecshop', '个人护理', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-09', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-09', 'ecshop', '面膜', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-09', 'ecshop', '手机', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-09', 'ecshop', '美妆', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-10', 'ecshop', '飘柔', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-10', 'ecshop', 'Mp3', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-10', 'ecshop', 'a', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-11', 'ecshop', '个人', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-11', 'ecshop', '完美', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-11', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-11', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-15', 'ecshop', '????|????', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-15', 'ecshop', '化妆品', '3');
INSERT INTO ecs_keywords VALUES ('2015-03-18', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-20', 'ecshop', '包包', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-20', 'ecshop', '牙膏', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-20', 'ecshop', '1', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-21', 'ecshop', '个人护理', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-22', 'ecshop', '化妆品', '3');
INSERT INTO ecs_keywords VALUES ('2015-03-23', 'ecshop', '化妆品', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-23', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-24', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-26', 'ecshop', 'ECS000000', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-28', 'ecshop', '个人护理', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '1', '2');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '123', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '12', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '11', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '2', '1');
INSERT INTO ecs_keywords VALUES ('2015-03-30', 'ecshop', '3', '1');

-- ----------------------------
-- Table structure for `ecs_link_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_link_goods`;
CREATE TABLE `ecs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_double` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`link_goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_link_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_mail_templates`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_mail_templates`;
CREATE TABLE `ecs_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(30) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_subject` varchar(200) NOT NULL DEFAULT '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL DEFAULT '0',
  `last_send` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_mail_templates
-- ----------------------------
INSERT INTO ecs_mail_templates VALUES ('1', 'send_password', '1', '密码找回', '{$user_name}您好！<br>\n<br>\n您已经进行了密码重置的操作，请点击以下链接(或者复制到您的浏览器):<br>\n<br>\n<a href=\"{$reset_email}\" target=\"_blank\">{$reset_email}</a><br>\n<br>\n以确认您的新密码重置操作！<br>\n<br>\n{$shop_name}<br>\n{$send_date}', '1194824789', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('2', 'order_confirm', '0', '订单确认通知', '亲爱的{$order.consignee}，你好！ \n\n我们已经收到您于 {$order.formated_add_time} 提交的订单，该订单编号为：{$order.order_sn} 请记住这个编号以便日后的查询。\n\n{$shop_name}\n{$sent_date}\n\n\n', '1158226370', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('3', 'deliver_notice', '1', '发货通知', '亲爱的{$order.consignee}。你好！</br></br>\n\n您的订单{$order.order_sn}已于{$send_time}按照您预定的配送方式给您发货了。</br>\n</br>\n{if $order.invoice_no}发货单号是{$order.invoice_no}。</br>{/if}\n</br>\n在您收到货物之后请点击下面的链接确认您已经收到货物：</br>\n<a href=\"{$confirm_url}\" target=\"_blank\">{$confirm_url}</a></br></br>\n如果您还没有收到货物可以点击以下链接给我们留言：</br></br>\n<a href=\"{$send_msg_url}\" target=\"_blank\">{$send_msg_url}</a></br>\n<br>\n再次感谢您对我们的支持。欢迎您的再次光临。 <br>\n<br>\n{$shop_name} </br>\n{$send_date}', '1194823291', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('4', 'order_cancel', '0', '订单取消', '亲爱的{$order.consignee}，你好！ \n\n您的编号为：{$order.order_sn}的订单已取消。\n\n{$shop_name}\n{$send_date}', '1156491130', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('5', 'order_invalid', '0', '订单无效', '亲爱的{$order.consignee}，你好！\n\n您的编号为：{$order.order_sn}的订单无效。\n\n{$shop_name}\n{$send_date}', '1156491164', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('6', 'send_bonus', '0', '发红包', '亲爱的{$user_name}您好！\n\n恭喜您获得了{$count}个红包，金额{if $count > 1}分别{/if}为{$money}\n\n{$shop_name}\n{$send_date}\n', '1156491184', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('7', 'group_buy', '1', '团购商品', '亲爱的{$consignee}，您好！<br>\n<br>\n您于{$order_time}在本店参加团购商品活动，所购买的商品名称为：{$goods_name}，数量：{$goods_number}，订单号为：{$order_sn}，订单金额为：{$order_amount}<br>\n<br>\n此团购商品现在已到结束日期，并达到最低价格，您现在可以对该订单付款。<br>\n<br>\n请点击下面的链接：<br>\n<a href=\"{$shop_url}\" target=\"_blank\">{$shop_url}</a><br>\n<br>\n请尽快登录到用户中心，查看您的订单详情信息。 <br>\n<br>\n{$shop_name} <br>\n<br>\n{$send_date}', '1194824668', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('8', 'register_validate', '1', '邮件验证', '{$user_name}您好！<br><br>\r\n\r\n这封邮件是 {$shop_name} 发送的。你收到这封邮件是为了验证你注册邮件地址是否有效。如果您已经通过验证了，请忽略这封邮件。<br>\r\n请点击以下链接(或者复制到您的浏览器)来验证你的邮件地址:<br>\r\n<a href=\"{$validate_email}\" target=\"_blank\">{$validate_email}</a><br><br>\r\n\r\n{$shop_name}<br>\r\n{$send_date}', '1162201031', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('9', 'virtual_card', '0', '虚拟卡片', '亲爱的{$order.consignee}\r\n你好！您的订单{$order.order_sn}中{$goods.goods_name} 商品的详细信息如下:\r\n{foreach from=$virtual_card item=card}\r\n{if $card.card_sn}卡号：{$card.card_sn}{/if}{if $card.card_password}卡片密码：{$card.card_password}{/if}{if $card.end_date}截至日期：{$card.end_date}{/if}\r\n{/foreach}\r\n再次感谢您对我们的支持。欢迎您的再次光临。\r\n\r\n{$shop_name} \r\n{$send_date}', '1162201031', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('10', 'attention_list', '0', '关注商品', '亲爱的{$user_name}您好~\n\n您关注的商品 : {$goods_name} 最近已经更新,请您查看最新的商品信息\n\n{$goods_url}\r\n\r\n{$shop_name} \r\n{$send_date}', '1183851073', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('11', 'remind_of_new_order', '0', '新订单通知', '亲爱的店长，您好：\n   快来看看吧，又有新订单了。\n    订单号:{$order.order_sn} \n 订单金额:{$order.order_amount}，\n 用户购买商品:{foreach from=$goods_list item=goods_data}{$goods_data.goods_name}(货号:{$goods_data.goods_sn})    {/foreach} \n\n 收货人:{$order.consignee}， \n 收货人地址:{$order.address}，\n 收货人电话:{$order.tel} {$order.mobile}, \n 配送方式:{$order.shipping_name}(费用:{$order.shipping_fee}), \n 付款方式:{$order.pay_name}(费用:{$order.pay_fee})。\n\n               系统提醒\n               {$send_date}', '1196239170', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('12', 'goods_booking', '1', '缺货回复', '亲爱的{$user_name}。你好！</br></br>{$dispose_note}</br></br>您提交的缺货商品链接为</br></br><a href=\"{$goods_link}\" target=\"_blank\">{$goods_name}</a></br><br>{$shop_name} </br>{$send_date}', '0', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('13', 'user_message', '1', '留言回复', '亲爱的{$user_name}。你好！</br></br>对您的留言：</br>{$message_content}</br></br>店主作了如下回复：</br>{$message_note}</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}', '0', '0', 'template');
INSERT INTO ecs_mail_templates VALUES ('14', 'recomment', '1', '用户评论回复', '亲爱的{$user_name}。你好！</br></br>对您的评论：</br>“{$comment}”</br></br>店主作了如下回复：</br>“{$recomment}”</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}', '0', '0', 'template');

-- ----------------------------
-- Table structure for `ecs_member_price`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_member_price`;
CREATE TABLE `ecs_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) NOT NULL DEFAULT '0',
  `user_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_id`),
  KEY `goods_id` (`goods_id`,`user_rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_nav`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_nav`;
CREATE TABLE `ecs_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_nav
-- ----------------------------
INSERT INTO ecs_nav VALUES ('2', '', '0', '选购中心', '1', '2', '0', 'pick_out.php', 'top');
INSERT INTO ecs_nav VALUES ('3', '', '0', '我的账户', '1', '0', '0', 'user.php', 'top');
INSERT INTO ecs_nav VALUES ('4', 'c', '21', '美颜系列', '1', '0', '0', 'category.php?id=21', 'middle');
INSERT INTO ecs_nav VALUES ('6', '', '0', '标签云', '1', '5', '6', 'tag_cloud.php', 'top');
INSERT INTO ecs_nav VALUES ('7', '', '0', '免责条款', '1', '1', '0', 'article.php?id=1', 'bottom');
INSERT INTO ecs_nav VALUES ('8', '', '0', '隐私保护', '1', '2', '0', 'article.php?id=2', 'bottom');
INSERT INTO ecs_nav VALUES ('9', '', '0', '咨询热点', '1', '3', '0', 'article.php?id=3', 'bottom');
INSERT INTO ecs_nav VALUES ('10', '', '0', '联系我们', '1', '4', '0', 'article.php?id=4', 'bottom');
INSERT INTO ecs_nav VALUES ('11', '', '0', '公司简介', '1', '5', '0', 'article.php?id=5', 'bottom');
INSERT INTO ecs_nav VALUES ('12', '', '0', '批发方案', '1', '6', '0', 'wholesale.php', 'bottom');
INSERT INTO ecs_nav VALUES ('14', '', '0', '配送方式', '1', '7', '0', 'myship.php', 'bottom');
INSERT INTO ecs_nav VALUES ('23', '', '0', '报价单', '1', '6', '0', 'quotation.php', 'top');
INSERT INTO ecs_nav VALUES ('24', '', '0', '团购商品', '1', '28', '0', 'group_buy.php', 'middle');
INSERT INTO ecs_nav VALUES ('26', 'c', '132', '美肤系列', '1', '1', '0', 'category.php?id=132', 'middle');
INSERT INTO ecs_nav VALUES ('33', '', '0', '品牌专区', '0', '7', '0', 'brand.php', 'middle');
INSERT INTO ecs_nav VALUES ('34', 'c', '16', '足浴系列', '1', '25', '0', 'category.php?id=16', 'middle');
INSERT INTO ecs_nav VALUES ('38', 'c', '69', '导航分类一', '1', '34', '0', 'category.php?id=69', 'middle');
INSERT INTO ecs_nav VALUES ('39', 'c', '44', '导航分类二', '1', '36', '0', 'category.php?id=44', 'middle');

-- ----------------------------
-- Table structure for `ecs_order_action`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_action`;
CREATE TABLE `ecs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_user` varchar(30) NOT NULL DEFAULT '',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_place` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_action
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_goods`;
CREATE TABLE `ecs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_info`;
CREATE TABLE `ecs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_pack`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_pack`;
CREATE TABLE `ecs_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `pack_img` varchar(255) NOT NULL DEFAULT '',
  `pack_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pack_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pack_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_pack
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_package_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_package_goods`;
CREATE TABLE `ecs_package_goods` (
  `package_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`,`goods_id`,`admin_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_package_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_payment`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_payment`;
CREATE TABLE `ecs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_pay_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_pay_log`;
CREATE TABLE `ecs_pay_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_plugins`;
CREATE TABLE `ecs_plugins` (
  `code` varchar(30) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `library` varchar(255) NOT NULL DEFAULT '',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `install_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_products`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_products`;
CREATE TABLE `ecs_products` (
  `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_attr` varchar(50) DEFAULT NULL,
  `product_sn` varchar(60) DEFAULT NULL,
  `product_number` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_products
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_region`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_region`;
CREATE TABLE `ecs_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_region
-- ----------------------------
INSERT INTO ecs_region VALUES ('1', '0', '中国', '0', '0');
INSERT INTO ecs_region VALUES ('2', '1', '北京', '1', '0');
INSERT INTO ecs_region VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO ecs_region VALUES ('4', '1', '福建', '1', '0');
INSERT INTO ecs_region VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO ecs_region VALUES ('6', '1', '广东', '1', '0');
INSERT INTO ecs_region VALUES ('7', '1', '广西', '1', '0');
INSERT INTO ecs_region VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO ecs_region VALUES ('9', '1', '海南', '1', '0');
INSERT INTO ecs_region VALUES ('10', '1', '河北', '1', '0');
INSERT INTO ecs_region VALUES ('11', '1', '河南', '1', '0');
INSERT INTO ecs_region VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO ecs_region VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO ecs_region VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO ecs_region VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO ecs_region VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO ecs_region VALUES ('17', '1', '江西', '1', '0');
INSERT INTO ecs_region VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO ecs_region VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO ecs_region VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO ecs_region VALUES ('21', '1', '青海', '1', '0');
INSERT INTO ecs_region VALUES ('22', '1', '山东', '1', '0');
INSERT INTO ecs_region VALUES ('23', '1', '山西', '1', '0');
INSERT INTO ecs_region VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO ecs_region VALUES ('25', '1', '上海', '1', '0');
INSERT INTO ecs_region VALUES ('26', '1', '四川', '1', '0');
INSERT INTO ecs_region VALUES ('27', '1', '天津', '1', '0');
INSERT INTO ecs_region VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO ecs_region VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO ecs_region VALUES ('30', '1', '云南', '1', '0');
INSERT INTO ecs_region VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO ecs_region VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO ecs_region VALUES ('33', '1', '香港', '1', '0');
INSERT INTO ecs_region VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO ecs_region VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO ecs_region VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO ecs_region VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO ecs_region VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO ecs_region VALUES ('39', '3', '池州', '2', '0');
INSERT INTO ecs_region VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO ecs_region VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO ecs_region VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO ecs_region VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO ecs_region VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO ecs_region VALUES ('45', '3', '六安', '2', '0');
INSERT INTO ecs_region VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO ecs_region VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO ecs_region VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO ecs_region VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO ecs_region VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO ecs_region VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO ecs_region VALUES ('52', '2', '北京', '2', '0');
INSERT INTO ecs_region VALUES ('53', '4', '福州', '2', '0');
INSERT INTO ecs_region VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO ecs_region VALUES ('55', '4', '南平', '2', '0');
INSERT INTO ecs_region VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO ecs_region VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO ecs_region VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO ecs_region VALUES ('59', '4', '三明', '2', '0');
INSERT INTO ecs_region VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO ecs_region VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO ecs_region VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO ecs_region VALUES ('63', '5', '白银', '2', '0');
INSERT INTO ecs_region VALUES ('64', '5', '定西', '2', '0');
INSERT INTO ecs_region VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO ecs_region VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO ecs_region VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO ecs_region VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO ecs_region VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO ecs_region VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO ecs_region VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO ecs_region VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO ecs_region VALUES ('73', '5', '天水', '2', '0');
INSERT INTO ecs_region VALUES ('74', '5', '武威', '2', '0');
INSERT INTO ecs_region VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO ecs_region VALUES ('76', '6', '广州', '2', '0');
INSERT INTO ecs_region VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO ecs_region VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO ecs_region VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO ecs_region VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO ecs_region VALUES ('81', '6', '河源', '2', '0');
INSERT INTO ecs_region VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO ecs_region VALUES ('83', '6', '江门', '2', '0');
INSERT INTO ecs_region VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO ecs_region VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO ecs_region VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO ecs_region VALUES ('87', '6', '清远', '2', '0');
INSERT INTO ecs_region VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO ecs_region VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO ecs_region VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO ecs_region VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO ecs_region VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO ecs_region VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO ecs_region VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO ecs_region VALUES ('95', '6', '中山', '2', '0');
INSERT INTO ecs_region VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO ecs_region VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO ecs_region VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO ecs_region VALUES ('99', '7', '百色', '2', '0');
INSERT INTO ecs_region VALUES ('100', '7', '北海', '2', '0');
INSERT INTO ecs_region VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO ecs_region VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO ecs_region VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO ecs_region VALUES ('104', '7', '河池', '2', '0');
INSERT INTO ecs_region VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO ecs_region VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO ecs_region VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO ecs_region VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO ecs_region VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO ecs_region VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO ecs_region VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO ecs_region VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO ecs_region VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO ecs_region VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO ecs_region VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO ecs_region VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO ecs_region VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO ecs_region VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO ecs_region VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO ecs_region VALUES ('120', '9', '海口', '2', '0');
INSERT INTO ecs_region VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO ecs_region VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO ecs_region VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO ecs_region VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO ecs_region VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO ecs_region VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO ecs_region VALUES ('127', '9', '东方', '2', '0');
INSERT INTO ecs_region VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO ecs_region VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO ecs_region VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO ecs_region VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO ecs_region VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO ecs_region VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO ecs_region VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO ecs_region VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO ecs_region VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO ecs_region VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO ecs_region VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO ecs_region VALUES ('139', '10', '保定', '2', '0');
INSERT INTO ecs_region VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO ecs_region VALUES ('141', '10', '承德', '2', '0');
INSERT INTO ecs_region VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO ecs_region VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO ecs_region VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO ecs_region VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO ecs_region VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO ecs_region VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO ecs_region VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO ecs_region VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO ecs_region VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO ecs_region VALUES ('151', '11', '开封', '2', '0');
INSERT INTO ecs_region VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO ecs_region VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO ecs_region VALUES ('154', '11', '济源', '2', '0');
INSERT INTO ecs_region VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO ecs_region VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO ecs_region VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO ecs_region VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO ecs_region VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO ecs_region VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO ecs_region VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO ecs_region VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO ecs_region VALUES ('163', '11', '周口', '2', '0');
INSERT INTO ecs_region VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO ecs_region VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO ecs_region VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO ecs_region VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO ecs_region VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO ecs_region VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO ecs_region VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO ecs_region VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO ecs_region VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO ecs_region VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO ecs_region VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO ecs_region VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO ecs_region VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO ecs_region VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO ecs_region VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO ecs_region VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO ecs_region VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO ecs_region VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO ecs_region VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO ecs_region VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO ecs_region VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO ecs_region VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO ecs_region VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO ecs_region VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO ecs_region VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO ecs_region VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO ecs_region VALUES ('190', '13', '随州', '2', '0');
INSERT INTO ecs_region VALUES ('191', '13', '天门', '2', '0');
INSERT INTO ecs_region VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO ecs_region VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO ecs_region VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO ecs_region VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO ecs_region VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO ecs_region VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO ecs_region VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO ecs_region VALUES ('199', '14', '常德', '2', '0');
INSERT INTO ecs_region VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO ecs_region VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO ecs_region VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO ecs_region VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO ecs_region VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO ecs_region VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO ecs_region VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO ecs_region VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO ecs_region VALUES ('208', '14', '永州', '2', '0');
INSERT INTO ecs_region VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO ecs_region VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO ecs_region VALUES ('211', '15', '长春', '2', '0');
INSERT INTO ecs_region VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO ecs_region VALUES ('213', '15', '白城', '2', '0');
INSERT INTO ecs_region VALUES ('214', '15', '白山', '2', '0');
INSERT INTO ecs_region VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO ecs_region VALUES ('216', '15', '四平', '2', '0');
INSERT INTO ecs_region VALUES ('217', '15', '松原', '2', '0');
INSERT INTO ecs_region VALUES ('218', '15', '通化', '2', '0');
INSERT INTO ecs_region VALUES ('219', '15', '延边', '2', '0');
INSERT INTO ecs_region VALUES ('220', '16', '南京', '2', '0');
INSERT INTO ecs_region VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO ecs_region VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO ecs_region VALUES ('223', '16', '常州', '2', '0');
INSERT INTO ecs_region VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO ecs_region VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO ecs_region VALUES ('226', '16', '南通', '2', '0');
INSERT INTO ecs_region VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO ecs_region VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO ecs_region VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO ecs_region VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO ecs_region VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO ecs_region VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO ecs_region VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO ecs_region VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO ecs_region VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO ecs_region VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO ecs_region VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO ecs_region VALUES ('238', '17', '九江', '2', '0');
INSERT INTO ecs_region VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO ecs_region VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO ecs_region VALUES ('241', '17', '新余', '2', '0');
INSERT INTO ecs_region VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO ecs_region VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO ecs_region VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO ecs_region VALUES ('245', '18', '大连', '2', '0');
INSERT INTO ecs_region VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO ecs_region VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO ecs_region VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO ecs_region VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO ecs_region VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO ecs_region VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO ecs_region VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO ecs_region VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO ecs_region VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO ecs_region VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO ecs_region VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO ecs_region VALUES ('257', '18', '营口', '2', '0');
INSERT INTO ecs_region VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO ecs_region VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO ecs_region VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO ecs_region VALUES ('261', '19', '包头', '2', '0');
INSERT INTO ecs_region VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO ecs_region VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO ecs_region VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO ecs_region VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO ecs_region VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO ecs_region VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO ecs_region VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO ecs_region VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO ecs_region VALUES ('270', '20', '银川', '2', '0');
INSERT INTO ecs_region VALUES ('271', '20', '固原', '2', '0');
INSERT INTO ecs_region VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO ecs_region VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO ecs_region VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO ecs_region VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO ecs_region VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO ecs_region VALUES ('277', '21', '海北', '2', '0');
INSERT INTO ecs_region VALUES ('278', '21', '海东', '2', '0');
INSERT INTO ecs_region VALUES ('279', '21', '海南', '2', '0');
INSERT INTO ecs_region VALUES ('280', '21', '海西', '2', '0');
INSERT INTO ecs_region VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO ecs_region VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO ecs_region VALUES ('283', '22', '济南', '2', '0');
INSERT INTO ecs_region VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO ecs_region VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO ecs_region VALUES ('286', '22', '德州', '2', '0');
INSERT INTO ecs_region VALUES ('287', '22', '东营', '2', '0');
INSERT INTO ecs_region VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO ecs_region VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO ecs_region VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO ecs_region VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO ecs_region VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO ecs_region VALUES ('293', '22', '日照', '2', '0');
INSERT INTO ecs_region VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO ecs_region VALUES ('295', '22', '威海', '2', '0');
INSERT INTO ecs_region VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO ecs_region VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO ecs_region VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO ecs_region VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO ecs_region VALUES ('300', '23', '太原', '2', '0');
INSERT INTO ecs_region VALUES ('301', '23', '长治', '2', '0');
INSERT INTO ecs_region VALUES ('302', '23', '大同', '2', '0');
INSERT INTO ecs_region VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO ecs_region VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO ecs_region VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO ecs_region VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO ecs_region VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO ecs_region VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO ecs_region VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO ecs_region VALUES ('310', '23', '运城', '2', '0');
INSERT INTO ecs_region VALUES ('311', '24', '西安', '2', '0');
INSERT INTO ecs_region VALUES ('312', '24', '安康', '2', '0');
INSERT INTO ecs_region VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO ecs_region VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO ecs_region VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO ecs_region VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO ecs_region VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO ecs_region VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO ecs_region VALUES ('319', '24', '延安', '2', '0');
INSERT INTO ecs_region VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO ecs_region VALUES ('321', '25', '上海', '2', '0');
INSERT INTO ecs_region VALUES ('322', '26', '成都', '2', '0');
INSERT INTO ecs_region VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO ecs_region VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO ecs_region VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO ecs_region VALUES ('326', '26', '达州', '2', '0');
INSERT INTO ecs_region VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO ecs_region VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO ecs_region VALUES ('329', '26', '广安', '2', '0');
INSERT INTO ecs_region VALUES ('330', '26', '广元', '2', '0');
INSERT INTO ecs_region VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO ecs_region VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO ecs_region VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO ecs_region VALUES ('334', '26', '南充', '2', '0');
INSERT INTO ecs_region VALUES ('335', '26', '内江', '2', '0');
INSERT INTO ecs_region VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO ecs_region VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO ecs_region VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO ecs_region VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO ecs_region VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO ecs_region VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO ecs_region VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO ecs_region VALUES ('343', '27', '天津', '2', '0');
INSERT INTO ecs_region VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO ecs_region VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO ecs_region VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO ecs_region VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO ecs_region VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO ecs_region VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO ecs_region VALUES ('350', '28', '山南', '2', '0');
INSERT INTO ecs_region VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO ecs_region VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO ecs_region VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO ecs_region VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO ecs_region VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO ecs_region VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO ecs_region VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO ecs_region VALUES ('358', '29', '和田', '2', '0');
INSERT INTO ecs_region VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO ecs_region VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO ecs_region VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO ecs_region VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO ecs_region VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO ecs_region VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO ecs_region VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO ecs_region VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO ecs_region VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO ecs_region VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO ecs_region VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO ecs_region VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO ecs_region VALUES ('371', '30', '保山', '2', '0');
INSERT INTO ecs_region VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO ecs_region VALUES ('373', '30', '大理', '2', '0');
INSERT INTO ecs_region VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO ecs_region VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO ecs_region VALUES ('376', '30', '红河', '2', '0');
INSERT INTO ecs_region VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO ecs_region VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO ecs_region VALUES ('379', '30', '文山', '2', '0');
INSERT INTO ecs_region VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO ecs_region VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO ecs_region VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO ecs_region VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO ecs_region VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO ecs_region VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO ecs_region VALUES ('386', '31', '金华', '2', '0');
INSERT INTO ecs_region VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO ecs_region VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO ecs_region VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO ecs_region VALUES ('390', '31', '台州', '2', '0');
INSERT INTO ecs_region VALUES ('391', '31', '温州', '2', '0');
INSERT INTO ecs_region VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO ecs_region VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO ecs_region VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO ecs_region VALUES ('395', '33', '香港', '2', '0');
INSERT INTO ecs_region VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO ecs_region VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO ecs_region VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO ecs_region VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO ecs_region VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO ecs_region VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO ecs_region VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO ecs_region VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO ecs_region VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO ecs_region VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO ecs_region VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO ecs_region VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO ecs_region VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO ecs_region VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO ecs_region VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO ecs_region VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO ecs_region VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO ecs_region VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO ecs_region VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO ecs_region VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO ecs_region VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO ecs_region VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO ecs_region VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO ecs_region VALUES ('420', '38', '和县', '3', '0');
INSERT INTO ecs_region VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO ecs_region VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO ecs_region VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO ecs_region VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO ecs_region VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO ecs_region VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO ecs_region VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO ecs_region VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO ecs_region VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO ecs_region VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO ecs_region VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO ecs_region VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO ecs_region VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO ecs_region VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO ecs_region VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO ecs_region VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO ecs_region VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO ecs_region VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO ecs_region VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO ecs_region VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO ecs_region VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO ecs_region VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO ecs_region VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO ecs_region VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO ecs_region VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO ecs_region VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO ecs_region VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO ecs_region VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO ecs_region VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO ecs_region VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO ecs_region VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO ecs_region VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO ecs_region VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO ecs_region VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO ecs_region VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO ecs_region VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO ecs_region VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO ecs_region VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO ecs_region VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO ecs_region VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO ecs_region VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO ecs_region VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO ecs_region VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO ecs_region VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO ecs_region VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO ecs_region VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO ecs_region VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO ecs_region VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO ecs_region VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO ecs_region VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO ecs_region VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO ecs_region VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO ecs_region VALUES ('473', '47', '埇桥区', '3', '0');
INSERT INTO ecs_region VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO ecs_region VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO ecs_region VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO ecs_region VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO ecs_region VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO ecs_region VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO ecs_region VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO ecs_region VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO ecs_region VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO ecs_region VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO ecs_region VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO ecs_region VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO ecs_region VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO ecs_region VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO ecs_region VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO ecs_region VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO ecs_region VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO ecs_region VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO ecs_region VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO ecs_region VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO ecs_region VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO ecs_region VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO ecs_region VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO ecs_region VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO ecs_region VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO ecs_region VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO ecs_region VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO ecs_region VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO ecs_region VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO ecs_region VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO ecs_region VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO ecs_region VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO ecs_region VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO ecs_region VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO ecs_region VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO ecs_region VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO ecs_region VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO ecs_region VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO ecs_region VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO ecs_region VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO ecs_region VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO ecs_region VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO ecs_region VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO ecs_region VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO ecs_region VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO ecs_region VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO ecs_region VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO ecs_region VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO ecs_region VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO ecs_region VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO ecs_region VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO ecs_region VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO ecs_region VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO ecs_region VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO ecs_region VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO ecs_region VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO ecs_region VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO ecs_region VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO ecs_region VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO ecs_region VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO ecs_region VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO ecs_region VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO ecs_region VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO ecs_region VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO ecs_region VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO ecs_region VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO ecs_region VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO ecs_region VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO ecs_region VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO ecs_region VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO ecs_region VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO ecs_region VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO ecs_region VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO ecs_region VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO ecs_region VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO ecs_region VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO ecs_region VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO ecs_region VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO ecs_region VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO ecs_region VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO ecs_region VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO ecs_region VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO ecs_region VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO ecs_region VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO ecs_region VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO ecs_region VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO ecs_region VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO ecs_region VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO ecs_region VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO ecs_region VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO ecs_region VALUES ('565', '58', '清濛开发区', '3', '0');
INSERT INTO ecs_region VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO ecs_region VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO ecs_region VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO ecs_region VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO ecs_region VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO ecs_region VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO ecs_region VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO ecs_region VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO ecs_region VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO ecs_region VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO ecs_region VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO ecs_region VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO ecs_region VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO ecs_region VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO ecs_region VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO ecs_region VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO ecs_region VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO ecs_region VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO ecs_region VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO ecs_region VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO ecs_region VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO ecs_region VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO ecs_region VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO ecs_region VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO ecs_region VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO ecs_region VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO ecs_region VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO ecs_region VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO ecs_region VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO ecs_region VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO ecs_region VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO ecs_region VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO ecs_region VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO ecs_region VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO ecs_region VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO ecs_region VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO ecs_region VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO ecs_region VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO ecs_region VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO ecs_region VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO ecs_region VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO ecs_region VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO ecs_region VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO ecs_region VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO ecs_region VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO ecs_region VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO ecs_region VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO ecs_region VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO ecs_region VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO ecs_region VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO ecs_region VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO ecs_region VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO ecs_region VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO ecs_region VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO ecs_region VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO ecs_region VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO ecs_region VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO ecs_region VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO ecs_region VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO ecs_region VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO ecs_region VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO ecs_region VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO ecs_region VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO ecs_region VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO ecs_region VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO ecs_region VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO ecs_region VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO ecs_region VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO ecs_region VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO ecs_region VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO ecs_region VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO ecs_region VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO ecs_region VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO ecs_region VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO ecs_region VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO ecs_region VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO ecs_region VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO ecs_region VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO ecs_region VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO ecs_region VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO ecs_region VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO ecs_region VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO ecs_region VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO ecs_region VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO ecs_region VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO ecs_region VALUES ('651', '70', '成县', '3', '0');
INSERT INTO ecs_region VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO ecs_region VALUES ('653', '70', '康县', '3', '0');
INSERT INTO ecs_region VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO ecs_region VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO ecs_region VALUES ('656', '70', '文县', '3', '0');
INSERT INTO ecs_region VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO ecs_region VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO ecs_region VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO ecs_region VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO ecs_region VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO ecs_region VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO ecs_region VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO ecs_region VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO ecs_region VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO ecs_region VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO ecs_region VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO ecs_region VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO ecs_region VALUES ('669', '72', '环县', '3', '0');
INSERT INTO ecs_region VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO ecs_region VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO ecs_region VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO ecs_region VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO ecs_region VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO ecs_region VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO ecs_region VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO ecs_region VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO ecs_region VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO ecs_region VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO ecs_region VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO ecs_region VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO ecs_region VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO ecs_region VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO ecs_region VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO ecs_region VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO ecs_region VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO ecs_region VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO ecs_region VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO ecs_region VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO ecs_region VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO ecs_region VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO ecs_region VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO ecs_region VALUES ('693', '76', '天河区', '3', '0');
INSERT INTO ecs_region VALUES ('694', '76', '东山区', '3', '0');
INSERT INTO ecs_region VALUES ('695', '76', '白云区', '3', '0');
INSERT INTO ecs_region VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO ecs_region VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO ecs_region VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO ecs_region VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO ecs_region VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO ecs_region VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO ecs_region VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO ecs_region VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO ecs_region VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO ecs_region VALUES ('705', '77', '福田区', '3', '0');
INSERT INTO ecs_region VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO ecs_region VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO ecs_region VALUES ('708', '77', '宝安区', '3', '0');
INSERT INTO ecs_region VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO ecs_region VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO ecs_region VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO ecs_region VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO ecs_region VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO ecs_region VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO ecs_region VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO ecs_region VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO ecs_region VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO ecs_region VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO ecs_region VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO ecs_region VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO ecs_region VALUES ('721', '79', '道滘镇', '3', '0');
INSERT INTO ecs_region VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO ecs_region VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO ecs_region VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO ecs_region VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO ecs_region VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO ecs_region VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO ecs_region VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO ecs_region VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO ecs_region VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO ecs_region VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO ecs_region VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO ecs_region VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO ecs_region VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO ecs_region VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO ecs_region VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO ecs_region VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO ecs_region VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO ecs_region VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO ecs_region VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO ecs_region VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO ecs_region VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO ecs_region VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO ecs_region VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO ecs_region VALUES ('745', '79', '高埗镇', '3', '0');
INSERT INTO ecs_region VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO ecs_region VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO ecs_region VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO ecs_region VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO ecs_region VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO ecs_region VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO ecs_region VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO ecs_region VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO ecs_region VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO ecs_region VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO ecs_region VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO ecs_region VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO ecs_region VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO ecs_region VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO ecs_region VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO ecs_region VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO ecs_region VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO ecs_region VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO ecs_region VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO ecs_region VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO ecs_region VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO ecs_region VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO ecs_region VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO ecs_region VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO ecs_region VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO ecs_region VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO ecs_region VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO ecs_region VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO ecs_region VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO ecs_region VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO ecs_region VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO ecs_region VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO ecs_region VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO ecs_region VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO ecs_region VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO ecs_region VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO ecs_region VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO ecs_region VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO ecs_region VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO ecs_region VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO ecs_region VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO ecs_region VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO ecs_region VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO ecs_region VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO ecs_region VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO ecs_region VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO ecs_region VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO ecs_region VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO ecs_region VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO ecs_region VALUES ('795', '87', '连山', '3', '0');
INSERT INTO ecs_region VALUES ('796', '87', '连南', '3', '0');
INSERT INTO ecs_region VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO ecs_region VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO ecs_region VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO ecs_region VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO ecs_region VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO ecs_region VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO ecs_region VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO ecs_region VALUES ('804', '89', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO ecs_region VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO ecs_region VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO ecs_region VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO ecs_region VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO ecs_region VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO ecs_region VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO ecs_region VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO ecs_region VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO ecs_region VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO ecs_region VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO ecs_region VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO ecs_region VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO ecs_region VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO ecs_region VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO ecs_region VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO ecs_region VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO ecs_region VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO ecs_region VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO ecs_region VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO ecs_region VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO ecs_region VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO ecs_region VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO ecs_region VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO ecs_region VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO ecs_region VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO ecs_region VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO ecs_region VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO ecs_region VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO ecs_region VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO ecs_region VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO ecs_region VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO ecs_region VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO ecs_region VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO ecs_region VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO ecs_region VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO ecs_region VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO ecs_region VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO ecs_region VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO ecs_region VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO ecs_region VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO ecs_region VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO ecs_region VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO ecs_region VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO ecs_region VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO ecs_region VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO ecs_region VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO ecs_region VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO ecs_region VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO ecs_region VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO ecs_region VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO ecs_region VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO ecs_region VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO ecs_region VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO ecs_region VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO ecs_region VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO ecs_region VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO ecs_region VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO ecs_region VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO ecs_region VALUES ('864', '97', '横县', '3', '0');
INSERT INTO ecs_region VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO ecs_region VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO ecs_region VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO ecs_region VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO ecs_region VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO ecs_region VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO ecs_region VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO ecs_region VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO ecs_region VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO ecs_region VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO ecs_region VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO ecs_region VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO ecs_region VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO ecs_region VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO ecs_region VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO ecs_region VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO ecs_region VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO ecs_region VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO ecs_region VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO ecs_region VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO ecs_region VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO ecs_region VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO ecs_region VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO ecs_region VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO ecs_region VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO ecs_region VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO ecs_region VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO ecs_region VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO ecs_region VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO ecs_region VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO ecs_region VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO ecs_region VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO ecs_region VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO ecs_region VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO ecs_region VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO ecs_region VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO ecs_region VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO ecs_region VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO ecs_region VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO ecs_region VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO ecs_region VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO ecs_region VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO ecs_region VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO ecs_region VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO ecs_region VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO ecs_region VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO ecs_region VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO ecs_region VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO ecs_region VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO ecs_region VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO ecs_region VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO ecs_region VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO ecs_region VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO ecs_region VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO ecs_region VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO ecs_region VALUES ('920', '104', '都安', '3', '0');
INSERT INTO ecs_region VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO ecs_region VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO ecs_region VALUES ('923', '104', '环江', '3', '0');
INSERT INTO ecs_region VALUES ('924', '104', '大化', '3', '0');
INSERT INTO ecs_region VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO ecs_region VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO ecs_region VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO ecs_region VALUES ('928', '105', '富川', '3', '0');
INSERT INTO ecs_region VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO ecs_region VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO ecs_region VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO ecs_region VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO ecs_region VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO ecs_region VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO ecs_region VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO ecs_region VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO ecs_region VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO ecs_region VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO ecs_region VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO ecs_region VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO ecs_region VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO ecs_region VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO ecs_region VALUES ('943', '107', '融水', '3', '0');
INSERT INTO ecs_region VALUES ('944', '107', '三江', '3', '0');
INSERT INTO ecs_region VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO ecs_region VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO ecs_region VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO ecs_region VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO ecs_region VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO ecs_region VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO ecs_region VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO ecs_region VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO ecs_region VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO ecs_region VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO ecs_region VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO ecs_region VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO ecs_region VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO ecs_region VALUES ('958', '110', '容县', '3', '0');
INSERT INTO ecs_region VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO ecs_region VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO ecs_region VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO ecs_region VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO ecs_region VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO ecs_region VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO ecs_region VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO ecs_region VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO ecs_region VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO ecs_region VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO ecs_region VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO ecs_region VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO ecs_region VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO ecs_region VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO ecs_region VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO ecs_region VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO ecs_region VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO ecs_region VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO ecs_region VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO ecs_region VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO ecs_region VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO ecs_region VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO ecs_region VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO ecs_region VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO ecs_region VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO ecs_region VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO ecs_region VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO ecs_region VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO ecs_region VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO ecs_region VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO ecs_region VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO ecs_region VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO ecs_region VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO ecs_region VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO ecs_region VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO ecs_region VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO ecs_region VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO ecs_region VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO ecs_region VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO ecs_region VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO ecs_region VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO ecs_region VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO ecs_region VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO ecs_region VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO ecs_region VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO ecs_region VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO ecs_region VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO ecs_region VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO ecs_region VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO ecs_region VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO ecs_region VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO ecs_region VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO ecs_region VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO ecs_region VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO ecs_region VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO ecs_region VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO ecs_region VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO ecs_region VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO ecs_region VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO ecs_region VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO ecs_region VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO ecs_region VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO ecs_region VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO ecs_region VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO ecs_region VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO ecs_region VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO ecs_region VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO ecs_region VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO ecs_region VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO ecs_region VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO ecs_region VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO ecs_region VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO ecs_region VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO ecs_region VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO ecs_region VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO ecs_region VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO ecs_region VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO ecs_region VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO ecs_region VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO ecs_region VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO ecs_region VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO ecs_region VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO ecs_region VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO ecs_region VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO ecs_region VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO ecs_region VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO ecs_region VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO ecs_region VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO ecs_region VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO ecs_region VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO ecs_region VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO ecs_region VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO ecs_region VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO ecs_region VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO ecs_region VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO ecs_region VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO ecs_region VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO ecs_region VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO ecs_region VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO ecs_region VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO ecs_region VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO ecs_region VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO ecs_region VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO ecs_region VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO ecs_region VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO ecs_region VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO ecs_region VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO ecs_region VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO ecs_region VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO ecs_region VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO ecs_region VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO ecs_region VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO ecs_region VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO ecs_region VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO ecs_region VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO ecs_region VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO ecs_region VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO ecs_region VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO ecs_region VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO ecs_region VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO ecs_region VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO ecs_region VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO ecs_region VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO ecs_region VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO ecs_region VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO ecs_region VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO ecs_region VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO ecs_region VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO ecs_region VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO ecs_region VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO ecs_region VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO ecs_region VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO ecs_region VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO ecs_region VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO ecs_region VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO ecs_region VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO ecs_region VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO ecs_region VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO ecs_region VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO ecs_region VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO ecs_region VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO ecs_region VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO ecs_region VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO ecs_region VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO ecs_region VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO ecs_region VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO ecs_region VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO ecs_region VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO ecs_region VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO ecs_region VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO ecs_region VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO ecs_region VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO ecs_region VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO ecs_region VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO ecs_region VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO ecs_region VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO ecs_region VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO ecs_region VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO ecs_region VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO ecs_region VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO ecs_region VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO ecs_region VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO ecs_region VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO ecs_region VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO ecs_region VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO ecs_region VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO ecs_region VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO ecs_region VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO ecs_region VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO ecs_region VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO ecs_region VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO ecs_region VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO ecs_region VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO ecs_region VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO ecs_region VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO ecs_region VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO ecs_region VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO ecs_region VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO ecs_region VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO ecs_region VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO ecs_region VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO ecs_region VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO ecs_region VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO ecs_region VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO ecs_region VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO ecs_region VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO ecs_region VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO ecs_region VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO ecs_region VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO ecs_region VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO ecs_region VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO ecs_region VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO ecs_region VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO ecs_region VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO ecs_region VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO ecs_region VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO ecs_region VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO ecs_region VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO ecs_region VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO ecs_region VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO ecs_region VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO ecs_region VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO ecs_region VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO ecs_region VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO ecs_region VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO ecs_region VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO ecs_region VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO ecs_region VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO ecs_region VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO ecs_region VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO ecs_region VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO ecs_region VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO ecs_region VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO ecs_region VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO ecs_region VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO ecs_region VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO ecs_region VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO ecs_region VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO ecs_region VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO ecs_region VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO ecs_region VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO ecs_region VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO ecs_region VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO ecs_region VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO ecs_region VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO ecs_region VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO ecs_region VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO ecs_region VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO ecs_region VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO ecs_region VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO ecs_region VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO ecs_region VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO ecs_region VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO ecs_region VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO ecs_region VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO ecs_region VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO ecs_region VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO ecs_region VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO ecs_region VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO ecs_region VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO ecs_region VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO ecs_region VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO ecs_region VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO ecs_region VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO ecs_region VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO ecs_region VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO ecs_region VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO ecs_region VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO ecs_region VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO ecs_region VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO ecs_region VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO ecs_region VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO ecs_region VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO ecs_region VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO ecs_region VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO ecs_region VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO ecs_region VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO ecs_region VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO ecs_region VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO ecs_region VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO ecs_region VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO ecs_region VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO ecs_region VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO ecs_region VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO ecs_region VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO ecs_region VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO ecs_region VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO ecs_region VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO ecs_region VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO ecs_region VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO ecs_region VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO ecs_region VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO ecs_region VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO ecs_region VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO ecs_region VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO ecs_region VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO ecs_region VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO ecs_region VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO ecs_region VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO ecs_region VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO ecs_region VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO ecs_region VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO ecs_region VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO ecs_region VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO ecs_region VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO ecs_region VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO ecs_region VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO ecs_region VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO ecs_region VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO ecs_region VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO ecs_region VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO ecs_region VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO ecs_region VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO ecs_region VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO ecs_region VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO ecs_region VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO ecs_region VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO ecs_region VALUES ('1271', '150', '瀍河回族区', '3', '0');
INSERT INTO ecs_region VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO ecs_region VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO ecs_region VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO ecs_region VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO ecs_region VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO ecs_region VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO ecs_region VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO ecs_region VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO ecs_region VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO ecs_region VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO ecs_region VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO ecs_region VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO ecs_region VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO ecs_region VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO ecs_region VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO ecs_region VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO ecs_region VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO ecs_region VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO ecs_region VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO ecs_region VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO ecs_region VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO ecs_region VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO ecs_region VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO ecs_region VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO ecs_region VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO ecs_region VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO ecs_region VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO ecs_region VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO ecs_region VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO ecs_region VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO ecs_region VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO ecs_region VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO ecs_region VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO ecs_region VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO ecs_region VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO ecs_region VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO ecs_region VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO ecs_region VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO ecs_region VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO ecs_region VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO ecs_region VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO ecs_region VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO ecs_region VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO ecs_region VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO ecs_region VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO ecs_region VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO ecs_region VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO ecs_region VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO ecs_region VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO ecs_region VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO ecs_region VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO ecs_region VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO ecs_region VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO ecs_region VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO ecs_region VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO ecs_region VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO ecs_region VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO ecs_region VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO ecs_region VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO ecs_region VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO ecs_region VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO ecs_region VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO ecs_region VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO ecs_region VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO ecs_region VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO ecs_region VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO ecs_region VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO ecs_region VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO ecs_region VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO ecs_region VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO ecs_region VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO ecs_region VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO ecs_region VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO ecs_region VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO ecs_region VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO ecs_region VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO ecs_region VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO ecs_region VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO ecs_region VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO ecs_region VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO ecs_region VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO ecs_region VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO ecs_region VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO ecs_region VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO ecs_region VALUES ('1368', '161', '浉河区', '3', '0');
INSERT INTO ecs_region VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO ecs_region VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO ecs_region VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO ecs_region VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO ecs_region VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO ecs_region VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO ecs_region VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO ecs_region VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO ecs_region VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO ecs_region VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO ecs_region VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO ecs_region VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO ecs_region VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO ecs_region VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO ecs_region VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO ecs_region VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO ecs_region VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO ecs_region VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO ecs_region VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO ecs_region VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO ecs_region VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO ecs_region VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO ecs_region VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO ecs_region VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO ecs_region VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO ecs_region VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO ecs_region VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO ecs_region VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO ecs_region VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO ecs_region VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO ecs_region VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO ecs_region VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO ecs_region VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO ecs_region VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO ecs_region VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO ecs_region VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO ecs_region VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO ecs_region VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO ecs_region VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO ecs_region VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO ecs_region VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO ecs_region VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO ecs_region VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO ecs_region VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO ecs_region VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO ecs_region VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO ecs_region VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO ecs_region VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO ecs_region VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO ecs_region VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO ecs_region VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO ecs_region VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO ecs_region VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO ecs_region VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO ecs_region VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO ecs_region VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO ecs_region VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO ecs_region VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO ecs_region VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO ecs_region VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO ecs_region VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO ecs_region VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO ecs_region VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO ecs_region VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO ecs_region VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO ecs_region VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO ecs_region VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO ecs_region VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO ecs_region VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO ecs_region VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO ecs_region VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO ecs_region VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO ecs_region VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO ecs_region VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO ecs_region VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO ecs_region VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO ecs_region VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO ecs_region VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO ecs_region VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO ecs_region VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO ecs_region VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO ecs_region VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO ecs_region VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO ecs_region VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO ecs_region VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO ecs_region VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO ecs_region VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO ecs_region VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO ecs_region VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO ecs_region VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO ecs_region VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO ecs_region VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO ecs_region VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO ecs_region VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO ecs_region VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO ecs_region VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO ecs_region VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO ecs_region VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO ecs_region VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO ecs_region VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO ecs_region VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO ecs_region VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO ecs_region VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO ecs_region VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO ecs_region VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO ecs_region VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO ecs_region VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO ecs_region VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO ecs_region VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO ecs_region VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO ecs_region VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO ecs_region VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO ecs_region VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO ecs_region VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO ecs_region VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO ecs_region VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO ecs_region VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO ecs_region VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO ecs_region VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO ecs_region VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO ecs_region VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO ecs_region VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO ecs_region VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO ecs_region VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO ecs_region VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO ecs_region VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO ecs_region VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO ecs_region VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO ecs_region VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO ecs_region VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO ecs_region VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO ecs_region VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO ecs_region VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO ecs_region VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO ecs_region VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO ecs_region VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO ecs_region VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO ecs_region VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO ecs_region VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO ecs_region VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO ecs_region VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO ecs_region VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO ecs_region VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO ecs_region VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO ecs_region VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO ecs_region VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO ecs_region VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO ecs_region VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO ecs_region VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO ecs_region VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO ecs_region VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO ecs_region VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO ecs_region VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO ecs_region VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO ecs_region VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO ecs_region VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO ecs_region VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO ecs_region VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO ecs_region VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO ecs_region VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO ecs_region VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO ecs_region VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO ecs_region VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO ecs_region VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO ecs_region VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO ecs_region VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO ecs_region VALUES ('1547', '180', '硚口区', '3', '0');
INSERT INTO ecs_region VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO ecs_region VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO ecs_region VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO ecs_region VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO ecs_region VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO ecs_region VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO ecs_region VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO ecs_region VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO ecs_region VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO ecs_region VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO ecs_region VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO ecs_region VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO ecs_region VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO ecs_region VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO ecs_region VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO ecs_region VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO ecs_region VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO ecs_region VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO ecs_region VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO ecs_region VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO ecs_region VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO ecs_region VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO ecs_region VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO ecs_region VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO ecs_region VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO ecs_region VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO ecs_region VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO ecs_region VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO ecs_region VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO ecs_region VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO ecs_region VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO ecs_region VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO ecs_region VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO ecs_region VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO ecs_region VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO ecs_region VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO ecs_region VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO ecs_region VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO ecs_region VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO ecs_region VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO ecs_region VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO ecs_region VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO ecs_region VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO ecs_region VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO ecs_region VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO ecs_region VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO ecs_region VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO ecs_region VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO ecs_region VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO ecs_region VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO ecs_region VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO ecs_region VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO ecs_region VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO ecs_region VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO ecs_region VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO ecs_region VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO ecs_region VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO ecs_region VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO ecs_region VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO ecs_region VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO ecs_region VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO ecs_region VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO ecs_region VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO ecs_region VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO ecs_region VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO ecs_region VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO ecs_region VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO ecs_region VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO ecs_region VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO ecs_region VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO ecs_region VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO ecs_region VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO ecs_region VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO ecs_region VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO ecs_region VALUES ('1631', '195', '猇亭区', '3', '0');
INSERT INTO ecs_region VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO ecs_region VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO ecs_region VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO ecs_region VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO ecs_region VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO ecs_region VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO ecs_region VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO ecs_region VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO ecs_region VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO ecs_region VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO ecs_region VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO ecs_region VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO ecs_region VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO ecs_region VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO ecs_region VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO ecs_region VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO ecs_region VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO ecs_region VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO ecs_region VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO ecs_region VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO ecs_region VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO ecs_region VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO ecs_region VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO ecs_region VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO ecs_region VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO ecs_region VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO ecs_region VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO ecs_region VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO ecs_region VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO ecs_region VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO ecs_region VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO ecs_region VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO ecs_region VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO ecs_region VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO ecs_region VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO ecs_region VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO ecs_region VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO ecs_region VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO ecs_region VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO ecs_region VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO ecs_region VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO ecs_region VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO ecs_region VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO ecs_region VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO ecs_region VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO ecs_region VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO ecs_region VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO ecs_region VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO ecs_region VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO ecs_region VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO ecs_region VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO ecs_region VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO ecs_region VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO ecs_region VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO ecs_region VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO ecs_region VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO ecs_region VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO ecs_region VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO ecs_region VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO ecs_region VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO ecs_region VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO ecs_region VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO ecs_region VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO ecs_region VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO ecs_region VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO ecs_region VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO ecs_region VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO ecs_region VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO ecs_region VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO ecs_region VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO ecs_region VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO ecs_region VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO ecs_region VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO ecs_region VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO ecs_region VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO ecs_region VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO ecs_region VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO ecs_region VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO ecs_region VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO ecs_region VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO ecs_region VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO ecs_region VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO ecs_region VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO ecs_region VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO ecs_region VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO ecs_region VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO ecs_region VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO ecs_region VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO ecs_region VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO ecs_region VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO ecs_region VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO ecs_region VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO ecs_region VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO ecs_region VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO ecs_region VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO ecs_region VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO ecs_region VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO ecs_region VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO ecs_region VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO ecs_region VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO ecs_region VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO ecs_region VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO ecs_region VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO ecs_region VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO ecs_region VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO ecs_region VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO ecs_region VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO ecs_region VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO ecs_region VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO ecs_region VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO ecs_region VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO ecs_region VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO ecs_region VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO ecs_region VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO ecs_region VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO ecs_region VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO ecs_region VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO ecs_region VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO ecs_region VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO ecs_region VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO ecs_region VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO ecs_region VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO ecs_region VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO ecs_region VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO ecs_region VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO ecs_region VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO ecs_region VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO ecs_region VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO ecs_region VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO ecs_region VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO ecs_region VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO ecs_region VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO ecs_region VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO ecs_region VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO ecs_region VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO ecs_region VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO ecs_region VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO ecs_region VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO ecs_region VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO ecs_region VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO ecs_region VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO ecs_region VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO ecs_region VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO ecs_region VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO ecs_region VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO ecs_region VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO ecs_region VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO ecs_region VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO ecs_region VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO ecs_region VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO ecs_region VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO ecs_region VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO ecs_region VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO ecs_region VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO ecs_region VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO ecs_region VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO ecs_region VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO ecs_region VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO ecs_region VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO ecs_region VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO ecs_region VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO ecs_region VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO ecs_region VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO ecs_region VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO ecs_region VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO ecs_region VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO ecs_region VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO ecs_region VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO ecs_region VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO ecs_region VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO ecs_region VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO ecs_region VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO ecs_region VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO ecs_region VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO ecs_region VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO ecs_region VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO ecs_region VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO ecs_region VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO ecs_region VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO ecs_region VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO ecs_region VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO ecs_region VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO ecs_region VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO ecs_region VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO ecs_region VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO ecs_region VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO ecs_region VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO ecs_region VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO ecs_region VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO ecs_region VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO ecs_region VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO ecs_region VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO ecs_region VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO ecs_region VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO ecs_region VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO ecs_region VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO ecs_region VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO ecs_region VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO ecs_region VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO ecs_region VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO ecs_region VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO ecs_region VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO ecs_region VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO ecs_region VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO ecs_region VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO ecs_region VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO ecs_region VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO ecs_region VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO ecs_region VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO ecs_region VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO ecs_region VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO ecs_region VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO ecs_region VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO ecs_region VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO ecs_region VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO ecs_region VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO ecs_region VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO ecs_region VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO ecs_region VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO ecs_region VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO ecs_region VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO ecs_region VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO ecs_region VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO ecs_region VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO ecs_region VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO ecs_region VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO ecs_region VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO ecs_region VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO ecs_region VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO ecs_region VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO ecs_region VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO ecs_region VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO ecs_region VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO ecs_region VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO ecs_region VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO ecs_region VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO ecs_region VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO ecs_region VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO ecs_region VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO ecs_region VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO ecs_region VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO ecs_region VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO ecs_region VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO ecs_region VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO ecs_region VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO ecs_region VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO ecs_region VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO ecs_region VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO ecs_region VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO ecs_region VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO ecs_region VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO ecs_region VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO ecs_region VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO ecs_region VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO ecs_region VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO ecs_region VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO ecs_region VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO ecs_region VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO ecs_region VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO ecs_region VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO ecs_region VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO ecs_region VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO ecs_region VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO ecs_region VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO ecs_region VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO ecs_region VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO ecs_region VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO ecs_region VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO ecs_region VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO ecs_region VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO ecs_region VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO ecs_region VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO ecs_region VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO ecs_region VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO ecs_region VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO ecs_region VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO ecs_region VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO ecs_region VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO ecs_region VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO ecs_region VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO ecs_region VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO ecs_region VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO ecs_region VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO ecs_region VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO ecs_region VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO ecs_region VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO ecs_region VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO ecs_region VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO ecs_region VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO ecs_region VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO ecs_region VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO ecs_region VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO ecs_region VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO ecs_region VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO ecs_region VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO ecs_region VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO ecs_region VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO ecs_region VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO ecs_region VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO ecs_region VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO ecs_region VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO ecs_region VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO ecs_region VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO ecs_region VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO ecs_region VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO ecs_region VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO ecs_region VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO ecs_region VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO ecs_region VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO ecs_region VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO ecs_region VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO ecs_region VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO ecs_region VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO ecs_region VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO ecs_region VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO ecs_region VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO ecs_region VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO ecs_region VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO ecs_region VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO ecs_region VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO ecs_region VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO ecs_region VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO ecs_region VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO ecs_region VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO ecs_region VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO ecs_region VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO ecs_region VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO ecs_region VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO ecs_region VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO ecs_region VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO ecs_region VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO ecs_region VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO ecs_region VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO ecs_region VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO ecs_region VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO ecs_region VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO ecs_region VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO ecs_region VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO ecs_region VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO ecs_region VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO ecs_region VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO ecs_region VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO ecs_region VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO ecs_region VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO ecs_region VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO ecs_region VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO ecs_region VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO ecs_region VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO ecs_region VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO ecs_region VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO ecs_region VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO ecs_region VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO ecs_region VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO ecs_region VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO ecs_region VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO ecs_region VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO ecs_region VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO ecs_region VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO ecs_region VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO ecs_region VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO ecs_region VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO ecs_region VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO ecs_region VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO ecs_region VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO ecs_region VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO ecs_region VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO ecs_region VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO ecs_region VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO ecs_region VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO ecs_region VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO ecs_region VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO ecs_region VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO ecs_region VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO ecs_region VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO ecs_region VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO ecs_region VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO ecs_region VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO ecs_region VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO ecs_region VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO ecs_region VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO ecs_region VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO ecs_region VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO ecs_region VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO ecs_region VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO ecs_region VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO ecs_region VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO ecs_region VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO ecs_region VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO ecs_region VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO ecs_region VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO ecs_region VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO ecs_region VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO ecs_region VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO ecs_region VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO ecs_region VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO ecs_region VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO ecs_region VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO ecs_region VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO ecs_region VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO ecs_region VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO ecs_region VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO ecs_region VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO ecs_region VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO ecs_region VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO ecs_region VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO ecs_region VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO ecs_region VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO ecs_region VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO ecs_region VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO ecs_region VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO ecs_region VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO ecs_region VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO ecs_region VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO ecs_region VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO ecs_region VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO ecs_region VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO ecs_region VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO ecs_region VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO ecs_region VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO ecs_region VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO ecs_region VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO ecs_region VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO ecs_region VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO ecs_region VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO ecs_region VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO ecs_region VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO ecs_region VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO ecs_region VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO ecs_region VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO ecs_region VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO ecs_region VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO ecs_region VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO ecs_region VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO ecs_region VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO ecs_region VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO ecs_region VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO ecs_region VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO ecs_region VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO ecs_region VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO ecs_region VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO ecs_region VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO ecs_region VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO ecs_region VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO ecs_region VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO ecs_region VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO ecs_region VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO ecs_region VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO ecs_region VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO ecs_region VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO ecs_region VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO ecs_region VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO ecs_region VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO ecs_region VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO ecs_region VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO ecs_region VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO ecs_region VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO ecs_region VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO ecs_region VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO ecs_region VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO ecs_region VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO ecs_region VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO ecs_region VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO ecs_region VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO ecs_region VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO ecs_region VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO ecs_region VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO ecs_region VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO ecs_region VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO ecs_region VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO ecs_region VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO ecs_region VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO ecs_region VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO ecs_region VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO ecs_region VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO ecs_region VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO ecs_region VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO ecs_region VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO ecs_region VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO ecs_region VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO ecs_region VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO ecs_region VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO ecs_region VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO ecs_region VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO ecs_region VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO ecs_region VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO ecs_region VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO ecs_region VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO ecs_region VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO ecs_region VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO ecs_region VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO ecs_region VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO ecs_region VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO ecs_region VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO ecs_region VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO ecs_region VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO ecs_region VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO ecs_region VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO ecs_region VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO ecs_region VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO ecs_region VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO ecs_region VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO ecs_region VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO ecs_region VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO ecs_region VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO ecs_region VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO ecs_region VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO ecs_region VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO ecs_region VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO ecs_region VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO ecs_region VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO ecs_region VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO ecs_region VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO ecs_region VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO ecs_region VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO ecs_region VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO ecs_region VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO ecs_region VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO ecs_region VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO ecs_region VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO ecs_region VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO ecs_region VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO ecs_region VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO ecs_region VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO ecs_region VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO ecs_region VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO ecs_region VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO ecs_region VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO ecs_region VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO ecs_region VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO ecs_region VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO ecs_region VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO ecs_region VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO ecs_region VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO ecs_region VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO ecs_region VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO ecs_region VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO ecs_region VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO ecs_region VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO ecs_region VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO ecs_region VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO ecs_region VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO ecs_region VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO ecs_region VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO ecs_region VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO ecs_region VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO ecs_region VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO ecs_region VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO ecs_region VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO ecs_region VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO ecs_region VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO ecs_region VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO ecs_region VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO ecs_region VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO ecs_region VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO ecs_region VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO ecs_region VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO ecs_region VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO ecs_region VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO ecs_region VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO ecs_region VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO ecs_region VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO ecs_region VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO ecs_region VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO ecs_region VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO ecs_region VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO ecs_region VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO ecs_region VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO ecs_region VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO ecs_region VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO ecs_region VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO ecs_region VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO ecs_region VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO ecs_region VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO ecs_region VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO ecs_region VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO ecs_region VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO ecs_region VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO ecs_region VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO ecs_region VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO ecs_region VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO ecs_region VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO ecs_region VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO ecs_region VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO ecs_region VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO ecs_region VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO ecs_region VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO ecs_region VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO ecs_region VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO ecs_region VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO ecs_region VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO ecs_region VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO ecs_region VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO ecs_region VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO ecs_region VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO ecs_region VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO ecs_region VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO ecs_region VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO ecs_region VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO ecs_region VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO ecs_region VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO ecs_region VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO ecs_region VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO ecs_region VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO ecs_region VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO ecs_region VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO ecs_region VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO ecs_region VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO ecs_region VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO ecs_region VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO ecs_region VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO ecs_region VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO ecs_region VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO ecs_region VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO ecs_region VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO ecs_region VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO ecs_region VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO ecs_region VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO ecs_region VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO ecs_region VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO ecs_region VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO ecs_region VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO ecs_region VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO ecs_region VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO ecs_region VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO ecs_region VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO ecs_region VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO ecs_region VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO ecs_region VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO ecs_region VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO ecs_region VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO ecs_region VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO ecs_region VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO ecs_region VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO ecs_region VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO ecs_region VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO ecs_region VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO ecs_region VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO ecs_region VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO ecs_region VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO ecs_region VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO ecs_region VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO ecs_region VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO ecs_region VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO ecs_region VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO ecs_region VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO ecs_region VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO ecs_region VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO ecs_region VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO ecs_region VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO ecs_region VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO ecs_region VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO ecs_region VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO ecs_region VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO ecs_region VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO ecs_region VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO ecs_region VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO ecs_region VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO ecs_region VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO ecs_region VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO ecs_region VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO ecs_region VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO ecs_region VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO ecs_region VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO ecs_region VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO ecs_region VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO ecs_region VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO ecs_region VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO ecs_region VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO ecs_region VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO ecs_region VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO ecs_region VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO ecs_region VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO ecs_region VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO ecs_region VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO ecs_region VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO ecs_region VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO ecs_region VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO ecs_region VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO ecs_region VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO ecs_region VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO ecs_region VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO ecs_region VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO ecs_region VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO ecs_region VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO ecs_region VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO ecs_region VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO ecs_region VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO ecs_region VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO ecs_region VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO ecs_region VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO ecs_region VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO ecs_region VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO ecs_region VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO ecs_region VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO ecs_region VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO ecs_region VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO ecs_region VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO ecs_region VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO ecs_region VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO ecs_region VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO ecs_region VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO ecs_region VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO ecs_region VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO ecs_region VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO ecs_region VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO ecs_region VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO ecs_region VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO ecs_region VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO ecs_region VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO ecs_region VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO ecs_region VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO ecs_region VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO ecs_region VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO ecs_region VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO ecs_region VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO ecs_region VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO ecs_region VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO ecs_region VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO ecs_region VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO ecs_region VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO ecs_region VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO ecs_region VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO ecs_region VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO ecs_region VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO ecs_region VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO ecs_region VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO ecs_region VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO ecs_region VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO ecs_region VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO ecs_region VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO ecs_region VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO ecs_region VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO ecs_region VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO ecs_region VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO ecs_region VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO ecs_region VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO ecs_region VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO ecs_region VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO ecs_region VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO ecs_region VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO ecs_region VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO ecs_region VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO ecs_region VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO ecs_region VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO ecs_region VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO ecs_region VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO ecs_region VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO ecs_region VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO ecs_region VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO ecs_region VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO ecs_region VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO ecs_region VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO ecs_region VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO ecs_region VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO ecs_region VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO ecs_region VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO ecs_region VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO ecs_region VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO ecs_region VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO ecs_region VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO ecs_region VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO ecs_region VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO ecs_region VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO ecs_region VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO ecs_region VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO ecs_region VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO ecs_region VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO ecs_region VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO ecs_region VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO ecs_region VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO ecs_region VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO ecs_region VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO ecs_region VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO ecs_region VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO ecs_region VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO ecs_region VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO ecs_region VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO ecs_region VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO ecs_region VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO ecs_region VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO ecs_region VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO ecs_region VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO ecs_region VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO ecs_region VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO ecs_region VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO ecs_region VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO ecs_region VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO ecs_region VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO ecs_region VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO ecs_region VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO ecs_region VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO ecs_region VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO ecs_region VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO ecs_region VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO ecs_region VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO ecs_region VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO ecs_region VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO ecs_region VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO ecs_region VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO ecs_region VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO ecs_region VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO ecs_region VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO ecs_region VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO ecs_region VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO ecs_region VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO ecs_region VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO ecs_region VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO ecs_region VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO ecs_region VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO ecs_region VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO ecs_region VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO ecs_region VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO ecs_region VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO ecs_region VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO ecs_region VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO ecs_region VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO ecs_region VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO ecs_region VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO ecs_region VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO ecs_region VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO ecs_region VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO ecs_region VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO ecs_region VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO ecs_region VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO ecs_region VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO ecs_region VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO ecs_region VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO ecs_region VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO ecs_region VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO ecs_region VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO ecs_region VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO ecs_region VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO ecs_region VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO ecs_region VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO ecs_region VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO ecs_region VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO ecs_region VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO ecs_region VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO ecs_region VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO ecs_region VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO ecs_region VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO ecs_region VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO ecs_region VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO ecs_region VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO ecs_region VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO ecs_region VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO ecs_region VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO ecs_region VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO ecs_region VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO ecs_region VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO ecs_region VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO ecs_region VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO ecs_region VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO ecs_region VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO ecs_region VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO ecs_region VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO ecs_region VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO ecs_region VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO ecs_region VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO ecs_region VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO ecs_region VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO ecs_region VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO ecs_region VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO ecs_region VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO ecs_region VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO ecs_region VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO ecs_region VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO ecs_region VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO ecs_region VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO ecs_region VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO ecs_region VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO ecs_region VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO ecs_region VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO ecs_region VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO ecs_region VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO ecs_region VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO ecs_region VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO ecs_region VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO ecs_region VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO ecs_region VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO ecs_region VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO ecs_region VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO ecs_region VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO ecs_region VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO ecs_region VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO ecs_region VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO ecs_region VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO ecs_region VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO ecs_region VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO ecs_region VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO ecs_region VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO ecs_region VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO ecs_region VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO ecs_region VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO ecs_region VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO ecs_region VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO ecs_region VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO ecs_region VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO ecs_region VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO ecs_region VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO ecs_region VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO ecs_region VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO ecs_region VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO ecs_region VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO ecs_region VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO ecs_region VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO ecs_region VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO ecs_region VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO ecs_region VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO ecs_region VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO ecs_region VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO ecs_region VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO ecs_region VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO ecs_region VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO ecs_region VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO ecs_region VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO ecs_region VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO ecs_region VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO ecs_region VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO ecs_region VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO ecs_region VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO ecs_region VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO ecs_region VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO ecs_region VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO ecs_region VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO ecs_region VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO ecs_region VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO ecs_region VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO ecs_region VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO ecs_region VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO ecs_region VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO ecs_region VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO ecs_region VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO ecs_region VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO ecs_region VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO ecs_region VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO ecs_region VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO ecs_region VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO ecs_region VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO ecs_region VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO ecs_region VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO ecs_region VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO ecs_region VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO ecs_region VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO ecs_region VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO ecs_region VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO ecs_region VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO ecs_region VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO ecs_region VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO ecs_region VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO ecs_region VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO ecs_region VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO ecs_region VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO ecs_region VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO ecs_region VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO ecs_region VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO ecs_region VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO ecs_region VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO ecs_region VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO ecs_region VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO ecs_region VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO ecs_region VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO ecs_region VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO ecs_region VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO ecs_region VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO ecs_region VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO ecs_region VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO ecs_region VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO ecs_region VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO ecs_region VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO ecs_region VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO ecs_region VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO ecs_region VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO ecs_region VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO ecs_region VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO ecs_region VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO ecs_region VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO ecs_region VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO ecs_region VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO ecs_region VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO ecs_region VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO ecs_region VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO ecs_region VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO ecs_region VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO ecs_region VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO ecs_region VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO ecs_region VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO ecs_region VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO ecs_region VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO ecs_region VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO ecs_region VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO ecs_region VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO ecs_region VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO ecs_region VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO ecs_region VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO ecs_region VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO ecs_region VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO ecs_region VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO ecs_region VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO ecs_region VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO ecs_region VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO ecs_region VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO ecs_region VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO ecs_region VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO ecs_region VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO ecs_region VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO ecs_region VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO ecs_region VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO ecs_region VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO ecs_region VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO ecs_region VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO ecs_region VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO ecs_region VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO ecs_region VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO ecs_region VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO ecs_region VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO ecs_region VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO ecs_region VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO ecs_region VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO ecs_region VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO ecs_region VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO ecs_region VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO ecs_region VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO ecs_region VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO ecs_region VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO ecs_region VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO ecs_region VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO ecs_region VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO ecs_region VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO ecs_region VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO ecs_region VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO ecs_region VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO ecs_region VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO ecs_region VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO ecs_region VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO ecs_region VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO ecs_region VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO ecs_region VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO ecs_region VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO ecs_region VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO ecs_region VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO ecs_region VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO ecs_region VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO ecs_region VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO ecs_region VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO ecs_region VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO ecs_region VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO ecs_region VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO ecs_region VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO ecs_region VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO ecs_region VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO ecs_region VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO ecs_region VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO ecs_region VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO ecs_region VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO ecs_region VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO ecs_region VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO ecs_region VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO ecs_region VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO ecs_region VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO ecs_region VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO ecs_region VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO ecs_region VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO ecs_region VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO ecs_region VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO ecs_region VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO ecs_region VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO ecs_region VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO ecs_region VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO ecs_region VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO ecs_region VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO ecs_region VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO ecs_region VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO ecs_region VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO ecs_region VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO ecs_region VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO ecs_region VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO ecs_region VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO ecs_region VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO ecs_region VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO ecs_region VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO ecs_region VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO ecs_region VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO ecs_region VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO ecs_region VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO ecs_region VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO ecs_region VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO ecs_region VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO ecs_region VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO ecs_region VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO ecs_region VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO ecs_region VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO ecs_region VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO ecs_region VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO ecs_region VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO ecs_region VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO ecs_region VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO ecs_region VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO ecs_region VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO ecs_region VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO ecs_region VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO ecs_region VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO ecs_region VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO ecs_region VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO ecs_region VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO ecs_region VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO ecs_region VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO ecs_region VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO ecs_region VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO ecs_region VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO ecs_region VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO ecs_region VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO ecs_region VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO ecs_region VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO ecs_region VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO ecs_region VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO ecs_region VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO ecs_region VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO ecs_region VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO ecs_region VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO ecs_region VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO ecs_region VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO ecs_region VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO ecs_region VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO ecs_region VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO ecs_region VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO ecs_region VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO ecs_region VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO ecs_region VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO ecs_region VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO ecs_region VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO ecs_region VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO ecs_region VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO ecs_region VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO ecs_region VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO ecs_region VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO ecs_region VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO ecs_region VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO ecs_region VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO ecs_region VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO ecs_region VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO ecs_region VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO ecs_region VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO ecs_region VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO ecs_region VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO ecs_region VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO ecs_region VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO ecs_region VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO ecs_region VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO ecs_region VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO ecs_region VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO ecs_region VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO ecs_region VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO ecs_region VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO ecs_region VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO ecs_region VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO ecs_region VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO ecs_region VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO ecs_region VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO ecs_region VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO ecs_region VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO ecs_region VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO ecs_region VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO ecs_region VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO ecs_region VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO ecs_region VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO ecs_region VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO ecs_region VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO ecs_region VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO ecs_region VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO ecs_region VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO ecs_region VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO ecs_region VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO ecs_region VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO ecs_region VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO ecs_region VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO ecs_region VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO ecs_region VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO ecs_region VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO ecs_region VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO ecs_region VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO ecs_region VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO ecs_region VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO ecs_region VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO ecs_region VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO ecs_region VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO ecs_region VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO ecs_region VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO ecs_region VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO ecs_region VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO ecs_region VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO ecs_region VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO ecs_region VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO ecs_region VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO ecs_region VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO ecs_region VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO ecs_region VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO ecs_region VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO ecs_region VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO ecs_region VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO ecs_region VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO ecs_region VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO ecs_region VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO ecs_region VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO ecs_region VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO ecs_region VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO ecs_region VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO ecs_region VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO ecs_region VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO ecs_region VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO ecs_region VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO ecs_region VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO ecs_region VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO ecs_region VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO ecs_region VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO ecs_region VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO ecs_region VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO ecs_region VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO ecs_region VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO ecs_region VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO ecs_region VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO ecs_region VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO ecs_region VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO ecs_region VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO ecs_region VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO ecs_region VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO ecs_region VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO ecs_region VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO ecs_region VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO ecs_region VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO ecs_region VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO ecs_region VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO ecs_region VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO ecs_region VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO ecs_region VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO ecs_region VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO ecs_region VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO ecs_region VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO ecs_region VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO ecs_region VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO ecs_region VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO ecs_region VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO ecs_region VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO ecs_region VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO ecs_region VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO ecs_region VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO ecs_region VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO ecs_region VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO ecs_region VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO ecs_region VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO ecs_region VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO ecs_region VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO ecs_region VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO ecs_region VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO ecs_region VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO ecs_region VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO ecs_region VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO ecs_region VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO ecs_region VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO ecs_region VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO ecs_region VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO ecs_region VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO ecs_region VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO ecs_region VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO ecs_region VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO ecs_region VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO ecs_region VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO ecs_region VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO ecs_region VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO ecs_region VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO ecs_region VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO ecs_region VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO ecs_region VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO ecs_region VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO ecs_region VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO ecs_region VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO ecs_region VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO ecs_region VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO ecs_region VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO ecs_region VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO ecs_region VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO ecs_region VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO ecs_region VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO ecs_region VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO ecs_region VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO ecs_region VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO ecs_region VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO ecs_region VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO ecs_region VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO ecs_region VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO ecs_region VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO ecs_region VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO ecs_region VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO ecs_region VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO ecs_region VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO ecs_region VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO ecs_region VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO ecs_region VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO ecs_region VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO ecs_region VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO ecs_region VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO ecs_region VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO ecs_region VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO ecs_region VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO ecs_region VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO ecs_region VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO ecs_region VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO ecs_region VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO ecs_region VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO ecs_region VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO ecs_region VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO ecs_region VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO ecs_region VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO ecs_region VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO ecs_region VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO ecs_region VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO ecs_region VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO ecs_region VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO ecs_region VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO ecs_region VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO ecs_region VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO ecs_region VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO ecs_region VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO ecs_region VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO ecs_region VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO ecs_region VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO ecs_region VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO ecs_region VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO ecs_region VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO ecs_region VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO ecs_region VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO ecs_region VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO ecs_region VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO ecs_region VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO ecs_region VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO ecs_region VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO ecs_region VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO ecs_region VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO ecs_region VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO ecs_region VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO ecs_region VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO ecs_region VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO ecs_region VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO ecs_region VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO ecs_region VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO ecs_region VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO ecs_region VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO ecs_region VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO ecs_region VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO ecs_region VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO ecs_region VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO ecs_region VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO ecs_region VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO ecs_region VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO ecs_region VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO ecs_region VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO ecs_region VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO ecs_region VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO ecs_region VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO ecs_region VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO ecs_region VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO ecs_region VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO ecs_region VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO ecs_region VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO ecs_region VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO ecs_region VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO ecs_region VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO ecs_region VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO ecs_region VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO ecs_region VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO ecs_region VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO ecs_region VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO ecs_region VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO ecs_region VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO ecs_region VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO ecs_region VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO ecs_region VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO ecs_region VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO ecs_region VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO ecs_region VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO ecs_region VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO ecs_region VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO ecs_region VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO ecs_region VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO ecs_region VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO ecs_region VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO ecs_region VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO ecs_region VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO ecs_region VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO ecs_region VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO ecs_region VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO ecs_region VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO ecs_region VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO ecs_region VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO ecs_region VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO ecs_region VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO ecs_region VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO ecs_region VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO ecs_region VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO ecs_region VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO ecs_region VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO ecs_region VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO ecs_region VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO ecs_region VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO ecs_region VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO ecs_region VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO ecs_region VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO ecs_region VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO ecs_region VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO ecs_region VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO ecs_region VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO ecs_region VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO ecs_region VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO ecs_region VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO ecs_region VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO ecs_region VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO ecs_region VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO ecs_region VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO ecs_region VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO ecs_region VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO ecs_region VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO ecs_region VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO ecs_region VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO ecs_region VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO ecs_region VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO ecs_region VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO ecs_region VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO ecs_region VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO ecs_region VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO ecs_region VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO ecs_region VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO ecs_region VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO ecs_region VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO ecs_region VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO ecs_region VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO ecs_region VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO ecs_region VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO ecs_region VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO ecs_region VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO ecs_region VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO ecs_region VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO ecs_region VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO ecs_region VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO ecs_region VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO ecs_region VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO ecs_region VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO ecs_region VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO ecs_region VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO ecs_region VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO ecs_region VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO ecs_region VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO ecs_region VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO ecs_region VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO ecs_region VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO ecs_region VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO ecs_region VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO ecs_region VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO ecs_region VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO ecs_region VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO ecs_region VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO ecs_region VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO ecs_region VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO ecs_region VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO ecs_region VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO ecs_region VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO ecs_region VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO ecs_region VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO ecs_region VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO ecs_region VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO ecs_region VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO ecs_region VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO ecs_region VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO ecs_region VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO ecs_region VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO ecs_region VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO ecs_region VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO ecs_region VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO ecs_region VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO ecs_region VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO ecs_region VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO ecs_region VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO ecs_region VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO ecs_region VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO ecs_region VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO ecs_region VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO ecs_region VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO ecs_region VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO ecs_region VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO ecs_region VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO ecs_region VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO ecs_region VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO ecs_region VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO ecs_region VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO ecs_region VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO ecs_region VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO ecs_region VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO ecs_region VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO ecs_region VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO ecs_region VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO ecs_region VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO ecs_region VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO ecs_region VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO ecs_region VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO ecs_region VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO ecs_region VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO ecs_region VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO ecs_region VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO ecs_region VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO ecs_region VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO ecs_region VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO ecs_region VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO ecs_region VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO ecs_region VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO ecs_region VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO ecs_region VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO ecs_region VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO ecs_region VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO ecs_region VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO ecs_region VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO ecs_region VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO ecs_region VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO ecs_region VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO ecs_region VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO ecs_region VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO ecs_region VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO ecs_region VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO ecs_region VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO ecs_region VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO ecs_region VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO ecs_region VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO ecs_region VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO ecs_region VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO ecs_region VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO ecs_region VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO ecs_region VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO ecs_region VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO ecs_region VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO ecs_region VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO ecs_region VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO ecs_region VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO ecs_region VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO ecs_region VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO ecs_region VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO ecs_region VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO ecs_region VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO ecs_region VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO ecs_region VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO ecs_region VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO ecs_region VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO ecs_region VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO ecs_region VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO ecs_region VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO ecs_region VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO ecs_region VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO ecs_region VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO ecs_region VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO ecs_region VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO ecs_region VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO ecs_region VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO ecs_region VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO ecs_region VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO ecs_region VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO ecs_region VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO ecs_region VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO ecs_region VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO ecs_region VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO ecs_region VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO ecs_region VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO ecs_region VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO ecs_region VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO ecs_region VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO ecs_region VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO ecs_region VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO ecs_region VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO ecs_region VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO ecs_region VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO ecs_region VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO ecs_region VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO ecs_region VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO ecs_region VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO ecs_region VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO ecs_region VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO ecs_region VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO ecs_region VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO ecs_region VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO ecs_region VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO ecs_region VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO ecs_region VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO ecs_region VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO ecs_region VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO ecs_region VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO ecs_region VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO ecs_region VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO ecs_region VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO ecs_region VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO ecs_region VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO ecs_region VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO ecs_region VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO ecs_region VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO ecs_region VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO ecs_region VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO ecs_region VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO ecs_region VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO ecs_region VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO ecs_region VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO ecs_region VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO ecs_region VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO ecs_region VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO ecs_region VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO ecs_region VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO ecs_region VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO ecs_region VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO ecs_region VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO ecs_region VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO ecs_region VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO ecs_region VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO ecs_region VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO ecs_region VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO ecs_region VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO ecs_region VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO ecs_region VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO ecs_region VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO ecs_region VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO ecs_region VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO ecs_region VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO ecs_region VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO ecs_region VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO ecs_region VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO ecs_region VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO ecs_region VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO ecs_region VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO ecs_region VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO ecs_region VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO ecs_region VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO ecs_region VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO ecs_region VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO ecs_region VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO ecs_region VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO ecs_region VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO ecs_region VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO ecs_region VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO ecs_region VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO ecs_region VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO ecs_region VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO ecs_region VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO ecs_region VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO ecs_region VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO ecs_region VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO ecs_region VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO ecs_region VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO ecs_region VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO ecs_region VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO ecs_region VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO ecs_region VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO ecs_region VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO ecs_region VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO ecs_region VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO ecs_region VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO ecs_region VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO ecs_region VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO ecs_region VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO ecs_region VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO ecs_region VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO ecs_region VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO ecs_region VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO ecs_region VALUES ('3373', '395', '深水埗区', '3', '0');
INSERT INTO ecs_region VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO ecs_region VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO ecs_region VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO ecs_region VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO ecs_region VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO ecs_region VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO ecs_region VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO ecs_region VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO ecs_region VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO ecs_region VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO ecs_region VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO ecs_region VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO ecs_region VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO ecs_region VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO ecs_region VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO ecs_region VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO ecs_region VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO ecs_region VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO ecs_region VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO ecs_region VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO ecs_region VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO ecs_region VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO ecs_region VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO ecs_region VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO ecs_region VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO ecs_region VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO ecs_region VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO ecs_region VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO ecs_region VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO ecs_region VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO ecs_region VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO ecs_region VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO ecs_region VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO ecs_region VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO ecs_region VALUES ('3408', '3401', '肥西县', '3', '0');

-- ----------------------------
-- Table structure for `ecs_reg_extend_info`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_reg_extend_info`;
CREATE TABLE `ecs_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_reg_extend_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_reg_fields`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_reg_fields`;
CREATE TABLE `ecs_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_need` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_reg_fields
-- ----------------------------
INSERT INTO ecs_reg_fields VALUES ('1', 'MSN', '0', '1', '1', '1');
INSERT INTO ecs_reg_fields VALUES ('2', 'QQ', '0', '1', '1', '1');
INSERT INTO ecs_reg_fields VALUES ('3', '办公电话', '0', '1', '1', '1');
INSERT INTO ecs_reg_fields VALUES ('4', '家庭电话', '0', '1', '1', '1');
INSERT INTO ecs_reg_fields VALUES ('5', '手机', '0', '1', '1', '1');
INSERT INTO ecs_reg_fields VALUES ('6', '密码找回问题', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `ecs_role`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_role`;
CREATE TABLE `ecs_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY (`role_id`),
  KEY `user_name` (`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_role
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_searchengine`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_searchengine`;
CREATE TABLE `ecs_searchengine` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_searchengine
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_sessions`;
CREATE TABLE `ecs_sessions` (
  `sesskey` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_sessions
-- ----------------------------
INSERT INTO ecs_sessions VALUES ('2e611313614bf59d214ef86a97ea10d5', '1427711191', '0', '0', '127.0.0.1', '0', '0', '1.00', '0', 'a:3:{s:7:\"from_ad\";i:0;s:7:\"referer\";s:6:\"本站\";s:10:\"login_fail\";i:0;}');
INSERT INTO ecs_sessions VALUES ('70a89b6b1181a4aa3354e9691686240f', '1427711375', '0', '0', '127.0.0.1', '0', '0', '1.00', '0', 'a:3:{s:7:\"from_ad\";i:0;s:7:\"referer\";s:6:\"本站\";s:10:\"login_fail\";i:0;}');
INSERT INTO ecs_sessions VALUES ('c3b3988a1e700ef3b5ccef13541d1d99', '1427711371', '0', '1', '127.0.0.1', '0', '0', '0.00', '0', 'a:5:{s:12:\"captcha_word\";s:16:\"NDk4MzAwNzgxYg==\";s:10:\"admin_name\";s:5:\"admin\";s:11:\"action_list\";s:3:\"all\";s:10:\"last_check\";i:1427711371;s:12:\"suppliers_id\";s:1:\"0\";}');
INSERT INTO ecs_sessions VALUES ('428794ca3e07380b372878b91db251f1', '1427711181', '0', '1', '127.0.0.1', '0', '0', '0.00', '0', 'a:5:{s:12:\"captcha_word\";s:16:\"MWM5ZDViYTU5Ng==\";s:10:\"admin_name\";s:5:\"admin\";s:11:\"action_list\";s:3:\"all\";s:10:\"last_check\";i:1427711181;s:12:\"suppliers_id\";s:1:\"0\";}');

-- ----------------------------
-- Table structure for `ecs_sessions_data`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_sessions_data`;
CREATE TABLE `ecs_sessions_data` (
  `sesskey` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_sessions_data
-- ----------------------------
INSERT INTO ecs_sessions_data VALUES ('2e611313614bf59d214ef86a97ea10d5', '4294967295', 'a:10:{s:7:\"from_ad\";i:193;s:7:\"referer\";s:6:\"本站\";s:10:\"login_fail\";i:0;s:12:\"captcha_word\";s:16:\"M2I2ZGI0Y2Q2Zg==\";s:9:\"last_time\";i:1427705304;s:7:\"last_ip\";s:0:\"\";s:9:\"flow_type\";i:0;s:10:\"flow_order\";a:9:{s:14:\"extension_code\";s:0:\"\";s:11:\"shipping_id\";i:0;s:6:\"pay_id\";i:0;s:7:\"pack_id\";i:0;s:7:\"card_id\";i:0;s:5:\"bonus\";i:0;s:8:\"integral\";i:0;s:7:\"surplus\";i:0;s:7:\"how_oos\";i:0;}s:14:\"flow_consignee\";a:14:{s:10:\"address_id\";i:0;s:9:\"consignee\";s:2:\"aa\";s:7:\"country\";s:1:\"1\";s:8:\"province\";s:1:\"2\";s:4:\"city\";s:2:\"52\";s:8:\"district\";s:3:\"500\";s:5:\"email\";s:12:\"admin@qq.com\";s:7:\"address\";s:3:\"aaa\";s:7:\"zipcode\";s:6:\"050124\";s:3:\"tel\";s:11:\"13213213212\";s:6:\"mobile\";s:11:\"13213213213\";s:13:\"sign_building\";s:2:\"12\";s:9:\"best_time\";s:2:\"12\";s:7:\"user_id\";s:1:\"1\";}s:14:\"display_search\";s:4:\"grid\";}');

-- ----------------------------
-- Table structure for `ecs_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shipping`;
CREATE TABLE `ecs_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '',
  `insure` varchar(10) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) DEFAULT NULL,
  `config_lable` text,
  `print_model` tinyint(1) DEFAULT '0',
  `shipping_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_id`),
  KEY `shipping_code` (`shipping_code`,`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_shipping_area`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shipping_area`;
CREATE TABLE `ecs_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `configure` text NOT NULL,
  PRIMARY KEY (`shipping_area_id`),
  KEY `shipping_id` (`shipping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shipping_area
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shop_config`;
CREATE TABLE `ecs_shop_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `store_range` varchar(255) NOT NULL DEFAULT '',
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=904 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shop_config
-- ----------------------------
INSERT INTO ecs_shop_config VALUES ('1', '0', 'shop_info', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('2', '0', 'basic', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('3', '0', 'display', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('4', '0', 'shopping_flow', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('5', '0', 'smtp', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('6', '0', 'hidden', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('7', '0', 'goods', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('8', '0', 'sms', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('9', '0', 'wap', 'group', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('101', '1', 'shop_name', 'text', '', '', '美颜专家', '1');
INSERT INTO ecs_shop_config VALUES ('102', '1', 'shop_title', 'text', '', '', '美颜专家', '1');
INSERT INTO ecs_shop_config VALUES ('103', '1', 'shop_desc', 'text', '', '', '美颜专家', '1');
INSERT INTO ecs_shop_config VALUES ('104', '1', 'shop_keywords', 'text', '', '', '美颜专家', '1');
INSERT INTO ecs_shop_config VALUES ('105', '1', 'shop_country', 'manual', '', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('106', '1', 'shop_province', 'manual', '', '', '2', '1');
INSERT INTO ecs_shop_config VALUES ('107', '1', 'shop_city', 'manual', '', '', '52', '1');
INSERT INTO ecs_shop_config VALUES ('108', '1', 'shop_address', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('109', '1', 'qq', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('110', '1', 'ww', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('111', '1', 'skype', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('112', '1', 'ym', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('113', '1', 'msn', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('114', '1', 'service_email', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('115', '1', 'service_phone', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('116', '1', 'shop_closed', 'select', '0,1', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('117', '1', 'close_comment', 'textarea', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('118', '1', 'shop_logo', 'file', '', '../themes/{$template}/images/', '../themes/ecmoban_jumei/images/logo.gif', '1');
INSERT INTO ecs_shop_config VALUES ('119', '1', 'licensed', 'select', '0,1', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('120', '1', 'user_notice', 'textarea', '', '', '用户中心公告！', '1');
INSERT INTO ecs_shop_config VALUES ('121', '1', 'shop_notice', 'textarea', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('122', '1', 'shop_reg_closed', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('201', '2', 'lang', 'manual', '', '', 'zh_cn', '1');
INSERT INTO ecs_shop_config VALUES ('202', '2', 'icp_number', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('203', '2', 'icp_file', 'file', '', '../cert/', '', '1');
INSERT INTO ecs_shop_config VALUES ('204', '2', 'watermark', 'file', '', '../images/', '', '1');
INSERT INTO ecs_shop_config VALUES ('205', '2', 'watermark_place', 'select', '0,1,2,3,4,5', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('206', '2', 'watermark_alpha', 'text', '', '', '65', '1');
INSERT INTO ecs_shop_config VALUES ('207', '2', 'use_storage', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('208', '2', 'market_price_rate', 'text', '', '', '1.2', '1');
INSERT INTO ecs_shop_config VALUES ('209', '2', 'rewrite', 'select', '0,1,2', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('210', '2', 'integral_name', 'text', '', '', '积分', '1');
INSERT INTO ecs_shop_config VALUES ('211', '2', 'integral_scale', 'text', '', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('212', '2', 'integral_percent', 'text', '', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('213', '2', 'sn_prefix', 'text', '', '', 'ECS', '1');
INSERT INTO ecs_shop_config VALUES ('214', '2', 'comment_check', 'select', '0,1', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('215', '2', 'no_picture', 'file', '', '../images/', '', '1');
INSERT INTO ecs_shop_config VALUES ('218', '2', 'stats_code', 'textarea', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('219', '2', 'cache_time', 'text', '', '', '3600', '1');
INSERT INTO ecs_shop_config VALUES ('220', '2', 'register_points', 'text', '', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('221', '2', 'enable_gzip', 'select', '0,1', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('222', '2', 'top10_time', 'select', '0,1,2,3,4', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('223', '2', 'timezone', 'options', '-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12', '', '8', '1');
INSERT INTO ecs_shop_config VALUES ('224', '2', 'upload_size_limit', 'options', '-1,0,64,128,256,512,1024,2048,4096', '', '64', '1');
INSERT INTO ecs_shop_config VALUES ('226', '2', 'cron_method', 'select', '0,1', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('227', '2', 'comment_factor', 'select', '0,1,2,3', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('228', '2', 'enable_order_check', 'select', '0,1', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('229', '2', 'default_storage', 'text', '', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('230', '2', 'bgcolor', 'text', '', '', '#FFFFFF', '1');
INSERT INTO ecs_shop_config VALUES ('231', '2', 'visit_stats', 'select', 'on,off', '', 'on', '1');
INSERT INTO ecs_shop_config VALUES ('232', '2', 'send_mail_on', 'select', 'on,off', '', 'off', '1');
INSERT INTO ecs_shop_config VALUES ('233', '2', 'auto_generate_gallery', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('234', '2', 'retain_original_img', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('235', '2', 'member_email_validate', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('236', '2', 'message_board', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('239', '2', 'certificate_id', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('240', '2', 'token', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('241', '2', 'certi', 'hidden', '', '', 'http://service.shopex.cn/openapi/api.php', '1');
INSERT INTO ecs_shop_config VALUES ('242', '2', 'send_verify_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('243', '2', 'ent_id', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('244', '2', 'ent_ac', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('245', '2', 'ent_sign', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('246', '2', 'ent_email', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('301', '3', 'date_format', 'hidden', '', '', 'Y-m-d', '1');
INSERT INTO ecs_shop_config VALUES ('302', '3', 'time_format', 'text', '', '', 'Y-m-d H:i:s', '1');
INSERT INTO ecs_shop_config VALUES ('303', '3', 'currency_format', 'text', '', '', '￥%s元', '1');
INSERT INTO ecs_shop_config VALUES ('304', '3', 'thumb_width', 'text', '', '', '100', '1');
INSERT INTO ecs_shop_config VALUES ('305', '3', 'thumb_height', 'text', '', '', '100', '1');
INSERT INTO ecs_shop_config VALUES ('306', '3', 'image_width', 'text', '', '', '230', '1');
INSERT INTO ecs_shop_config VALUES ('307', '3', 'image_height', 'text', '', '', '230', '1');
INSERT INTO ecs_shop_config VALUES ('312', '3', 'top_number', 'text', '', '', '10', '1');
INSERT INTO ecs_shop_config VALUES ('313', '3', 'history_number', 'text', '', '', '5', '1');
INSERT INTO ecs_shop_config VALUES ('314', '3', 'comments_number', 'text', '', '', '5', '1');
INSERT INTO ecs_shop_config VALUES ('315', '3', 'bought_goods', 'text', '', '', '3', '1');
INSERT INTO ecs_shop_config VALUES ('316', '3', 'article_number', 'text', '', '', '8', '1');
INSERT INTO ecs_shop_config VALUES ('317', '3', 'goods_name_length', 'text', '', '', '7', '1');
INSERT INTO ecs_shop_config VALUES ('318', '3', 'price_format', 'select', '0,1,2,3,4,5', '', '5', '1');
INSERT INTO ecs_shop_config VALUES ('319', '3', 'page_size', 'text', '', '', '10', '1');
INSERT INTO ecs_shop_config VALUES ('320', '3', 'sort_order_type', 'select', '0,1,2', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('321', '3', 'sort_order_method', 'select', '0,1', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('322', '3', 'show_order_type', 'select', '0,1,2', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('323', '3', 'attr_related_number', 'text', '', '', '5', '1');
INSERT INTO ecs_shop_config VALUES ('324', '3', 'goods_gallery_number', 'text', '', '', '5', '1');
INSERT INTO ecs_shop_config VALUES ('325', '3', 'article_title_length', 'text', '', '', '16', '1');
INSERT INTO ecs_shop_config VALUES ('326', '3', 'name_of_region_1', 'text', '', '', '国家', '1');
INSERT INTO ecs_shop_config VALUES ('327', '3', 'name_of_region_2', 'text', '', '', '省', '1');
INSERT INTO ecs_shop_config VALUES ('328', '3', 'name_of_region_3', 'text', '', '', '市', '1');
INSERT INTO ecs_shop_config VALUES ('329', '3', 'name_of_region_4', 'text', '', '', '区', '1');
INSERT INTO ecs_shop_config VALUES ('330', '3', 'search_keywords', 'text', '', '', '', '0');
INSERT INTO ecs_shop_config VALUES ('332', '3', 'related_goods_number', 'text', '', '', '4', '1');
INSERT INTO ecs_shop_config VALUES ('333', '3', 'help_open', 'select', '0,1', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('334', '3', 'article_page_size', 'text', '', '', '10', '1');
INSERT INTO ecs_shop_config VALUES ('335', '3', 'page_style', 'select', '0,1', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('336', '3', 'recommend_order', 'select', '0,1', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('337', '3', 'index_ad', 'hidden', '', '', 'sys', '1');
INSERT INTO ecs_shop_config VALUES ('401', '4', 'can_invoice', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('402', '4', 'use_integral', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('403', '4', 'use_bonus', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('404', '4', 'use_surplus', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('405', '4', 'use_how_oos', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('406', '4', 'send_confirm_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('407', '4', 'send_ship_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('408', '4', 'send_cancel_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('409', '4', 'send_invalid_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('410', '4', 'order_pay_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('411', '4', 'order_unpay_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('412', '4', 'order_ship_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('413', '4', 'order_receive_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('414', '4', 'order_unship_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('415', '4', 'order_return_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('416', '4', 'order_invalid_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('417', '4', 'order_cancel_note', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('418', '4', 'invoice_content', 'textarea', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('419', '4', 'anonymous_buy', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('420', '4', 'min_goods_amount', 'text', '', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('421', '4', 'one_step_buy', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('422', '4', 'invoice_type', 'manual', '', '', 'a:2:{s:4:\"type\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}s:4:\"rate\";a:3:{i:0;d:1;i:1;d:1.5;i:2;d:0;}}', '1');
INSERT INTO ecs_shop_config VALUES ('423', '4', 'stock_dec_time', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('424', '4', 'cart_confirm', 'options', '1,2,3,4', '', '3', '0');
INSERT INTO ecs_shop_config VALUES ('425', '4', 'send_service_email', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('426', '4', 'show_goods_in_cart', 'select', '1,2,3', '', '3', '1');
INSERT INTO ecs_shop_config VALUES ('427', '4', 'show_attr_in_cart', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('501', '5', 'smtp_host', 'text', '', '', 'localhost', '1');
INSERT INTO ecs_shop_config VALUES ('502', '5', 'smtp_port', 'text', '', '', '25', '1');
INSERT INTO ecs_shop_config VALUES ('503', '5', 'smtp_user', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('504', '5', 'smtp_pass', 'password', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('505', '5', 'smtp_mail', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('506', '5', 'mail_charset', 'select', 'UTF8,GB2312,BIG5', '', 'UTF8', '1');
INSERT INTO ecs_shop_config VALUES ('507', '5', 'mail_service', 'select', '0,1', '', '0', '0');
INSERT INTO ecs_shop_config VALUES ('508', '5', 'smtp_ssl', 'select', '0,1', '', '0', '0');
INSERT INTO ecs_shop_config VALUES ('601', '6', 'integrate_code', 'hidden', '', '', 'ecshop', '1');
INSERT INTO ecs_shop_config VALUES ('602', '6', 'integrate_config', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('603', '6', 'hash_code', 'hidden', '', '', '31693422540744c0a6b6da635b7a5a93', '1');
INSERT INTO ecs_shop_config VALUES ('604', '6', 'template', 'hidden', '', '', 'ecmoban_jumei', '1');
INSERT INTO ecs_shop_config VALUES ('605', '6', 'install_date', 'hidden', '', '', '1427683187', '1');
INSERT INTO ecs_shop_config VALUES ('606', '6', 'ecs_version', 'hidden', '', '', 'v2.7.3', '1');
INSERT INTO ecs_shop_config VALUES ('607', '6', 'sms_user_name', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('608', '6', 'sms_password', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('609', '6', 'sms_auth_str', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('610', '6', 'sms_domain', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('611', '6', 'sms_count', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('612', '6', 'sms_total_money', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('613', '6', 'sms_balance', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('614', '6', 'sms_last_request', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('616', '6', 'affiliate', 'hidden', '', '', 'a:3:{s:6:\"config\";a:7:{s:6:\"expire\";d:24;s:11:\"expire_unit\";s:4:\"hour\";s:11:\"separate_by\";i:0;s:15:\"level_point_all\";s:2:\"5%\";s:15:\"level_money_all\";s:2:\"1%\";s:18:\"level_register_all\";i:2;s:17:\"level_register_up\";i:60;}s:4:\"item\";a:4:{i:0;a:2:{s:11:\"level_point\";s:3:\"60%\";s:11:\"level_money\";s:3:\"60%\";}i:1;a:2:{s:11:\"level_point\";s:3:\"30%\";s:11:\"level_money\";s:3:\"30%\";}i:2;a:2:{s:11:\"level_point\";s:2:\"7%\";s:11:\"level_money\";s:2:\"7%\";}i:3;a:2:{s:11:\"level_point\";s:2:\"3%\";s:11:\"level_money\";s:2:\"3%\";}}s:2:\"on\";i:1;}', '1');
INSERT INTO ecs_shop_config VALUES ('617', '6', 'captcha', 'hidden', '', '', '12', '1');
INSERT INTO ecs_shop_config VALUES ('618', '6', 'captcha_width', 'hidden', '', '', '100', '1');
INSERT INTO ecs_shop_config VALUES ('619', '6', 'captcha_height', 'hidden', '', '', '20', '1');
INSERT INTO ecs_shop_config VALUES ('620', '6', 'sitemap', 'hidden', '', '', 'a:6:{s:19:\"homepage_changefreq\";s:6:\"hourly\";s:17:\"homepage_priority\";s:3:\"0.9\";s:19:\"category_changefreq\";s:6:\"hourly\";s:17:\"category_priority\";s:3:\"0.8\";s:18:\"content_changefreq\";s:6:\"weekly\";s:16:\"content_priority\";s:3:\"0.7\";}', '0');
INSERT INTO ecs_shop_config VALUES ('621', '6', 'points_rule', 'hidden', '', '', '', '0');
INSERT INTO ecs_shop_config VALUES ('622', '6', 'flash_theme', 'hidden', '', '', 'dynfocus', '1');
INSERT INTO ecs_shop_config VALUES ('623', '6', 'stylename', 'hidden', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('701', '7', 'show_goodssn', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('702', '7', 'show_brand', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('703', '7', 'show_goodsweight', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('704', '7', 'show_goodsnumber', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('705', '7', 'show_addtime', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('706', '7', 'goodsattr_style', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('707', '7', 'show_marketprice', 'select', '1,0', '', '1', '1');
INSERT INTO ecs_shop_config VALUES ('801', '8', 'sms_shop_mobile', 'text', '', '', '', '1');
INSERT INTO ecs_shop_config VALUES ('802', '8', 'sms_order_placed', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('803', '8', 'sms_order_payed', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('804', '8', 'sms_order_shipped', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('901', '9', 'wap_config', 'select', '1,0', '', '0', '1');
INSERT INTO ecs_shop_config VALUES ('902', '9', 'wap_logo', 'file', '', '../images/', '', '1');
INSERT INTO ecs_shop_config VALUES ('903', '2', 'message_check', 'select', '1,0', '', '1', '1');

-- ----------------------------
-- Table structure for `ecs_snatch_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_snatch_log`;
CREATE TABLE `ecs_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `snatch_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bid_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `snatch_id` (`snatch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_snatch_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_stats`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_stats`;
CREATE TABLE `ecs_stats` (
  `access_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `visit_times` smallint(5) unsigned NOT NULL DEFAULT '1',
  `browser` varchar(60) NOT NULL DEFAULT '',
  `system` varchar(20) NOT NULL DEFAULT '',
  `language` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(30) NOT NULL DEFAULT '',
  `referer_domain` varchar(100) NOT NULL DEFAULT '',
  `referer_path` varchar(200) NOT NULL DEFAULT '',
  `access_url` varchar(255) NOT NULL DEFAULT '',
  KEY `access_time` (`access_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_stats
-- ----------------------------
INSERT INTO ecs_stats VALUES ('1427683190', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/myzj/install/index.php?lang=zh_cn&step=done', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427689086', '127.0.0.1', '3', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/myzj/category.php?id=1', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427692243', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427698469', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/myzj/group_buy.php', '/myzj/category.php');
INSERT INTO ecs_stats VALUES ('1427698695', '127.0.0.1', '3', 'FireFox 33.0', 'Windows NT', 'zh-cn,zh', 'LAN', 'http://127.0.0.1', '/', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427698932', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427703273', '192.168.1.109', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://192.168.1.109', '/', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427703298', '192.168.1.105', '1', 'Internet Explorer 8.0', 'Windows NT', 'zh-cn', 'LAN', '', '', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427708270', '127.0.0.1', '2', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/myzj/search.php?encode=YTozOntzOjg6ImtleXdvcmRzIjtzOjE6IjEiO3M6MTA6ImltYWdlRmllbGQiO3M6OToi5pCc576O5aaGIjtzOjE4OiJzZWFyY2hfZW5jb2RlX3RpbWUiO2k6MTQyNzcwODI2Njt9', '/myzj/search.php');
INSERT INTO ecs_stats VALUES ('1427710918', '127.0.0.1', '3', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/myzj/search.php?encode=YTozOntzOjg6ImtleXdvcmRzIjtzOjE6IjMiO3M6MTA6ImltYWdlRmllbGQiO3M6OToi5pCc576O5aaGIjtzOjE4OiJzZWFyY2hfZW5jb2RlX3RpbWUiO2k6MTQyNzcwODI4Nzt9', '/myzj/index.php');
INSERT INTO ecs_stats VALUES ('1427711240', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/', '/myzj/index.php');

-- ----------------------------
-- Table structure for `ecs_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_suppliers`;
CREATE TABLE `ecs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_name` varchar(255) DEFAULT NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_suppliers
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_tag`;
CREATE TABLE `ecs_tag` (
  `tag_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_words` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_template`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_template`;
CREATE TABLE `ecs_template` (
  `filename` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(40) NOT NULL DEFAULT '',
  `library` varchar(40) NOT NULL DEFAULT '',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `remarks` varchar(30) NOT NULL DEFAULT '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_template
-- ----------------------------
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/vote_list.lbi', '8', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/email_list.lbi', '9', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/order_query.lbi', '6', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/cart.lbi', '0', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/promotion_info.lbi', '3', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/auction.lbi', '4', '0', '3', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/group_buy.lbi', '5', '0', '3', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '', '/library/recommend_promotion.lbi', '0', '0', '4', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '右边主区域', '/library/recommend_hot.lbi', '2', '0', '10', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '右边主区域', '/library/recommend_new.lbi', '1', '0', '10', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '右边主区域', '/library/recommend_best.lbi', '0', '0', '10', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/invoice_query.lbi', '7', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/top10.lbi', '2', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '左边区域', '/library/category_tree.lbi', '1', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '', '/library/brands.lbi', '0', '0', '11', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '左边区域', '/library/category_tree.lbi', '1', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '右边区域', '/library/recommend_best.lbi', '0', '0', '5', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '右边区域', '/library/goods_list.lbi', '1', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '右边区域', '/library/pages.lbi', '2', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '左边区域', '/library/cart.lbi', '0', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '左边区域', '/library/price_grade.lbi', '3', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('category', '左边区域', '/library/filter_attr.lbi', '2', '0', '0', '0', 'default', '');
INSERT INTO ecs_template VALUES ('index', '商店公告下广告', '/library/ad_position.lbi', '0', '159', '1', '4', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '', '/library/brands.lbi', '0', '0', '3', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '', '/library/auction.lbi', '0', '0', '3', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '', '/library/group_buy.lbi', '0', '0', '3', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '促销商品区域', '/library/recommend_promotion.lbi', '0', '0', '4', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '全宽行', '/library/recommend_hot.lbi', '1', '0', '5', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '全宽行', '/library/recommend_new.lbi', '0', '0', '5', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '全宽行', '/library/recommend_best.lbi', '2', '0', '5', '0', 'ecmoban_jumei', '');
INSERT INTO ecs_template VALUES ('index', '商店公告', '/library/new_articles.lbi', '0', '0', '0', '0', 'ecmoban_jumei', '');

-- ----------------------------
-- Table structure for `ecs_topic`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_topic`;
CREATE TABLE `ecs_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) DEFAULT NULL,
  `title_pic` varchar(255) DEFAULT NULL,
  `base_style` char(6) DEFAULT NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_users`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_users`;
CREATE TABLE `ecs_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_special` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ec_salt` varchar(10) DEFAULT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '0',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(60) NOT NULL,
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `office_phone` varchar(20) NOT NULL,
  `home_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_line` decimal(10,2) unsigned NOT NULL,
  `passwd_question` varchar(50) DEFAULT NULL,
  `passwd_answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_users
-- ----------------------------
INSERT INTO ecs_users VALUES ('1', '1978177373@qq.com', 'admin123', '0192023a7bbd73250516f069df18b500', '', '', '0', '0000-00-00', '0.00', '0.00', '0', '0', '1', '1427705301', '1427705301', '0000-00-00 00:00:00', '127.0.0.1', '1', '0', '0', null, '0', '0', '0', '', '222@qq.com', '102252125', '126352', '1236321', '13366088630', '0', '0.00', 'friend_birthday', '1994-8-5');

-- ----------------------------
-- Table structure for `ecs_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_account`;
CREATE TABLE `ecs_user_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `paid_time` int(10) NOT NULL DEFAULT '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL DEFAULT '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_paid` (`is_paid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_address`;
CREATE TABLE `ecs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) NOT NULL DEFAULT '0',
  `province` smallint(5) NOT NULL DEFAULT '0',
  `city` smallint(5) NOT NULL DEFAULT '0',
  `district` smallint(5) NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_address
-- ----------------------------
INSERT INTO ecs_user_address VALUES ('1', '', '1', 'aa', 'admin@qq.com', '1', '2', '52', '500', 'aaa', '050124', '13213213212', '13213213213', '12', '12');

-- ----------------------------
-- Table structure for `ecs_user_bonus`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_bonus`;
CREATE TABLE `ecs_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_sn` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `used_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bonus_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_user_feed`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_feed`;
CREATE TABLE `ecs_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `feed_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_feed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_feed
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_user_rank`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_rank`;
CREATE TABLE `ecs_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_price` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `special_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_rank
-- ----------------------------
INSERT INTO ecs_user_rank VALUES ('1', '注册用户', '0', '10000', '100', '1', '0');

-- ----------------------------
-- Table structure for `ecs_virtual_card`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_virtual_card`;
CREATE TABLE `ecs_virtual_card` (
  `card_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `card_sn` varchar(60) NOT NULL DEFAULT '',
  `card_password` varchar(60) NOT NULL DEFAULT '',
  `add_date` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `is_saled` tinyint(1) NOT NULL DEFAULT '0',
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `crc32` varchar(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`),
  KEY `goods_id` (`goods_id`),
  KEY `car_sn` (`card_sn`),
  KEY `is_saled` (`is_saled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_virtual_card
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_volume_price`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_volume_price`;
CREATE TABLE `ecs_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_type`,`goods_id`,`volume_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_volume_price
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_vote`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote`;
CREATE TABLE `ecs_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(250) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_vote_log`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote_log`;
CREATE TABLE `ecs_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote_option`;
CREATE TABLE `ecs_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(250) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for `ecs_wholesale`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_wholesale`;
CREATE TABLE `ecs_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_wholesale
-- ----------------------------
