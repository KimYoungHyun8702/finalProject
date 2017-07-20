package com.mugs.controller.professor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.professor.ProfessorInfoService;
import com.mugs.vo.Professor;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/professor/")
public class ProfessorInfoController {

	@Autowired
	private ProfessorInfoService service;
	private String fileName= "";

	
	@RequestMapping("updateProfile")
	public String updateProfessorProfile(@ModelAttribute Users users){
	
	//Business Logic 호출	
	service.updateProfessorInfo(users);
	return "professor/professorInfo.tiles"; //WEB-INF/view/contents/professor/professorInfo.jsp

	}
	
	@RequestMapping("professorInfo")
	public String getProfessorRegisterByJoin(HttpSession session){
		 Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String proId = users.getUsersId();
	      
	      Professor professor = service.getProfessorInfoByJoin(proId);
	      session.setAttribute("professor", professor);
	      return "professor/professorInfo.tiles";
	}
		
		@RequestMapping("professorInfoUpdate")
	public String getProfessorInfoByJoin(HttpSession session){
		 Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String proId = users.getUsersId();
	      
	      Professor professor = service.getProfessorInfoByJoin(proId);
	      session.setAttribute("professor", professor);
	      return "professor/professorInfoUpdate.tiles";
	      //return "/professor/professorInfo.do";
	}
}
