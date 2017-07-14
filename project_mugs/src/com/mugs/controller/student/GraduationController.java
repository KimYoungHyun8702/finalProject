package com.mugs.controller.student;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.Credit;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class GraduationController {
	@Autowired
	GraduationManagementService service;
	
	@RequestMapping("graduationInfo")
	ModelAndView getGraduationInfo(){
		return new ModelAndView("student/graduationInfo/graduationInfo.tiles","map",service.getCreditByYearAndSemesterAndUsersIdForGraduInfo());
	}
	
}
