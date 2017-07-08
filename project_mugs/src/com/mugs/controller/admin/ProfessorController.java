package com.mugs.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.ProfessorService;
import com.mugs.vo.Professor;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/admin/")
public class ProfessorController {
	
	@Autowired
	private ProfessorService professorService;
	
	@RequestMapping("insertProfessorController")
	public ModelAndView insertProfessor(Users users, Professor professor){
		professor.setProId(users.getUsersId());
		professorService.insertProfessor(users, professor);
		return new ModelAndView("redirect:/select_professor.do");
	}
	
	@RequestMapping("selectProfessorByNameController")
	@ResponseBody
	public List<Professor> selectProfessorByName(String usersName){
		List<Professor> list = professorService.selectProfessorByName(usersName);
		return list;
	}
	
	
	@RequestMapping("selectProfessorInfoByIdController")
	@ResponseBody
	public Map selectProfessorInfoById(String proId){
		Map map = new HashMap();
		map.put("professor",professorService.selectProfessorInfoById(proId));
		return map;
	}
	
	@RequestMapping("selectForInsertProfessorController")
	public ModelAndView selectForInsertSubject(){
		Map<String, Object> map = professorService.selectForInsertProfessor();
		ModelAndView view = new ModelAndView();
		view.setViewName("contents/admin/professor/insert_professor");
		view.addObject("building",map.get("building"));
		view.addObject("room",map.get("room"));
		view.addObject("college",map.get("college"));
		view.addObject("major",map.get("major"));
		return view;
	}
	
	@RequestMapping("deleteProfessorController")
	public String deleteProfessor(String usersId){
		professorService.deleteProfessor(usersId);
		return "redirect:/select_professor.do";
	}
	
	@RequestMapping("updateProfessorController")
	public String updateProfessor(Users users, Professor professor){
		professorService.updateProfessor(users, professor);
		return "redirect:/select_professor.do";
	}
	
	@RequestMapping("selectProfessorForupdateController")
	public ModelAndView selectProfessorForupdate(String usersId){
		Map<String, Object> map = professorService.selectProfessorForupdate(usersId);
		ModelAndView view = new ModelAndView();
		view.setViewName("contents/admin/professor/update_professor");
		view.addObject("info",map.get("info"));
		view.addObject("proMajor",map.get("major"));
		view.addObject("office",map.get("office"));
		view.addObject("laboratory",map.get("laboratory"));
		view.addObject("building",map.get("building"));
		view.addObject("room",map.get("room"));
		view.addObject("college",map.get("college"));
		view.addObject("majorList",map.get("majorList"));
		System.out.println(view);
		return view;
	}
}
