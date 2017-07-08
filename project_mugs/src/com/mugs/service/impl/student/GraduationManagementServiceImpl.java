package com.mugs.service.impl.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CreditDao;
import com.mugs.dao.GraduationCreditDao;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.Credit;
import com.mugs.vo.GraduationCredit;

@Service
public class GraduationManagementServiceImpl implements GraduationManagementService{
	@Autowired
	CreditDao creditDao;
	@Autowired
	GraduationCreditDao graCreditDao;
	@Autowired
	StudentDao stuDao;
	
	
	@Override
	public List<String> getMajorList() {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 해당 학생의 졸업기준학점, 이수학점, 졸업시험 통과여부를 조회한다.
	 */
	@Override
	public Map<String,Object> getCreditByYearAndSemesterAndUsersIdForGraduInfo(int year, String semester, int majorId, String usersId) {
		Map<String,Object> creditsAndGraduCredit = new HashMap<String, Object>();
		List<Credit> credits = creditDao.selectCreditByYearSemesterAndUsersId(year, semester, usersId);
		GraduationCredit gradCredit = graCreditDao.selectGraduationCreditByMajorIdAndUsersId(majorId, year, usersId);
		String gradExamPass = stuDao.selectStuGraduationExam(usersId);
		creditsAndGraduCredit.put("credits", credits);
		creditsAndGraduCredit.put("gradCredit", gradCredit);
		creditsAndGraduCredit.put("gradExamPass", gradExamPass);
		return creditsAndGraduCredit;
	}



}

