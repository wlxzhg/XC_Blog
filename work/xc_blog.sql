/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xc_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-01 21:32:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_blog
-- ----------------------------
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE `b_blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `brief` varchar(255) DEFAULT NULL COMMENT '简介',
  `text` longtext COMMENT '正文',
  `category_code` tinyint(2) unsigned DEFAULT '0' COMMENT '类别代码\r\n0：未分类\r\n1：web前端\r\n2：web后端\r\n3：音乐\r\n4：人工只能\r\n5：黑科技',
  `create_time` datetime DEFAULT NULL COMMENT '博客创建的时间',
  `modify_time` datetime DEFAULT NULL COMMENT '最后修改博客的时间',
  `like_num` int(10) unsigned DEFAULT '0' COMMENT '喜欢数',
  `browse_num` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `comment_num` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `begin_img_href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_blog
-- ----------------------------
INSERT INTO `b_blog` VALUES ('1', '1', 'CSS3创造属于你的旋转loading', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这', '1', '2017-09-25 22:18:00', '2017-09-25 22:18:01', '10', '66', '0', null);
INSERT INTO `b_blog` VALUES ('2', '1', 'CSS3创造属于你的旋转loading', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。', '', '1', '2017-09-25 22:18:00', '2017-09-25 22:18:02', '9', '66', '0', '');
INSERT INTO `b_blog` VALUES ('3', '1', 'CSS3创造属于你的旋转loading', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。', '', '1', '2017-09-25 22:18:00', '2017-09-25 22:18:01', '8', '66', '0', '');
INSERT INTO `b_blog` VALUES ('4', '1', 'CSS3创造属于你的旋转loading', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。', '', '1', '2017-09-25 22:18:00', '2017-09-25 22:18:00', '8', '66', '0', '');
INSERT INTO `b_blog` VALUES ('5', '1', 'CSS3创造属于你的旋转loading', '今天我们来做一个loading动画，如图所示。首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。', '', '1', '2017-09-25 22:18:00', '2017-09-25 22:18:00', '8', '66', '0', '');
INSERT INTO `b_blog` VALUES ('6', '1', '<h1 id=\"-\">番茄工作法总结</h1>', ' 番茄工作法总结 哈哈哈哈', '<h1 id=\"-\">番茄工作法总结</h1>\n<h2 id=\"-\">哈哈哈哈</h2>\n', '0', '2018-02-01 20:19:22', '2018-02-01 20:19:22', '0', '0', '0', null);

-- ----------------------------
-- Table structure for b_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE `b_blog_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '类别名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_blog_category
-- ----------------------------

-- ----------------------------
-- Table structure for b_blog_like
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_like`;
CREATE TABLE `b_blog_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL COMMENT 'blog id',
  `uid` int(11) NOT NULL COMMENT 'user id',
  `create_time` datetime DEFAULT NULL COMMENT '点赞时间',
  `valid` tinyint(1) DEFAULT '1' COMMENT '表示是否是有效记录。0：无效；1：有效。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_bid_uid` (`bid`,`uid`) USING BTREE COMMENT '一个用户对一篇文章的点赞只能有一条记录'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_blog_like
-- ----------------------------
INSERT INTO `b_blog_like` VALUES ('1', '1', '5', '2018-01-22 16:41:45', '1');
INSERT INTO `b_blog_like` VALUES ('4', '2', '5', '2018-01-22 21:00:05', '1');

-- ----------------------------
-- Table structure for b_blog_save
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_save`;
CREATE TABLE `b_blog_save` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `text_md` longtext NOT NULL COMMENT '文章内容(markdown形式)',
  `category_code` tinyint(2) DEFAULT '0' COMMENT '分类代码',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_blog_save
-- ----------------------------
INSERT INTO `b_blog_save` VALUES ('1', '3', '# 测试\n## 3', '0', '2018-01-31 14:50:21', '2018-01-31 15:19:02');
INSERT INTO `b_blog_save` VALUES ('3', '1', '# 番茄工作法总结\n## 哈哈哈哈', '0', '2018-01-31 16:13:39', '2018-01-31 16:13:49');

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名，不为空',
  `password` varchar(255) NOT NULL,
  `last_ip` varchar(23) DEFAULT NULL,
  `last_visit_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '用户创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES ('1', '1', '17051293080', '3a828a926c0e08c58cb1f1f6c29e85b8', null, null, '2018-01-16 21:36:39');
INSERT INTO `b_user` VALUES ('3', '1', '1', '29449ee37a313bca55f7f9e66483e072', null, null, '2018-01-17 21:02:48');
INSERT INTO `b_user` VALUES ('4', '1', '11', '29449ee37a313bca55f7f9e66483e072', null, null, '2018-01-17 21:06:34');
INSERT INTO `b_user` VALUES ('5', '1', '第四单元', 'bd03f7135b6dbbed461fb6b99e14464a', null, null, '2018-01-22 16:39:08');
