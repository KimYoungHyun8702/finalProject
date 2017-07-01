package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Credit;

public interface CreditDao {
	/**
	 * 한 개 학점에 대한 데이터를 insert하는 메소드
	 * 
	 * @param credit
	 * @return
	 */
	int insertCredit(Credit credit);

	/**
	 * 한 학점의 데이터를 매개변수로 받은 Credit객체의 Id와 일치하는 학점의 정보를 update하는 메소드.
	 * 
	 * @param credit
	 * @return
	 */
	int updateCreditById(Credit credit);

	/**
	 * 매개변수로 받은 학점Id와 일치하는 Data 삭제.
	 * 
	 * @param id
	 * @return
	 */
	int deleteCredit(int id);

	/**
	 * 매개변수로 받은 학점Id와 일치하는 학점의 Data 조회.
	 * 
	 * @param id
	 * @return
	 */
	Credit selectCreditById(int id);

	/**
	 * 매개변수로 받은 학생Id와 일치하는 연도들을 조회.
	 * 
	 * @param id
	 * @return
	 */
	List<Integer> selectYearByStuId(String id);

	/**
	 * 모든 Credit Data들을 select하는 메소드.
	 * 
	 * @return
	 */
	List<Credit> selectCreditList();

	/**
	 * credit_year(연도)로 학점테이블의 데이터를 select하는 메소드 ->join 연산을 이용해 조회된 과목테이블에 대한
	 * 정보도 같이 조회한다.
	 * 
	 * @param year
	 * @return
	 */
	List<Credit> selectCreditByYear(int year);

	/**
	 * credit_semester(학기)로 학점테이블의 데이터를 select하는 메소드. ->join 연산을 이용해 조회된 과목테이블에
	 * 대한 정보도 같이 조회한다.
	 * 
	 * @param semester
	 * @return
	 */
	List<Credit> selectCreditBySemester(String semester);

	/**
	 * subject_type(이수구분)로 학점테이블의 데이터를 select하는 메소드. -> join 연산을 이용해 조회된 과목테이블에
	 * 대한 정보도 같이 조회한다.
	 * 
	 * @param type
	 * @return
	 */
	List<Credit> selectCreditByType(String type);

	/**
	 * credit_year(학년)와 credit_semester(학기)로 학점테이블의 데이터를 select하는 메소드. ->join
	 * 연산을 이용해 조회된 과목테이블에 대한 정보도 같이 조회한다.
	 * 
	 * @param year
	 * @param semester
	 * @return
	 */
	List<Credit> selectCreditByYearAndSemester(int year, String semester);
}
