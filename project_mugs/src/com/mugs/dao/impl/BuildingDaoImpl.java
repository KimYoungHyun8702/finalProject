package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.BuildingDao;
import com.mugs.vo.Building;

@Repository
public class BuildingDaoImpl implements BuildingDao{

	//Spring Container에서 SqlSessionTemplate을 주입받아서 instance변수로 대입
	@Autowired
	private SqlSessionTemplate session;
	private String makeSql(String tagId){
		return "com.mugs.config.mapper.buildingMapper."+tagId;
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
		return session.delete(makeSql("deleteBuildingById"), buildingId);
	}

	@Override
	public Building selectBuildingById(int buildingId) {
		return session.selectOne(makeSql("selectBuildingById"), buildingId);
	}

	@Override
	public List<Building> selectBuildingList() {
		return session.selectList(makeSql("selectBuildingList"));
	}

}
