package com.mugs.service.student;

import java.util.HashMap;
import java.util.List;

import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Major;

public interface EvaluationManagementService {
	


	/**
	 * 학생이 설문&평가질문에 대한 점수, 평가정보들을 insert하는 메소드
	 */
	public List<EvaluationAnswer> addEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										 int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										 String nowSemester, String loginId, int subjectId, String proId);

	

	public HashMap<String, Object> getEvaluationPeriod(String loginId);
	
	
	/**
	 * Baek
	 * @return
	 */
	List<String> getSubjectTypeList();
	
	/**
	 * 학부리스트를 조회하는 메소드
	 * 
	 * By Baek.J.H
	 * @return HashMap<String, Object>
	 */
	HashMap<String, Object> findCollegeList(String subjectType);
	
	
	/**
	 * 
	 * 
	 * By Baek.J.H
	 * @return List<Major>
	 */
	List<Major> findMajorListByCollegeId(int collegeId);
	
	/**
	 *
	 * By Beak.J.H
	 * @param majorId
	 * @param subjectType
	 * @return
	 */
	HashMap<String, Object> findSubjectListByJoin(int majorId, String subjectType);
	
	/**
	 * 
	 * By Beak.J.H
	 * @param subjectId
	 * @param proId
	 * @return
	 */
	HashMap<String, Object> getEvaluationGraph(int subjectId, String proId);
}
