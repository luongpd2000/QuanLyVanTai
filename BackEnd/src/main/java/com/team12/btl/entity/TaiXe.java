package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "tbltaixe")
@Data
public class TaiXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "ten", nullable = false)
    private String ten;

    @Column(name = "cmt", nullable = false)
    private String cmt;

    @Column(name = "ma_so_bang_lai", nullable = false)
    private String maSoBangLai;

    @Column(name = "loai_bang_lai", nullable = false)
    private String loaiBangLai;

    @Column(name = "dia_chi", nullable = false)
    private String diaChi;

    @Column(name = "ngay_sinh", nullable = false)
    private Date ngaySinh;

    @Column(name = "tham_nien", nullable = false)
    private Integer thamNien;

    @Column(name = "is_active", nullable = false)
    private boolean is_active;
}
