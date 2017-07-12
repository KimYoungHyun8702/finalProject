package com.mugs.controller.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mugs.service.student.ApplyService;

@Controller
@RequestMapping("/student/")
public class ApplyController {

	@Autowired
	private ApplyService applyServiceImpl;
}                    