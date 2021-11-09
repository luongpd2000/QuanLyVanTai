/*
 Navicat Premium Data Transfer

 Source Server         : pdluong
 Source Server Type    : MySQL
 Source Server Version : 100604
 Source Host           : localhost:3306
 Source Schema         : ltw

 Target Server Type    : MySQL
 Target Server Version : 100604
 File Encoding         : 65001

 Date: 09/11/2021 10:50:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblchuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tblchuyenxe`;
CREATE TABLE `tblchuyenxe`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soKhach` int NOT NULL,
  `giaVe` float(255, 0) NOT NULL,
  `batDau` datetime(0) NOT NULL,
  `ketThuc` datetime(0) NOT NULL,
  `heSoLuong` float(255, 0) NOT NULL,
  `xeKhachId` int NOT NULL,
  `tuyenXeId` int NOT NULL,
  `laiXeId` int NOT NULL,
  `phuXeId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_lx`(`laiXeId`) USING BTREE,
  INDEX `fk_px`(`phuXeId`) USING BTREE,
  INDEX `fk_xk`(`xeKhachId`) USING BTREE,
  INDEX `fk_tx`(`tuyenXeId`) USING BTREE,
  CONSTRAINT `fk_lx` FOREIGN KEY (`laiXeId`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_px` FOREIGN KEY (`phuXeId`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tx` FOREIGN KEY (`tuyenXeId`) REFERENCES `tbltuyenxe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_xk` FOREIGN KEY (`xeKhachId`) REFERENCES `tblxekhach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tblchuyenxe
-- ----------------------------

-- ----------------------------
-- Table structure for tbldophuctap
-- ----------------------------
DROP TABLE IF EXISTS `tbldophuctap`;
CREATE TABLE `tbldophuctap`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `doPhucTap` int NOT NULL,
  `heSoLuong` float(255, 0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbldophuctap
-- ----------------------------

-- ----------------------------
-- Table structure for tbltaixe
-- ----------------------------
DROP TABLE IF EXISTS `tbltaixe`;
CREATE TABLE `tbltaixe`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `cmt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `maSoBangLai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `loaiBangLai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `thamNien` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbltaixe
-- ----------------------------
INSERT INTO `tbltaixe` VALUES (1, 'test', '83746873', '743857463', 'A1', 'Hà nội', '1993-09-23', 4);

-- ----------------------------
-- Table structure for tbltuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tbltuyenxe`;
CREATE TABLE `tbltuyenxe`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `diemDau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diemCuoi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `doDai` float(255, 0) NOT NULL,
  `doPhucTapId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_dpt`(`doPhucTapId`) USING BTREE,
  CONSTRAINT `fk_pdt` FOREIGN KEY (`doPhucTapId`) REFERENCES `tbldophuctap` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbltuyenxe
-- ----------------------------

-- ----------------------------
-- Table structure for tblxekhach
-- ----------------------------
DROP TABLE IF EXISTS `tblxekhach`;
CREATE TABLE `tblxekhach`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bienSo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mauXe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `hangSanXuat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `soGhe` int NOT NULL,
  `soNamSuDung` float NOT NULL,
  `ngayBaoDuongCuoi` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tblxekhach
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
