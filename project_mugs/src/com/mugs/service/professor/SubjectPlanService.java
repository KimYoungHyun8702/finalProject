package com.mugs.service.professor;

import java.util.List;

import com.mugs.vo.ProfessorSubject;

public interface SubjectPlanService {
	
	/**
	 * proId로 담당과목 list를 조회
	 * subject와 조인관계에 있다.
	 * @param proId
	 * @return
	 */
	List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId);
}
