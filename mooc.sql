/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : localhost:3306
 Source Schema         : mooc

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 20/02/2025 15:21:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `context` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hour` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Python', 'Python', '1', '1', '一般', '20', NULL);
INSERT INTO `course` VALUES (2, 'Python入门', 'Python入门', '0', '0', '不错', '10', NULL);
INSERT INTO `course` VALUES (3, '1024设计', '1024设计', '1', '0', '还行', '5', NULL);
INSERT INTO `course` VALUES (4, 'Python爬虫', 'Python爬虫技巧', '0', '0', '不错', '12', NULL);
INSERT INTO `course` VALUES (5, 'java', 'java基础入门', '1', '0', '一般', '14', NULL);
INSERT INTO `course` VALUES (6, 'Python爬虫2', 'Python爬虫2', '0', '0', '一般', '15', NULL);
INSERT INTO `course` VALUES (7, '123', '123123', '1', '1', NULL, NULL, NULL);
INSERT INTO `course` VALUES (8, '12123', '123123', '1', '1', NULL, NULL, NULL);
INSERT INTO `course` VALUES (9, 'test', '', '0', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ipset
-- ----------------------------
DROP TABLE IF EXISTS `ipset`;
CREATE TABLE `ipset`  (
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firsttime` datetime NULL DEFAULT NULL,
  `bantime` datetime NULL DEFAULT NULL,
  `totime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ipset
-- ----------------------------
INSERT INTO `ipset` VALUES ('0:0:0:0:0:0:0:1', NULL, NULL, '2025-10-27 20:00:34', NULL, '2025-02-20 14:51:59');
INSERT INTO `ipset` VALUES ('127.0.0.1', '0', '恶意登陆管理员账号！', '2025-10-16 11:57:36', '2117-10-16 19:16:14', '2025-02-17 22:24:28');
INSERT INTO `ipset` VALUES ('172.162.1.125', '0', '多次测试未知账户！', '2025-10-16 18:34:05', '2025-10-16 18:39:14', '2025-10-16 18:34:05');
INSERT INTO `ipset` VALUES ('172.162.1.40', '0', '恶意登陆管理员账号！', '2025-10-16 14:11:35', '2117-10-16 19:00:29', '2025-10-16 19:05:29');
INSERT INTO `ipset` VALUES ('172.162.1.41', '1', '多次测试未知账户！', '2025-10-16 12:00:48', '2025-10-17 19:21:21', '2025-10-16 19:20:43');
INSERT INTO `ipset` VALUES ('172.162.1.42', '0', '多次测试未知账户！', '2025-10-16 14:09:01', '2025-10-17 18:57:18', '2025-10-17 19:22:21');
INSERT INTO `ipset` VALUES ('172.162.1.43', '0', '多次测试未知账户！', '2025-10-16 12:00:30', '2025-10-16 19:24:00', '2025-10-16 14:04:47');
INSERT INTO `ipset` VALUES ('172.162.1.44', '1', '多次测试未知账户！', '2025-10-16 15:09:06', '2025-10-16 19:26:04', '2025-10-16 19:19:24');
INSERT INTO `ipset` VALUES ('172.162.1.87', '1', '多次测试未知账户！', '2025-10-16 19:08:26', '2025-10-16 19:25:58', '2025-10-16 19:09:36');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `executor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-10-15 15:13:46', NULL);
INSERT INTO `log` VALUES (2, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-10-15 15:15:57', 'admin');
INSERT INTO `log` VALUES (3, '20151612204', 'admin', '充值500元', '0:0:0:0:0:0:0:1', '2025-10-15 15:16:53', 'admin');
INSERT INTO `log` VALUES (4, '202508231058301205', '1823544517', '充值10000元', '0:0:0:0:0:0:0:1', '2025-10-15 15:18:02', 'admin');
INSERT INTO `log` VALUES (5, '202508231058301205', '1823544517', '屏蔽用户登录', '0:0:0:0:0:0:0:1', '2025-10-15 15:18:12', 'admin');
INSERT INTO `log` VALUES (6, '202508231058301205', '1823544517', '恢复用户登录', '0:0:0:0:0:0:0:1', '2025-10-15 15:19:10', 'admin');
INSERT INTO `log` VALUES (7, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-15 15:19:15', NULL);
INSERT INTO `log` VALUES (8, '202508231058301205', '1823544517', '订阅课程:1024设计', '127.0.0.1', '2025-10-15 15:19:20', NULL);
INSERT INTO `log` VALUES (9, '202508231058301205', '1823544517', '购买会员：一年', '127.0.0.1', '2025-10-15 15:31:58', NULL);
INSERT INTO `log` VALUES (10, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-15 16:12:09', NULL);
INSERT INTO `log` VALUES (11, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-10-15 21:45:02', 'admin');
INSERT INTO `log` VALUES (12, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-15 21:49:02', NULL);
INSERT INTO `log` VALUES (13, NULL, NULL, '下架课程：Python', '0:0:0:0:0:0:0:1', '2025-10-15 21:49:27', 'admin');
INSERT INTO `log` VALUES (14, NULL, NULL, '上架课程：Python', '0:0:0:0:0:0:0:1', '2025-10-15 21:49:37', 'admin');
INSERT INTO `log` VALUES (15, NULL, NULL, '下架课程：Python', '0:0:0:0:0:0:0:1', '2025-10-15 21:49:44', 'admin');
INSERT INTO `log` VALUES (16, NULL, NULL, '尝试登录账号:asdawdasdwqweqwrqwe，密码错误', '127.0.0.1', '2025-10-16 10:08:03', NULL);
INSERT INTO `log` VALUES (17, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 10:08:48', 'admin');
INSERT INTO `log` VALUES (18, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-16 10:10:17', NULL);
INSERT INTO `log` VALUES (19, '202510161045371069', 'abc', '普通注册', '172.162.1.44', '2025-10-16 10:37:45', NULL);
INSERT INTO `log` VALUES (20, '202510161045371069', 'abc', '登录', '172.162.1.44', '2025-10-16 10:38:12', NULL);
INSERT INTO `log` VALUES (21, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:38:27', NULL);
INSERT INTO `log` VALUES (22, '202510161045371069', 'abc', '订阅课程:1024设计', '172.162.1.44', '2025-10-16 10:39:07', NULL);
INSERT INTO `log` VALUES (23, '202510161045371069', 'abc', '个人信息更改', '172.162.1.44', '2025-10-16 10:40:49', NULL);
INSERT INTO `log` VALUES (24, '202510161045371069', 'abc', '个人信息更改', '172.162.1.44', '2025-10-16 10:40:57', NULL);
INSERT INTO `log` VALUES (25, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-16 10:41:17', NULL);
INSERT INTO `log` VALUES (26, '202510161045371069', 'abc', '取消课程：1024设计', '172.162.1.44', '2025-10-16 10:41:32', NULL);
INSERT INTO `log` VALUES (27, '202510161045371069', 'abc', '个人信息更改', '172.162.1.44', '2025-10-16 10:43:15', NULL);
INSERT INTO `log` VALUES (28, '202510161045371069', 'abc', '充值10000元', '127.0.0.1', '2025-10-16 10:44:50', 'admin');
INSERT INTO `log` VALUES (29, '202510161045371069', 'abc', '购买会员：一年', '172.162.1.44', '2025-10-16 10:45:04', NULL);
INSERT INTO `log` VALUES (30, '202510161045371069', 'abc', '购买会员：半年', '172.162.1.44', '2025-10-16 10:45:07', NULL);
INSERT INTO `log` VALUES (31, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:45:11', NULL);
INSERT INTO `log` VALUES (32, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:45:13', NULL);
INSERT INTO `log` VALUES (33, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:45:15', NULL);
INSERT INTO `log` VALUES (34, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:45:16', NULL);
INSERT INTO `log` VALUES (35, '202510161045371069', 'abc', '购买会员：半年', '172.162.1.44', '2025-10-16 10:46:02', NULL);
INSERT INTO `log` VALUES (36, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:46:05', NULL);
INSERT INTO `log` VALUES (37, '202510161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2025-10-16 10:46:07', NULL);
INSERT INTO `log` VALUES (38, '202510161045371069', 'abc', '注销', '172.162.1.44', '2025-10-16 10:46:24', NULL);
INSERT INTO `log` VALUES (39, NULL, NULL, '尝试登录账号:admin，密码错误', '172.162.1.44', '2025-10-16 10:46:52', NULL);
INSERT INTO `log` VALUES (40, '20151612204', 'admin', '注销', '127.0.0.1', '2025-10-16 10:47:40', 'admin');
INSERT INTO `log` VALUES (41, NULL, NULL, '尝试登录账号:admin，密码错误', '127.0.0.1', '2025-10-16 10:47:50', NULL);
INSERT INTO `log` VALUES (42, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 10:48:09', 'admin');
INSERT INTO `log` VALUES (43, '202508231058301205', '1823544517', '登录', '172.162.1.42', '2025-10-16 14:09:19', NULL);
INSERT INTO `log` VALUES (44, '202508231058301205', '1823544517', '订阅课程:Python爬虫', '172.162.1.42', '2025-10-16 14:09:32', NULL);
INSERT INTO `log` VALUES (45, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 14:34:55', 'admin');
INSERT INTO `log` VALUES (46, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 14:47:31', 'admin');
INSERT INTO `log` VALUES (47, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 15:02:14', 'admin');
INSERT INTO `log` VALUES (48, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 15:06:45', 'admin');
INSERT INTO `log` VALUES (49, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 15:07:24', 'admin');
INSERT INTO `log` VALUES (50, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-16 15:22:23', NULL);
INSERT INTO `log` VALUES (51, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 15:27:01', 'admin');
INSERT INTO `log` VALUES (52, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-16 15:27:30', NULL);
INSERT INTO `log` VALUES (53, '202508231058301205', '1823544517', '发表评论，在\'null\'', '127.0.0.1', '2025-10-16 15:27:45', NULL);
INSERT INTO `log` VALUES (54, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 15:29:20', 'admin');
INSERT INTO `log` VALUES (55, '202508231058301205', '1823544517', '登录', '127.0.0.1', '2025-10-16 15:30:13', NULL);
INSERT INTO `log` VALUES (56, '202508231058301205', '1823544517', '发表评论，在\'Python爬虫\'', '127.0.0.1', '2025-10-16 15:30:22', NULL);
INSERT INTO `log` VALUES (57, '202510161045371069', 'abc', '登录', '172.162.1.44', '2025-10-16 15:34:59', NULL);
INSERT INTO `log` VALUES (58, '202510161045371069', 'abc', '订阅课程:1024设计', '172.162.1.44', '2025-10-16 15:35:05', NULL);
INSERT INTO `log` VALUES (59, '202510161045371069', 'abc', '发表评论，在\'1024设计\'', '172.162.1.44', '2025-10-16 15:35:30', NULL);
INSERT INTO `log` VALUES (60, '202510161045371069', 'abc', '取消课程：1024设计', '172.162.1.44', '2025-10-16 15:36:28', NULL);
INSERT INTO `log` VALUES (61, '202510161045371069', 'abc', '屏蔽用户登录', '127.0.0.1', '2025-10-16 15:36:47', 'admin');
INSERT INTO `log` VALUES (62, '202510161045371069', 'abc', '订阅课程:Python入门', '172.162.1.44', '2025-10-16 15:37:03', NULL);
INSERT INTO `log` VALUES (63, '202510161045371069', 'abc', '注销', '172.162.1.44', '2025-10-16 15:37:11', NULL);
INSERT INTO `log` VALUES (64, '202510161045371069', 'abc', '恢复用户登录', '127.0.0.1', '2025-10-16 15:37:22', 'admin');
INSERT INTO `log` VALUES (65, '202510161045371069', 'abc', '登录', '172.162.1.44', '2025-10-16 15:37:27', NULL);
INSERT INTO `log` VALUES (66, '202508231058301205', '1823544517', '注销', '127.0.0.1', '2025-10-16 15:42:47', NULL);
INSERT INTO `log` VALUES (67, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:11:30', 'admin');
INSERT INTO `log` VALUES (68, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:12:28', 'admin');
INSERT INTO `log` VALUES (69, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:27:45', 'admin');
INSERT INTO `log` VALUES (70, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:28:48', 'admin');
INSERT INTO `log` VALUES (71, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:29:32', 'admin');
INSERT INTO `log` VALUES (72, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:31:06', 'admin');
INSERT INTO `log` VALUES (73, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:40:19', 'admin');
INSERT INTO `log` VALUES (74, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:44:57', 'admin');
INSERT INTO `log` VALUES (75, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:47:35', 'admin');
INSERT INTO `log` VALUES (76, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 17:48:23', 'admin');
INSERT INTO `log` VALUES (77, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 18:18:24', 'admin');
INSERT INTO `log` VALUES (78, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 18:21:29', 'admin');
INSERT INTO `log` VALUES (79, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 18:27:53', 'admin');
INSERT INTO `log` VALUES (80, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 18:53:35', 'admin');
INSERT INTO `log` VALUES (81, NULL, NULL, '尝试登录账号:96321，密码错误', '172.162.1.40', '2025-10-16 19:01:02', NULL);
INSERT INTO `log` VALUES (82, NULL, NULL, '尝试登录账号:96321，密码错误', '172.162.1.40', '2025-10-16 19:01:24', NULL);
INSERT INTO `log` VALUES (83, '202510161901381601', '96321', '普通注册', '172.162.1.40', '2025-10-16 19:01:38', NULL);
INSERT INTO `log` VALUES (84, '202510161901381601', '96321', '屏蔽用户登录', '127.0.0.1', '2025-10-16 19:01:50', 'admin');
INSERT INTO `log` VALUES (85, '202510161901381601', '96321', '恢复用户登录', '127.0.0.1', '2025-10-16 19:01:55', 'admin');
INSERT INTO `log` VALUES (86, '202510161901381601', '96321', '登录', '172.162.1.40', '2025-10-16 19:02:03', NULL);
INSERT INTO `log` VALUES (87, '202510161901381601', '96321', '个人信息更改', '172.162.1.40', '2025-10-16 19:02:33', NULL);
INSERT INTO `log` VALUES (88, '202510161901381601', '96321', '订阅课程:Python入门', '172.162.1.40', '2025-10-16 19:02:41', NULL);
INSERT INTO `log` VALUES (89, '202510161901381601', '96321', '发表评论，在\'Python入门\'', '172.162.1.40', '2025-10-16 19:02:56', NULL);
INSERT INTO `log` VALUES (90, '202510161901381601', '96321', '取消课程：Python入门', '172.162.1.40', '2025-10-16 19:03:08', NULL);
INSERT INTO `log` VALUES (91, '202510161901381601', '96321', '购买会员：一个月', '172.162.1.40', '2025-10-16 19:03:40', NULL);
INSERT INTO `log` VALUES (92, '202510161901381601', '96321', '订阅课程:Python爬虫2', '172.162.1.40', '2025-10-16 19:03:46', NULL);
INSERT INTO `log` VALUES (93, '202510161901381601', '96321', '发表评论，在\'Python爬虫2\'', '172.162.1.40', '2025-10-16 19:03:55', NULL);
INSERT INTO `log` VALUES (94, '202510161901381601', '96321', '个人信息更改', '172.162.1.40', '2025-10-16 19:04:36', NULL);
INSERT INTO `log` VALUES (95, '202510161901381601', '96321', '注销', '172.162.1.40', '2025-10-16 19:05:29', NULL);
INSERT INTO `log` VALUES (96, '20151612204', 'admin', '登录', '172.162.1.44', '2025-10-16 19:15:49', 'admin');
INSERT INTO `log` VALUES (97, '20151612204', 'admin', '登录', '172.162.1.44', '2025-10-16 19:18:37', 'admin');
INSERT INTO `log` VALUES (98, '20151612204', 'admin', '登录', '172.162.1.44', '2025-10-16 19:19:04', 'admin');
INSERT INTO `log` VALUES (99, '20151612204', 'admin', '登录', '172.162.1.41', '2025-10-16 19:20:27', 'admin');
INSERT INTO `log` VALUES (100, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-16 19:20:55', 'admin');
INSERT INTO `log` VALUES (101, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-17 15:50:41', NULL);
INSERT INTO `log` VALUES (102, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-17 15:51:46', 'admin');
INSERT INTO `log` VALUES (103, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-17 15:52:31', NULL);
INSERT INTO `log` VALUES (104, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-17 18:55:21', 'admin');
INSERT INTO `log` VALUES (105, NULL, NULL, '尝试登录账号:admin，密码错误', '0:0:0:0:0:0:0:1', '2025-10-27 20:01:49', NULL);
INSERT INTO `log` VALUES (106, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-10-27 20:01:57', 'admin');
INSERT INTO `log` VALUES (107, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 10:30:06', 'admin');
INSERT INTO `log` VALUES (108, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 10:46:37', 'admin');
INSERT INTO `log` VALUES (109, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 14:30:47', 'admin');
INSERT INTO `log` VALUES (110, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 14:35:21', 'admin');
INSERT INTO `log` VALUES (111, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 14:48:57', 'admin');
INSERT INTO `log` VALUES (112, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 14:51:52', 'admin');
INSERT INTO `log` VALUES (113, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 14:52:54', 'admin');
INSERT INTO `log` VALUES (114, NULL, NULL, '删除课程：张三', '127.0.0.1', '2025-10-29 14:53:07', 'admin');
INSERT INTO `log` VALUES (115, NULL, NULL, '删除课程：张三', '127.0.0.1', '2025-10-29 14:53:16', 'admin');
INSERT INTO `log` VALUES (116, NULL, NULL, '删除课程：张三', '127.0.0.1', '2025-10-29 14:53:22', 'admin');
INSERT INTO `log` VALUES (117, NULL, NULL, '删除课程：张三', '127.0.0.1', '2025-10-29 14:53:29', 'admin');
INSERT INTO `log` VALUES (118, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 15:22:11', 'admin');
INSERT INTO `log` VALUES (119, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 15:23:42', 'admin');
INSERT INTO `log` VALUES (120, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 15:24:57', 'admin');
INSERT INTO `log` VALUES (121, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 15:51:24', 'admin');
INSERT INTO `log` VALUES (122, '20151612204', 'admin', '登录', '127.0.0.1', '2025-10-29 15:53:23', 'admin');
INSERT INTO `log` VALUES (123, NULL, NULL, '上架课程：123123', '127.0.0.1', '2025-10-29 15:54:04', 'admin');
INSERT INTO `log` VALUES (124, NULL, NULL, '下架课程：123123', '127.0.0.1', '2025-10-29 15:54:17', 'admin');
INSERT INTO `log` VALUES (125, NULL, NULL, '删除课程：123123', '127.0.0.1', '2025-10-29 15:54:34', 'admin');
INSERT INTO `log` VALUES (126, '20151612204', 'admin', '发表评论，在\'Python入门\'', '127.0.0.1', '2025-10-29 16:09:50', NULL);
INSERT INTO `log` VALUES (127, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-16 18:16:04', NULL);
INSERT INTO `log` VALUES (128, '20151612204', 'admin', '发表评论，在\'Python入门\'', '0:0:0:0:0:0:0:1', '2025-02-16 18:16:39', NULL);
INSERT INTO `log` VALUES (129, '20151612204', 'admin', '购买会员：一个月', '0:0:0:0:0:0:0:1', '2025-02-16 18:17:33', NULL);
INSERT INTO `log` VALUES (130, '20151612204', 'admin', '注销', '0:0:0:0:0:0:0:1', '2025-02-16 18:19:08', NULL);
INSERT INTO `log` VALUES (131, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-16 18:20:02', 'admin');
INSERT INTO `log` VALUES (132, '202510161045371069', 'abc', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 16:32:16', NULL);
INSERT INTO `log` VALUES (133, '202510161045371069', 'abc', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 18:06:56', NULL);
INSERT INTO `log` VALUES (134, '202510161045371069', 'abc', '订阅课程:Python爬虫', '0:0:0:0:0:0:0:1', '2025-02-17 18:07:35', NULL);
INSERT INTO `log` VALUES (135, '202510161045371069', 'abc', '发表评论，在\'Python爬虫\'', '0:0:0:0:0:0:0:1', '2025-02-17 18:08:52', NULL);
INSERT INTO `log` VALUES (136, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 18:09:19', 'admin');
INSERT INTO `log` VALUES (137, '20151612204', 'admin', '注销', '0:0:0:0:0:0:0:1', '2025-02-17 18:14:31', NULL);
INSERT INTO `log` VALUES (138, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 20:50:07', 'admin');
INSERT INTO `log` VALUES (139, NULL, NULL, '上架课程：test', '0:0:0:0:0:0:0:1', '2025-02-17 20:51:17', 'admin');
INSERT INTO `log` VALUES (140, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:16:00', NULL);
INSERT INTO `log` VALUES (141, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:17:04', NULL);
INSERT INTO `log` VALUES (142, NULL, NULL, '尝试登录账号:null，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:17:08', NULL);
INSERT INTO `log` VALUES (143, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:18:13', NULL);
INSERT INTO `log` VALUES (144, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:33:45', NULL);
INSERT INTO `log` VALUES (145, NULL, NULL, '尝试登录账号:null，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:36:08', NULL);
INSERT INTO `log` VALUES (146, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:40:03', NULL);
INSERT INTO `log` VALUES (147, '202509061055001264', 'aaa', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 21:55:42', NULL);
INSERT INTO `log` VALUES (148, NULL, NULL, '尝试登录账号:aaa，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 21:58:49', NULL);
INSERT INTO `log` VALUES (149, '202509061055001264', 'aaa', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 21:59:03', NULL);
INSERT INTO `log` VALUES (150, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 22:02:07', NULL);
INSERT INTO `log` VALUES (151, '202509061055001264', 'aaa', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 22:02:15', NULL);
INSERT INTO `log` VALUES (152, '202509061055001264', 'aaa', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 22:29:32', NULL);
INSERT INTO `log` VALUES (153, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-17 22:50:05', NULL);
INSERT INTO `log` VALUES (154, '202509061055001264', 'aaa', '登录', '0:0:0:0:0:0:0:1', '2025-02-17 22:50:15', NULL);
INSERT INTO `log` VALUES (155, '202509061055001264', 'aaa', '订阅课程:1024设计', '0:0:0:0:0:0:0:1', '2025-02-17 22:50:27', NULL);
INSERT INTO `log` VALUES (156, '202509061055001264', 'aaa', '订阅课程:java', '0:0:0:0:0:0:0:1', '2025-02-17 22:51:04', NULL);
INSERT INTO `log` VALUES (157, '202509061055001264', 'aaa', '订阅课程:test', '0:0:0:0:0:0:0:1', '2025-02-17 22:52:39', NULL);
INSERT INTO `log` VALUES (158, '202509061055001264', 'aaa', '订阅课程:Python入门', '0:0:0:0:0:0:0:1', '2025-02-17 22:55:40', NULL);
INSERT INTO `log` VALUES (159, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-18 21:48:27', NULL);
INSERT INTO `log` VALUES (160, NULL, NULL, '尝试登录账号:Naiteiy，密码错误', '0:0:0:0:0:0:0:1', '2025-02-18 21:48:32', NULL);
INSERT INTO `log` VALUES (161, '202502182207511578', 'Naiteiy1', '普通注册', '0:0:0:0:0:0:0:1', '2025-02-18 22:07:51', NULL);
INSERT INTO `log` VALUES (162, '202502182209241733', 'Naiteiy', '普通注册', '0:0:0:0:0:0:0:1', '2025-02-18 22:09:24', NULL);
INSERT INTO `log` VALUES (163, '202502182209241733', 'Naiteiy', '登录', '0:0:0:0:0:0:0:1', '2025-02-19 21:18:37', NULL);
INSERT INTO `log` VALUES (164, '202502182209241733', 'Naiteiy', '订阅课程:java', '0:0:0:0:0:0:0:1', '2025-02-19 21:19:23', NULL);
INSERT INTO `log` VALUES (165, '202502182209241733', 'Naiteiy', '登录', '0:0:0:0:0:0:0:1', '2025-02-20 13:52:24', NULL);
INSERT INTO `log` VALUES (166, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-20 13:54:18', 'admin');
INSERT INTO `log` VALUES (167, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-20 14:21:06', 'admin');
INSERT INTO `log` VALUES (168, '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2025-02-20 14:21:34', 'admin');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `courseid` int(100) NOT NULL DEFAULT 0,
  `userid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '20151612204');
INSERT INTO `message` VALUES (3, '202508240857431128');
INSERT INTO `message` VALUES (6, '202508231058301205');
INSERT INTO `message` VALUES (4, '20151612204');
INSERT INTO `message` VALUES (5, '20151612204');
INSERT INTO `message` VALUES (2, '202509030750151429');
INSERT INTO `message` VALUES (2, '20151612204');
INSERT INTO `message` VALUES (2, '202509061049051592');
INSERT INTO `message` VALUES (2, '202508240857431128');
INSERT INTO `message` VALUES (6, '202508240857431128');
INSERT INTO `message` VALUES (4, '202509030750151429');
INSERT INTO `message` VALUES (5, '202508240857431128');
INSERT INTO `message` VALUES (1, '202509061049051592');
INSERT INTO `message` VALUES (3, '202508231058301205');
INSERT INTO `message` VALUES (4, '202508231058301205');
INSERT INTO `message` VALUES (2, '202510161045371069');
INSERT INTO `message` VALUES (6, '202510161901381601');
INSERT INTO `message` VALUES (4, '202510161045371069');
INSERT INTO `message` VALUES (3, '202509061055001264');
INSERT INTO `message` VALUES (5, '202509061055001264');
INSERT INTO `message` VALUES (9, '202509061055001264');
INSERT INTO `message` VALUES (2, '202509061055001264');
INSERT INTO `message` VALUES (5, '202502182209241733');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `reviewid` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseid` int(50) NULL DEFAULT NULL,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `lable` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`reviewid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('202509060327341776', 'fgfdgdsgg', 2, 'zzz', '2025-09-06 15:34:27', '4', 'Female', 1);
INSERT INTO `review` VALUES ('202509060414381493', '钱花的有点多', 1, '雷宇锋', '2025-09-06 16:38:14', '0', NULL, 1);
INSERT INTO `review` VALUES ('202509060423031483', '这课不错', 4, 'admin', '2025-09-06 16:03:23', '2', 'Male', 1);
INSERT INTO `review` VALUES ('202509060444041617', '刷好评', 4, 'adm', '2025-09-06 16:04:44', '4', NULL, 0);
INSERT INTO `review` VALUES ('202509060450041302', '刷好评', 4, 'adm', '2025-09-06 16:04:50', '4', NULL, 0);
INSERT INTO `review` VALUES ('202509060452031217', '这还不错', 4, 'adm', '2025-09-06 16:03:52', '3', NULL, 0);
INSERT INTO `review` VALUES ('202509060457021559', '这课不错', 5, 'admin', '2025-09-06 16:02:57', '2', 'Male', 1);
INSERT INTO `review` VALUES ('202510151532321876', '测试测试！！！', 6, '1823544517', '2025-10-15 15:32:32', '3', 'Male', 1);
INSERT INTO `review` VALUES ('202510151554191404', 'en ?', 3, '1823544517', '2025-10-15 15:19:54', '2', 'Male', 1);
INSERT INTO `review` VALUES ('202510161036391342', '美太太', 3, 'abc', '2025-10-16 10:39:36', '4', 'Female', 1);
INSERT INTO `review` VALUES ('202510161522301059', '测试', 4, '1823544517', '2025-10-16 15:30:22', '4', 'Male', 1);
INSERT INTO `review` VALUES ('202510161530351701', 'en    很不错', 3, 'abc', '2025-10-16 15:35:30', '0', 'Female', 1);
INSERT INTO `review` VALUES ('202510161545271907', '测试测试', 4, '1823544517', '2025-10-16 15:27:45', '4', 'Male', 1);
INSERT INTO `review` VALUES ('202510161902561206', '', 2, '96321', '2025-10-16 19:02:56', '4', 'Male', 1);
INSERT INTO `review` VALUES ('202510161903551373', '6666', 6, '96321', '2025-10-16 19:03:55', '4', 'Male', 1);
INSERT INTO `review` VALUES ('202510291609501589', '还行', 2, 'admin', '2025-10-29 16:09:50', '4', 'Male', 1);
INSERT INTO `review` VALUES ('202502161816391405', '你好', 2, 'admin', '2025-02-16 18:16:39', '1', 'Male', 1);
INSERT INTO `review` VALUES ('202502171808521237', '你好\r\n', 4, 'abc', '2025-02-17 18:08:52', '0', 'Female', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vx` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mission` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buycase` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mycase` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collect` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip` datetime NULL DEFAULT NULL,
  `fristtime` datetime NULL DEFAULT NULL,
  `age` int(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20151612204', 'Male', '18235447109', '591284209@qq.com', '1111', '杨式人', 'admin', 'admin', 'admin', NULL, NULL, '458000', '高中/中专', '2033-11-01 19:57:53', NULL, NULL);
INSERT INTO `user` VALUES ('202508100710171565', 'Female', '18235447109', '591284209@qq.com', NULL, NULL, 'admin1', 'admin', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-10 19:17:10', NULL);
INSERT INTO `user` VALUES ('202508100930501831', 'Male', '18235447109', '591284209@qq.com', '1111111111111111111', '张三', 'zhangsan', 'asdasd', NULL, NULL, NULL, '0', '本科/大专', '2019-09-01 20:41:04', '2025-08-10 09:50:30', NULL);
INSERT INTO `user` VALUES ('202508101154331492', 'Female', '1111111111111', '1447883900@qq.com', NULL, NULL, 'zhazhabi', 'zxcvbnm', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-10 11:33:54', NULL);
INSERT INTO `user` VALUES ('202508230425131682', NULL, '123456789', '125486', '15846', 'bad', 'bb', '123456', NULL, NULL, NULL, '500', '研究生以上', NULL, '2025-08-23 16:13:25', NULL);
INSERT INTO `user` VALUES ('202508230439101712', NULL, NULL, NULL, NULL, NULL, '18235445172', '1111', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-23 16:10:39', NULL);
INSERT INTO `user` VALUES ('202508231058301205', 'Male', '12345689', '789@qq.com', '784554asdd', '雷', '1823544517', '123654', NULL, '0', NULL, '7000', '本科/大专', '2019-10-15 15:31:58', '2025-08-23 10:30:58', NULL);
INSERT INTO `user` VALUES ('202508240857431128', 'Female', '12345678907assa', '345424354@qq.com', '4dgde', 'zzzgf', 'zzz', '12345', NULL, NULL, NULL, '0', '研究生以上', '2023-01-06 15:33:03', '2025-08-24 08:43:57', NULL);
INSERT INTO `user` VALUES ('202508241105291520', NULL, NULL, NULL, NULL, NULL, '1823544517111111111111', '123456', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-24 11:29:05', NULL);
INSERT INTO `user` VALUES ('202508241117291016', NULL, NULL, NULL, NULL, NULL, '182354451722222222222', '123456', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-24 11:29:17', NULL);
INSERT INTO `user` VALUES ('202508241149281125', NULL, NULL, NULL, NULL, NULL, '18235445171111', '123456', NULL, NULL, NULL, '500', NULL, NULL, '2025-08-24 11:28:49', NULL);
INSERT INTO `user` VALUES ('202509030750151429', NULL, NULL, NULL, NULL, NULL, 'adm', '123', NULL, NULL, NULL, '500', NULL, NULL, '2025-09-03 19:15:50', NULL);
INSERT INTO `user` VALUES ('202509061018111546', 'Male', '110', '373254553@qq.com', 'js666', 'js', 'js', 'js666', NULL, NULL, NULL, '10000', '研究生以上', '2020-03-06 10:15:16', '2025-09-06 10:11:18', NULL);
INSERT INTO `user` VALUES ('202509061049051592', NULL, NULL, NULL, NULL, NULL, '雷宇锋', '110', NULL, NULL, NULL, '0', NULL, '2025-12-06 16:37:39', '2025-09-06 10:05:49', NULL);
INSERT INTO `user` VALUES ('202509061051011416', NULL, NULL, NULL, NULL, NULL, 'sdsd', '123', NULL, NULL, NULL, '500', NULL, NULL, '2025-09-06 10:01:51', NULL);
INSERT INTO `user` VALUES ('202509061055001264', NULL, NULL, NULL, NULL, NULL, 'aaa', '123', NULL, NULL, NULL, '500', NULL, NULL, '2025-09-06 10:00:55', NULL);
INSERT INTO `user` VALUES ('202509061108071033', 'Female', '12123', '1447883900@qq.com', NULL, NULL, '111', 'qweqwe', NULL, NULL, NULL, '500', NULL, NULL, '2025-09-06 11:07:08', NULL);
INSERT INTO `user` VALUES ('202510161045371069', 'Female', '13096613748', '872486471', '1223', '去玩儿', 'abc', '123456', NULL, '0', NULL, '0', '研究生以上', '2021-05-16 10:38:27', '2025-10-16 10:37:45', NULL);
INSERT INTO `user` VALUES ('202510161901381601', 'Male', '96321', '96321', '96321', '96321', '96321', '96321', NULL, '0', NULL, '0', '研究生以上', '2025-11-16 19:03:40', '2025-10-16 19:01:38', NULL);
INSERT INTO `user` VALUES ('202502182207511578', 'Male', '15275094728', '1820031511@qq.com', NULL, NULL, 'Naiteiy1', '12030115', NULL, NULL, NULL, '500', NULL, NULL, '2025-02-18 22:07:51', NULL);
INSERT INTO `user` VALUES ('202502182209241733', 'Male', '15275094728', '1820031511@qq.com', NULL, NULL, 'Naiteiy', '12030115', NULL, NULL, NULL, '500', NULL, NULL, '2025-02-18 22:09:24', NULL);

SET FOREIGN_KEY_CHECKS = 1;
