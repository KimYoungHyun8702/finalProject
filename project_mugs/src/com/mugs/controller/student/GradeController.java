package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.GradeService;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Credit;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class GradeController {
	@Autowired
	private GradeService service;

	@RequestMapping("yearInquiry")
	@ResponseBody
	public List<Integer> yearInquiry() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
		
		List<Integer> list = service.getYear(id);
		return list;
	}

	@RequestMapping("allCreditInquiry")
	@ResponseBody
	public List<Credit> allCreditInquiry() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
		
		List<Credit> list = service.getAllCredit(id);
		return list;
	}

	@RequestMapping("semesterInquiry")
	@ResponseBody
	public List<String> semesterInquiry(int year) {
		List<String> list = service.getSemester(year);
		return list;
	}

	@RequestMapping("creditByYear")
	@ResponseBody
	public List<Credit> creditByYear(int year) {
		List<Credit> list = service.getCreditByYear(year);
		return list;
	}

	@RequestMapping("creditByYearSemester")
	@ResponseBody
	public List<Credit> creditByYearSemester(int year, String semester) {
		List<Credit> list = service.getCreditByYearSemester(year, semester);
		return list;
	}

	@RequestMapping("creditByType")
	@ResponseBody
	public List<Credit> creditByType(int year, String semester, String type) {
		List<Credit> list = service.getCreditByType(year, semester, type);
		return list;
	}

	@RequestMapping("creditByOneType")
	@ResponseBody
	public List<Credit> creditByOneType(String type) {
		List<Credit> list = service.getCreditByOneType(type);
		return list;
	}

	@RequestMapping("creditByYearType")
	@ResponseBody
	public List<Credit> creditByYearType(int year, String type) {
		List<Credit> list = service.getCreditByYearType(year, type);
		return list;
	}

	@RequestMapping("currentGradeInquiry")
	public ModelAndView currentGradeInquiry() {
		return new ModelAndView("student/credit/currentGradeInquiry.tiles", "map",
				service.getCalendarByYearAndCalName());
	}

	@RequestMapping("academicProbationInquiry")
	@ResponseBody
	public List<AcademicProbation> academicProbationInquiry() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
		
		return service.getAcademicProbationByStuId(id);
	}
}
