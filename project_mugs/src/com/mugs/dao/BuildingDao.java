package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Building;

public interface BuildingDao {
	
	/**
	 * 한 건물의 데이터를 insert하는 메소드
	 * 
	 * @param building 
	 * @return
	 */
	int insertBuilding(Building building);
	
	/**
	 * 매개변수로 받은 Building 객체의 id와 일치하는 건물의 나머지 정보를 update 하는 메소드
	 * 
	 * @param building
	 * @return
	 */
	int updateBuildingById(Building building);
	
	/**
	 * 매개변수로 받은 buildingId와 일치하는 building data를 삭제하는 메소드.
	 * 
	 * @param buildingId
	 * @return
	 */
	int deleteBuilding(int buildingId);
	
	/**
	 * 매개변수로 받은 buildingId와 일치하는 building data를 select하는 메소드
	 * 
	 * @param buildingId
	 * @return
	 */
	Building selectBuildingById(int buildingId);
	
	/**
	 * 모든 Building data들을 select하는 메소드
	 * 
	 * @return
	 */
	List<Building> selectBuildingList();
	
}
