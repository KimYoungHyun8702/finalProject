package com.mugs.service.admin;

import java.util.List;

import com.mugs.vo.Building;
import com.mugs.vo.Room;

public interface BuildingService {
	
	/**
	 * 하나의 건물 등록하는 메소드
	 * @param building
	 * @return
	 */
	String insertBuilding(Building building);
	
	/**
	 * 하나의 건물 수정하는 메소드
	 * @param building
	 * @return
	 */
	String updateBuildingById(Building building);
	
	/**
	 * 매개변수로 buildingId를 받아 해당하는 건물 삭제하는 메소드
	 * @param buildingId
	 * @return
	 */
	String deleteBuilding(int buildingId);
	
	/**
	 * 건물 전체를 조회하는 메소드
	 * @return
	 */
	List<Building> selectBuildingList();
	
	/**
	 * 매개변수로 BuildingId를 받아 해당하는 건물 조회하는 메소드Join
	 * @param buildingId
	 * @return
	 */
	Building selectBuildingByIdJoin(int buildingId);
	
	/**
	 * 매개변수로 BuildingId를 받아 해당하는 건물 조회하는 메소드
	 * @param buildingId
	 * @return
	 */
	Building selectBuildingById(int buildingId);
	
	/**
	 * 하나의 강의실 등록 메소드
	 * @param room
	 * @return
	 */
	int insertRoom(Room room);
	
	/**
	 * 하나의 강의실 수정 메소드
	 * @param room
	 * @return
	 */
	int updateRoom(Room room);
	
	/**
	 * 강의실 전체 조회 메소드
	 * @return
	 */
	List<Room> selectRoom();
	
	/**
	 * 매개변수로 buildingId를 받아 조회하는 메소드
	 * @param buildingId
	 * @return
	 */
	List<Room> selectRoomByReference(int buildingId);
	
	/**
	 * 매개변수로 roomId를 받아 삭제하는 메소드
	 * @param roomId
	 * @return
	 */
	int deleteRoom(int roomId);
	
	/**
	 * 매개변수로 roomId를 받아 조회하는 메소드
	 * @param roomId
	 * @return
	 */
	Room selectById(int roomId);
	
	/**
	 * 교수실강의동 강의실 조회 메소드
	 * @return
	 */
	List<Building> selectRoomListByOffice();
	
	/**
	 * 연구실강의동 강의실 조회 메소드
	 * @return
	 */
	List<Building> selectRoomListByLaboratory();

}
