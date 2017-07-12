package com.mugs.service.student;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;

public interface EvaluationManagementService {
	

	/**
	 * 로그인한 학생의 id에 따라 자신이 수강했던 과목의 설문응답상태를 조회하는 메소드
	 * @param loginId
	 * @return
	 */
	public List<EvaluationAnswer> getEvaluationValueList(String loginId);

	/**
	 * 학생이 설문&평가질문에 대한 점수, 평가정보들을 insert하는 메소드
	 */
	public List<EvaluationAnswer> addEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										 int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										 String nowSemester, String loginId, int subjectId, String proId);
	
	/**
	 * 현재기간을 기준으로 지금 설문응답이 가능한 기간인지를 조회해주는 메소드
	 * @return
	 */
	public String getEvaluationPeriod();
	

}
