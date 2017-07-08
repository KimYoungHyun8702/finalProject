package com.mugs.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.CollegeService;
import com.mugs.service.admin.MajorService;
import com.mugs.vo.College;
import com.mugs.vo.Major;

@Controller
@RequestMapping("/admin/")
public class MajorController {
	
	@Autowired
	private MajorService majorService;
	@Autowired
	private CollegeService collegeService;
	
	@RequestMapping("/selectMajorListController")
	public ModelAndView selectMajorList(){
		List<Major> list = majorService.selectMajorList();
		return new ModelAndView("contents/admin/major/select_major","list",list);
	}
	
	@RequestMapping("/selectCollegeListForSelectController")
	public ModelAndView selectCollegeListForSelect(){
		List<College> list = collegeService.selectCollegeList();
		return new ModelAndView("contents/admin/major/select_major","list",list);
	}
	
	@RequestMapping("/selectCollegeListForinsertController")
	public ModelAndView selectCollegeListForinsert(){
		List<College> list = collegeService.selectCollegeList();
		return new ModelAndView("contents/admin/major/insert_major","list",list);
	}
	
	@RequestMapping("/selectMajorByCollegeIdController")
	@ResponseBody
	public List<Major> selectMajorBycollegeId(int collegeId){
		List<Major> list = majorService.selectMajorBycollegeId(collegeId);
		return list;
	}
	
	@RequestMapping("/selectMajorGraduationCreditByMajorIdController")
	public ModelAndView selectMajorGraduationCreditByMajorId(int majorId){
		List<Major> list = majorService.selectMajorGraduationCreditByMajorId(majorId);
		return new ModelAndView("contents/admin/major/select_major_info", "list",list);
	}
	
	@RequestMapping("/selectMajorByMajorIdForUpdateController")
	public ModelAndView selectMajorByMajorIdForUpdate(int majorId){
		Major major = majorService.selectMajorById(majorId);
		return new ModelAndView("contents/admin/major/update_major","major",major);
	}
	
	@RequestMapping("/insertMajorController")
	public ModelAndView insertMajor(Major major){
		int majorId = majorService.insertMajor(major);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",majorId);
	}
	
	@RequestMapping("/updateMajorController")
	public ModelAndView updateMajor(Major major){
		int majorId = majorService.updateMajor(major);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",majorId);
	}
	
	@RequestMapping("/deleteMajorController")
	public String deleteMajor(int majorId){
		majorService.deleteMajor(majorId);
		return "redirect:/admin/selectCollegeListForSelectController.do";
	}
	
}
