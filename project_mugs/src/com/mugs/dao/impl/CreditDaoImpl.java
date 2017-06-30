package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.CreditDao;
import com.mugs.vo.Credit;

@Repository
public class CreditDaoImpl implements CreditDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertCredit(Credit credit) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertCredit"), credit);
	}

	@Override
	public int updateCreditById(Credit credit) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateCreditById"), credit);
	}

	@Override
	public int deleteCredit(int id) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteCredit"), id);
	}

	@Override
	public Credit selectCreditById(int id) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectCreditById"), id);
	}

	@Override
	public List<Credit> selectCreditList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectCreditList"));
	}

	@Override
	public List<Credit> selectCreditByYear(int year) {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectCreditByYear"), year);
	}

	@Override
	public List<Credit> selectCreditBySemester(String semester) {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectCreditBySemester"), semester);
	}

	@Override
	public List<Credit> selectCreditByType(String type) {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectCreditByType"), type);
	}

	@Override
	public List<Credit> selectCreditByYearAndSemester(int year, String semester) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year",year);
		map.put("semester",semester);
		
		return session.selectList(makeSqlId("selectCreditByYearAndSemester"), map);
	}
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.creditMapper."+id;
	}
}
