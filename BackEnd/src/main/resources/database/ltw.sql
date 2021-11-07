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

 Date: 08/11/2021 00:39:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblchuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tblchuyenxe`;
CREATE TABLE `tblchuyenxe`  (
  `id` int(0) NOT NULL,
  `soKhach` int(0) NOT NULL,
  `giaVe` float(255, 0) NOT NULL,
  `batDau` datetime(0) NOT NULL,
  `ketThuc` datetime(0) NOT NULL,
  `heSoLuong` float(255, 0) NOT NULL,
  `xeKhachId` int(0) NOT NULL,
  `tuyenXeId` int(0) NOT NULL,
  `laiXeId` int(0) NOT NULL,
  `phuXeId` int(0) NOT NULL,
  `bat_dau` datetime(6) NOT NULL,
  `gia_ve` float NOT NULL,
  `he_so_luong` float NOT NULL,
  `ket_thuc` datetime(6) NOT NULL,
  `lai_xe_id` int(0) NOT NULL,
  `phu_xe_id` int(0) NOT NULL,
  `so_khach` int(0) NOT NULL,
  `tuyen_xe_id` int(0) NOT NULL,
  `xe_khach_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_lx`(`laiXeId`) USING BTREE,
  INDEX `fk_px`(`phuXeId`) USING BTREE,
  INDEX `fk_xk`(`xeKhachId`) USING BTREE,
  INDEX `fk_tx`(`tuyenXeId`) USING BTREE,
  CONSTRAINT `fk_lx` FOREIGN KEY (`laiXeId`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_px` FOREIGN KEY (`phuXeId`) REFERENCES `tbltaixe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tx` FOREIGN KEY (`tuyenXeId`) REFERENCES `tbltuyenxe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_xk` FOREIGN KEY (`xeKhachId`) REFERENCES `tblxekhach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbldophuctap
-- ----------------------------
DROP TABLE IF EXISTS `tbldophuctap`;
CREATE TABLE `tbldophuctap`  (
  `id` int(0) NOT NULL,
  `doPhucTap` int(0) NOT NULL,
  `heSoLuong` float(255, 0) NOT NULL,
  `do_phuc_tap` int(0) NOT NULL,
  `he_so_luong` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbltaixe
-- ----------------------------
DROP TABLE IF EXISTS `tbltaixe`;
CREATE TABLE `tbltaixe`  (
  `id` int(0) NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cmt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `maSoBangLai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loaiBangLai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `thamNien` int(0) NOT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loai_bang_lai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ma_so_bang_lai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngay_sinh` date NOT NULL,
  `tham_nien` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbltuyenxe
-- ----------------------------
DROP TABLE IF EXISTS `tbltuyenxe`;
CREATE TABLE `tbltuyenxe`  (
  `id` int(0) NOT NULL,
  `diemDau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diemCuoi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `doDai` float(255, 0) NOT NULL,
  `doPhucTapId` int(0) NOT NULL,
  `diem_cuoi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diem_dau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `do_dai` float NOT NULL,
  `do_phuc_tap_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_dpt`(`doPhucTapId`) USING BTREE,
  CONSTRAINT `fk_dpt` FOREIGN KEY (`doPhucTapId`) REFERENCES `tbldophuctap` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tblxekhach
-- ----------------------------
DROP TABLE IF EXISTS `tblxekhach`;
CREATE TABLE `tblxekhach`  (
  `id` int(0) NOT NULL,
  `bienSo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mauXe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hangSanXuat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `soGhe` int(0) NOT NULL,
  `soNamSuDung` float NOT NULL,
  `ngayBaoDuongCuoi` date NOT NULL,
  `bien_so` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hang_san_xuat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mau_xe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngay_bao_duong_cuoi` date NOT NULL,
  `so_ghe` int(0) NOT NULL,
  `so_nam_su_dung` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
