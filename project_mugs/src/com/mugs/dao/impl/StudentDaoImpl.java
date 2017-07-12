package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.StudentDao;
import com.mugs.vo.Student;
import com.mugs.vo.Users;

@Repository
public class StudentDaoImpl implements StudentDao{
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String id){
		return "com.mugs.config.mapper.studentMapper."+id;
	}
	
	@Override
	public int insertStudent(Student student) {
		return session.insert(makeSql("insertStudent"),student);
	}

	@Override
	public int updateStudent(Student student) {
		return session.update(makeSql("updateStudent"),student);
	}

	@Override
	public int deleteStudent(String studentId) {
		return session.delete(makeSql("deleteStudent"),studentId);
	}

	@Override
	public Student selectStudentById(String studentId) {
		return session.selectOne(makeSql("selectStudentById"),studentId);
	}

	@Override
	public List<Student> selectStudentList() {
		return session.selectList(makeSql("selectStudentList"));
	}
	//병문 daoImpl

	@Override
	public Student selectStudentAllInfoByJoin(Student stu) {
		return session.selectOne(makeSql("selectStudentAllInfoByJoin"),stu);
	}

	@Override
	public String selectStuGraduationExam(String stuId) {
		return session.selectOne(makeSql("selectStuGraduationExam"),stuId);
	}

}