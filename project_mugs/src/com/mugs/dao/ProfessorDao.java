package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.Room;

public interface ProfessorDao {
	
	/**
	 * 교수 한 명 insert하는 메소드
	 * @param professor
	 * @return
	 */
	int insertProfessor(Professor professor);

	/**
	 * 교수 한 명 update하는 메소드
	 * @param professor
	 * @return
	 */
	int updateProfessor(Professor professor);

	/**
	 * 매개변수로 proId를 받아 해당되는 교수를 delete하는 메소드
	 * @param proId
	 * @return
	 */
	int deleteProfessor(String usersId);

	/**
	 * 교수전체를 조회하는 메소드
	 * @return
	 */
	List<Professor> selectProfessorList();
	
	/**
	 * 매개변수로 proId를 받아 해당 되는 교수를 조회하는 메소드
	 * @param proId
	 * @return
	 */
	Professor selectProfessorById(String proId);
	

	/** ---------영현이꼬---------
	 * pro_id를 통해 사용자-교수의 Join된 테이블을 select하는 메소드
	 * 
	 * @param pro_id
	 * @return
	 */
	Professor selectProfessorInfoByJoin(String proId);

	
	/**------------진현이꼬-------------------*/
	Professor selectFullInfoProfessorById(String proId);
	
	/** -----------동준이꼬-------------------
	 * 매개변수로 proName를 받아 해당하는 교수 조회 메소드 
	 * @param proName
	 * @return
	 */
	List<Professor> selectProfessorByName(String usersName);
	
	/** -----------동준이꼬-------------------
	 * 매개변수로 proId를 받아 해당하는 교수 조회 메소드
	 * @param proId
	 * @return
	 */
	Professor selectProfessorInfoById(String proId);
	
	/** -----------동준이꼬-------------------
	 * 매개변수로 proId를 받아 해당하는 교수 학과 조회 메소드
	 * @param proId
	 * @return
	 */
	Professor selectProfessorInfoForMajorById(String proId);
	
	/** -----------동준이꼬-------------------
	 * 매개변수로 proId를 받아 해당하는 교수실 조회 메소드
	 * @param proId
	 * @return
	 */
	Professor selectProfessorInfoForOfficeById(String proId);
	
	/** -----------동준이꼬-------------------
	 * 매개변수로 proId를 받아 해당하는 연구실 조회 메소드
	 * @param proId
	 * @return
	 */
	Professor selectProfessorInfoForLaboratoryById(String proId);
	
	/**
	 * 중복제거를 위한 교수실강의동 조회 메소드
	 * @return
	 */
	List<Professor> selectProfessorOfficeForOverlap();
	
	/**
	 * 중복제거를 위한 연구실강의동 조회 메소드
	 * @return
	 */
	List<Professor> selectProfessorLabaratoryForoverlap();
}
