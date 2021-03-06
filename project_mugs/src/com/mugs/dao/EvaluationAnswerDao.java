package com.mugs.dao;

import java.util.ArrayList;
import java.util.List;

import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;

public interface EvaluationAnswerDao {
	/**
	 * 하나의 평가응답 등록
	 * @param 등록할 평가응답
	 * @return 변경된 행의 수
	 */
	int insertEvaluationAnswer(EvaluationAnswer ea);
	
	/**
	 * 하나의 평가응답 수정
	 * @param 수정할 평가응답
	 * @return 변경된 행의 수
	 */
	int updateEvaluationAnswerById(EvaluationAnswer ea);
	
	/**
	 * 하나의 평가응답 삭제
	 * @param 삭제할 평가응답의 id
	 * @return 변경된 행의 수
	 */
	int deleteEvaluationAnswerById(int eaId);
	
	/**
	 * 전체 평가응답 조회
	 * @return 평가응답 리스트
	 */
	List<EvaluationAnswer>  selectEvaluationAnswerAll();
	
	/**
	 * 하나의 평가응답 조회
	 * @param eaId
	 * @return 평가응답
	 */
	EvaluationAnswer selectEvaluationAnswerById(int eaId);

	/**
	 * 현재 로그인한 id, 현재년도, 현재학기를 매개변수로 받아서 수강한 과목의 평가응답상태를 조회하는 메소드
	 * @param loginIn
	 * @param nowYear
	 * @param nowSemester
	 * @return
	 */
	List<EvaluationAnswer> selectEvaluationAnswerValueList(String loginIn, int nowYear, String nowSemester);
	
	/**
	 * 설문에 응답한 정보를 insert하는 메소드
	 * @param nowYear
	 * @param nowSemester
	 * @param loginIn
	 * @param subjectId
	 * @param proId
	 * @return
	 */
	int insertEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
									int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
									String nowSemester, String loginId, int subjectId, String proId);
	
	
	ArrayList<Object> updateEvaluationAnswerState(int nowYear, String nowSemester, String loginId, int subjectId);
	
	
	List<EvaluationAnswer> selectEvaluationAnswerValue(int nowYear, String nowSemester, String loginId, int subjectId);
	
	/**
	 * 
	 * @param nowYear
	 * @param semester
	 * @param stuId
	 * @param subjectId
	 * @return
	 */
	int deleteEvaluationAnswerByEtc(int nowYear, String semester, String stuId, int subjectId);
}
