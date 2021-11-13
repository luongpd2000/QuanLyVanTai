package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbldophuctap")
@Data
public class DoPhucTap implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "do_phuc_tap", nullable = false)
    private Integer doPhucTap;

    @Column(name = "he_so_luong", nullable = false)
    private Float heSoLuong;

}
