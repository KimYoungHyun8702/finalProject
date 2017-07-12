package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.CourseRegistrationService;
import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Standard;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class CourseRegistrationController {
	
	@Autowired
	private CourseRegistrationService courseRegistrationService;
	
	
	@Autowired
	private GraduationManagementService graduationManagementServiceImpl;
	
	@RequestMapping("getCollegeListAjax")
	@ResponseBody
	public List<College> getCollegeListAjax() {
		return courseRegistrationService.getCollegeList();
	}
	
	@RequestMapping("getCollegeList")
	public ModelAndView getCollegeList(){
		List<College> collegeList = courseRegistrationService.getCollegeList();
		return new ModelAndView("student/standard/courseStandardView.tiles", "collegeList", collegeList);
	}
	

	@RequestMapping("subjectType")
	public ModelAndView subjectTypeList() {
		return new ModelAndView("contents/student/course", "subjectTypeList", courseRegistrationService.getSubjectType());
	}
	
	@RequestMapping("getMajorListByCollegeId")
	@ResponseBody
	public List<Major> getMajorListByCollegeId(int collegeId) {
		System.out.println(collegeId);
		return courseRegistrationService.findMajorByCollegeId(collegeId);
	}

	



	@RequestMapping("getMyCourseListByJoin")
	public ModelAndView getMyCourseListByJoin() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = users.getUsersId();
		List<Course> myCourseListResult = courseRegistrationService.findMyCourseListByJoin(loginId);
		return new ModelAndView("student/courseInformationList/course_InformationListView.tiles", "myCourseListResult", myCourseListResult);
		
	}

	
	@RequestMapping("getMajorList")
	public ModelAndView getMajorList() {
		List<String> majorListResult = graduationManagementServiceImpl.getMajorList();
		return new ModelAndView("student/standard/courseStandardView,.tiles", "majorListResult", majorListResult);
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
	
	@RequestMapping("subject")
	@ResponseBody
	public List<ProfessorSubject> subjectListByMajorId(String majorId, String subjectSemester, String nowYear) {
		subjectSemester = "1학기";
		int nowYearInt = Integer.parseInt(nowYear);
		int majorIdInt = Integer.parseInt(majorId);
		return courseRegistrationService.getProfessorSubjectList(majorIdInt, nowYearInt, subjectSemester);
	}
	
	@RequestMapping("getMySubject")
	@ResponseBody
	public List<ProfessorSubject> getMySubject(String subjectId, String proId, String semester, String majorId) {
		int subjectIdInt = Integer.parseInt(subjectId);
		int majorIdInt = Integer.parseInt(majorId);
		return courseRegistrationService.getMySubject(subjectIdInt, proId, semester, majorIdInt);
	}
	
	@RequestMapping("deleteMySubject")
	@ResponseBody
	public List<ProfessorSubject> deleteMySubject(String subjectId, String proId, String semester, String majorId) {
		int subjectIdInt = Integer.parseInt(subjectId);
		int majorIdInt = Integer.parseInt(majorId);
		return courseRegistrationService.deleteMySubject(subjectIdInt, proId, semester, majorIdInt);
	}
}
