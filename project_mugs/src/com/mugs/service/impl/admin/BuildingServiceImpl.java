package com.mugs.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.BuildingDao;
import com.mugs.dao.RoomDao;
import com.mugs.service.admin.BuildingService;
import com.mugs.vo.Building;
import com.mugs.vo.Room;

@Service
public class BuildingServiceImpl implements BuildingService{

	@Autowired
	private BuildingDao buildingDao;
	@Autowired
	private RoomDao	roomDao;
	
	@Override
	public String insertBuilding(Building building) {
		int cnt = buildingDao.insertBuilding(building);
		if (cnt == 0) {
			return "실패";
		}
		return "성공";
	}

	@Override
	public String updateBuildingById(Building building) {
		int cnt = buildingDao.updateBuildingById(building);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public String deleteBuilding(int buildingId) {
		int cnt = buildingDao.deleteBuilding(buildingId);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public List<Building> selectBuildingList() {
		return buildingDao.selectBuildingList();
	}

	@Override
	public Building selectBuildingById(int buildingId) {
		if(buildingDao.selectBuildingByIdJoin(buildingId) == null){
			return buildingDao.selectBuildingById(buildingId);
		}else{
			return buildingDao.selectBuildingByIdJoin(buildingId);
		}		
	}

	@Override
	public Building selectBuildingByIdJoin(int buildingId) {
		return buildingDao.selectBuildingByIdJoin(buildingId);
	}

	@Override
	public int insertRoom(Room room) {
		int cnt = roomDao.insertRoom(room);
		if(cnt == 0 ){
			return 0;
		}else{
			return room.getBuildingId();
		}
	}

	@Override
	public int updateRoom(Room room) {
		int cnt = roomDao.updateRoom(room);
		if(cnt == 0 ){
			return 0;
		}else{
			return room.getBuildingId();
		}
	}

	@Override
	public List<Room> selectRoom() {
		return roomDao.selectRoomList();
	}

	@Override
	public List<Room> selectRoomByReference(int buildingId) {
		return roomDao.selectRoomByReference(buildingId);
	}

	@Override
	public int deleteRoom(int roomId) {
		int buildingId = roomDao.selectRoomById(roomId).getBuildingId();
		int cnt = roomDao.deleteRoom(roomId);
		if(cnt == 0 ){
			return 0;
		}else{
			return buildingId;
		}
	}

	@Override
	public Room selectById(int roomId) {
		return roomDao.selectRoomById(roomId);
	}	
}
