package com.mugs.dao;

import java.util.List;

import com.mugs.vo.SubjectPlan;

public interface SubjectPlanDao {
	/**
	 * 한 개의 강의계획서에 대한 데이터를 insert하는 메소드
	 * 
	 * @param sp
	 * @return
	 */
	int insertSubjectPlan(SubjectPlan sp);

	/**
	 * 한 개의 강의계획서에 대한 데이터를 매개변수로 받은 SubjectPlan 객체의 Id와 일치하는 강의계획서의 정보를 update하는 메소드.
	 * 
	 * @param sp
	 * @return
	 */
	int updateSubjectPlanById(SubjectPlan sp);

	/**
	 * 매개변수로 받은 강의계획서Id와 일치하는 Data 삭제.
	 * 
	 * @param id
	 * @return
	 */
	int deleteSubjectPlan(int id);

	/**
	 * 매개변수로 받은 강의계획서Id와 일치하는 강의계획서의 Data 조회.
	 * 
	 * @param id
	 * @return
	 */
	SubjectPlan selectSubjectPlanById(int id);

	/**
	 * 모든 SubjectPlan Data들을 select하는 메소드.
	 * 
	 * @return
	 */
	List<SubjectPlan> selectSubjectPlanList();
	
	/** 영현이꼬
	 * 	4개의 매개변수를 받은 ID값들과 일치하는 강의계획서 Data 조회.
	 * @param planYear,planSemester,subjectId,proId
	 * @return SubjectPlan
	 */
	SubjectPlan selectSubjectPlanByFourId(int planYear, String planSemester, int subjectId, String proId);
	
}
