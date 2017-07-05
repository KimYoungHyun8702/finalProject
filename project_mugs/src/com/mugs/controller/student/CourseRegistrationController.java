package com.mugs.controller.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.ProfessorSubject;

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
