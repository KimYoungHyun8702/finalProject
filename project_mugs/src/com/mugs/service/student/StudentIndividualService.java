package com.mugs.service.student;

import com.mugs.vo.Student;

public interface StudentIndividualService {
	//병문 서비스
	/**
	 * 한 명의 학생 정보를 수정하는 서비스
	 * @param 수정할 학생
	 */
	void updateStudentInfo(Student stu);
	
	/**
	 * 학생 id로 학생 정보를 찾아주는 서비스
	 * @param 조회할 학생의 id
	 */
	Student findStudentById(String id);
}
