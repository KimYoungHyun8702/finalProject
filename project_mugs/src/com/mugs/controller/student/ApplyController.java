package com.mugs.controller.student;



import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.ApplyService;
import com.mugs.vo.LeaveReturnApplication;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class ApplyController {

	@Autowired
	private ApplyService applyServiceImpl;
	
	/**
	 * 현재 로그인한 학생ID를 이용해 휴복학 내역을 가져와서 휴복학 신청페이지로 이동
	 * 
	 * By Baek.J.H
	 * @return
	 */
	@RequestMapping("getLeaveReturnApplicationListByStuId")
	public ModelAndView getLeaveReturnApplicationListByStuId() {
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		
		List<LeaveReturnApplication> leaveReturnApplicationList = applyServiceImpl.findLeaveReturnApplicationListByStuId(stuId);
		
		return new ModelAndView("student/leaveReturnApplication.tiles", "leaveReturnApplicationList", leaveReturnApplicationList);
	}
	
	/**
	 * 신청종류를 매개변수로 받아서 휴/복학신청이 가능하면 신청을 하고 신청이 안되면 안되는 이유메세지를 리턴
	 * 
	 * By Baek.J.H
	 * @param LRApplicationType
	 * @return
	 */
	@RequestMapping(value="addLeaveReturnApplication", produces="text/html;charset=utf-8")
	@ResponseBody 
	public HashMap<String, Object> addLeaveReturnApplication(String LRApplicationType) {
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		
		HashMap map = applyServiceImpl.addLeaveReturnApplication(stuId, LRApplicationType);
		
		Iterator iterator = map.entrySet().iterator();
		
		return null;
	}
}                    