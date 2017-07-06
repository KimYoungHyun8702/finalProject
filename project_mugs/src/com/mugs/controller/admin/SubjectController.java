package com.mugs.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.SubjectService;
import com.mugs.vo.Building;
import com.mugs.vo.Subject;

@Controller
@RequestMapping("/admin/")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("selectSubjectTypeController")
	public ModelAndView selectSubjectType(){
		List<String> list = subjectService.selectSubjectType();
		return new ModelAndView("view/contents/admin/subject/select_subject","list",list);
	}
	
	@RequestMapping("selectCollegeIdBySubjectTypeController")
	@ResponseBody
	public List<Subject> selectCollegeIdBySubjectType(String subjectType){
		List<Subject> list = subjectService.selectCollegeIdBySubjectType(subjectType);
		return list;
	}
	
	@RequestMapping("selectMajorIdByCollegeIdController")
	@ResponseBody
	public List<Subject> selectMajorIdByCollegeId(int collegeId, String subjectType){
		List<Subject> list = subjectService.selectMajorIdByCollegeId(collegeId, subjectType);
		return list;
	}
	
	@RequestMapping("selectSubjectByMajorIdController")
	@ResponseBody
	public List<Subject> selectSubjectByMajorId(int majorId, int collegeId, String subjectType){
		List<Subject> list = subjectService.selectSubjectByMajorId(majorId, collegeId, subjectType);
		return list;
	}
	
	@RequestMapping("selectSubjectInfoBySubjectNameController")
	@ResponseBody
	public Subject selectSubjectInfoBySubjectName(int subjectId){
		Subject subject = subjectService.selectSubjectInfoBySubjectName(subjectId);
		return subject;
	}
	
	@RequestMapping("selectForInsertSubjectController")
	public ModelAndView selectForInsertSubject(){
		Map<String, Object> map = subjectService.selectForInsertSubject();
		ModelAndView view = new ModelAndView();
		view.setViewName("view/contents/admin/subject/insert_subject");
		view.addObject("building",map.get("building"));
		view.addObject("room",map.get("room"));
		view.addObject("college",map.get("college"));
		view.addObject("major",map.get("major"));
		return view;
	}
	
	@RequestMapping("insertSubjectController")
	public String insertSubjectController(Subject subject){
		subjectService.insertSubject(subject);
		return "redirect:/admin/selectSubjectTypeController.do";
	}
	
	@RequestMapping("selectSubjectInfoBySubjectIdForUpdateController")
	public ModelAndView selectSubjectInfoBySubjectIdForUpdate(int subjectId){
		Map<String, Object> map = subjectService.selectSubjectInfoBySubjectIdForUpdate(subjectId);
		ModelAndView view = new ModelAndView();
		view.setViewName("view/contents/admin/subject/update_subject");
		view.addObject("building",map.get("building"));
		view.addObject("subject",map.get("subject"));
		return view;
	}
	
	@RequestMapping("updateSubjectContorller")
	public String updateSubject(Subject subject){
		subjectService.updateSubject(subject);
		return "redirect:/admin/selectSubjectTypeController.do";
	}
	
	@RequestMapping("deleteSubjectBySubjectIdController")
	public String deleteSubject(int subjectId){
		subjectService.deleteSubject(subjectId);
		return "redirect:/admin/selectSubjectTypeController.do";
	}
	
	@RequestMapping("selectCollegeIdBySubjectTypeMinorController")
	@ResponseBody
	public List<Subject> selectCollegeIdBySubjectTypeMinor(String subjectType){
		List<Subject> list = subjectService.selectCollegeIdBySubjectTypeMinor(subjectType);
		return list;
	}
	
	@RequestMapping("selectSubjectInfoBySubjectTimeController")
	@ResponseBody
	public List<Subject> selectSubjectInfoBySubjectTime(String subjectTime, String subjectType){
		List<Subject> list = subjectService.selectSubjectInfoBySubjectTime(subjectTime, subjectType);
		return list;
	}
	
	@RequestMapping("selectSubjectInfoBySubjectIdForMinorUpdateController")
	public ModelAndView selectSubjectInfoBySubjectIdForMinorUpdate(int subjectId){
		Map<String, Object> map = subjectService.selectSubjectInfoBySubjectIdForMinorUpdate(subjectId);
		ModelAndView view = new ModelAndView();
		view.setViewName("view/contents/admin/subject/update_subject");
		view.addObject("building",map.get("building"));
		view.addObject("subject",map.get("subject"));
		return view;
	}
}
