package com.mugs.controller.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.ProfessorInfoService;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/professor/")
public class ProfessorInfoController{

	@Autowired
	private ProfessorInfoService service;
	
	@RequestMapping("update_profile")
	public String updateProfessorProfile(@ModelAttribute Users users){
	
	//Business Logic 호출	
	service.updateProfessorInfo(users);	
	
	return "view/contents/professor/professorInfo";
	}
	
	@RequestMapping("searchById")
	@ResponseBody
	public Users getProfessorProfile(String userId){
	//Business Logic 호출	
	Users users = service.getUsersByUsersId(userId);
	System.out.println(users);
	
	return users;	
	}
}
