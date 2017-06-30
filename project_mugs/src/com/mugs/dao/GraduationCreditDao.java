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
}
