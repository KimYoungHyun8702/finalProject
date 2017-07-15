package com.mugs.service.student;

import java.util.HashMap;
import java.util.List;

import com.mugs.vo.LeaveReturnApplication;

public interface ApplyService {
	
	/**
	 * 학생ID를 매개변수로 해당학생의 휴복학내역을 가져온다.
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @return
	 */
	List<LeaveReturnApplication> findLeaveReturnApplicationListByStuId(String stuId);
	
	/**
	 * 학생ID와 신청종류를 매개변수로 받아서 휴/복학신청이 가능하면 신청을 하고 신청이 안되면 안되는 이유메세지를 리턴
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @return
	 */
	HashMap<String, Object> addLeaveReturnApplication(String stuId, String LRApplicationType);
	
	/**
	 * LRApplicationId를 매개변수로 해당 휴복학신청 내역을 삭제하고 해당 학생ID로 휴복학 신청 내역을 받아온다.
	 * 
	 * By Baek.J.H
	 * @param LRApplicationId
	 * @param stuId
	 * @return
	 */
	HashMap<String, Object> deleteLeaveReturnApplicationById(String stuId, int LRApplicationId);
	
	/**
	 * stuId를 매개변수로 해당 학생의 학점포기내역과 학점포기 기간이면 포기할수 있는
	 * 학점 리스트를 함께 리턴
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @return
	 */
	HashMap<String, Object> findCreditGiveUpList(String stuId);
	
	/**
	 * creditId를 매개변수로 해당 학점을 학점포기 테이블에 대기상태로 insert시킨다. 
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @param creditId
	 * @return
	 */
	HashMap<String, Object> addCreditGiveUp(int creditId, String stuId);
	
	/**
	 * CGUId를 매개변수로 해당 학점포기신청 내역 삭제
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @param CGUId
	 * @return
	 */
	HashMap<String, Object>deleteCreditGiveUp(String stuId, int CGUId);
}
