package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.RoomDao;
import com.mugs.vo.Room;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String id){
		return "com.mugs.config.mapper.roomMapper."+id;
	}


	@Override
	public int insertRoom(Room room) {
		return session.insert(makeSql("insertRoom"),room);
	}

	@Override
	public int updateRoom(Room room) {
		return session.update(makeSql("updateRoom"), room);
	}

	@Override
	public int deleteRoom(String roomId) {
		return session.delete(makeSql("deleteRoom"), roomId);
	}

	@Override
	public Room selectRoomById(String roomId) {
		return session.selectOne(makeSql("selectRoomById"), roomId);
	}

	@Override
	public List<Room> selectRoomList() {

		return session.selectList(makeSql("selectRoomList"));
	}
}
