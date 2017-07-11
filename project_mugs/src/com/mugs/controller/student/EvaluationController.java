package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class EvaluationController {
	
	@Autowired
	EvaluationManagementService evaluationServiceImpl;

	//평가응답테이블
	@RequestMapping("selectEvaluationAnswerValueList")
	public ModelAndView selectEvaluationAnswerValueList(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = users.getUsersId();
		//String loginId="1";
		List<EvaluationAnswer> evaluationAnswerValueListResult = evaluationServiceImpl.getEvaluationValueList(loginId);
		System.out.println("겟평가응답리스트");
		return new ModelAndView("student/evaluationAnswer/evaluationAnswerView.tiles", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
		//return new ModelAndView("contents/student/evaluationAnswer/evaluationAnswerView", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
	}
	
	@RequestMapping("addEvaluationAnswerValue")
	public ModelAndView addEvaluationAnswerValue(@RequestParam int evaluationTaskPoint, @RequestParam int evaluationExamPoint, 
										   @RequestParam int evaluationReadyPoint, @RequestParam int evaluationPassionPoint, 
										   @RequestParam int evaluationQuestionPoint, @RequestParam int nowYear, 
										   @RequestParam String nowSemester, @RequestParam String loginId, 
										   @RequestParam int subjectId, @RequestParam String proId){
		//String loginId="사용자1";//이 서비스 메소드값은 3가지 디에이메소드를 거쳐서 온 값임. insert평가, update평가응답(n->y), select설문응답정보&여부 
		System.out.println("평가정보인서트전");
		List<EvaluationAnswer> evaluationAnswerValueListResult = evaluationServiceImpl.addEvaluationAnswerValue(evaluationTaskPoint, evaluationExamPoint, evaluationReadyPoint, evaluationPassionPoint, evaluationQuestionPoint, nowYear, nowSemester, loginId, subjectId, proId);
		return new ModelAndView ("student/evaluationAnswer/evaluationAnswerView.tiles", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
		//return new ModelAndView ("contents/student/evaluationAnswer/evaluationAnswerView", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
				
	}
	
	@RequestMapping("compareEvaluationPeriod")
	public ModelAndView compareEvaluationPeriod(){
		//결과값이 일정명이어야 함.
		String evaluationPeriodResult = evaluationServiceImpl.getEvaluationPeriod();
		//일정명을 가지고 인덱스(초기화면)화면으로 이동함
		return new ModelAndView("index.tiles", "evaluationPeriodResult", evaluationPeriodResult);
		//return new ModelAndView("index", "evaluationPeriodResult", evaluationPeriodResult);
	}
}
