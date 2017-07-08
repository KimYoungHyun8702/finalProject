package com.mugs.controller.student;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.Credit;

@Controller
@RequestMapping("/student/")
public class GraduationController {
	@Autowired
	GraduationManagementService service;
	
	@RequestMapping("graduationInfo")
	@ResponseBody
	Map<String,Object> getGraduationInfo(int year, String semester, int majorId, String usersId){
		System.out.println(year);
		System.out.println(semester);
		return service.getCreditByYearAndSemesterAndUsersIdForGraduInfo(year, semester, majorId, usersId);
	}
	
}
