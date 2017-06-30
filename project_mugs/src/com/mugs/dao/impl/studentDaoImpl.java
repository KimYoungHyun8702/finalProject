package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.studentDao;
import com.mugs.vo.Student;

@Repository
public class studentDaoImpl implements studentDao{
	
	
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
}