package com.mugs.dao;

import java.util.List;


import com.mugs.vo.Student;

public interface studentDao {
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
	int deleteStudent(String studentId);
	
	
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

}
