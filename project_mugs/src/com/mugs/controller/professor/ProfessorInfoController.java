package com.mugs.controller.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mugs.service.professor.ProfessorInfoService;
import com.mugs.vo.Professor;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/professor/")
public class ProfessorInfoController {

	@Autowired
	private ProfessorInfoService service;

	
	@RequestMapping("updateProfile")
	public String updateProfessorProfile(@ModelAttribute Users users){
	
	//Business Logic 호출	
	service.updateProfessorInfo(users);
	return "contents/professor/professorInfo"; //WEB-INF/view/contents/professor/professorInfo.jsp

	}
	
	@RequestMapping("searchByJoin")

	@ResponseBody
	public Professor getProfessorRegisterByJoin(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
	Professor professor = service.getProfessorInfoByJoin(id);
	System.out.println(professor);
	return professor;	

	}
}
