package com.mugs.service.admin;

import java.util.List;
import java.util.Map;

import com.mugs.vo.Room;
import com.mugs.vo.Subject;

public interface SubjectService {
	
	/**
	 * 한 개의 과목 등록 메소드
	 * @param subject
	 * @return
	 */
	int insertSubject(Subject subject);
	
	/**
	 * 한 개의 과목 수정 메소드
	 * @param subject
	 * @return
	 */
	int updateSubject(Subject subject);
	
	/**
	 * 매개변수로 subjectId를 받아 해당하는 과목 제거 메소드
	 * @param subjectId
	 * @return
	 */
	int deleteSubject(int subjectId);
	
	/**
	 * 과목 전체 조회 메소드
	 * @return
	 */
	List<Subject> selectSubject();
	
	/**
	 * 매개변수로 subjectId를 받아 해당하는 과목 조회 메소드
	 * @param subjectId
	 * @return
	 */
	Subject selectSubjectInfo(int subjectId);
	
	/**
	 * 이수구분 전체 조회 메소드
	 * @return
	 */
	List<String> selectSubjectType();
	
	/**
	 * 매개변수로 subjectType을 받아 해당하는 college 조회 메소드
	 * @param subjectType
	 * @return
	 */
	List<Subject> selectCollegeIdBySubjectType(String subjectType);
	
	/**
	 * 매개변수로 collegeId를 받아 해당하는 major 조회 메소드
	 * @param collegeId
	 * @return
	 */
	List<Subject> selectMajorIdByCollegeId(int collegeId, String subjectType);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 subject 조회 메소드
	 * @param majorId
	 * @return
	 */
	List<Subject> selectSubjectByMajorId(int majorId, int collegeId, String subjectType);
	
	/**
	 * 매개변수로 subjectName를 받아 해당하는 subject 조회 메소드
	 * @param subjectName
	 * @return
	 */
	Subject selectSubjectInfoBySubjectName(int subjectId);
	
	/**
	 * 과목 등록 하기 위한 조회 메소드
	 * @return
	 */
	Map<String,Object> selectForInsertSubject();
	
	/**
	 * 매개변수로 subjectId를 받아 update하기 위한 값 조회 메소드
	 * @param subjectId
	 * @return
	 */
	Map<String,Object> selectSubjectInfoBySubjectIdForUpdate(int subjectId);
	
	/**
	 * 매개변수로 subject를 받아 해당하는 subjectType 조회 메소드
	 * @param subjectType
	 * @return
	 */
	List<Subject> selectCollegeIdBySubjectTypeMinor(String subjectType);
	
	/**
	 * 매개변수로 subjectTime, subjectType를 받아 해당하는 subject 조회 메소드
	 * @param subjectTime
	 * @param subjectType
	 * @return
	 */
	List<Subject> selectSubjectInfoBySubjectTime(String subjectTime, String subjectType);
	
	/**
	 * 매개변수로 subjectId를 받아 해당하는 과목 정보 조회(교양)
	 * @param subjectId
	 * @return
	 */
	Map<String,Object> selectSubjectInfoBySubjectIdForMinorUpdate(int subjectId);
	
	/**
	 * 강의실 중복제거를 위한 조회 메소드
	 * @param subjectTime
	 * @param subjectSemester
	 * @param lecureId
	 * @param buildingId
	 * @return
	 */
	List<Room> selectForOverlap(String subjectTime, String subjectSemester, int buildingId);
	
	/**
	 * 수정할 경우 강의실 중복 제거를 위한 조회 메소드
	 * @param subjectTime
	 * @param subjectSemester
	 * @param buildingId
	 * @return
	 */
	List<Room> selectForOverlapUpdate(String subjectTime, String subjectSemester, int buildingId, int subjectId);
}
