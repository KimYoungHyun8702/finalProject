package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.LeaveReturnApplicationDao;
import com.mugs.vo.LeaveReturnApplication;

@Repository
public class LeaveReturnApplicationDaoImpl implements LeaveReturnApplicationDao {
	
	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String tagId) {
		return "com.mugs.config.mapper.leaveReturnApplicationMapper." + tagId;
	}
	
	@Override
	public int insertLeaveReturnApplication(LeaveReturnApplication leaveReturnApplication) {
		// TODO Auto-generated method stub
		return session.insert(makeSql("insertLeaveReturnApplication"), leaveReturnApplication);
	}

	@Override
	public int updateLeaveReturnApplication(LeaveReturnApplication leaveReturnApplication) {
		// TODO Auto-generated method stub
		return session.update(makeSql("updateLeaveReturnApplicationById"), leaveReturnApplication);
	}

	@Override
	public int deleteLeaveReturnApplication(int LRApplicationId) {
		// TODO Auto-generated method stub
		return session.delete(makeSql("deleteLeaveReturnApplication"), LRApplicationId);
	}

	@Override
	public List<LeaveReturnApplication> SelectLeaveReturnApplicationList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSql("selectLeaveReturnApplicationList"));
	}

	@Override
	public LeaveReturnApplication SelectLeaveReturnApplicationById(int LRApplicationId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectLeaveReturnApplicationById"), LRApplicationId);
	}

}
