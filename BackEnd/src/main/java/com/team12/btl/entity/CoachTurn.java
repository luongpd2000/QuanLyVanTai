package com.team12.btl.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Data
@Table(name = "coach_turn")
public class CoachTurn implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "passenger_amount", nullable = false)
    private Integer passengerAmount;

    @Column(name = "ticket_price", nullable = false)
    private Float ticketPrice;

    @Column(name = "start_time", nullable = false)
    private Timestamp startTime;

    @Column(name = "end_time", nullable = false)
    private Timestamp endTime;

    @Column(name = "grade_salary", nullable = false)
    private Float gradeSalary;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "coach_id",referencedColumnName = "id", nullable = false)
    private Coach coach;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "route_id",referencedColumnName = "id", nullable = false)
    private Route route;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "driver_id",referencedColumnName = "id", nullable = false)
    private Driver driver;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "driver_asistant_id",referencedColumnName = "id", nullable = false)
    private Driver driverAsistant;

    @Column(name = "is_active", nullable = false)
    private Boolean active;

}
