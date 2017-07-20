package com.mugs.controller.student;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Major;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class EvaluationController {
	
	@Autowired
	private EvaluationManagementService evaluationServiceImpl;


	@RequestMapping("addEvaluationAnswerValue")
	public ModelAndView addEvaluationAnswerValue(@RequestParam int evaluationTaskPoint, @RequestParam int evaluationExamPoint, 
										   @RequestParam int evaluationReadyPoint, @RequestParam int evaluationPassionPoint, 
										   @RequestParam int evaluationQuestionPoint, @RequestParam int nowYear, 
										   @RequestParam String nowSemester, @RequestParam String loginId, 
										   @RequestParam int subjectId, @RequestParam String proId){
		//String loginId="사용자1";//이 서비스 메소드값은 3가지 디에이메소드를 거쳐서 온 값임. insert평가, update평가응답(n->y), select설문응답정보&여부 
		List<EvaluationAnswer> evaluationAnswerValueListResult = evaluationServiceImpl.addEvaluationAnswerValue(evaluationTaskPoint, evaluationExamPoint, evaluationReadyPoint, evaluationPassionPoint, evaluationQuestionPoint, nowYear, nowSemester, loginId, subjectId, proId);
		return new ModelAndView ("student/evaluationAnswer/evaluationAnswerView.tiles", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
		//return new ModelAndView ("contents/student/evaluationAnswer/evaluationAnswerView", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
				
	}
	
	
	@RequestMapping("compareEvaluationPeriod")
	public ModelAndView compareEvaluationPeriod(){
		//결과값이 일정명이어야 함.
		ModelAndView model = new ModelAndView();
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = users.getUsersId();
		
		HashMap<String, Object> map = evaluationServiceImpl.getEvaluationPeriod(loginId);
		System.out.println("map:"+map);
		Iterator iterator = map.entrySet().iterator();
		
		// map의 다음 키값이 있는지 없는지 확인하면서 작업 진행
		while (iterator.hasNext()) {
		   Entry entry = (Entry)iterator.next();
		   if(entry.getKey().toString() == "studentState") {
			 
			   if(entry.getValue().equals("휴학") || entry.getValue().equals("군휴학")) {
				   model.setViewName("index.tiles");	
				   model.addObject(entry.getKey().toString(), entry.getValue());	// 현재 휴학상태를 model에 담고 리턴
				   return model;
			   }
		   } else if(entry.getKey().toString() == "alarm" && !entry.getValue().equals("")) {
			  
			   model.setViewName("index.tiles");	
			   model.addObject(entry.getKey().toString(), entry.getValue()); // 지금 설문응답 기간아니라는 메세지 담아서 리턴
			   return model;
		   }
		   model.addObject(entry.getKey().toString(), entry.getValue());	// 재적상태도 정상이고 지금 현재도 설문응답기간이면 설문응답 리스트 담는다.
		   System.out.println(entry.getValue());
		}
		model.setViewName("student/evaluationAnswer/evaluationAnswerView.tiles"); // 재적상태도 정상이고 지금 현재도 설문응답기간이면 담은 설문응답 리스트 갖고 설문응답페이지로 이동
		System.out.println("#######"+model);
		return model;
	}
	
	@RequestMapping("getEvaluationGraphSubjectTypeList")
	public ModelAndView getEvaluationGraphSubjectTypeList() {
		
		return new ModelAndView("student/evaluationGraph.tiles", "subjectTypeList", evaluationServiceImpl.getSubjectTypeList());
	}
	
	@RequestMapping("getEvaluationGraphCollegeList")
	@ResponseBody
	public HashMap<String, Object> getEvaluationGraphCollegeList(String subjectType) {
		return evaluationServiceImpl.findCollegeList(subjectType);
	}
	
	@RequestMapping("getEvaluationGraphMajorListByCollegeId")
	@ResponseBody
	public List<Major> getMajorListByCollegeId(int collegeId) {

		return evaluationServiceImpl.findMajorListByCollegeId(collegeId);
	}
	
	/** 
	 * ....
	 * 
	 * By Baek.J.H 
	 *
	 **/
	@RequestMapping("getEvaluationGraphSubjectListByJoin")
	@ResponseBody
	public HashMap<String, Object> getEvaluationGraphSubjectListByJoin(int majorId, String subjectType) {

		return evaluationServiceImpl.findSubjectListByJoin(majorId, subjectType);
	}
	
	/** 
	 * ....
	 * 
	 * By Baek.J.H 
	 *
	 **/
	@RequestMapping("getEvaluationGraph")
	@ResponseBody
	public HashMap<String, Object> getEvaluationGraph(String proId, int subjectId) {
		return evaluationServiceImpl.getEvaluationGraph(subjectId, proId);
	}
	
	
}