package com.mugs.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.EvaluationAnswer;

@Controller
@RequestMapping("/student/")
public class EvaluationController {
	
	@Autowired
	EvaluationManagementService evaluationServiceImpl;

	@RequestMapping("selectEvaluationAnswerValueList")
	public ModelAndView selectEvaluationAnswerValueList(){
		String loginId="사용자1";
		List<EvaluationAnswer> evaluationAnswerValueListResult = evaluationServiceImpl.getEvaluationValueList(loginId);
		return new ModelAndView("contents/student/timeTable/}/evaluationAnswerView", "evaluationAnswerValueListResult", evaluationAnswerValueListResult);
	}
}
