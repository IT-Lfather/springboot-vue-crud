/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : springboot-demo

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 04/05/2022 09:00:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', NULL, '1', 1, '女', '1');
INSERT INTO `user` VALUES (3, '李卓', NULL, '7z', 21, '未知', '123');
INSERT INTO `user` VALUES (4, '张强', NULL, '1', 21, '男', '12');
INSERT INTO `user` VALUES (5, '3', '123456', '4', 21, '男', '121');
INSERT INTO `user` VALUES (6, '3', '123456', '213', 23, '男', '34213');
INSERT INTO `user` VALUES (7, '45', '123456', '5', 6, '男', '446');
INSERT INTO `user` VALUES (8, '5645', '123456', '65', 65, '男', '56');
INSERT INTO `user` VALUES (9, '654', '123456', '44', 5, '男', '1');
INSERT INTO `user` VALUES (10, '1', '123456', '1', 1, '男', '1');
INSERT INTO `user` VALUES (11, '11', '123456', '1', 111, '男', '11');
INSERT INTO `user` VALUES (12, '11', '123456', '11', 11, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
