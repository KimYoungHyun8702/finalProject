package com.mugs.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.Course;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.SubjectPlan;

@Controller
@RequestMapping("/professor/")
public class AddStudentGradeController{

	@Autowired
	private SubjectPlanService service;
	@Autowired
	private AddStudentGradeService service2;
	
	@RequestMapping("searchSubjectList") 
	@ResponseBody
	public List<ProfessorSubject> getProfessorSubjectList(String proId){
		
		//Business Logic 호출	
		List<ProfessorSubject> list = service.getProfessorSubjectInfoByJoin(proId);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
		return list;
	}
	
	  @RequestMapping("searchCourseByThreeId") 
	@ResponseBody
	public List<Course> getCourse(int courseYear, String courseSemester, int subjectId){
		System.out.println("-----------------searchSubjectPlanByFourId  TEST -------------------");
		System.out.println(courseYear + courseSemester + subjectId);
		//System.out.println(planYear+planSemester+subjectId+proId);
		List<Course> courseList = service2.getCourseByThreeId(courseYear, courseSemester, subjectId);
		for(int i=0; i<courseList.size(); i++){
			System.out.println(courseList.get(i));
		}
		return courseList;
		
	}
	 
	
	
}
