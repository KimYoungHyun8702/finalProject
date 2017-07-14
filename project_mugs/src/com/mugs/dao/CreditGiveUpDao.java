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
	List<CreditGiveUp> SelectCreditGiveUpList();
	
	/**
	 * 매개변수로 creditGiveUpId를 받아 해당되는 학점포기 내역 조회하는 메소드
	 * @param creditGiveUpId
	 * @return
	 */
	CreditGiveUp SelectCreditGiveUpById(int creditGiveUpId);
	
	/**
	 * 학점 포기 현황 전체 조회 메소드
	 * @return
	 */
	List<CreditGiveUp> selectCreditGiveUpJoin();
}
