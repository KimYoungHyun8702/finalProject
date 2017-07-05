package com.mugs.service.impl.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.StudentDao;
import com.mugs.service.student.StudentIndividualService;
import com.mugs.vo.Student;
@Service
public class StudentIndividualServiceImpl implements StudentIndividualService {
	//병문 serviceImpl
	
	@Autowired
	private StudentDao dao;
	
	@Override
	public void updateStudentInfo(Student stu) {
	dao.updateStudent(stu);		
	}

	@Override
	public Student findStudentById(String id) {
	return dao.selectStudentById(id);		
	}
}
