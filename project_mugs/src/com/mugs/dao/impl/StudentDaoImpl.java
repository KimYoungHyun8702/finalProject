package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.StudentDao;
import com.mugs.vo.Student;

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
	public int deleteStudent(String stuId) {
		return session.delete(makeSql("deleteStudent"),stuId);
	} 

	@Override
	public Student selectStudentById(String studentId) {
		return session.selectOne(makeSql("selectStudentById"),studentId);
	}

	@Override
	public List<Student> selectStudentList() {
		return session.selectList(makeSql("selectStudentList"));
	}

	@Override //병문이꼬
	public Student selectStudentMajorName() {
		return session.selectOne(makeSql("selectStudentMajorName"));
	}

	@Override
	public List<Student> selectStudentByName(String usersName) {
		return session.selectList(makeSql("selectStudentByName"),usersName);
	}

	@Override
	public Student selectStudentInfoForMajorById(String stuId) {
		return session.selectOne(makeSql("selectStudentInfoForMajorById"),stuId);
	}

	@Override
	public Student selectStudentInfoForMajorDualById(String stuId) {
		return session.selectOne(makeSql("selectProfessorInfoForMajorDualById"),stuId);
	}

	@Override
	public Student selectStudentInfoForMajorMinorById(String stuId) {
		return session.selectOne(makeSql("selectProfessorInfoForMajorMinorById"),stuId);
	}

	@Override
	public Student selectStudentInfoByStuId(String stuId) {
		return session.selectOne(makeSql("selectStudentInfoByJoin"),stuId);
	}
	
	
}
