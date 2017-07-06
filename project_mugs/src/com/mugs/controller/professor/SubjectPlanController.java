package com.mugs.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.ProfessorSubject;

@Controller
@RequestMapping("/professor/")
public class SubjectPlanController{

	@Autowired
	private SubjectPlanService service;
	
	@RequestMapping("searchSubjectListById")
	@ResponseBody
	public List<ProfessorSubject> getProfessorSubjectList(String proId){
		
		//Business Logic 호출	
		List<ProfessorSubject> list = service.getProfessorSubjectInfoByJoin(proId);
		
		return list;
	}
}
