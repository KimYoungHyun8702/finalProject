package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.BuildingDao;
import com.mugs.vo.Building;

@Repository
public class BuildingDaoImpl implements BuildingDao {

	// Spring Container에서 SqlSessionTemplate을 주입받아서 instance변수로 대입
	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String tagId) {
		return "com.mugs.config.mapper.buildingMapper." + tagId;
	}

	@Override
	public int insertBuilding(Building building) {
		return session.insert(makeSql("insertBuilding"), building);
	}

	@Override
	public int updateBuildingById(Building building) {
		return session.update(makeSql("updateBuildingById"), building);
	}

	@Override
	public int deleteBuilding(int buildingId) {
		return session.delete(makeSql("deleteBuilding"), buildingId);
	}

	@Override
	public Building selectBuildingById(int buildingId) {
		return session.selectOne(makeSql("selectBuildingById"), buildingId);
	}

	@Override
	public Building selectBuildingByIdJoin(int buildingId) {
		return session.selectOne(makeSql("selectBuildingByIdJoin"), buildingId);
	}

	@Override
	public List<Building> selectBuildingList() {
		return session.selectList(makeSql("selectBuildingList"));
	}

	@Override
	public Building selectBuildingByBuildingName(String buildingName) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectBuildingByBuildingName"), buildingName);
	}

	public List<Building> selectRoomListByOffice() {
		return session.selectList(makeSql("selectRoomListByOffice"));
	}

	@Override
	public List<Building> selectRoomListByLaboratory() {
		return session.selectList(makeSql("selectRoomListByLaboratory"));
	}
	
}
