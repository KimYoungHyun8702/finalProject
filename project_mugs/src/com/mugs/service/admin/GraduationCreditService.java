package com.mugs.service.admin;

import java.util.List;

import com.mugs.vo.GraduationCredit;

public interface GraduationCreditService {
	
	/**
	 * 기준 학점 등록 메소드
	 * @param graduationCredit
	 * @return
	 */
	int insertGraduationCredit(GraduationCredit graduationCredit);
	
	/**
	 * 기준 학점 수정 메소드
	 * @param graduationCredit
	 * @return
	 */
	int updateGraduationCredit(GraduationCredit graduationCredit);
	
	/**
	 * 매개변수로  majorId 및 graduationCreditYear를 받아 해당하는 기준 학점 삭제 메소드
	 * @param majorId
	 * @param graduationCreditYear
	 * @return
	 */
	int deleteGraduationCredit(int majorId, int graduationCreditYear);
	
	/**
	 * 기준 학점 조회 메소드
	 * @return
	 */
	List<GraduationCredit> selectGraduationCreditList();
	
	/**
	 * 매개변수로 majorId 및 graduationCreditYear를 받아 해당하는 기준 학점 조회 메소드
	 * @param majorId
	 * @param graduationCreditYear
	 * @return
	 */
	GraduationCredit selectGraduationCreditbyId(int majorId, int graduationCreditYear);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 기준 학점 조회 메소드
	 * @param majorId
	 * @return
	 */
	List<GraduationCredit> selectGraduationCreditByMajorId(int majorId);
}
