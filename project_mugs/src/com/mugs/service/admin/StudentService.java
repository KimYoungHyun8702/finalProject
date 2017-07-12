package com.mugs.service.admin;

import java.util.List;
import java.util.Map;

import com.mugs.vo.Major;
import com.mugs.vo.Student;
import com.mugs.vo.Users;

public interface StudentService {

	/**
	 * 학생 등록 메소드
	 * @param users
	 * @param student
	 * @return
	 */
	String insertStudent(Users users, Student student, String role);
	
	/**
	 * 학생 수정 메소드
	 * @param users
	 * @param student
	 * @return
	 */
	String updateStudent(Users users, Student student);
	
	/**
	 * 학생 제거 메소드
	 * @param usersId
	 * @return
	 */
	String deleteStudent(String usersId);
	
	/**
	 * 학생 전체 조회 메소드
	 * @param usersName
	 * @return
	 */
	List<Student> selectStudentByName(String usersName);
	
	/** 
	 * 매개변수로 proId를 받아 해당하는 교수 조회 메소드
	 * @param proId
	 * @return
	 */
	Map selectStudentInfoById(String stuId);
	
	/**
	 * 학생 등록하기 위한 메소드
	 * @return
	 */
	Map<String,Object> selectForInsertStudent();
	
	/**
	 * 매개변수로 usersId를 받아 해당하는 수정하기 위한 학생 정보를 조회하는 메소드
	 * @param usersId
	 * @return
	 */
	Map selectStudentForupdate(String usersId);
	
	
	
}
