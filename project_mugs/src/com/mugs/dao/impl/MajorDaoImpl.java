package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.MajorDao;
import com.mugs.vo.Major;
@Repository
public class MajorDaoImpl implements MajorDao{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.majorMapper."+id;
	}

	@Override
	public int insertMajor(Major major) {
		return session.insert(makeSqlId("insertMajor"), major);
	}

	@Override
	public int updateMajorById(Major major) {
		return session.update(makeSqlId("updateMajorById"), major);
	}

	@Override
	public int deleteMajor(int majorId) {
		return session.delete(makeSqlId("deleteMajor"), majorId);
	}

	@Override
	public List<Major> selectMajorList() {
		return session.selectList(makeSqlId("selectMajorList"));
	}

	@Override
	public Major selectMajorById(int majorId) {
		return session.selectOne(makeSqlId("selectMajorById"), majorId);
	}

	@Override
	public List<Major> selectMajorByCollegeId(int collegeId) {
		return session.selectList(makeSqlId("selectMajorByCollegeId"), collegeId);
	}
	
	
	
}
