package com.mugs.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.InfoFindService;

@Controller
@RequestMapping("/admin/")
public class InfoController {
	@Autowired
	InfoFindService service;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("idFind")
	public ModelAndView idFind(String name, String rrn1, String rrn2){
		String rrn =rrn1+"-"+rrn2;
		if(name.trim().isEmpty()){
			return new ModelAndView("view/contents/login/id_find_form", "message", "이름을 입력하세요.");
		}else if(rrn1.trim().isEmpty()||rrn2.trim().isEmpty()){
			return new ModelAndView("view/contents/login/id_find_form", "message", "주민등록번호를 입력하세요.");
		}
		if(service.getIdByInfo(name, rrn)==null){
			return new ModelAndView("view/contents/login/id_find_form", "message", "입력하신 정보와 일치하는 Id는 없습니다.");
		}
		return new ModelAndView("view/contents/login/id_result_form", "id", service.getIdByInfo(name, rrn));
	}
	
	@RequestMapping("pwFind")
	public ModelAndView idFind(String id, String name, String rrn1, String rrn2){
		if(id.trim().isEmpty()){
			return new ModelAndView("view/contents/login/pw_find_form", "message", "Id 입력하세요.");
		}else if(name.trim().isEmpty()){
			return new ModelAndView("view/contents/login/pw_find_form", "message", "이름을 입력하세요.");
		}else if(rrn1.trim().isEmpty()||rrn2.trim().isEmpty()){
			return new ModelAndView("view/contents/login/pw_find_form", "message", "주민등록번호를  입력하세요.");
		}
		
		String rrn =rrn1+"-"+rrn2;
		
		if(service.getIdByInfo(id, name, rrn)==null){
			return new ModelAndView("view/contents/login/pw_find_form", "message", "입력하신 정보와 일치하는 Id는 없습니다.");
		}
		return new ModelAndView("view/contents/login/pw_update_form", "user", service.getIdByInfo(id, name, rrn));
	}
	
	@RequestMapping("pwChange")
	public ModelAndView pwChange(String id, String pw, String chkPw){
		if(pw.trim().isEmpty()||chkPw.trim().isEmpty()){
			return new ModelAndView("view/contents/login/pw_update_form", "error", "비밀번호 입력하세요");
		}
		if(!pw.equals(chkPw)){
			return new ModelAndView("view/contents/login/pw_update_form", "error", "비밀번호가 다릅니다. 다시 한번 확인해주세요!");
		}
		
		service.changePassword(id, passwordEncoder.encode(pw));
		return new ModelAndView("view/contents/login/pw_update_form", "message", "close");
	}
}
