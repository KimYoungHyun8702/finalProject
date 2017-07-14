package com.mugs.service.professor;

import java.util.List;

import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.SubjectPlan;

public interface SubjectPlanService {
	
	/**
	 * proId로 담당과목 list를 조회
	 * subject/professor 와 조인관계에 있다.
	 * @param proId
	 * @return
	 */
	List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId);
	
	/** ------------영현이꼬---------
	 * 4개의 매개변수로 강의계획서를 조회
	 * 
	 * @param proId
	 * @return
	 */
	SubjectPlan getSubjectPlanByFourId(int planYear, String planSemester, int subjectId, String proId);
	
	/** --------------영현이꼬-------------
	 * 하나의 강의계획서를 등록
	 * @param sp
	 */
	void addSubjectPlan(SubjectPlan sp);
	
	/** --------------영현이꼬-------------
	 *  하나의 강의계획서를 수정
	 * @param sp
	 */
	void setSubjectPlan(SubjectPlan sp);
	
	/** --------------영현이꼬-------------
	 * 하나의 강의계획서를 삭제
	 * @param sp
	 */
	void deleteSubjectPlanById(int planId);
}
