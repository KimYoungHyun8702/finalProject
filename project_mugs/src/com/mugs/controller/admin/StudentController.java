package com.mugs.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mugs.service.admin.StudentService;
import com.mugs.vo.Student;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/admin/")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("selectMajorForInsertController")
	public ModelAndView	selectMajorForInsert(){
		ModelAndView view = new ModelAndView();
		Map map = studentService.selectForInsertStudent();
		view.setViewName("admin/student/insert_student.tiles");
		view.addObject("major",map.get("major"));
		view.addObject("majorDual",map.get("majorDual"));
		view.addObject("majorMinor",map.get("majorMinor"));
		return view;
	}
	@RequestMapping("insertStudentController")
	public ModelAndView insertStudent(Users users,Student student, HttpSession session){
		session.setAttribute("insertMessage", "");
		student.setStuId(users.getUsersId());
		studentService.insertStudent(users, student,"ROLE_STUDENT");
		return new ModelAndView("redirect:/select_student.do");
	}
	
	@RequestMapping("selectStudentByNameController")
	@ResponseBody
	public List<Student> selectStudentByName(String usersName){
		List<Student> list = studentService.selectStudentByName(usersName);
		return list;
	}
	
	@RequestMapping("selectStudentInfoByIdController")
	@ResponseBody
	public Map selectStudentInfoById(String stuId){
		Map map = new HashMap();
		map.put("student", studentService.selectStudentInfoById(stuId));
		return map;
	}
	
	@RequestMapping("deleteStudentController")
	public ModelAndView deleteStudent(String usersId, HttpSession session){
		session.setAttribute("deleteMessage", "");
		studentService.deleteStudent(usersId);
		return new ModelAndView("redirect:/select_student.do","delete","delete");
	}
	
	@RequestMapping("updateStudentController")
	public ModelAndView updateStudent(Users users, Student student,  HttpSession session){
		session.setAttribute("updateMessage", "");
		studentService.updateStudent(users, student);
		return new ModelAndView("redirect:/select_student.do","update","update");
	}
	
	@RequestMapping("selectStudentForUpdateController")
	public ModelAndView selectStudentForUpdateController(String usersId){
		Map map = studentService.selectStudentForupdate(usersId);
		ModelAndView view = new ModelAndView();
		view.setViewName("admin/student/update_student.tiles");
		view.addObject("stuGraduationDate", map.get("stuGraduationDate"));
		view.addObject("stuAdmissionDate", map.get("stuAdmissionDate"));
		view.addObject("info", map.get("info"));
		view.addObject("major", map.get("major"));
		view.addObject("majorDual", map.get("majorDual"));
		view.addObject("majorMinor", map.get("majorMinor"));
		view.addObject("majorList", map.get("majorList"));
		view.addObject("majorMinorList", map.get("majorMinorList"));
		view.addObject("majorDualList", map.get("majorDualList"));
		System.out.println(view);
		return view;
	}
}
