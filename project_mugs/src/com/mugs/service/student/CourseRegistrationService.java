package com.mugs.service.student;

import java.util.ArrayList;
import java.util.List;

import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.Standard;

public interface CourseRegistrationService {

	/**
	 * 학부리스트를 조회하는 메소드
	 * @return
	 */
	List<College> getCollegeList();
	
	//
	List<String> getSubjectType();
	
	//
	List<Major> findMajorByCollegeId(int collegeId);
	
	
	/**
	 * 로그인한 학생id를 통해서 자신의 현재 수강내역을 조회해주는 메소드
	 * @param loginId
	 * @return
	 */
	List<Course> findMyCourseListByJoin(String loginId);
	
	/**
	 * 학과id에 따라 해당년도를 조회하는 메소드
	 * @param majorId
	 * @return
	 */
	List<Standard> findYearListByMajorId(int majorId);

	/**
	 * 선택년도에 따라 기준수강신청학점 조회하는 메소드
	 * @param year
	 * @return
	 */
	Standard findStandardValue(int collegeId, int majorId, int standardYear);

}
