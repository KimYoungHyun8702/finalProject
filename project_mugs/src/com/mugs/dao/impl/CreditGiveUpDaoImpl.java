package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.CreditGiveUpDao;
import com.mugs.vo.CreditGiveUp;

@Repository
public class CreditGiveUpDaoImpl implements CreditGiveUpDao {
	
	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String tagId) {
		return "com.mugs.config.mapper.creditGiveUpMapper." + tagId;
	}
	
	@Override
	public int insertCreditGiveUp(CreditGiveUp creditGiveUp) {
		// TODO Auto-generated method stub
		return session.insert(makeSql("insertCreditGiveUp"), creditGiveUp);
	}

	@Override
	public int updateCreditGiveUp(CreditGiveUp creditGiveUp) {
		// TODO Auto-generated method stub
		return session.update(makeSql("updateCreditGiveUpById"), creditGiveUp);
	}

	@Override
	public int deleteCreditGiveUp(int creditGiveUpId) {
		// TODO Auto-generated method stub
		return session.delete(makeSql("deleteCreditGiveUp"), creditGiveUpId);
	}

	@Override
	public List<CreditGiveUp> selectCreditGiveUpList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSql("selectCreditGiveUpList"));
	}

	@Override
	public CreditGiveUp selectCreditGiveUpById(int creditGiveUpId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectCreditGiveUpById"), creditGiveUpId);
	}
	
	@Override
	public List<CreditGiveUp> selectCreditGiveUpByStuId(String stuId) {
		// TODO Auto-generated method stub
		return session.selectList(makeSql("selectCreditGiveUpByStuId"), stuId);
	}

	@Override
	public List<CreditGiveUp> selectCreditGiveUpByStuIdYearSemester(String stuId, int nowYear, String semester) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("stuId", stuId);
		map.put("nowYear", nowYear);
		map.put("semester", semester);
		return session.selectList(makeSql("selectCreditGiveUpByYearStuIdSemester"), map);
	}

	public List<CreditGiveUp> selectCreditGiveUpJoin() {
		return session.selectList(makeSql("selectCreditGiveUpJoin"));
	}


}
