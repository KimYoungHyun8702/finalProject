package com.mugs.dao;

import java.util.List;

import com.mugs.vo.CreditGiveUp;

public interface CreditGiveUpDao {
	
	/**
	 * 학점포기 내역 한 개  insert하는 메소드
	 * @param creditGiveUp
	 * @return
	 */
	int insertCreditGiveUp(CreditGiveUp creditGiveUp);
	
	/**
	 * 학점포기 내역 update하는 메소드
	 * @param creditGiveUp
	 * @return
	 */
	int updateCreditGiveUp(CreditGiveUp creditGiveUp);
	
	/**
	 * 매개변수로 creditGiveUpId를 받아 학점포기 내역 delete하는 메소드
	 * @param creditGiveUpId
	 * @return
	 */
	int deleteCreditGiveUp(int creditGiveUpId);
	
	/**
	 * 학점포기 내역 전체 조회하는 메소드
	 * @return
	 */
	List<CreditGiveUp> selectCreditGiveUpList();
	
	/**
	 * 매개변수로 creditGiveUpId를 받아 해당되는 학점포기 내역 조회하는 메소드
	 * @param creditGiveUpId
	 * @return
	 */
	CreditGiveUp selectCreditGiveUpById(int creditGiveUpId);
	
	/**
	 * 매개변수로 stuId를 받아 해당되는 학생의 학기포기 내역을 조회하는 메소드
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @return
	 */
	List<CreditGiveUp> selectCreditGiveUpByStuId(String stuId);
	
	/**
	 * 매개변수로 학생ID와 현재연도, 현재학기를 받아서 현재연도, 학기에 해당학생이
	 * 학점포기한 리스트를 갖고온다.
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @param nowYear
	 * @param semester
	 * @return
	 */
	List<CreditGiveUp> selectCreditGiveUpByStuIdYearSemester(String stuId, int nowYear, String semester);
}
