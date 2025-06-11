package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;
@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void joinSQL(BuildingSearchRequest builder, StringBuilder sql) {
        Long areaTo=builder.getAreaTo();
        Long areaFrom=builder.getAreaFrom();
        if(StringUtils.check(areaFrom) || StringUtils.check(areaTo)) {
            sql.append(" inner join rentarea ra on ra.buildingid=b.id");
        }
        Long staffId= builder.getStaffId();
        if(StringUtils.check(staffId)) {
            sql.append(" inner join assignmentbuilding asb on asb.buildingid=b.id");
        }
    }
    public void whereNormal(BuildingSearchRequest builder,StringBuilder where) {
        try {
            Field[] fileds= BuildingSearchRequest.class.getDeclaredFields();
            for(Field it:fileds) {
                it.setAccessible(true);
                String fieldName = it.getName().trim();
                if(!fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")
                        && !fieldName.equals("staffId") && !fieldName.equals("typeCode")) {
                    Object value=it.get(builder);
                    if(value!=null && !value.equals("")) {
                        if(it.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b."+fieldName+"="+value.toString().trim());
                        }else if(it.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b."+fieldName+" LIKE '%"+value.toString().trim()+"%'");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void whereSpecial(BuildingSearchRequest builder,StringBuilder where) {
        Long areaTo=builder.getAreaTo();
        Long areaFrom=builder.getAreaFrom();
        if(StringUtils.check(areaFrom)) {
            where.append(" AND value >="+areaFrom);
        }
        if(StringUtils.check(areaTo)) {
            where.append(" AND value <="+areaTo);
        }
        Long rentPriceFrom=builder.getRentPriceFrom();
        Long rentPriceTo=builder.getRentPriceTo();
        if(StringUtils.check(rentPriceFrom)) {
            where.append(" AND b.rentprice >="+rentPriceFrom);
        }
        if(StringUtils.check(rentPriceTo)) {
            where.append(" AND b.rentprice <="+rentPriceTo);
        }
        List<String> typeCode=builder.getTypeCode();
        if(typeCode!=null && typeCode.size()!=0) {
                where.append(" AND (").append(typeCode.stream().map(it -> " type LIKE '%"+it+"%'")
                                                            .collect(Collectors.joining(" OR ")))
                    .append(")");
        }
        Long staffId=builder.getStaffId();
        if(StringUtils.check(staffId)) {
            where.append(" AND staffId="+staffId);
        }
    }

    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        StringBuilder sql=new StringBuilder("Select b.* FROM building b");
        StringBuilder where= new StringBuilder(" Where 1=1");
        joinSQL(buildingSearchRequest, sql);
        whereNormal(buildingSearchRequest, where);
        whereSpecial(buildingSearchRequest, where);
        sql.append(where).append(" GROUP BY (b.id)");
        sql.append(" LIMIT ").append(pageable.getPageSize())
                .append(" OFFSET ").append(pageable.getOffset());
        Query query= entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
            return query.getResultList();
    }// theo phaan trang 4 building

    @Override
    public int countBuildings(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql=new StringBuilder("Select b.* FROM building b");
        StringBuilder where= new StringBuilder(" Where 1=1");
        joinSQL(buildingSearchRequest, sql);
        whereNormal(buildingSearchRequest, where);
        whereSpecial(buildingSearchRequest, where);
        sql.append(where).append(" GROUP BY (b.id)");
        Query query= entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList().size();
    }//8 building
}
