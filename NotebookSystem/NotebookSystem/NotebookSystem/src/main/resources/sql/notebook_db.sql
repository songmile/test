/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : notebook_db

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 13/12/2024 21:24:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(0) NULL DEFAULT NULL COMMENT '绑定用户Id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出生日期',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `regTime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 3, '杨潘国', '2000-01-02', '17302395506', '3454346979@qq.com', '2024-12-12 09:13:08');
INSERT INTO `customer` VALUES (2, 4, '文明彬', '2000-10-10', '13978522728', '1069275386@qq.com', '2024-12-12 09:22:10');
INSERT INTO `customer` VALUES (3, 5, '刘妍伶', '2000-10-10', '19112335661', '1840954382@qq.com', '2024-12-12 09:25:10');
INSERT INTO `customer` VALUES (4, 6, '李松蔓', '2000-10-10', '15223353656', '2664195548@qq.com', '2024-12-12 09:26:53');
INSERT INTO `customer` VALUES (5, 7, '张先峰', '2000-10-10', '15208193946', '3286856832@qq.com', '2024-12-12 09:26:53');
INSERT INTO `customer` VALUES (6, 8, '何慧君', '2000-10-10', '18223731373', '2234998159@qq.com', '2024-12-12 09:26:53');
INSERT INTO `customer` VALUES (7, 9, '雷仙开', '2000-10-10', '13308904103', '2714859206@qq.com', '2024-12-12 09:13:08');
INSERT INTO `customer` VALUES (8, 10, '周研博', '2000-10-10', '18048800692', '914117355@qq.com', '2024-12-12 09:22:10');
INSERT INTO `customer` VALUES (9, 11, '郑婷婷', '2000-10-10', '18375714140', '3297277289@qq.com', '2024-12-12 09:25:10');
INSERT INTO `customer` VALUES (10, 12, '叶茂林', '2000-10-10', '13368113479', '2863196327@qq.com', '2024-12-12 09:26:53');
INSERT INTO `customer` VALUES (11, 13, '叶奎龙', '2000-10-10', '19122624471', '1904224501@qq.com', '2024-12-12 09:26:53');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态(0-正常 1-禁用)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '管理员', 'admin', '123456', 0);
INSERT INTO `sys_user` VALUES (2, '付祥明', 'fxm', '123456', 0);
INSERT INTO `sys_user` VALUES (3, '杨潘国', 'ypg', '123456', 0);
INSERT INTO `sys_user` VALUES (4, '文明彬', 'wmb', '123456', 0);
INSERT INTO `sys_user` VALUES (5, '刘妍伶', 'lyl', '123456', 0);
INSERT INTO `sys_user` VALUES (6, '李松蔓', 'lsm', '123456', 0);
INSERT INTO `sys_user` VALUES (7, '张先峰', 'zxf', '123456', 0);
INSERT INTO `sys_user` VALUES (8, '何慧君', 'hhj', '123456', 0);
INSERT INTO `sys_user` VALUES (9, '雷仙开', 'lxk', '123456', 0);
INSERT INTO `sys_user` VALUES (10, '周研博', 'zyb', '123456', 0);
INSERT INTO `sys_user` VALUES (11, '郑婷婷', 'ztt', '123456', 0);
INSERT INTO `sys_user` VALUES (12, '叶茂林', 'yml', '123456', 0);
INSERT INTO `sys_user` VALUES (13, '叶奎龙', 'ykl', '123456', 0);

-- ----------------------------
-- Table structure for task_type
-- ----------------------------
DROP TABLE IF EXISTS `task_type`;
CREATE TABLE `task_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类编码',
  `sortCode` int(0) NOT NULL COMMENT '顺序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_type
-- ----------------------------
INSERT INTO `task_type` VALUES (1, '生活', '01', 10);
INSERT INTO `task_type` VALUES (2, '工作', '02', 20);
INSERT INTO `task_type` VALUES (3, '会议', '03', 30);
INSERT INTO `task_type` VALUES (4, '暑假', '04', 40);
INSERT INTO `task_type` VALUES (5, '寒假', '05', 50);
INSERT INTO `task_type` VALUES (6, '生日', '06', 60);

-- ----------------------------
-- Table structure for user_task
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(0) NULL DEFAULT NULL COMMENT '隶属用户Id',
  `taskTypeId` int(0) NULL DEFAULT NULL COMMENT '事件分类Id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件内容',
  `startDate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '起始日期',
  `endDate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '截止日期',
  `level` int(0) NULL DEFAULT NULL COMMENT '事件级别',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_task
-- ----------------------------
INSERT INTO `user_task` VALUES (1, 3, 1, '参加宴会', '亲戚60岁生日宴会', '2024-10-01', '2024-10-05', 1, 1);
INSERT INTO `user_task` VALUES (2, 1, 4, '在线培训', '2024年专技人员公需科目', '2024-12-13', '2024-12-20', 1, 1);
INSERT INTO `user_task` VALUES (3, 3, 2, '参加会议', '专周实训会议', '2024-12-13', '2024-12-13', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
