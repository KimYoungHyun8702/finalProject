package com.mugs.service.student;

import java.util.HashMap;
import java.util.List;

import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Standard;
import com.mugs.vo.Subject;

public interface CourseRegistrationService {

	/**
	 * 학부리스트를 조회하는 메소드
	 * 
	 * By Baek.J.H
	 * @return HashMap<String, Object>
	 */
	HashMap<String, Object> findCollegeList(String subjectType, String stuId);
	
	
	
	
	/**
	 * 수강신청 탭을 눌렀을 때 오늘 날짜가 수강신청 기간이면 
	 * 대분류인 이수구분과 현재 학기, 학적상태를 각각 맵에 담아서 리턴
	 * 현재 수강신청 기간이 아니면 수강신청기간이 아니라는 메시지를 맵에 담아 리턴
	 * 
	 * By Baek.J.H
	 * @param stuId
	 * @return HashMap<String, Object>
	 */
	HashMap<String, Object> getSubjectTypeMap(String stuId);
	
	
	
	
	/**
	 * 단과대학(학부)ID를 통해서
	 * 해당 단과대학에 소속된 학과의 정보를 리스트에 담아서 리턴
	 * 
	 * By Cho.S.R
	 * @param collegeId
	 * @return
	 */
	List<Major> findMajorListByCollegeId(int collegeId);
	
	
	
	
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

	
	
	/**
	 * 학과의 ID와 현재연도, 학기정보, 이수구분을 이용하여
	 * 그학과에서 개설한 강의를 모두 가져온다.
	 * 
	 * By Beak.J.H
	 * @param majorId
	 * @param nowYear
	 * @param semester
	 * @param subjectType
	 * @return
	 */
	HashMap<String, Object> findSubjectListByJoin(int majorId, int nowYear, String semester, String subjectType, String stuId);
	
	
	
	
	/**
	 * 
	 * 
	 * By Beak.J.H
	 * @param subjectId
	 * @param proId
	 * @param semester
	 * @param majorId
	 * @return
	 */
	HashMap<String, Object> addCourseMySubject(int majorId, String semester, int nowYear, String subjectType, String recourse, String proId, int subjectId, String stuId, String  stuRegister);

	
	List<College> getCollegeList();
	
	/**
	 * 
	 * By Baek.J.H
	 * @param subjectId
	 * @param proId
	 * @param semester
	 * @param majorId
	 * @param nowYear
	 * @param stuId
	 * @return
	 */
	HashMap<String, Object> deleteMySubject(int subjectId, String proId, String semester, int majorId, int nowYear, String stuId, String subjectType);
}
