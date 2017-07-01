package com.mugs.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.BuildingDao;
import com.mugs.service.admin.BuildingService;
import com.mugs.vo.Building;

@Service
public class BuildingServiceImpl implements BuildingService{

	@Autowired
	private BuildingDao dao;
	
	@Override
	public String insertBuilding(Building building) {
		int cnt = dao.insertBuilding(building);
		if (cnt == 0) {
			return "실패";
		}
		return "성공";
	}

	@Override
	public String updateBuildingById(Building building) {
		int cnt = dao.updateBuildingById(building);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public String deleteBuilding(int buildingId) {
		int cnt = dao.deleteBuilding(buildingId);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public List<Building> selectBuildingList() {
		return dao.selectBuildingList();
	}

	@Override
	public Building selectBuildingById(int buildingId) {
		return dao.selectBuildingById(buildingId);
	}

	@Override
	public Building selectBuildingByIdJoin(int buildingId) {
		return dao.selectBuildingByIdJoin(buildingId);
	}

}
