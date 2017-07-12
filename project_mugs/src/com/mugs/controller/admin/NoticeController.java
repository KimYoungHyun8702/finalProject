package com.mugs.controller.admin;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.NoticeService;
import com.mugs.vo.Notice;

@Controller
@RequestMapping("/admin/")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("insertNoticeController")
	public String insertNotice(Notice notice){
		notice.setNoticeDate(new Date());
		noticeService.insertNotice(notice);
		return "redirect:/admin/selectNoticeController.do";
	}
	
	@RequestMapping("updateNoticeController")
	public String updateNotice(Notice notice){
		notice.setNoticeDate(new Date());
		noticeService.updateNotice(notice);
		return "redirect:/admin/selectNoticeController.do";
	}
	
	@RequestMapping("selectNoticeController")
	public ModelAndView selectNotice(){
		ModelAndView view = new ModelAndView();
		Map notice = noticeService.selectNotice();
		view.setViewName("admin/notice/select_notice.tiles");
		view.addObject("notice", notice.get("notice"));
		view.addObject("date",notice.get("date"));
		return view;
	}
	
	@RequestMapping("selectNoticeForUpdateController")
	public ModelAndView selectNoticeForUpdate(){
		ModelAndView view = new ModelAndView();
		Map notice = noticeService.selectNotice();
		view.setViewName("admin/notice/update_notice.tiles");
		view.addObject("notice", notice.get("notice"));
		view.addObject("date",notice.get("date"));
		return view;
	}
}
