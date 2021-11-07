package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Data
@Table(name = "tblchuyenxe")
public class ChuyenXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "soKhach", nullable = false)
    private Integer soKhach;

    @Column(name = "giaVe", nullable = false)
    private Float giaVe;

    @Column(name = "batDau", nullable = false)
    private Timestamp batDau;

    @Column(name = "ketThuc", nullable = false)
    private Timestamp ketThuc;

    @Column(name = "heSoLuong", nullable = false)
    private Float heSoLuong;

    @Column(name = "xeKhachId", nullable = false)
    private Integer xeKhachId;

    @Column(name = "tuyenXeId", nullable = false)
    private Integer tuyenXeId;

    @Column(name = "laiXeId", nullable = false)
    private Integer laiXeId;

    @Column(name = "phuXeId", nullable = false)
    private Integer phuXeId;

}
