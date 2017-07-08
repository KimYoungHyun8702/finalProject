package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Student;
import com.mugs.vo.Users;

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
	
	/**
	 * 학생의 인적정보와 전공정보를 select하는 메소드
	 * @param stuId
	 * @return 주전공, 부전공, 복수전공을 모두 가지고 있는 학생
	 * @author 병문
	 */
	Student selectStudentAllInfoByJoin(Student stu);
	
	/**
	 * 학생의 졸업시험 패스여부를 select하는 메소드
	 * @param stuId
	 * @return 졸업시험 통과여부
	 * @author 병문
	 */
	String selectStuGraduationExam(String stuId);
}