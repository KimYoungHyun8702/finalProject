package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.ProfessorDao;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.Room;

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
	public int deleteProfessor(String usersId) {
		return session.delete(makeSqlId("deleteProfessorById"), usersId);
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

	@Override
	public List<Professor> selectProfessorByName(String usersName) {
		return session.selectList(makeSqlId("selectProfessorByName"),usersName);
	}

	@Override
	public Professor selectProfessorInfoById(String proId) {
		return session.selectOne(makeSqlId("selectProfessorInfoById"),proId);
	}

	@Override
	public Professor selectProfessorInfoForMajorById(String proId) {
		return session.selectOne(makeSqlId("selectProfessorInfoForMajorById"),proId);
	}

	@Override
	public Professor selectProfessorInfoForOfficeById(String proId) {
		return session.selectOne(makeSqlId("selectProfessorInfoForOfficeById"),proId);
	}

	@Override
	public Professor selectProfessorInfoForLaboratoryById(String proId) {
		return session.selectOne(makeSqlId("selectProfessorInfoForLaboratoryById"),proId);
	}			
	
	
	
}
