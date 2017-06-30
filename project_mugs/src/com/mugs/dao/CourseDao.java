package com.mugs.dao;

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
	
}