package com.mugs.controller.student;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;


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
import com.mugs.vo.Standard;
import com.mugs.vo.Users;


@Controller
@RequestMapping("/student/")
public class CourseRegistrationController {
	
	@Autowired
	private CourseRegistrationService courseRegistrationService;
	
	@Autowired
	private GraduationManagementService graduationManagementServiceImpl;
	
	/** 
	 * 이수구분을 선택한뒤 다음 중분류인 대학교에 존재하는
	 * 전체 단과대학(학부)의 리스트를 뽑아오는 역할을 하는 메소드
	 * Ajax를 이용하여 통신함
	 * 
	 * By Baek.J.H 
	 * 
	 **/
	@RequestMapping("getCollegeListAjax")
	@ResponseBody
	public List<College> getCollegeListAjax() {
		return courseRegistrationService.findCollegeList();
	}
	
	
	
	
	/** By Cho.S.R **/
	@RequestMapping("getCollegeList")
	public ModelAndView getCollegeList(){
		List<College> collegeList = courseRegistrationService.getCollegeList();
		return new ModelAndView("student/standard/courseStandardView.tiles", "collegeList", collegeList);
		
	}

	
	
	
	/** 
	 * 현재 기간이 수강신청 가능 기간인지 확인하고
	 * 수강신청 기간이면 로그인한 학생의 제적상태, 현재연도, 현재학기
	 * 이수구분 리스트를 각각 Model에 담아서 수강신청 페이지로 이동한다.
	 * 
	 * 현재 기간이 수강신청 기간이 아니면 index페이지로 이동 후
	 * 수강신청 기간이 아니라는 메시지를 띄운다.
 	 * 
	 * By Baek.J.H 
	 * 
	 **/
	@RequestMapping("subjectTypeList")
	public ModelAndView subjectTypeList() {
		
		ModelAndView model = new ModelAndView();
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		HashMap map = courseRegistrationService.getSubjectTypeMap(stuId);
		
		Iterator iterator = map.entrySet().iterator();
		
		while (iterator.hasNext()) {
		   Entry entry = (Entry)iterator.next();
		   if(entry.getKey().toString() == "stuRegister") {
			   if(entry.getValue().equals("휴학") || entry.getValue().equals("군휴학")) {
				   model.setViewName("index.tiles");
				   model.addObject(entry.getKey().toString(), entry.getValue());
				   return model;
			   } else {
				   model.addObject(entry.getKey().toString(), entry.getValue());
			   }
			   
		   } else if(entry.getKey().toString() == "msg" && !entry.getValue().equals("")) {
			   model.setViewName("index.tiles");
			   model.addObject(entry.getKey().toString(), entry.getValue());
			   return model;
		   }
		   model.addObject(entry.getKey().toString(), entry.getValue());
		}
		
		model.setViewName("student/course.tiles");
		return model;
	}
	
	
	
	
	/** 
	 * 단과대학(학부)의 ID를 이용해서 
	 * 그 해당 단과대학(학부)의 소속된 학과정보를 리스트에 담아서 리턴
	 * 
	 * By Cho.S.R(근데 나도 이 메소드 필요함 By Baek.J.H) 
	 * 
	 **/
	@RequestMapping("getMajorListByCollegeId")
	@ResponseBody
	public List<Major> getMajorListByCollegeId(int collegeId) {

		return courseRegistrationService.findMajorListByCollegeId(collegeId);
	}

	
	
	
	/** By Cho.S.R **/
	@RequestMapping("getMyCourseListByJoin")
	public ModelAndView getMyCourseListByJoin() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = users.getUsersId();
		//String loginId="1";//시큐리티설정 전에 테스트위해서 설정해준 값
		List<Course> myCourseListResult = courseRegistrationService.findMyCourseListByJoin(loginId);
		System.out.println(myCourseListResult);
		return new ModelAndView("student/courseInformationList/course_InformationListView.tiles", "myCourseListResult", myCourseListResult);
		//return new ModelAndView("contents/student/courseInformationList/course_InformationListView", "myCourseListResult", myCourseListResult);
	}

	/** By Cho.S.R **/
	@RequestMapping("getMajorList")
	public ModelAndView getMajorList() {
		List<String> majorListResult = graduationManagementServiceImpl.getMajorList();
		return new ModelAndView("student/standard/courseStandardView,.tiles", "majorListResult", majorListResult);
		//return new ModelAndView("contents/student/standard/courseStandardView", "majorListResult", majorListResult);
	}
	
	/** By Cho.S.R **/
	@RequestMapping("getYearListByMajorId")
	@ResponseBody
	public List<Standard> getYearListByMajorId(int majorId){
		return courseRegistrationService.findYearListByMajorId(majorId);
	}
	
	/** By Cho.S.R **/
	@RequestMapping("getStandardValue")
	@ResponseBody
	public Standard getStandardValue(int collegeId, int majorId, int standardYear) {
		return courseRegistrationService.findStandardValue(collegeId, majorId, standardYear);
	}
	
	
	
	
	/** 
	 * 소분류에서 받은 학과ID와 미리 모셔놓은 현재학기, 현재연도, 대분류에서 받은 이수구분을
	 * 매개변수로 받아 해당연도, 학기에 해당 학과에서 개설한 이수구분타입의
	 * 강의 정보를 리스트에 담아서 리턴한다.
	 * 
	 * By Baek.J.H 
	 *
	 **/
	@RequestMapping("getSubjectListByJoin")
	@ResponseBody
	public HashMap<String, Object> getSubjectListByJoin(int majorId, String semester, int nowYear, String subjectType) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return courseRegistrationService.findSubjectListByJoin(majorId, nowYear, semester, subjectType, stuId);
	}
	
	
	
	
	/**
	 * 
	 * 
	 * By Baek.J.H 
	 * 
	 **/
	@RequestMapping("addCourseMySubject")
	@ResponseBody
	public HashMap<String, Object> addCourseMySubject(int majorId, String semester, int nowYear, 
			String subjectType, String recourse, String proId, int subjectId, String stuRegister) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return courseRegistrationService.addCourseMySubject(majorId, semester, nowYear, subjectType, recourse, proId, subjectId, stuId, stuRegister);
	}
	
	
	
	
	/** 
	 * 해당수강 신청
	 * 
	 * By Baek.J.H 
	 *
	 **/
	@RequestMapping("removeMySubject")
	@ResponseBody
	public HashMap<String, Object> removeMySubject(int majorId, String semester, int nowYear, String proId, int subjectId, String subjectType) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return courseRegistrationService.deleteMySubject(subjectId, proId, semester, majorId, nowYear, stuId, subjectType);
	}
}
