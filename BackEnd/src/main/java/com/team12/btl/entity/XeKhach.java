package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Data
@Table(name = "tblxekhach")
public class XeKhach implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "bien_so", nullable = false)
    private String bienSo;

    @Column(name = "mau_xe", nullable = false)
    private String mauXe;

    @Column(name = "hang_san_xuat", nullable = false)
    private String hangSanXuat;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "so_ghe", nullable = false)
    private Integer soGhe;

    @Column(name = "so_nam_su_dung", nullable = false)
    private Float soNamSuDung;

    @Column(name = "ngay_bao_duong_cuoi", nullable = false)
    private Date ngayBaoDuongCuoi;

    @Column(name = "is_active", nullable = false)
    private boolean is_active;
}
