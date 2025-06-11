package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void joinSQL(CustomerSearchRequest customer, StringBuilder sql) {
        Long staffId = customer.getStaffId();
        if(StringUtils.check(staffId)) {
            sql.append(" inner join assignmentcustomer ac on ac.customerid=c.id ");
        }
    }

    public void whereNormal(CustomerSearchRequest customer, StringBuilder where) {
        try {
            Field[] fileds= CustomerSearchRequest.class.getDeclaredFields();
            for(Field it:fileds) {
                it.setAccessible(true);
                String fieldName = it.getName().trim();
                    Object value=it.get(customer);
                    if(!fieldName.equals("staffId") && !fieldName.equals("status")) {
                        if(value!=null && !value.equals("")) {
                            if(it.getType().getName().equals("java.lang.Long")) {
                                where.append(" AND c."+fieldName+"="+value.toString().trim());
                            }else if(it.getType().getName().equals("java.lang.String")) {
                                where.append(" AND c."+fieldName.trim()+" LIKE '%"+value.toString().trim()+"%'");
                            }
                        }
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void whereSpecial(CustomerSearchRequest customer, StringBuilder where) {
        if(StringUtils.check(customer.getStaffId())) {
            where.append(" AND ac.staffid="+customer.getStaffId());
        }
        if(StringUtils.check(customer.getStatus())) {
            where.append(" AND c.status LIKE '%"+ Status.valueOf(Status.class, customer.getStatus()).getStatusName()+"%'");
        }
    }

    @Override
    public List<CustomerEntity> findCustomer(CustomerSearchRequest request, Pageable pageable) {
        StringBuilder sql = new StringBuilder("Select c.* from customer c ");
        joinSQL(request, sql);
        sql.append(" where 1=1 ");
        whereNormal(request, sql);
        whereSpecial(request, sql);
        sql.append(" order by c.createddate desc ");
        sql.append(" LIMIT ").append(pageable.getPageSize()).append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    public int countCustomer(CustomerSearchRequest request){
        StringBuilder sql = new StringBuilder("select c.* from customer c ");
        joinSQL(request, sql);
        sql.append(" where 1=1 ");
        whereNormal(request, sql);
        sql.append(" order by c.createddate desc ");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList().size();
    }
}
