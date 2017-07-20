package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.CreditGiveUpDao;
import com.mugs.dao.LeaveReturnApplicationDao;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.ApplyService;
import com.mugs.vo.AcademicCalendar;
import com.mugs.vo.Credit;
import com.mugs.vo.CreditGiveUp;
import com.mugs.vo.LeaveReturnApplication;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	private LeaveReturnApplicationDao leaveReturnApplicationDaoImpl;
	
	@Autowired
	private StudentDao studentDaoImpl;
	
	@Autowired
	private AcademicCalendarDao academicCalendarDaoImpl;
	
	@Autowired
	private CreditDao creditDaoImpl;
	
	@Autowired
	private CreditGiveUpDao creditGiveUpDaoImpl;
	
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
		Date startDate = null;
		Date finishDate = null;
		String stuRegister = studentDaoImpl.selectStudentById(stuId).getStuRegisterState();
		
		List<LeaveReturnApplication> leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
		
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date  = new Date();
		
		String dateStr = dataFormat.format(date);
		
		List<AcademicCalendar> academicCalendarList = 
				academicCalendarDaoImpl.selectCalendarByDate(dateStr);
		
		for(int i = 0; i < academicCalendarList.size(); i++) {
			if(academicCalendarList.get(i).getCalendarName().contains("휴복학")) {
				term = academicCalendarList.get(i).getCalendarName();
				startDate = academicCalendarList.get(i).getCalendarStart();
				finishDate = academicCalendarList.get(i).getCalendarFinish();
			}
		}
		
		if(term == null) {
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
		
		leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByDate(startDate, finishDate, stuId);
		
		if(leaveReturnApplicationlist.size() != 0) {
			msg = "이미 신청하셨습니다. 부득이한 경우 과사로 하시기 바랍니다.";
			map.put("msg", msg);
			return map;
		}
		
		leaveReturnApplicationDaoImpl.insertLeaveReturnApplication(new LeaveReturnApplication(0, LRApplicationType, date, null, "대기", stuId));
		
		leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
		msg = "신청되었습니다.";
		
		map.put("leaveReturnApplicationlist", leaveReturnApplicationlist);
		map.put("msg", msg);
		return map;
	}

	/**
	 * LRApplicationId로 해당 휴복학신청 내역 삭제후 
	 * stuId를 통해 해당 학생ID의 휴복학 신청내역을 찾아서 리턴
	 * 
	 * By Baek.J.H
	 */
	@Override
	public HashMap<String, Object> deleteLeaveReturnApplicationById(String stuId, int LRApplicationId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		leaveReturnApplicationDaoImpl.deleteLeaveReturnApplication(LRApplicationId);
		
		List<LeaveReturnApplication> leaveReturnApplicationlist = leaveReturnApplicationDaoImpl.selectLeaveReturnApplicationByStuId(stuId);
		map.put("leaveReturnApplicationlist", leaveReturnApplicationlist);
		return map;
	}

	/**
	 * stuId를 매개변수로 해당 학생의 학점포기내역과 학점포기 기간이면 포기할수 있는
	 * 학점 리스트를 함께 리턴
	 * 
	 * By Baek.J.H
	 */
	@Override
	public HashMap<String, Object> findCreditGiveUpList(String stuId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		String term = null;
		String msg = null;
		String stuRegister = studentDaoImpl.selectStudentById(stuId).getStuRegisterState();
		String semester = null;
		int nowYear = new Date().getYear() + 1900;

		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date  = new Date();
		
		String dateStr = dataFormat.format(date);
		
		List<CreditGiveUp> creditGiveUpList = creditGiveUpDaoImpl.selectCreditGiveUpByStuId(stuId);
		
		List<AcademicCalendar> academicCalendarList = 
				academicCalendarDaoImpl.selectCalendarByDate(dateStr);
		
		for(int i = 0; i < academicCalendarList.size(); i++) {
			if(academicCalendarList.get(i).getCalendarName().contains("학점포기")) {
				term = academicCalendarList.get(i).getCalendarName();
			}
			
			if(academicCalendarList.get(i).getCalendarName().contains("학기") 
					&& academicCalendarList.get(i).getCalendarName().length() < 5) {
				semester = academicCalendarList.get(i).getCalendarName();
			}
		}
		
		if(term == null) {
			msg = "지금은 학점포기 기간이 아닙니다.";
			map.put("msg", msg);
			if(creditGiveUpList.size() != 0) {
				map.put("creditGiveUpList", creditGiveUpList);
				return map;
			}
		} else if(stuRegister.equals("휴학")) {
			msg = "휴학생은 학점포기를 할수 없습니다.";
			map.put("msg", msg);
			if(creditGiveUpList.size() != 0) {
				map.put("creditGiveUpList", creditGiveUpList);
				return map;
			}
		}
		
		List<Credit> creditList = creditDaoImpl.selectCreditByYearSemesterStdId(nowYear, semester, stuId);
		
		if(creditList.size() != 0) {
			map.put("creditList", creditList);
		}
		
		if(creditGiveUpList.size() != 0) {
			map.put("creditGiveUpList", creditGiveUpList);
		}
		return map;
	}
	
	/**
	 * creditId를 매개변수로 해당 학점을 학점포기 테이블에 대기상태로 insert시킨다.
	 * 
	 * By Baek.J.H
	 */
	@Override
	public HashMap<String, Object> addCreditGiveUp(int creditId, String stuId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		Credit credit = creditDaoImpl.selectCreditById(creditId);
		
		List<CreditGiveUp> creditGiveUpList = creditGiveUpDaoImpl.selectCreditGiveUpByStuIdYearSemester(stuId, credit.getCreditYear(), credit.getCreditSemester());
		
		int creditAcquireSum = 0;
		String msg = null;
		
		if(creditGiveUpList.size() != 0) {
			for(int i = 0; i < creditGiveUpList.size(); i++) {
				creditAcquireSum += creditGiveUpList.get(i).getCredit().getCreditAcquire();
			}
		}
		
		if(creditAcquireSum + credit.getCreditAcquire() > 6) {
			msg = "해당기간에 6학점 초과의 학점은 포기할수 없습니다.";
			List<Credit> creditList = creditDaoImpl.selectCreditByYearSemesterStdId(credit.getCreditYear(), credit.getCreditSemester(), stuId);
			map.put("msg", msg);
			map.put("creditGiveUpList", creditGiveUpList);
			map.put("creditList", creditList);
			return map;
		}
		
		creditGiveUpDaoImpl.insertCreditGiveUp(new CreditGiveUp(0, credit.getCreditYear(), credit.getCreditSemester(), new Date(), null, "대기", creditId));
		creditGiveUpList = creditGiveUpDaoImpl.selectCreditGiveUpByStuId(stuId);
		List<Credit> creditList = creditDaoImpl.selectCreditByYearSemesterStdId(credit.getCreditYear(), credit.getCreditSemester(), stuId);
		msg = "신청완료 했습니다.";
		map.put("msg", msg);
		map.put("creditGiveUpList", creditGiveUpList);
		map.put("creditList", creditList);

		return map;
	}
	
	/**
	 * ㅁㄴ람어하;ㅣㅇㄹ너
	 * 
	 * By Baek.J.H
	 */
	@Override
	public HashMap<String, Object> deleteCreditGiveUp(String stuId, int CGUId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(stuId);
		System.out.println(CGUId);
		String msg = null;
		CreditGiveUp creditGiveUp = creditGiveUpDaoImpl.selectCreditGiveUpById(CGUId);
		
		int nowYear = creditGiveUp.getCGUYear();
		String semester = creditGiveUp.getCGUSemester();
		
		creditGiveUpDaoImpl.deleteCreditGiveUp(CGUId);
		
		List<Credit> creditList = creditDaoImpl.selectCreditByYearSemesterStdId(nowYear, semester, stuId);
		List<CreditGiveUp> creditGiveUpList = creditGiveUpDaoImpl.selectCreditGiveUpByStuId(stuId);
		msg = "신청 취소되었습니다.";
		map.put("msg", msg);
		map.put("creditList", creditList);
		map.put("creditGiveUpList", creditGiveUpList);
		return map;
	}
}