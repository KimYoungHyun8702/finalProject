package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.vo.ProfessorSubject;

@Repository
public class ProfessorSubjectDaoImpl implements ProfessorSubjectDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.professorSubjectMapper."+id;
	}
	
	@Override
	public int insertProfessorSubject(ProfessorSubject proSubject) {
		return session.insert(makeSqlId("insertProfessorSubject"), proSubject);
	}

	@Override
	public int updateProfessorSubject(ProfessorSubject proSubject) {
		return session.update(makeSqlId("updateProfessorSubject"), proSubject);
	}

	@Override
	public int deleteProfessorSubjectById(int proSubjectId) {
		return session.delete(makeSqlId("deleteProfessorSubjectById"), proSubjectId);
	}

	@Override
	public List<ProfessorSubject> selectProfessorSubjectList() {
		return session.selectList(makeSqlId("selectProfessorSubjectList"));
	}

	@Override
	public ProfessorSubject selectProfessorSubjectById(int proSubjectId) {
		return session.selectOne(makeSqlId("selectProfessorSubjectById"), proSubjectId);
	}
	//병문 DaoImpl
	@Override
	public ProfessorSubject selectProfessorSubjectBySubId(int subjectId) {
		return session.selectOne(makeSqlId("selectProfessorSubjectBySubId"),subjectId);
	}

}
