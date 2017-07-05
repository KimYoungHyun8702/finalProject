package com.mugs.dao;

import java.util.List;

import com.mugs.vo.AcademicCalendar;

public interface AcademicCalendarDao {
	
	/**
	 * insert 하는 메소드
	 * @param academicCalendar
	 * @return
	 */
	int insertAcademicCalendar(AcademicCalendar academicCalendar);
	
	/**
	 * update하는 메소드
	 * @param academicCalendar
	 * @return
	 */
	int updateAcademicCalendarById(AcademicCalendar academicCalendar);
	
	/**
	 * 매개변수로 학사일정id를 받아서 delete하는 메소드
	 * @param calendarId
	 * @return
	 */
	int deleteAcademicCalendar(int calendarId);
	
	/**
	 * 매개변수로 학사일정id를 받아서 정보를 select하는 메소드
	 * @param calendarId
	 * @return
	 */
	AcademicCalendar selectAcademicCalendarById(int calendarId);
	/**
	 * AcademicCalendar테이블의 모든 정보를 select하는 메소드
	 * @return
	 */
	List<AcademicCalendar> selectAcademicCalendarList();
	/**
	 * 매개변수로 연도와 학사일정명을 받아서 정보를 select하는 메소드.
	 * @param year
	 * @param name
	 * @return
	 */
	AcademicCalendar selectCalendarByYearCalName(int year, String calName);
}
