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
	 * 3개의 매개변수와 일치하는 학사경고 내역 삭제
	 * @param probationYear
	 * @param probationSemester
	 * @param stuId
	 * @return
	 */
	int deleteAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId);
	
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
	
	/**
	 * 3개의 매개변수와 일치하는 학사경고 내역 insert
	 * @param probationYear
	 * @param probationSemester
	 * @param stuId
	 * @return
	 */
	AcademicProbation selectAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId);
	
	/**
	 * 학사경고 3번 이상 받은 학생 연도 학기 조회 메소드
	 * @return
	 */
	List<AcademicProbation> selectForExpel(String stuId);
	
	/**
	 * 학사경고 3번 이상 받은 학생 정보 조회 메소드
	 * @return
	 */
	List<AcademicProbation> selectForExpelStudentInfo();
}
