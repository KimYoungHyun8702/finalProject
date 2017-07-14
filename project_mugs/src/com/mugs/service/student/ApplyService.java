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
}
