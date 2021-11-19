package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "driver")
@Data
public class Driver implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "id_card", nullable = false)
    private String idCard;

    @Column(name = "driving_license_code", nullable = false)
    private String drivingLicenseCode;

    @Column(name = "type_of_license", nullable = false)
    private String typeOfLicense;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "birthday", nullable = false)
    private Date birthday;

    @Column(name = "experience", nullable = false)
    private Integer experience;

    @Column(name = "is_active", nullable = false)
    private Boolean active;

    @Column(name = "fixed_salary_id", nullable = false)
    private Integer fixedSalaryId;

}
