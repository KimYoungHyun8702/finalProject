
package com.mugs.dao;

import java.util.List;


import com.mugs.vo.Room;

public interface RoomDao {

	
	/**
	 * 한 강의실의 데이터를 insert하는 메소드
	 * @param room
	 * @return
	 */
	int insertRoom(Room room);
	
	
	/**
	 * 한 강의실의 데이터를 update하는 메소드
	 * @param room
	 * @return
	 */
	int updateRoom(Room room);
	
	
	/**
	 * 매개변수로 방id를 받아서 한 강의실의 데이터를 delete하는 메소드
	 * @param roomId
	 * @return
	 */
	int deleteRoom(int roomId);
	
	
	/**
	 * 매개변수로 방id를 받아서 해당되는 강의실 정보를 select하는 메소드
	 * @param roomId
	 * @return
	 */
	Room selectRoomById(int roomId);
	
	
	/**
	 * Room테이블의 모든 강의실 정보를 select하는 메소드
	 * @return
	 */
	List<Room> selectRoomList();
	
	/**
	 * 매개변수로 강의동을 받아서 조회하는 메소드
	 * @param buildingId
	 * @return
	 */
	List<Room> selectRoomByReference(int buildingId);



	



}
