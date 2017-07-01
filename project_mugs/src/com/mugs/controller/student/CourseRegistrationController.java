package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.College;
import com.mugs.vo.Major;

@Controller
@RequestMapping("/student/")
public class CourseRegistrationController {
	
	@Autowired
	
	private CourseRegistrationService courseRegistrationService;
	
	// fuck that
	@RequestMapping("college")
	@ResponseBody
	public List<College> collegeList() {

		return courseRegistrationService.allCollegeList();
	}
	
	// 개쉣
	@RequestMapping("subjectType")
	public ModelAndView subjectTypeList() {

		return new ModelAndView("view/contents/student/course", "subjectTypeList", courseRegistrationService.SubjectType());
	}
	
	@RequestMapping("major")
	@ResponseBody
	public List<Major> majorList(int collegeId) {

		return courseRegistrationService.selectMajorByCollegeId(collegeId);
	}
	
	/*@RequestMapping(value="/searchById", produces="text/html;charset=utf-8")
	public @ResponseBody List searchById(@RequestBody String id) {
		
		return list;
	}*/
}
