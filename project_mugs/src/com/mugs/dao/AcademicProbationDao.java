package com.mugs.dao;

import java.util.List;

import com.mugs.vo.AcademicProbation;

public interface AcademicProbationDao {
	
	/**
	 * insert 하는 메소드
	 * @param AcademicProbation
	 * @return
	 */
	int insertAcademicProbation(AcademicProbation academicProbation);
	
	/**
	 * update하는 메소드
	 * @param AcademicProbation
	 * @return
	 */
	int updateAcademicProbationById(AcademicProbation academicProbation);
	
	/**
	 * delete하는 메소드
	 * @param probationId
	 * @return
	 */
	int deleteAcademicProbation(int probationId);
	
	/**
	 * 매개변수로 학사경고id를 받아서 정보를 select하는 메소드
	 * @param probationId
	 * @return
	 */
	AcademicProbation selectAcademicProbationById(int probationId);
	/**
	 * AcademicProbation테이블의 모든 정보를 select하는 메소드
	 * @return
	 */
	List<AcademicProbation> selectAcademicProbationList();
	/**
	 * 매개변수로 학생ID 받아서 정보를 SELECT하는 메소드.
	 * @param stuId
	 * @return
	 */
	List<AcademicProbation> selectAcademicProbationByStuId(String stuId);
	
}
