package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.LeaveReturnApplicationDao;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.ApplyService;
import com.mugs.vo.AcademicCalendar;
import com.mugs.vo.LeaveReturnApplication;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	private LeaveReturnApplicationDao leaveReturnApplicationDaoImpl;
	
	@Autowired
	private StudentDao studentDaoImpl;
	
	@Autowired
	private AcademicCalendarDao academicCalendarDaoImpl;
	
	/**
	 * 현재 로그인된 학생ID를 가지고 휴복학 내역을 가져온다.
	 * 
	 * By Baek.J.H
	 */
	@Override
	public List<LeaveReturnApplication> findLeaveReturnApplicationListByStuId(String stuId) {
		// TODO Auto-generated method stub
		return leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
	}
	
	/**
	 * 학생ID와 신청종류를 매개변수로 받아서 휴/복학신청이 가능하면 신청을 하고 신청이 안되면 안되는 이유메세지를 리턴
	 * 
	 * By Baek.J.H
	 */
	@Override
	public HashMap<String, Object> addLeaveReturnApplication(String stuId, String LRApplicationType) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		String term = null;
		String msg = null;
		String stuRegister = studentDaoImpl.selectStudentById(stuId).getStuRegisterState();
		
		List<LeaveReturnApplication> leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
		
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date  = new Date();
		
		String dateStr = dataFormat.format(date);
		
		List<AcademicCalendar> academicCalendarList = 
				academicCalendarDaoImpl.selectCalendarByDate(dateStr);
		
		for(int i = 0; i < academicCalendarList.size(); i++) {
			term = academicCalendarList.get(i).getCalendarName();
		}
		
		if(term == null || !term.contains("휴복학")) {
			msg = "휴복학 신청기간이 아닙니다.";
			map.put("msg", msg);
			return map;
		}
		
		if(stuRegister.equals("휴학")) {
			if(LRApplicationType.equals("휴학")) {
				msg = "휴학생은 휴학신청을 할수 없습니다.";
				map.put("msg", msg);
				return map;
			}
		} else if(stuRegister.equals("재학")) {
			if(LRApplicationType.equals("복학")) {
				msg = "재학생은 복학신청을 할수 없습니다.";
				map.put("msg", msg);
				return map;
			}
		}
		
		if (LRApplicationType.equals("휴학")) {
			for(int i = 0; i < leaveReturnApplicationlist.size(); i++) {
				if(leaveReturnApplicationlist.get(i).getLRApplicationType().equals("휴학") && leaveReturnApplicationlist.get(i).getLRApplicationState().equals("대기")) {
					msg = "승인 대기중인 휴학신청이 있습니다.";
					map.put("msg", msg);
					return map;
				} 
			}	
		} else {
			for(int i = 0; i < leaveReturnApplicationlist.size(); i++) {
				if(leaveReturnApplicationlist.get(i).getLRApplicationType().equals("복학") && leaveReturnApplicationlist.get(i).getLRApplicationState().equals("대기")) {
					msg = "승인 대기중인 복학신청이 있습니다.";
					map.put("msg", msg);
					return map;
				}
			}
		}
		
		leaveReturnApplicationDaoImpl.insertLeaveReturnApplication(new LeaveReturnApplication(0, LRApplicationType, date, null, "대기", stuId));
		
		leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
		msg = "신청되었습니다.";
		
		map.put("leaveReturnApplicationlist", leaveReturnApplicationlist);
		map.put("msg", msg);
		return map;
	}
}