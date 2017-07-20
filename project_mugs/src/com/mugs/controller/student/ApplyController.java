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
	@RequestMapping("addLeaveReturnApplication")
	@ResponseBody 
	public HashMap<String, Object> addLeaveReturnApplication(String LRApplicationType) {
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return applyServiceImpl.addLeaveReturnApplication(stuId, LRApplicationType);
	}
	
	/**
	 * LRApplicationId를 매개변수로 받아서 해당 휴복학신청을 delete한다.
	 * 
	 * By Baek.J.H
	 * @param LRApplicationId
	 * @return
	 */
	@RequestMapping("cancelLeaveReturnApplication")
	@ResponseBody
	public HashMap<String, Object> cancelLeaveReturnApplication(int LRApplicationId) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return applyServiceImpl.deleteLeaveReturnApplicationById(stuId, LRApplicationId);
	}
	
	/**
	 * 로그인한 해당 학생의 학점포기신청 내역 및 학점포기 신청 가능 여부를 메세지로 리턴
	 * 
	 * By Baek.J.H
	 * @return
	 */
	@RequestMapping("getCreditGiveUpListByStuId")
	public ModelAndView getCreditGiveUpListByStuId() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		
		ModelAndView model = new ModelAndView();
		model.setViewName("student/creditGiveUp.tiles");
		
		HashMap<String, Object> map = applyServiceImpl.findCreditGiveUpList(stuId);
		
		Iterator iterator = map.entrySet().iterator();
		
		while (iterator.hasNext()) {
			Entry entry = (Entry)iterator.next();
			model.addObject(entry.getKey().toString(), entry.getValue());
		}
		return model;
	}
	
	/**
	 * 로그인한 해당 학생의 학점포기 신청하는 메소드 학점포기가 불가능한 조건이면
	 * 메세지 리턴
	 * 
	 * By Baek.J.H
	 * @param creditId
	 * @return
	 */
	@RequestMapping("addCreditGiveUp")
	@ResponseBody
	public HashMap<String, Object> addCreditGiveUp(int creditId) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return applyServiceImpl.addCreditGiveUp(creditId, stuId);
	}
	
	/**
	 * 학점포기 신청한 신청내역에서 대기중인 학점포기 신청을 취소하는 메소드
	 * 
	 * By Baek.J.H
	 * @param CGUId
	 * @return
	 */
	@RequestMapping("deleteCreditGiveUp")
	@ResponseBody
	public HashMap<String, Object> deleteCreditGiveUp(int CGUId) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		return applyServiceImpl.deleteCreditGiveUp(stuId, CGUId);
	}
	
	
}                    