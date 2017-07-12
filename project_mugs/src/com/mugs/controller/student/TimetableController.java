package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.TimetableManagementService;
import com.mugs.vo.Course;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class TimetableController {
	
	@Autowired
	private TimetableManagementService timeTableManagementServiceImpl;
	
	@RequestMapping("getMyTimeTable")
	public ModelAndView getMyTimeTable(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = users.getUsersId();
		
		
		//String loginId="1";//시큐리티하기 전까지는 내가 임의로 선언 및 초기화
		//1.요청파라미터조회(위에서 다함) + 검증.  
		//2.비즈니스로직처리(서비스메소드 호출)
		List<Course> myTimeTableResult = timeTableManagementServiceImpl.findMyTimeTableByJoin(loginId);//내 시간표정보를 가져오는 서비스메소드
		//System.out.println("myTimeTableResult.get(0).toString()  :  " + myTimeTableResult.get(0).toString());
		
		//3.응답
		//view.setViewName("student/timeTable/myTimeTableView.tiles");
		//view.addObject("timeTableResult", myTimeTableResult.get(0));
		//view.addObject("yoyilAndGyoshi", myTimeTableResult.get(1));
		//return new ModelAndView("contents/student/timeTable/myTimeTableView", "myTimeTableResult", myTimeTableResult);
		return new ModelAndView("student/timeTable/myTimeTableView.tiles", "myTimeTableResult", myTimeTableResult);
		
		//return view;
	
	}
}
