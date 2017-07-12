package com.mugs.service.admin;

import java.util.List;
import java.util.Map;

import com.mugs.vo.Professor;
import com.mugs.vo.Users;

public interface ProfessorService {

	/**
	 * 교수 등록 메소드
	 * @param users
	 * @param professor
	 * @return
	 */
	int insertProfessor(Users users, Professor professor, String role);
	
	/**
	 * 교수 수정 메소드
	 * @param users
	 * @param professor
	 * @return
	 */
	int updateProfessor(Users users, Professor professor);
	
	/**
	 * 매개 변수로 usersId를 받아 교수 제거 메소드
	 * @param usersId
	 * @return
	 */
	int deleteProfessor(String usersId);
	
	/**
	 * 매개 변수로 usersName를 받아 교수 조회 메소드
	 * @param usersName
	 * @return
	 */
	List<Professor> selectProfessorByName(String usersName);
	
	
	/** 
	 * 매개변수로 proId를 받아 해당하는 교수 조회 메소드
	 * @param proId
	 * @return
	 */
	Map selectProfessorInfoById(String proId);
	
	/**
	 * 교수 등록하기 위한 메소드
	 * @return
	 */
	Map<String,Object> selectForInsertProfessor();
	
	/**
	 * 매개변수로 usersId를 받아 해당하는 교수 수정 메소드
	 * @param usersId
	 * @return
	 */
	Map selectProfessorForupdate(String usersId);
	
	
}
