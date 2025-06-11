package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.Status;
import com.javaweb.enums.Transaction;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController(value="customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    @Autowired
    private TransactionService transactionService;
    @Autowired
    UserService userService;
    @GetMapping("/admin/customer-list")
    public ModelAndView getBuildings(@ModelAttribute("customerSearch") CustomerSearchRequest params,
                                     HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/customer/list");
        view.addObject("staffs", userService.getListStaff());
        view.addObject("status", Status.getType());
        if(SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)){
            params.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        DisplayTagUtils.of(request, params);
        List<CustomerEntity> customerSearchResponses = customerService.findCustomer(params,PageRequest.of(params.getPage()-1,params.getMaxPageItems()));
        CustomerSearchResponse customerList= new CustomerSearchResponse();
        customerList.setListResult(customerSearchResponses);
        customerList.setTotalItems(customerService.countCustomer(params));
        customerList.setPage(params.getPage());
        view.addObject("customerList", customerList);
        return view;
    }

    @GetMapping("/admin/customer-edit")
    public ModelAndView addBuilding(@ModelAttribute("customerDTO") CustomerSearchRequest params){
        ModelAndView view= new ModelAndView("admin/customer/edit");
        view.addObject("transactionType", Transaction.getTransactionType());
        view.addObject("status", Status.getType());
        return view;
    }
    @GetMapping("/admin/customer-edit-{id}")
    public ModelAndView editBuilding(@PathVariable Long id){
        ModelAndView view= new ModelAndView("admin/customer/edit");
        if(SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            if(!customerService.isStaffOfCustomer(staffId, id)){
                ModelAndView nav = new ModelAndView("redirect:/login?accessDenied");
                return nav;
            }
        }
        view.addObject("transactionType", Transaction.getTransactionType());

        CustomerDTO customerDTO = new CustomerDTO();
        try {
            customerDTO = customerService.findByIdandIsActive(id,1);
        }catch (Exception e){
            e.getMessage();
            return null;
        }
        view.addObject("status", Status.getType());
        view.addObject("customerDTO", customerDTO);

        List<TransactionEntity> CSKH = transactionService.getTransactionByCodeAndCustomerId("CSKH",id);
        List<TransactionEntity> DDX = transactionService.getTransactionByCodeAndCustomerId("DDX",id);
        view.addObject("CSKH", CSKH);
        view.addObject("DDX", DDX);
        return view;
    }
}
