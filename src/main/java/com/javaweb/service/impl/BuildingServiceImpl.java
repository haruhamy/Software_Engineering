package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Override
    public List<BuildingSearchResponse> buildingSearch(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities=  buildingRepositoryCustom.findBuildings(buildingSearchRequest,pageable);
        List<BuildingSearchResponse> results = new ArrayList<>();
        for(BuildingEntity buildingEntity:buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.toBuildingSearchResponse(buildingEntity);
            results.add(buildingSearchResponse);
        }
        return results;
    }
//    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
//        String path = "/building/" + buildingDTO.getImageName();
//        if (null != buildingDTO.getImageBase64()) {
//            if (null != buildingEntity.getImage()) {
//                if (!path.equals(buildingEntity.getImage())) {
//                    File file = new File("C://home/office" + buildingEntity.getImage());
//                    file.delete();
//                }
//            }
//            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
//            uploadFileUtils.writeOrUpdate(path, bytes);
//            buildingEntity.setImage(path);
//        }
//    }
    @Override
    public BuildingEntity createOrUpdateBuilding(BuildingDTO buildingDTO) throws ServiceException {
        BuildingEntity buildingEntity = buildingConverter.toBuidlingEntity(buildingDTO);
//        saveThumbnail(buildingDTO,buildingEntity);
        List<String> listValue = Arrays.stream(buildingDTO.getRentArea().split(",")).collect(Collectors.toList());
        List<RentAreaEntity> rentAreaEntities= new ArrayList<>();
        for(String item:listValue) {
            RentAreaEntity rentAreaEntity= new RentAreaEntity();
            try {
                rentAreaEntity.setValue(Long.parseLong(item));
            }catch (Exception e){
                throw new ServiceException("Rent Area : "+e.getMessage());
            }
            rentAreaEntity.setBuildingEntity(buildingEntity);
            rentAreaEntities.add(rentAreaEntity);
        }
        buildingEntity.setRentAreas(rentAreaEntities);
        if(buildingEntity.getId() != null){
            BuildingEntity building= buildingRepository.findBuildingEntityById(buildingDTO.getId());
            if(building != null){
                buildingEntity.setUsers(building.getUsers());
            }
        }
        buildingRepository.save(buildingEntity);
        return null;
    }

    @Override
    public BuildingDTO findByIḍ(Long id) throws ServiceException {
        BuildingEntity buildingEntity=buildingRepository.findBuildingEntityById(id);
        if(buildingEntity==null){
            throw new ServiceException("Building not found ");
        }
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public void deleteBuilding(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest) {
        return buildingRepositoryCustom.countBuildings(buildingSearchRequest);
    }

    @Override
    public boolean isStaffOfBuilding(Long staffId, Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findBuildingEntityById(buildingId);
        UserEntity userEntity = userRepository.findById(staffId).get();
        if(buildingEntity.getUsers().contains(userEntity)){
            return true;
        }
        return false;
    }
}
