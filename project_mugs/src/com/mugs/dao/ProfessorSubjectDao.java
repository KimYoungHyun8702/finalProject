package com.mugs.dao;

import java.util.List;

import com.mugs.vo.ProfessorSubject;

public interface ProfessorSubjectDao {

	/**
	 * 교수 담당과목 insert하는 메소드
	 * @param proSubject
	 * @return
	 */
	int insertProfessorSubject(ProfessorSubject proSubject);
	
	/**
	 * 교수 담당과목 update하는 메소드
	 * @param proSubject
	 * @return
	 */
	int updateProfessorSubject(ProfessorSubject proSubject);

	/**
	 * 매개변수로 proSubjectId를 받아 해당되는 교수 담당과목 제거하는 메소드
	 * @param proSubjectId
	 * @return
	 */
	int deleteProfessorSubjectById(int proSubjectId);
	
	/**
	 * 교수 담당과목 전체를 조회하는 메소드
	 * @return
	 */
	List<ProfessorSubject> selectProfessorSubjectList();
	
	/**
	 * 매개변수로 proSubjectId를 받아 해당되는 교수 담당과목을 조회하는 메소드
	 * @param proSubjectId
	 * @return
	 */
	ProfessorSubject selectProfessorSubjectById(int proSubjectId);
	
	
	
	List<ProfessorSubject> selectProfessorSubjectList(int majorId, int nowYear, String subjectSemester);
}
