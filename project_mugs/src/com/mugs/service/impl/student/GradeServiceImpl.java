package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.AcademicProbationDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.service.student.GradeService;
import com.mugs.vo.AcademicCalendar;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Credit;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Users;

@Service
public class GradeServiceImpl implements GradeService {
	@Autowired
	private CreditDao dao;
	@Autowired
	private AcademicCalendarDao acDao;
	@Autowired
	private AcademicProbationDao apDao;
	@Autowired
	private EvaluationAnswerDao eaDao;
	@Override
	public List<Integer> getYear(String id) {
		// TODO Auto-generated method stub
		return dao.selectYearByStuId(id);
	}

	@Override
	public List<Credit> getAllCredit(String id) {
		// TODO Auto-generated method stub
		return dao.selectAllCreditByStuId(id);
	}

	@Override
	public List<String> getSemester(String id, int year) {
		return dao.selectSemesterByYear(id, year);
	}

	@Override
	public List<Credit> getCreditByYear(String id, int year) {
		// TODO Auto-generated method stub
		return dao.selectCreditByYear(id, year);
	}

	@Override
	public List<Credit> getCreditByYearSemester(String id, int year, String semester) {
		// TODO Auto-generated method stub
		System.out.println(id);
		System.out.println(year);
		System.out.println(semester);
		return dao.selectCreditByYearAndSemester(id, year, semester);
	}

	@Override
	public List<Credit> getCreditByOneType(String id, String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByOneType(id, type);
	}

	@Override
	public List<Credit> getCreditByType(String id, int year, String semester, String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByType(id, year, semester, type);
	}

	@Override
	public List<Credit> getCreditByYearType(String id, int year, String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByYearType(id, year, type);
	}

	@Override
	public Map getCalendarByYearAndCalName() {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		String message = "접근허용";
		String calName = "1학기성적조회";
		String semester = "1학기";
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		
	/*	if (month >= 3 && month <= 6) {
			calName = "1학기성적조회";
			semester = "1학기";
		} else if (month >= 7 && month <= 8) {
			calName = "여름학기성적조회";
			semester = "여름학기";
		} else if (month >= 9 && month <= 12) {
			calName = "2학기성적조회";
			semester = "2학기";
		} else if (month >= 1 && month <= 2) {
			calName = "겨울학기성적조회";
			semester = "겨울학기";
		}*/

		Date currentDate = new Date();
		AcademicCalendar ac = acDao.selectCalendarByYearCalName(year, calName);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (ac == null || dt.format(ac.getCalendarStart()).compareTo(dt.format(currentDate)) == 1
				|| dt.format(ac.getCalendarFinish()).compareTo(dt.format(currentDate)) == -1) {
			message = "성적조회 기간이 아닙니다.";
		}else{
			for(EvaluationAnswer ea :eaDao.selectEvaluationAnswerValueList(users.getUsersId(), year, semester)){
				if(ea.getEvaluationAnswerState().equals("N")){
					message = "수강설문 미응답자 성적조회 불가!";
					break;
				}
			}
			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		map.put("year", year);
		map.put("semester", semester);

		return map;
	}

	@Override
	public List<AcademicProbation> getAcademicProbationByStuId(String stuId) {
		
		return apDao.selectAcademicProbationByStuId(stuId);
	}

}
