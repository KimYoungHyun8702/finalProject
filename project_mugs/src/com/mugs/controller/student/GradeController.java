package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.GradeService;

@Controller
@RequestMapping("/student/")
public class GradeController {
	@Autowired
	private GradeService service;

	@RequestMapping("yearInquiry")
	@ResponseBody
	public List<Integer> yearInquiry() {
		String id = "사용자1";
		List<Integer> list = service.getYear(id);
		return list;
	}
	
	@RequestMapping("semesterInquiry")
	public List<String> semesterInquiry(int year){
		return null;
		
	}
}
