package com.mugs.controller.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.GuidenceStudentService;
import com.mugs.vo.GuidanceStudent;



@Controller
@RequestMapping("/professor/")
public class GuidenceStudentController{

	@Autowired
	private GuidenceStudentService service;
	
	@RequestMapping("searchList")
	@ResponseBody
	public GuidanceStudent getGuidanceStudentList(String proId){
	//Business Logic 호출	
	GuidanceStudent guideStu = service.getGuidanceStudentListByJoin(proId);
	System.out.println(guideStu);
	
	return guideStu;	
	}
}
