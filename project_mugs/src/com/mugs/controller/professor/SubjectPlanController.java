package com.mugs.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.SubjectPlan;

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
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@RequestMapping("searchSubjectPlanByFourId") 
	@ResponseBody
	public SubjectPlan getSubjectPlan(int planYear, String planSemester, int subjectId, String proId){
		System.out.println("-----------------searchSubjectPlanByFourId  TEST -------------------");
		
		//System.out.println(planYear+planSemester+subjectId+proId);
		SubjectPlan subjectPlan = service.getSubjectPlanByFourId(planYear, planSemester, subjectId, proId);
		System.out.println(subjectPlan);
		return subjectPlan;
		
	}
	@RequestMapping("registerSubjectPlan") 
	@ResponseBody
	public String joinSubjectPlan(@ModelAttribute SubjectPlan sp){
		//비지니스로직
		service.addSubjectPlan(sp);
	return "contents/professor/SubjectPlan_insert"; //WEB-INF/view/contents/professor/SubjectPlan_insert.jsp
	}
	
	@RequestMapping("reNewSubjectPlan") 
	@ResponseBody
	public String reNewSubjectPlan(@ModelAttribute SubjectPlan sp){
		//비지니스로직
		service.setSubjectPlan(sp);
	return "contents/professor/SubjectPlan_update"; //WEB-INF/view/contents/professor/SubjectPlan_update.jsp
	}
	
	@RequestMapping("removeSubjectPlan") 
	@ResponseBody
	public String removeSubjectPlan(int planId2){
		//비지니스로직
		
		//int planId = Integer.parseInt(id);
		System.out.println(planId2);
		service.deleteSubjectPlanById(planId2);
	return "contents/professor/SubjectPlan_success"; //WEB-INF/view/contents/professor/SubjectPlan_success.jsp
	}
}
