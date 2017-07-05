package com.mugs.service.impl.student;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mugs.dao.CourseDao;
import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.EvaluationAnswer;

public class EvaluationManagementServiceImpl implements EvaluationManagementService {

	@Autowired
	EvaluationAnswerDao evaluationDaoImpl;
	
	@Autowired
	CourseDao courseDaoImpl;

	@Override
	public List<EvaluationAnswer> getEvaluationValueList(String loginId) {
		Date date = new Date();
		int nowYear = date.getYear() + 1900;
		// int nowMonth = date.getMonth();//-1해줘야 함
		String nowSemester = "1학기";// 학기는 원래 여기서 해주지 않고 디비를 통해서 서비스에서 가져오는 건데 일단 이렇게

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드 - 학사일정테이블 필요
		// String nowSemester = courseDaoImpl.selectHackGiIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";
		
		List<EvaluationAnswer> evaluationAnswerValueList = evaluationDaoImpl.selectEvaluationAnswerValueList(loginId, nowYear, nowSemester);

		return evaluationAnswerValueList;
	}

}
