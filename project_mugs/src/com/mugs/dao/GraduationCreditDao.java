package com.mugs.dao;

import java.util.List;

import com.mugs.vo.GraduationCredit;

public interface GraduationCreditDao {
	
	/**
	 * 졸업학점 insert하는 메소드
	 * @param graduationCredit
	 * @return
	 */
	int insertGraduationCredit(GraduationCredit graduationCredit);
	
	/**
	 * 졸업학점 update하는 메소드
	 * @param graduationCredit
	 * @return
	 */
	int updateGraduationCreditById(GraduationCredit graduationCredit);
	
	/**
	 * 매개변수로 majorId, graduationCreditYear를 받아 해당하는 졸업학점 delete하는 메소드
	 * @param majorId
	 * @param graduationCreditYear
	 * @return
	 */
	int deleteGraduationCredit(int majorId, int graduationCreditYear);
	
	/**
	 * 졸업학점 전체 조회 메소드
	 * @return
	 */
	List<GraduationCredit> selectGraduationCreditList();
	
	/**
	 * 매개변수로 majorId, graduationCreditYear를 받아 해당되는 졸업학점 조회하는 메소드
	 * @param majorId
	 * @param graduationCreditYear
	 * @return
	 */
	GraduationCredit selectGraduationCreditById(int majorId, int graduationCreditYear);
	
	/**
	 * 매개변수로 majorId로 받아 해당하는 기준학점 조회 메소드
	 * @param majorId
	 * @return
	 */
	List<GraduationCredit> selectGraduationCreditByMajorId(int majorId);
	
	/**
	 * 해당 학생 전공의 졸업기준학점을 조회하는 메소드
	 * @param majorId
	 * @param year
	 * @param usersId
	 * @return 졸업기준학점
	 * @author 병문
	 */
	GraduationCredit selectGraduationCreditByMajorIdAndUsersId(int majorId, String year, String usersId);
}
