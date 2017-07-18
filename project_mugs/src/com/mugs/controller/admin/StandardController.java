package com.mugs.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.StandardService;
import com.mugs.vo.Standard;

@Controller
@RequestMapping("/admin/")
public class StandardController {

	@Autowired
	private StandardService standardService;
	
	@RequestMapping("insertStandardController")
	public ModelAndView insertStandard(Standard standard, HttpSession session){
		session.setAttribute("stainsertMessage", "1");
		standardService.insertStandard(standard);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",standard.getMajorId());
	}
	
	@RequestMapping("updateStandardController")
	public ModelAndView updateGraduationCredit(Standard standard, HttpSession session){
		session.setAttribute("staupdateMessage", "1");
		standardService.updateStandard(standard);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",standard.getMajorId());
	}
	
	@RequestMapping("deleteStandardController")
	public ModelAndView deleteGraduationCredit(int majorId, int standardYear, HttpSession session){
		session.setAttribute("stadeleteMessage", "1");
		standardService.deleteStandard(standardYear, majorId);
		return new ModelAndView("redirect:/admin/selectMajorGraduationCreditByMajorIdController.do","majorId",majorId);
	}
	
	@RequestMapping("selectForUpdateStandardController")
	public ModelAndView selectForUpdateByIdController(int majorId){
		List<Standard> list = standardService.selectStandardByMajorId(majorId);
		return new ModelAndView("admin/standard/update_standard.tiles","list",list);
	}
	
	@RequestMapping("selectStandardForUpdateController")
	@ResponseBody
	public Standard selectStandardForUpdate(int majorId, int standardYear){
		Standard standard = standardService.selectStandardInfo(standardYear, majorId);
		return standard;
	}
}
