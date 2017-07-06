package com.mugs.controller.student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.StudentIndividualService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Student;
import com.mugs.vo.Subject;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class StudentIndividualController {
	//병문 학생정보관리 Controller   
	@Autowired
	private StudentIndividualService service;
	
	
	//이수구분 선택 시 해당 과목들의 id를 넘긴다.
	List<Integer> subIdList = new ArrayList<Integer>();
	//
	
	@RequestMapping("moveUpdateForm")
	public String moveUpdateFrom(){
		return "view/contents/student/IndividualInfo/stuInfo_update_form";
	}

	@RequestMapping("updateStu")
	public String updateStudentInformation(Users users){	
				service.updateStudentHumanInfo(users);	
		return "view/contents/student/test";
	}  
	
	@RequestMapping("getStudentInfoById")
	@ResponseBody
	public Student getStudentAllInformaion(String stuId){ 
		return service.findStudentInfoById(stuId);
	}
	/**
	 * 단과대학을 넘기는 Handler메소드
	 * @return
	 */
	@RequestMapping("getAllTimeTable")
	public ModelAndView getAllTimeTable(){
		 List<College> list = service.getCollegeList();
		 return new ModelAndView("view/contents/student/IndividualInfo/allTimeTable","list",list);
	}
	/**
	 * 학과를 넘기는 Handler메소드
	 * @param collegeId
	 * @return
	 */
	@RequestMapping("getMajorList")
	@ResponseBody
	public List<Major> getMajorList(int collegeId){
		List<Major> majorList = service.getMajorList(collegeId);
		return majorList;
	}
	
	@RequestMapping("getSubjectTypeList")
	@ResponseBody
	public List<String> getSubjectTypeListByMajorId(int majorId){ 
		
		List<Subject> subjectList = service.getSubjectTypeListByMajorId(majorId);
		List<String> subTypeList = new ArrayList<String>();
		
		for(Subject sb : subjectList){
			subTypeList.add(sb.getSubjectType());
		}
		 
		return subTypeList;
	} 
	
	@RequestMapping("getSubjectBySubjectType")
	@ResponseBody
	public Map<String,Subject> getSubjectBySubjectType(@RequestParam String majorId,
														@RequestParam String subjectType){

		System.out.println(majorId); 
		System.out.println(subjectType);
		
		HashMap<String,Object> param = new HashMap<String, Object>();
		param.put("majorId", majorId); 
		param.put("subjectType", subjectType); 

		Map<String,Subject> result = (HashMap)service.getSubjectBySubjectTypeAndMajorId(param);	
		return result; 
	}
}
