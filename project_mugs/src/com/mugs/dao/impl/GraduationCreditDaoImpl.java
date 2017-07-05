package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.GraduationCreditDao;
import com.mugs.vo.GraduationCredit;
@Repository
public class GraduationCreditDaoImpl implements GraduationCreditDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.graduationCreditMapper."+id;
	}
	
	@Override
	public int insertGraduationCredit(GraduationCredit graduationCredit) {
		return session.insert(makeSqlId("insertGraduationCredit"), graduationCredit);
	}

	@Override
	public int updateGraduationCreditById(GraduationCredit graduationCredit) {
		return session.update(makeSqlId("updateGraduationCreditById"), graduationCredit);
	}

	@Override
	public int deleteGraduationCredit(int majorId, int graduationCreditYear) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("majorId", majorId);
		map.put("graduationCreditYear", graduationCreditYear);
		return session.delete(makeSqlId("deleteGraduationCredit"),map);
	}

	@Override
	public List<GraduationCredit> selectGraduationCreditList() {
		return session.selectList(makeSqlId("selectGraduationCreditList"));
	}

	@Override
	public GraduationCredit selectGraduationCreditById(int majorId, int graduationCreditYear) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("majorId", majorId);
		map.put("graduationCreditYear", graduationCreditYear);
		return session.selectOne(makeSqlId("selectGraduationCreditById"), map);
	}

	@Override
	public List<GraduationCredit> selectGraduationCreditByMajorId(int majorId) {
		return session.selectList(makeSqlId("selectGraduationCreditByMajorId"),majorId);
	}
	
}
