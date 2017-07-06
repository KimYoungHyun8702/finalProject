package com.mugs.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.SubjectDao;
import com.mugs.vo.Subject;

@Repository
public class SubjectDaoImpl implements SubjectDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertSubject(Subject subject) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertSubject"), subject);
	}

	@Override
	public int updateSubjectById(Subject subject) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateSubjectById"), subject);
	}

	@Override
	public int deleteSubject(int id) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteSubject"), id);
	}

	@Override
	public Subject selectSubjectById(int id) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectSubjectById"), id);
	}

	@Override
	public List<Subject> selectSubjectList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectList"));
	}
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.subjectMapper."+id;
	}

	@Override
	public List<String> subjectTypeList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectType"));
	}
	//병문 DaoImpl
	@Override
	public List<Subject> selectSubjectTypeByMajorId(int majorId) {
		return session.selectList(makeSqlId("selectSubjectTypeByMajorId"),majorId);
	}
	
	@Override
	public List<Subject> selectSubjectBySubjectTypeAndMajorId(Map<String,Object> typeAndMajorId) {
		return session.selectList(makeSqlId("selectSubjectBySubjectTypeAndMajorId"),typeAndMajorId);
	}

	
}
