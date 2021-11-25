package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "route")
@Data
public class Route implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "point_of_departure", nullable = false)
    private String pointOfDeparture;

    @Column(name = "destination", nullable = false)
    private String destination;

    @Column(name = "length", nullable = false)
    private Float length;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "complexity_id",referencedColumnName = "complexity", nullable = false)
    private Complexity complexity;

    @Column(name = "is_active", nullable = false)
    private Boolean active;

}
