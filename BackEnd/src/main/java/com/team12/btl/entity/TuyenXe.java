package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "tbltuyenxe")
@Data
public class TuyenXe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "diemDau", nullable = false)
    private String diemDau;

    @Column(name = "diemCuoi", nullable = false)
    private String diemCuoi;

    @Column(name = "doDai", nullable = false)
    private Float doDai;

    @Column(name = "doPhucTapId", nullable = false)
    private Integer doPhucTapId;

}
