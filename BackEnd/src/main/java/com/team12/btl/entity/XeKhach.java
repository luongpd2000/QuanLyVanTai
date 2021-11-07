package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Data
@Table(name = "tblxekhach")
public class XeKhach implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "bienSo", nullable = false)
    private String bienSo;

    @Column(name = "mauXe", nullable = false)
    private String mauXe;

    @Column(name = "hangSanXuat", nullable = false)
    private String hangSanXuat;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "soGhe", nullable = false)
    private Integer soGhe;

    @Column(name = "soNamSuDung", nullable = false)
    private Float soNamSuDung;

    @Column(name = "ngayBaoDuongCuoi", nullable = false)
    private Date ngayBaoDuongCuoi;

}
