package com.javaweb.controller.admin;
import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Pageable;
import java.util.List;

@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    UserService userService;
    @Autowired
    BuildingService buildingService;
    @GetMapping("/admin/building-list")
    public ModelAndView getBuildings(@ModelAttribute("modelSearch") BuildingSearchRequest params,
                                    HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/building/list");
        view.addObject("staffs", userService.getListStaff());
        view.addObject("district", District.getDistrict());
        view.addObject("typeCode", TypeCode.getType());
        if(SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)){
            params.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        DisplayTagUtils.of(request, params);
        List<BuildingSearchResponse> buildingSearchResponses = buildingService.buildingSearch(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        BuildingSearchResponse buildingList = new BuildingSearchResponse();
        buildingList.setListResult(buildingSearchResponses);
        buildingList.setTotalItems(buildingService.countTotalItems(params));
        buildingList.setPage(params.getPage());
        view.addObject("buildingList", buildingList);
        return view;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView addBuilding(@ModelAttribute("buildingDTO")BuildingDTO buildingDTO){
        ModelAndView view= new ModelAndView("admin/building/edit");
        view.addObject("district", District.getDistrict());
        view.addObject("typeCode", TypeCode.getType());
        return view;
    }
    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable Long id){
        ModelAndView view= new ModelAndView("admin/building/edit");
        if(SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            if(!buildingService.isStaffOfBuilding(staffId, id)){
                ModelAndView nav = new ModelAndView("redirect:/login?accessDenied");
                return nav;
            }
        }
        view.addObject("district", District.getDistrict());
        view.addObject("typeCode", TypeCode.getType());
        BuildingDTO buildingDTO= new BuildingDTO();
        try {
            buildingDTO = buildingService.findByIḍ(id);
        }catch (Exception e){
            e.getMessage();
            return null;
        }
        view.addObject("buildingDTO", buildingDTO);
        return view;
    }
}
