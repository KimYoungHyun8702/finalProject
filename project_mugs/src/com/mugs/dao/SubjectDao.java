package com.mugs.dao;

import java.util.List;
import java.util.Map;

import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Subject;

public interface SubjectDao {
	
	/**
	 * 한 개의 과목에 대한 데이터를 insert하는 메소드
	 * 
	 * @param subject
	 * @return
	 */
	int insertSubject(Subject subject);

	/**
	 * 한 개의 과목에 대한 데이터를 매개변수로 받은 Subject 객체의 Id와 일치하는 과목의 정보를 update하는 메소드.
	 * 
	 * @param user
	 * @return
	 */
	int updateSubjectById(Subject subject);

	/**
	 * 매개변수로 받은 과목Id와 일치하는 Data 삭제.
	 * 
	 * @param id
	 * @return
	 */
	int deleteSubject(int subjectId);

	/**
	 * 매개변수로 받은 과목Id와 일치하는 과목의 Data 조회.
	 * 
	 * @param id
	 * @return
	 */
	Subject selectSubjectById(int subjectId);

	/**
	 * 모든 Subject Data들을 select하는 메소드.
	 * 
	 * @return
	 */
	List<Subject> selectSubjectList();
	
	/**
	 * SubjectType 전체 조회 메소드. 
	 * 
	 * @return
	 */
	List<String> subjectTypeList();
	
	/**
	 * 전공 id로 이수구분 확인
	 * @return 이수구분 리스트
	 * @param 해당 전공 id
	 * @author 병문
	 */
	List<Subject> selectSubjectTypeByMajorId(int majorId);
	
	/**
	 * 이수구분별 과목 리스트를 select하는 메소드
	 * @param subjectType, majorId
	 * @return 과목 리스트들
	 * @author 병문
	 */
	List<Subject> selectSubjectBySubjectTypeAndMajorId(Map<String,Object> typeAndMajorId);
	
	/**
	 * 매개변수로 subjectType를 받아 해당하는 college 조회 메소드
	 * @param subjectType
	 * @return
	 */
	List<Subject> selectCollegeIdBySubjectType(String subjectType);
	
	/**
	 * 매개변수로 collegeId, subjectType를 받아 해당하는 major 조회 메소드
	 * @param collegeId
	 * @return
	 */
	List<Subject> selectMajorIdByCollegeId(int collegeId, String subjectType);
	
	/**
	 * 매개변수로 majorId, collegeId, subjectType를 받아 해당하는 subject 조회 메소드
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
	 * 매개변수로 subjectId를 받아 update시키기 위해 필요한 값 조회 메소드
	 * @param subjectId
	 * @return
	 */
	Subject selectSubjectInfoBySubjectIdForUpdate(int subjectId);
	
	/**
	 * 매개변수로 subjectType를 받아 subjectTime 조회 메소드
	 * @param subjectType
	 * @return
	 */
	List<Subject> selectCollegeIdBySubjectTypeMinor(String subjectType);
	
	/**
	 * 매개변수로 subjectType, subjectTime을 받아 subject 조회 메소드
	 * @param subjectType
	 * @param subjectTime
	 * @return
	 */
	List<Subject> selectSubjectInfoBySubjectTime(String subjectType, String subjectTime);
	
	/**
	 * 매개변수로 subjectIdf를 받아 교양 수정하기 위한 메소드
	 * @param subjectId
	 * @return
	 */
	Subject selectSubjectInfoBySubjectIdForMinorUpdate(int subjectId);
}
