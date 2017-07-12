package com.mugs.controller.student;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.StudentIndividualService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Student;
import com.mugs.vo.Users;


@Controller
@RequestMapping("/student/")
public class StudentIndividualController {
	//병문 학생정보관리 Controller   
	@Autowired
	private StudentIndividualService service;	
	@Autowired
	private PasswordEncoder passwordEncoder;	
	//이수구분 선택 시 해당 과목들의 id를 넘긴다.
	List<Integer> subIdList = new ArrayList<Integer>();
	
	@RequestMapping("moveUpdatePwd")
	public ModelAndView moveUpdatePwd(){
		Users stu = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		return new ModelAndView ("student/IndividualInfo/update_stu_pwd.tiles","reFormDateStu",service.findStudentInfoById(stu.getUsersId()));	
	}
	
	@RequestMapping("updatePassword")
	public ModelAndView updateUsersPassword(@ModelAttribute Users acptUser, 
									@RequestParam String oldUserPassword)throws Exception{
		Users loginUser = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = loginUser.getUsersId();
		
		//요청한(로그인한) 사용자의 정보 조회
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		
		//패스워드 체크				
		if(!passwordEncoder.matches(oldUserPassword, ((Users)authentication.getPrincipal()).getUsersPassword())){ 
			String errorMessage = "기존 비밀번호가 틀렸습니다.";		
			return new ModelAndView("redirect:/student/moveUpdatePwd.do?errorMessage="+URLEncoder.encode(errorMessage,"UTF-8"));
		}		 
		  
		//Business Logic 호출
		acptUser.setUsersId(stuId);
		service.updateStudentPassword(acptUser);
		
		UsernamePasswordAuthenticationToken newAutentication = 
				new UsernamePasswordAuthenticationToken(acptUser, acptUser.getUsersPassword(), authentication.getAuthorities());

		context.setAuthentication(newAutentication);
		return new ModelAndView("student/IndividualInfo/stuInfo_update_form.tiles","reFormDateStu", service.findStudentInfoById(acptUser.getUsersId()));
	}
	
	@RequestMapping("moveUpdateForm")
	public ModelAndView moveUpdateFrom(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("student/IndividualInfo/stuInfo_update_form.tiles","reFormDateStu",service.findStudentInfoById(users.getUsersId()));
	}

	@RequestMapping("updateStuAndSelect")
	public ModelAndView updateStudentInformation(
									@RequestParam
									String usersEmail,
									@RequestParam
									String usersPhoneNum,
									@RequestParam
									String usersCellNum,
									@RequestParam
									String usersCurrentAddr,
									@RequestParam
									String usersBornAddr,
									@RequestParam("upImage")
									MultipartFile upImage,
									HttpServletRequest req,
									ModelMap map) throws Exception{
		
		Users updateUser = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(upImage!=null && !upImage.isEmpty()){//Image로 넘어온게 없거나, 넘어왔는데 파일이 없으면
			String fileName= upImage.getOriginalFilename();		
			File dest = new File(req.getServletContext().getRealPath("/resource/up_image"),fileName);			
			upImage.transferTo(dest);
			updateUser.setUsersPhoto(fileName);
			map.addAttribute("fileName",fileName);			
		}else{
			String fileName = upImage.getOriginalFilename();
			fileName = null;
			updateUser.setUsersPhoto(fileName);
			map.addAttribute("fileName", fileName);
		}
		
		updateUser.setUsersEmail(usersEmail);
		updateUser.setUsersPhoneNum(usersPhoneNum);
		updateUser.setUsersCellNum(usersCellNum);
		updateUser.setUsersCurrentAddr(usersCurrentAddr);
		updateUser.setUsersBornAddr(usersBornAddr);
				
		service.updateStudentHumanInfo(updateUser);		
		map.addAttribute("updateStu", service.findStudentInfoById(updateUser.getUsersId()));
		return new ModelAndView ("student/IndividualInfo/stuInfo.tiles","reFormDateStu",service.findStudentInfoById(updateUser.getUsersId()));
	}  
	
	@RequestMapping("getStudentInfoById")
	@ResponseBody
	public ModelAndView getStudentAllInformaion(){ 
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return new ModelAndView("student/IndividualInfo/stuInfo.tiles","reFormDateStu",service.findStudentInfoById(stuId));
	}
	
	@RequestMapping("getAllTimeTable")
	public ModelAndView getAllTimeTable(){
		 List<College> list = service.getCollegeList();
		 return new ModelAndView("student/IndividualInfo/allTimeTable.tiles","list",list);
	}
	
	@RequestMapping("getMajorLists")
	@ResponseBody
	public List<Major> getMajorLists(int collegeId){
		List<Major> majorList = service.getMajorList(collegeId);
		return majorList;
	}
	
	@RequestMapping("getSubjectTypeList")
	@ResponseBody
	public List <Object> getSubjectTypeListByMajorId(int majorId){
		List<Object> subjectList = service.getSubjectTypeListByMajorId(majorId);
		List<Object> subjectAndsubTypeList = new ArrayList<Object>();
					
		//과목 리스트에는 전공 중복제거한 구문이 없기 때문에 StudentIndividualServiceImpl에서 따로 이수구분 추가함.
		subjectAndsubTypeList.add(subjectList);	
		subjectAndsubTypeList.add(subjectList.get(3));
		
		return subjectAndsubTypeList;
	}
	
	@RequestMapping("getSubjectBySubjectType")
	@ResponseBody
	public List<Object> getSubjectBySubjectType(@RequestParam String majorId,
												@RequestParam String subjectType){
		List<Object> param = new ArrayList<Object>();
		param.add(majorId); 
		param.add(subjectType); 

		List<Object> result = service.getSubjectBySubjectTypeAndMajorId(param);	
		return result; 
	} 
}
