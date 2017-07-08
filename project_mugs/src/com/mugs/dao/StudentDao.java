package com.mugs.dao;

import java.util.List;


import com.mugs.vo.Student;

public interface StudentDao {
	/**
	 * 한 학생의 데이터를 insert하는 메소드
	 * @param student
	 * @return
	 */
	int insertStudent(Student student);
	
	
	/**
	 * 한 학생의 데이터를 update하는 메소드
	 * @param student
	 * @return
	 */
	int updateStudent(Student student);
	
	
	/**
	 * 매개변수로 학생id를 받아서 한 학생의 데이터를 delete하는 메소드
	 * @param studentId
	 * @return
	 */
	int deleteStudent(String stuId);
	
	
	/**
	 * 매개변수로 학생id를 받아서 해당되는 학생정보를 select하는 메소드
	 * @param studentId
	 * @return
	 */
	Student selectStudentById(String studentId);
	
	
	/**
	 * Student테이블의 모든 학생 정보를 select하는 메소드
	 * @return
	 */
	List<Student> selectStudentList();
	
	/**
	 * @author 병문이꼬
	 * 학과 이름을 가져오기 위한 select 메소드, 학과 이름은 학생vo의 list에 저장되게 함.
	 * @return 학생-학과정보 조인한 학생의 정보, 
	 */
	Student selectStudentMajorName();
	
	/**
	 * usersName으로 학생 조회 메소드
	 * @param usersName
	 * @return
	 */
	List<Student> selectStudentByName(String usersName);
	
	/**
	 * stuId로 학과 조회 메소드
	 * @param stuId
	 * @return
	 */
	Student selectStudentInfoForMajorById(String stuId);
	
	/**
	 * stuId로 복수 전공 조회 메소드
	 * @param stuId
	 * @return
	 */
	Student selectStudentInfoForMajorDualById(String stuId);
	
	/**
	 * stuId로 부 전공 조회 메소드
	 * @param stuId
	 * @return
	 */
	Student selectStudentInfoForMajorMinorById(String stuId);
	
	/**
	 * 매개변수로 stuId를 받아 해당하는 학생 조회 메소드
	 * @param stuId
	 * @return
	 */
	Student selectStudentInfoByStuId(String stuId);
	

}
