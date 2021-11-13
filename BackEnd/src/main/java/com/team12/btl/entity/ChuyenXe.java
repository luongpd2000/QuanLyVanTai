package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Data
@Table(name = "tblchuyenxe")
public class ChuyenXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "so_khach", nullable = false)
    private Integer soKhach;

    @Column(name = "gia_ve", nullable = false)
    private Float giaVe;

    @Column(name = "bat_dau", nullable = false)
    private Timestamp batDau;

    @Column(name = "ket_thuc", nullable = false)
    private Timestamp ketThuc;

    @Column(name = "he_so_luong", nullable = false)
    private Float heSoLuong;

    @Column(name = "is_active", nullable = false)
    private boolean is_active;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "xe_khach_id",referencedColumnName = "id", nullable = false)
    private XeKhach xeKhach;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tuyen_xe_id",referencedColumnName = "id", nullable = false)
    private TuyenXe tuyenXe;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "lai_xe_id",referencedColumnName = "id", nullable = false)
    private TaiXe laiXe;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "phu_xe_id",referencedColumnName = "id", nullable = false)
    private TaiXe phuXe;

}
