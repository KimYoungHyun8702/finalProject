package com.mugs.dao;

import java.util.List;
import java.util.Map;

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
	int deleteSubject(int id);

	/**
	 * 매개변수로 받은 과목Id와 일치하는 과목의 Data 조회.
	 * 
	 * @param id
	 * @return
	 */
	Subject selectSubjectById(int id);

	/**
	 * 모든 Subject Data들을 select하는 메소드.
	 * 
	 * @return
	 */
	List<Subject> selectSubjectList();
	
	/**
	 * 
	 * @return
	 */
	List<String> subjectTypeList();
	
	/**
	 * 전공 id로 이수구분 확인
	 * @return 이수구분 리스트
	 * @param 해당 전공 id
	 */
	List<Subject> selectSubjectTypeByMajorId(int majorId);
	
	/**
	 * 이수구분별 과목 리스트를 select하는 메소드
	 * @param subjectType, majorId
	 * @return 과목 리스트들
	 * @author 병문
	 */
	List<Subject> selectSubjectBySubjectTypeAndMajorId(Map<String,Object> typeAndMajorId);
}
