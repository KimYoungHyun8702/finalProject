package com.mugs.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		view.setViewName("contents/admin/student/insert_student");
		view.addObject("major",map.get("major"));
		view.addObject("majorDual",map.get("majorDual"));
		view.addObject("majorMinor",map.get("majorMinor"));
		return view;
	}
	@RequestMapping("insertStudentController")
	public ModelAndView insertStudent(Users users,Student student){
		System.out.println(users);
		System.out.println(student);
		student.setStuId(users.getUsersId());
		studentService.insertStudent(users, student);
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
	public String deleteStudent(String usersId){
		studentService.deleteStudent(usersId);
		return "redirect:/select_student.do";
	}
	
	@RequestMapping("updateStudentController")
	public String updateStudent(Users users, Student student){
		studentService.updateStudent(users, student);
		return "redirect:/select_student.do";
	}
	
	@RequestMapping("selectStudentForUpdateController")
	public ModelAndView selectStudentForUpdateController(String usersId){
		Map map = studentService.selectStudentForupdate(usersId);
		ModelAndView view = new ModelAndView();
		view.setViewName("contents/admin/student/update_student");
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
