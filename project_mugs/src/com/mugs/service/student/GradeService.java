package com.mugs.service.student;

import java.util.List;
import java.util.Map;

import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Credit;

public interface GradeService {
	/**
	 * 매개변수로 학생 id을 받아 학점테이블에서 연도를 조회한다.
	 * @param id
	 * @return
	 */
	List<Integer> getYear(String id);
	/**
	 * 매개변수로 연도를 받아 학점테이블에서 그 연도에 맞는 학기들을 조회한다.
	 * @param year
	 * @return
	 */
	List<String> getSemester(String id, int year);
	/**
	 * 매개변수로 학생Id을 받아 모든 연도에 학점을 조회한다.
	 * @param id
	 * @return
	 */
	List<Credit> getAllCredit(String id);
	/**
	 * 매개변수로 연도를 받아 학점테이블에서 그에 맞는 성적을 조회한다.
	 * @param year
	 * @return
	 */
	List<Credit> getCreditByYear(String id, int year);
	/**
	 * 매개변수로 연도와 학기를 받아 학점테이블에서 그에 맞는 성적을 조회한다.
	 * @param year
	 * @param semester
	 * @return
	 */
	List<Credit> getCreditByYearSemester(String id, int year, String semester);
	/**
	 * 매개변수로 이수구분을 받아 모든 성적리스트에서 이수구분으로 성적을 조회한다.
	 * @param type
	 * @return
	 */
	List<Credit> getCreditByOneType(String id, String type);
	/**
	 * 매개변수로 연도와 학기 이수구분을 받아 그에 맞는 성적을 조회한다.
	 * @param year
	 * @param semester
	 * @param type
	 * @return
	 */
	List<Credit> getCreditByType(String id, int year, String semester, String type);
	/**
	 * 매개변수로 연도와 이수구분을 받아 그에 맞는 성적을 조회한다.
	 * @param year
	 * @param type
	 * @return
	 */
	List<Credit> getCreditByYearType(String id, int year, String type);
	/**
	 * 연도와 학사일정명으로 그에 맞는 학사일정 조회 여부를 체크한다.
	 * @return
	 */
	Map getCalendarByYearAndCalName();
	/**
	 * 매개변수로 학생Id을 받아 그에 맞는 학사경고 내역을 조회한다.
	 * @param stuId
	 * @return
	 */
	List<AcademicProbation> getAcademicProbationByStuId(String stuId);
}
