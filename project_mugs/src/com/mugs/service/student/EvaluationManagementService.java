package com.mugs.service.student;

import java.util.List;

import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;

public interface EvaluationManagementService {
	

	/**
	 * 로그인한 학생의 id에 따라 자신이 수강했던 과목의 설문응답상태를 조회하는 메소드
	 * @param loginId
	 * @return
	 */
	public List<EvaluationAnswer> getEvaluationValueList(String loginId);

}
