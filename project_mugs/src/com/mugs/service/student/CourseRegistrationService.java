package com.mugs.service.student;

import java.util.ArrayList;
import java.util.List;

import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.Standard;
import com.mugs.vo.Professor;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Subject;

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

	// 단과대학(학부)의 ID를 매개변수 받아서 해당대학(학부)에 속하는 전체 학과 정보 얻기
	List<Major> selectMajorByCollegeId(int collegeId);
	
	//
	List<ProfessorSubject> getProfessorSubjectList(int majorId, int nowYear, String subjectSemester);
	
	
	List<ProfessorSubject> getMySubject(int subjectId, String proId, String semester, int majorId);

	
	//
	List<ProfessorSubject> deleteMySubject(int subjectId, String proId, String semester, int majorId);

	Subject getSubject(int num);
}
