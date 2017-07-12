package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.AcademicProbationDao;
import com.mugs.dao.CreditDao;
import com.mugs.service.student.GradeService;
import com.mugs.vo.AcademicCalendar;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Credit;

@Service
public class GradeServiceImpl implements GradeService {
	@Autowired
	private CreditDao dao;
	@Autowired
	private AcademicCalendarDao acDao;
	@Autowired
	private AcademicProbationDao apDao;

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
	public List<String> getSemester(int year) {
		return dao.selectSemesterByYear(year);
	}

	@Override
	public List<Credit> getCreditByYear(int year) {
		// TODO Auto-generated method stub
		return dao.selectCreditByYear(year);
	}

	@Override
	public List<Credit> getCreditByYearSemester(int year, String semester) {
		// TODO Auto-generated method stub
		return dao.selectCreditByYearAndSemester(year, semester);
	}

	@Override
	public List<Credit> getCreditByOneType(String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByOneType(type);
	}

	@Override
	public List<Credit> getCreditByType(int year, String semester, String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByType(year, semester, type);
	}

	@Override
	public List<Credit> getCreditByYearType(int year, String type) {
		// TODO Auto-generated method stub
		return dao.selectCreditByYearType(year, type);
	}

	@Override
	public Map getCalendarByYearAndCalName() {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		String message = "접근허용";
		String calName = "안갔어";
		String semester = "안학기~";
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		
		System.out.println(month);
		if (month >= 3 && month <= 6) {
			calName = "1학기성적조회";
			semester = "1";
		} else if (month >= 7 && month <= 8) {
			calName = "여름학기성적조회";
			semester = "여름학기";
		} else if (month >= 9 && month <= 12) {
			calName = "2학기성적조회";
			semester = "2학기";
		} else if (month >= 1 && month <= 2) {
			calName = "겨울학기성적조회";
			semester = "겨울학기";
		}

		Date currentDate = new Date();
		AcademicCalendar ac = acDao.selectCalendarByYearCalName(year, calName);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");

		if (ac == null || dt.format(ac.getCalendarStart()).compareTo(dt.format(currentDate)) == 1
				|| dt.format(ac.getCalendarFinish()).compareTo(dt.format(currentDate)) == -1) {
			message = "접근불가";
		}
		
		System.out.println(message);
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
