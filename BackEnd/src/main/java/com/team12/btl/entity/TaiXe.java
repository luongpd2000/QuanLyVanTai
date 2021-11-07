package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "tbltaixe")
@Data
public class TaiXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "ten", nullable = false)
    private String ten;

    @Column(name = "cmt", nullable = false)
    private String cmt;

    @Column(name = "maSoBangLai", nullable = false)
    private String maSoBangLai;

    @Column(name = "loaiBangLai", nullable = false)
    private String loaiBangLai;

    @Column(name = "diaChi", nullable = false)
    private String diaChi;

    @Column(name = "ngaySinh", nullable = false)
    private Date ngaySinh;

    @Column(name = "thamNien", nullable = false)
    private Integer thamNien;

}
