package com.mugs.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.StandardService;
import com.mugs.vo.GraduationCredit;
import com.mugs.vo.Standard;

@Controller
@RequestMapping("/admin/")
public class StandardController {

	@Autowired
	private StandardService standardService;
	
	@RequestMapping("insertStandardController")
	public ModelAndView insertStandard(Standard standard){
		standardService.insertStandard(standard);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",standard.getMajorId());
	}
	
	@RequestMapping("updateStandardController")
	public ModelAndView updateGraduationCredit(Standard standard){
		standardService.updateStandard(standard);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",standard.getMajorId());
	}
	
	@RequestMapping("deleteStandardController")
	public ModelAndView deleteGraduationCredit(int majorId, int standardYear){
		standardService.deleteStandard(standardYear, majorId);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",majorId);
	}
	
	@RequestMapping("selectForUpdateStandardController")
	public ModelAndView selectForUpdateByIdController(int majorId){
		List<Standard> list = standardService.selectStandardByMajorId(majorId);
		return new ModelAndView("admin/standard/update_standard.tiles","list",list);
	}
}
