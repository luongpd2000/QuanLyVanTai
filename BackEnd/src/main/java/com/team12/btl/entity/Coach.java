package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "coach")
@Data
public class Coach implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "plate", nullable = false)
    private String plate;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "manufacturer", nullable = false)
    private String manufacturer;

    @Column(name = "capacity", nullable = false)
    private Integer capacity;

    @Column(name = "years_of_use", nullable = false)
    private Float yearsOfUse;

    @Column(name = "last_maintenance_day", nullable = false)
    private Date lastMaintenanceDay;

    @Column(name = "is_active", nullable = false)
    private Boolean active;

}
