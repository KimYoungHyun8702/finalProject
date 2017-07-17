package com.mugs.dao;

import java.util.Date;
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
	List<LeaveReturnApplication> selectLeaveReturnApplicationList();
	
	/**
	 * 매개변수로 LRApplicationId를 받아 해당되는 휴복학 내역 조회하는 메소드
	 * @param LRApplicationId
	 * @return
	 */
	LeaveReturnApplication selectLeaveReturnApplicationById(int LRApplicationId);
	
	/**
	 * 매개변수로 StuId를 받아서 해당 학생의 휴복학 내역 조회하는 메소드
	 * 
	 * By Baek.J.H
	 * @param StuId
	 * @return
	 */
	List<LeaveReturnApplication> selectLeaveReturnApplicationByStuId(String stuId);
	
	/**
	 * 휴복학 전체 조회 메소드
	 * @return
	 */
	List<LeaveReturnApplication> selectLeaveReturnApplicationJoin();
	
	/**
	 * 매개변수로 휴복학신청기간 시작일자, 종료일자, 학생ID를 받아서 그안에 신청한 휴복한신청 내역을 조회하는 메소드 
	 * 
	 * By Baek.J.H
	 * @param startDate
	 * @param finishDate
	 * @return
	 */
	List<LeaveReturnApplication> selectLeaveReturnApplicationByDate(Date startDate, Date finishDate, String stuId);
}
