package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbltuyenxe")
@Data
public class TuyenXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "diem_dau", nullable = false)
    private String diemDau;

    @Column(name = "diem_cuoi", nullable = false)
    private String diemCuoi;

    @Column(name = "do_dai", nullable = false)
    private Float doDai;

    @Column(name = "is_active", nullable = false)
    private boolean is_active;

//    @Column(name = "doPhucTapId", nullable = false)
//    private Integer doPhucTapId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "do_phuc_tap_id",referencedColumnName = "id", nullable = false)
    private DoPhucTap doPhucTap;

}
