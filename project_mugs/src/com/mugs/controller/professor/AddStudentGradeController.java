package com.mugs.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.SubjectPlan;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/professor/")
public class AddStudentGradeController{

	@Autowired
	private SubjectPlanService service;
	@Autowired
	private AddStudentGradeService service2;
	
	@RequestMapping("searchSubjectList") 
	@ResponseBody
	public List<ProfessorSubject> getProfessorSubjectList(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
		//Business Logic 호출	
		List<ProfessorSubject> list = service.getProfessorSubjectInfoByJoin(id);
		/*for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}*/
		return list;
	}
	
	@RequestMapping("searchCourseByThreeId") 
	@ResponseBody
	public List<Course> getCourse(int courseYear, String courseSemester, int subjectId){
		System.out.println("-----------------searchCourseByThreeId  TEST -------------------");
		System.out.println(courseYear + courseSemester + subjectId);
		//System.out.println(planYear+planSemester+subjectId+proId);
		List<Course> courseList = service2.getCourseByThreeId(courseYear, courseSemester, subjectId);
		for(Course c : courseList){
			System.out.println(c.getCount());
		}
		return courseList;
		
	}
	
	@RequestMapping("registerCredit") 
	@ResponseBody
	public Credit registerCredit(@ModelAttribute Credit credit){
		System.out.println(credit);
		service2.addCredit(credit);
		return credit;
	}
	 
	
	
}
