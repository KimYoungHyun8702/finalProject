package com.mugs.dao;

import java.util.List;

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

}
