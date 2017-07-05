package com.mugs.controller.student;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.CourseRegistrationService;
import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.Standard;

@Controller
@RequestMapping("/student/")
public class CourseRegistrationController {
	
	@Autowired
	private CourseRegistrationService courseRegistrationService;
	
	
	@Autowired
	private GraduationManagementService GraduationManagementServiceImpl;
	
	@RequestMapping("collegeList")
	@ResponseBody
	public List<College> collegeList() {
		
		return courseRegistrationService.getCollegeList();
	}
	
	@RequestMapping("getCollegeList")
	public ModelAndView getCollegeList(){
		List<College> collegeList = courseRegistrationService.getCollegeList();
		return new ModelAndView("contents/student/standard/courseStandardView", "collegeList", collegeList);
	}
	

	@RequestMapping("subjectType")
	public ModelAndView subjectTypeList() {
		return new ModelAndView("view/contents/student/course", "subjectTypeList", courseRegistrationService.getSubjectType());
	}
	
	@RequestMapping("getMajorListByCollegeId")
	@ResponseBody
	public List<Major> getMajorListByCollegeId(int collegeId) {
		return courseRegistrationService.findMajorByCollegeId(collegeId);
	}
	
	/*@RequestMapping(value="/searchById", produces="text/html;charset=utf-8")
	public @ResponseBody List searchById(@RequestBody String id) {
		
		return list;
	}*/

	@RequestMapping("getMyCourseListByJoin")
	public ModelAndView getMyCourseListByJoin() {
		String loginId="사용자1";//시큐리티설정 전에 테스트위해서 설정해준 값
		List<Course> myCourseListResult = courseRegistrationService.findMyCourseListByJoin(loginId);
		return new ModelAndView("contents/student/courseInformationList/course_InformationListView", "myCourseListResult", myCourseListResult);
	}

	
	@RequestMapping("getMajorList")
	public ModelAndView getMajorList() {
		List<String> majorListResult = GraduationManagementServiceImpl.getMajorList();
		return new ModelAndView("contents/student/standard/courseStandardView", "majorListResult", majorListResult);
	}
	
	
	@RequestMapping("getYearListByMajorId")
	@ResponseBody
	public List<Standard> getYearListByMajorId(int majorId){
		return courseRegistrationService.findYearListByMajorId(majorId);
	}
	
	@RequestMapping("getStandardValue")
	@ResponseBody
	public Standard getStandardValue(int collegeId, int majorId, int standardYear) {
		return courseRegistrationService.findStandardValue(collegeId, majorId, standardYear);
	}
	
}
