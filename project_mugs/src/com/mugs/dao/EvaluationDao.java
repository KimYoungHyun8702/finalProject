package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Evaluation;

public interface EvaluationDao {
	/**
	 * 교수가 맡은 과목에 대한 평가를 등록하는 dao(evaluation_id_seq => 시퀀스로 이용)
	 * @return 변경된 행의 수 (int)
	 */
	int insertEvaluation(Evaluation e);
	
	/**
	 * 교수가 맡은 과목에 대한 평가를 삭제하는 dao
	 * @return 변경된 행의 수 (int)
	 */
	int deleteEvaluationById(int evalId);
	
	/**
	 * 교수가 맡은 과목에 대한 평가를 평가 id로 수정하는 dao 
	 * @return 변경된 행의 수 (int)
	 */
	int updateEvaluationById(Evaluation e);
	
	/**
	 * 교수가 맡은 과목에 대한 평가를 평가 id로 조회하는 dao
	 * @return 평점 id로 조회된 평점
	 */
	Evaluation selectEvaluationById(int evalId);
	
	/**
	 * 전체 평가에 대한 조회
	 * @return 리스트로 리턴.
	 */
	List<Evaluation> selectEvaluationAll();
	
}
