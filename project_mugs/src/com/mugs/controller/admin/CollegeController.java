package com.mugs.controller.admin;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.CollegeService;
import com.mugs.vo.College;

@Controller
@RequestMapping("/admin/")
public class CollegeController {
	
	@Autowired
	private CollegeService service;
	
	@RequestMapping("/selectCollegeListController")
	public ModelAndView selectCollegeList(){
		List<College> list = service.selectCollegeList();
		return new ModelAndView("admin/college/select_college.tiles","list",list);
	}
	
	@RequestMapping("/insertCollegeController")
	public String insertCollege(College college){
		service.insertCollege(college);
		return "redirect:/admin/selectCollegeListController.do";
	}
	
	@RequestMapping("/updateCollegeController")
	public String updateCollege(College college){
		service.updateCollegeById(college);
		return "redirect:/admin/selectCollegeListController.do";
	}
	
	@RequestMapping("/deleteCollegeController")
	public String deleteCollege(int collegeId){
		service.deleteCollege(collegeId);
		return "redirect:/admin/selectCollegeListController.do";
	}
}
