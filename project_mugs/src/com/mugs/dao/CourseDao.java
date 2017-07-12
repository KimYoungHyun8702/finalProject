package com.mugs.dao;

import java.util.HashMap;
import java.util.List;

import com.mugs.vo.Course;

public interface CourseDao {
	/**
	 * 하나의 수강을 등록하는 메소드
	 * @param 등록할 수강객체
	 * @return 변경된 행의 수
	 */
	int insertCourse(Course c);
	
	/**
	 * 하나의 수강을 수정하는 메소드
	 * @param 변경할 수강객체
	 * @return 변경된 행의 수
	 */
	int updateCourseById(Course c);
	
	/**
	 * 수강 id로 하나의 수강을 삭제하는 메소드
	 * @param 수강 id
	 * @return 변경된 행의 수
	 */
	int deleteCourseById(int cId);
	
	/**
	 * 전체수강을 조회하는 메소드
	 * @return 전체수강정보
	 */
	List<Course> selectCourseAll();
	
	/**
	 * 수강 id로 하나의 수강을 조회하는 메소드
	 * @param 조회할 수강의 id
	 * @return 수강
	 */
	Course selectCourseById(int cId);
	
	
	/**
	 * 현재 월을 이용해 학기를 구하는 메소드
	 * @param nowYear
	 * @param nowMonth
	 */
	String selectHackGiIlJung(int nowMonth);
	
	
	/**
	 * 학생id, 해당년도, 해당학기를 이용하여 해당시기에 수강하고 있는 수강과목들의 정보와 교수명 조회 - 시간표조회용
	 * @param stuId
	 * @param nowYear
	 * @param nowSemester
	 * @return
	 */
	List<Course> selectMyTimeTableByJoin(String loninId, int nowYear, String nowSemester);
	
	/**
	 * 현재 로그인한 학생id를 통해서 현재 수강하고 있는 수강내역을 조회해주는 메소드
	 * @param loginId
	 * @param nowYear
	 * @param nowSemester
	 * @return
	 */
	List<Course> selectMyCourseListByJoin(String loginId, int nowYear, String nowSemester);
	

	/**
	 * 해당 연도, 학기에 해당하는 과목을 듣는 학생의 숫자를 구하는 메소드
	 * 
	 * @param semester
	 * @param nowYear
	 * @param subjectId
	 * @return
	 */
	int selectStudentCount(String semester, int nowYear, int subjectId);

	/** 영현이꼬
	 * 	4개의 매개변수를 받은 ID값들과 일치하는 수강 Data 조회.
	 * @param courseYear,courseSemester,subjectId
	 * @return Course
	 */
	List<Course> selectCourseByThreeId(int courseYear, String courseSemester, int subjectId);

	/**
	 * 해당 연도, 학기에 해당하는 학생의 과목 정보를 구하는 메소드
	 * 
	 * @param stuId
	 * @param nowYear
	 * @param semester
	 * @return
	 */
	List<Course> selectMyCourseList(String stuId, int nowYear, String semester);
	
	/**
	 * 해당연도, 학기에 해당하는 학생의 과목을 삭제하는 메소드
	 * 
	 * @param stuId
	 * @param nowYear
	 * @param semester
	 * @param subjectId
	 * @return
	 */
	int deleteCourse(String stuId, int nowYear, String semester, int subjectId);

	/** 영현이꼬
	 * 	2개의 매개변수를 받은 ID값들과 일치하는 학생의수강 list 조회.
	 * @param courseYear,courseSemester,subjectId
	 * @return Course
	 */
	List<Course> selectCourseByTwoId(int subjectId, String stuId);
}