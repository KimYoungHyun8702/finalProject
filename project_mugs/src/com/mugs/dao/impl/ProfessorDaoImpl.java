package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.ProfessorDao;
import com.mugs.vo.Professor;

@Repository
public class ProfessorDaoImpl implements ProfessorDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.professorMapper."+id;
	}

	@Override
	public int insertProfessor(Professor professor) {
		return session.insert(makeSqlId("insertProfessor"), professor);
	}

	@Override
	public int updateProfessor(Professor professor) {
		return session.update(makeSqlId("updateProfessor"), professor);
	}

	@Override
	public int deleteProfessor(String proId) {
		return session.delete(makeSqlId("deleteProfessorById"), proId);
	}

	@Override
	public List<Professor> selectProfessorList() {
		return session.selectList(makeSqlId("selectProfessorList"));
	}

	@Override
	public Professor selectProfessorById(String proId) {
		return session.selectOne(makeSqlId("selectProfessorById"), proId);
	}

	@Override

	public Professor selectProfessorInfoByJoin(String proId) {
		return session.selectOne(makeSqlId("selectProfessorInfoByJoin"), proId);
	}
	
	/**----- 진현이꼬 --------------*/
	public Professor selectFullInfoProfessorById(String proId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectupdateProfessorUsers"), proId);
	}			
}
