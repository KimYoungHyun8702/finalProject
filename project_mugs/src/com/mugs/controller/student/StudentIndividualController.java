package com.mugs.controller.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.mugs.service.student.StudentIndividualService;

@Controller
@RequestMapping("/student/")
public class StudentIndividualController {
	//병문 학생정보관리 Controller
	@Autowired
	private StudentIndividualService service;
	

//	@RequestMapping("updateStu")
//	public ModelAndView updateStudentInformation(String studentId){
//	}
	
	@RequestMapping("getStudentInfoById")
	public String getStudentInformation(String stuId){
		
		service.findStudentById(stuId);
		return null;
	}
}
