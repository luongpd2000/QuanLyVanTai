/*
 Navicat Premium Data Transfer

 Source Server         : pdluong
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : ltw

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 19/11/2021 09:02:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coach
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `capacity` int(0) NOT NULL,
  `years_of_use` float NOT NULL,
  `last_maintenance_day` date NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coach_turn
-- ----------------------------
DROP TABLE IF EXISTS `coach_turn`;
CREATE TABLE `coach_turn`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `passenger_amount` int(0) NOT NULL,
  `ticket_price` float(255, 0) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `grade_salary` float(255, 0) NOT NULL,
  `coach_id` int(0) NOT NULL,
  `route_id` int(0) NOT NULL,
  `driver_id` int(0) NOT NULL,
  `driver_asistant_id` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_lx`(`driver_id`) USING BTREE,
  INDEX `fk_px`(`driver_asistant_id`) USING BTREE,
  INDEX `fk_xk`(`coach_id`) USING BTREE,
  INDEX `fk_tx`(`route_id`) USING BTREE,
  CONSTRAINT `fk_lx` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_px` FOREIGN KEY (`driver_asistant_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tx` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_xk` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complexity
-- ----------------------------
DROP TABLE IF EXISTS `complexity`;
CREATE TABLE `complexity`  (
  `complexity` int(0) NOT NULL AUTO_INCREMENT,
  `grade_salary` float(255, 0) NOT NULL,
  PRIMARY KEY (`complexity`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complexity
-- ----------------------------
INSERT INTO `complexity` VALUES (1, 2);
INSERT INTO `complexity` VALUES (2, 3);
INSERT INTO `complexity` VALUES (3, 4);

-- ----------------------------
-- Table structure for driver
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `driving_license_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type_of_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `birthday` date NOT NULL,
  `experience` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `fixed_salary_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_fsalary`(`fixed_salary_id`) USING BTREE,
  CONSTRAINT `fk_fsalary` FOREIGN KEY (`fixed_salary_id`) REFERENCES `fixed_salary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fixed_salary
-- ----------------------------
DROP TABLE IF EXISTS `fixed_salary`;
CREATE TABLE `fixed_salary`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `grade` float NOT NULL,
  `basic_salary` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `point_of_departure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `length` float(255, 0) NOT NULL,
  `complexity_id` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_dpt`(`complexity_id`) USING BTREE,
  CONSTRAINT `fk_pdt` FOREIGN KEY (`complexity_id`) REFERENCES `complexity` (`complexity`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES (1, 't1', 't2', 100, 1, b'1');
INSERT INTO `route` VALUES (2, 't1', 't2', 100, 2, b'1');

-- ----------------------------
-- Table structure for total_salary
-- ----------------------------
DROP TABLE IF EXISTS `total_salary`;
CREATE TABLE `total_salary`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  `month` int(0) NOT NULL,
  `year` int(0) NOT NULL,
  `driver_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fK_drive`(`driver_id`) USING BTREE,
  CONSTRAINT `fK_drive` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
