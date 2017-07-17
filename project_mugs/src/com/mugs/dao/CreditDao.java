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

	/** 영현이꼬
	 * 한 학점의 데이터를 4개의 매개변수로 받은 Credit객체의 Id와 일치하는 학점의 정보를 update하는 메소드.
	 * 
	 * @param credit
	 * @return
	 */
	int updateCreditByFourId(Credit credit);
	
	/** 영현이꼬
	 * 한 학점의 데이터를 3개의 매개변수로 받은 Credit객체의 평균학점의 정보를 select하는 메소드.
	 * 
	 * @param credit
	 * @return 
	 */
	double selectCreditAvgByThreeId(int creditYear, String creditSemester, String stuId);
	
	
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
	 * 매개변수로 받은 학생Id와 일치하는 학점의 Data 조회.
	 * 
	 * @param stuId
	 * @return
	 */
	Credit selectCreditByFourId(int creditYear, String creditSemester, String stuId, int subjectId);
	
	/**
	 * 매개변수로 받은 학생Id와 일치하는 연도들을 조회.
	 * 
	 * @param id
	 * @return
	 */
	List<Integer> selectYearByStuId(String id);

	/**
	 * 매개변수로 박은 학생Id와 일치하는 모든 연도들의 성적을 조회.
	 * 
	 * @param id
	 * @return
	 */
	List<Credit> selectAllCreditByStuId(String id);

	/**
	 * 매개변수로 받은 연도와 일치하는 학기들을 조회.
	 * 
	 * @param year
	 * @return
	 */
	List<String> selectSemesterByYear(String id, int year);

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
	List<Credit> selectCreditByYear(String id, int year);

	/**
	 * credit_semester(학기)로 학점테이블의 데이터를 select하는 메소드. ->join 연산을 이용해 조회된 과목테이블에
	 * 대한 정보도 같이 조회한다.
	 * 
	 * @param semester
	 * @return
	 */
	List<Credit> selectCreditBySemester(String id, String semester);

	/**
	 * subject_type(이수구분)로 학점테이블의 데이터를 select하는 메소드. -> join 연산을 이용해 조회된 과목테이블에
	 * 대한 정보도 같이 조회한다.
	 * 
	 * @param type
	 * @return
	 */
	List<Credit> selectCreditByType(String id, int year, String semester, String type);

	/**
	 * 학생의 전체 학점리스트에서 subject_type(이수구분)로 학점테이블의 데이터를 select하는 메소드. -> join 연산을 이용해 조회된 과목테이블에
	 * 대한 정보도 같이 조회한다.
	 * 
	 * @param type
	 * @return
	 */
	List<Credit> selectCreditByOneType(String id, String type);

	/**
	 * credit_year(연도)와 credit_semester(학기)로 학점테이블의 데이터를 select하는 메소드. ->join
	 * 연산을 이용해 조회된 과목테이블에 대한 정보도 같이 조회한다.
	 * 
	 * @param year
	 * @param semester
	 * @return
	 */
	List<Credit> selectCreditByYearAndSemester(String id, int year, String semester);
	/**
	 * credit_year(연도)와 subject_type로 학점테이블의 데이터를 select.
	 * @param year
	 * @param type
	 * @return
	 */
	List<Credit> selectCreditByYearType(String id, int year, String type);
	

	/**
	 * 과목ID와 로그인된 학생ID를 통해서 해당과목의 학점을 얻는 메소드
	 * @param subjectId
	 * @param stuId
	 * @return
	 */
	List<Double> selectCreditScoreBySubjectIdStuId(int subjectId, String stuId);

	/**
	 * 해당 학생이 이수했던 과목들의 학점 조회 메소드
	 * @param year
	 * @param type
	 * @return
	 * @author 병문
	 */
	List<Credit> selectCreditByYearSemesterAndUsersId(int year, String semester,String usersId);
}
