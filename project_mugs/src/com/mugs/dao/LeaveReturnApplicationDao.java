package com.mugs.dao;

import java.util.List;

import com.mugs.vo.LeaveReturnApplication;

public interface LeaveReturnApplicationDao {
	
	/**
	 * 휴복학 내역 한 개  insert하는 메소드
	 * @param leaveReturnApplication
	 * @return
	 */
	int insertLeaveReturnApplication(LeaveReturnApplication leaveReturnApplication);
	
	/**
	 * 휴복학 내역 update하는 메소드
	 * @param leaveReturnApplication
	 * @return
	 */
	int updateLeaveReturnApplication(LeaveReturnApplication leaveReturnApplication);
	
	/**
	 * 매개변수로 LRApplicationId를 받아 휴복학 내역 delete하는 메소드
	 * @param LRApplicationId
	 * @return
	 */
	int deleteLeaveReturnApplication(int LRApplicationId);
	
	/**
	 * 휴복학 내역 전체 조회하는 메소드
	 * @return
	 */
	List<LeaveReturnApplication> SelectLeaveReturnApplicationList();
	
	/**
	 * 매개변수로 LRApplicationId를 받아 해당되는 휴복학 내역 조회하는 메소드
	 * @param LRApplicationId
	 * @return
	 */
	LeaveReturnApplication SelectLeaveReturnApplicationById(int LRApplicationId);
}
