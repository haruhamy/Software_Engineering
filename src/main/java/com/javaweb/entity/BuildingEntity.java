package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "building")
public class BuildingEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name",nullable = false)
    private String name;

    @Column(name="numberofbasement")
    private Long numberOfBasement;

    @Column(name="ward")
    private String ward;

    @Column(name="street")
    private String street;

    @Column(name = "district")
    private String district;

    @Column(name="floorarea")
    private Long floorArea;

    @Column(name="rentprice", nullable = false)
    private Long rentPrice;

    @Column(name = "rentpricedescription")
    private String rentPriceDescription;

    @Column(name="managername")
    private String managerName;

    @Column(name="managerphone")
    private String managerPhone;

    @Column(name="type")
    private String type;

    @Column(name="servicefee")
    private Long serviceFee;

    @Column(name="brokeragefee")
    private Long brokerageFee;

    @Column(name = "overtimefee")
    private String overtimeFee;

    @Column(name = "electricityfee")
    private String electricityFee;

    @Column(name = "waterfee")
    private  String waterFee;

    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;
    @OneToMany(mappedBy = "buildingEntity",fetch= FetchType.LAZY,cascade ={CascadeType.ALL},orphanRemoval = true)
    List<RentAreaEntity> rentAreas=new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> users = new ArrayList<>();
}
