package com.mugs.service.student;

import java.util.HashMap;
import java.util.List;

import com.mugs.vo.EvaluationAnswer;

public interface EvaluationManagementService {
	


	/**
	 * 학생이 설문&평가질문에 대한 점수, 평가정보들을 insert하는 메소드
	 */
	public List<EvaluationAnswer> addEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										 int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										 String nowSemester, String loginId, int subjectId, String proId);

	

	public HashMap<String, Object> getEvaluationPeriod(String loginId);

}
