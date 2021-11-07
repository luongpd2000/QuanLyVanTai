package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "tbldophuctap")
@Data
public class DoPhucTap implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "doPhucTap", nullable = false)
    private Integer doPhucTap;

    @Column(name = "heSoLuong", nullable = false)
    private Float heSoLuong;

}
