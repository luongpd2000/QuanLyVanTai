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

 Date: 13/11/2021 15:31:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblchuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tblchuyenxe`;
CREATE TABLE `tblchuyenxe`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `so_khach` int(0) NOT NULL,
  `gia_ve` float(255, 0) NOT NULL,
  `bat_dau` datetime(0) NOT NULL,
  `ket_thuc` datetime(0) NOT NULL,
  `he_so_luong` float(255, 0) NOT NULL,
  `xe_khach_id` int(0) NOT NULL,
  `tuyen_xe_id` int(0) NOT NULL,
  `lai_xe_id` int(0) NOT NULL,
  `phu_xe_id` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_lx`(`lai_xe_id`) USING BTREE,
  INDEX `fk_px`(`phu_xe_id`) USING BTREE,
  INDEX `fk_xk`(`xe_khach_id`) USING BTREE,
  INDEX `fk_tx`(`tuyen_xe_id`) USING BTREE,
  CONSTRAINT `fk_lx` FOREIGN KEY (`lai_xe_id`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_px` FOREIGN KEY (`phu_xe_id`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tx` FOREIGN KEY (`tuyen_xe_id`) REFERENCES `tbltuyenxe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_xk` FOREIGN KEY (`xe_khach_id`) REFERENCES `tblxekhach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbldophuctap
-- ----------------------------
DROP TABLE IF EXISTS `tbldophuctap`;
CREATE TABLE `tbldophuctap`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `do_phuc_tap` int(0) NOT NULL,
  `he_so_luong` float(255, 0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldophuctap
-- ----------------------------
INSERT INTO `tbldophuctap` VALUES (1, 1, 3);
INSERT INTO `tbldophuctap` VALUES (2, 2, 4);
INSERT INTO `tbldophuctap` VALUES (3, 3, 5);

-- ----------------------------
-- Table structure for tbltaixe
-- ----------------------------
DROP TABLE IF EXISTS `tbltaixe`;
CREATE TABLE `tbltaixe`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `cmt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ma_so_bang_lai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `loai_bang_lai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ngay_sinh` date NOT NULL,
  `tham_nien` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltaixe
-- ----------------------------
INSERT INTO `tbltaixe` VALUES (1, 'test', '83746873', '743857463', 'A1', 'Ha Noi', '1993-09-23', 4, b'0');

-- ----------------------------
-- Table structure for tbltuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tbltuyenxe`;
CREATE TABLE `tbltuyenxe`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `diem_dau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diem_cuoi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `do_dai` float(255, 0) NOT NULL,
  `do_phuc_tap_id` int(0) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_dpt`(`do_phuc_tap_id`) USING BTREE,
  CONSTRAINT `fk_pdt` FOREIGN KEY (`do_phuc_tap_id`) REFERENCES `tbldophuctap` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tblxekhach
-- ----------------------------
DROP TABLE IF EXISTS `tblxekhach`;
CREATE TABLE `tblxekhach`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `bien_so` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mau_xe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `hang_san_xuat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `so_ghe` int(0) NOT NULL,
  `so_nam_su_dung` float NOT NULL,
  `ngay_bao_duong_cuoi` date NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
