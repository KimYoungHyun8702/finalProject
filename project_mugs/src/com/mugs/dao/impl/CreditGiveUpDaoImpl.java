package com.mugs.dao.impl;

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
	public List<CreditGiveUp> SelectCreditGiveUpList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSql("selectCreditGiveUpList"));
	}

	@Override
	public CreditGiveUp SelectCreditGiveUpById(int creditGiveUpId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectCreditGiveUpById"), creditGiveUpId);
	}

	@Override
	public List<CreditGiveUp> selectCreditGiveUpJoin() {
		return session.selectList(makeSql("selectCreditGiveUpJoin"));
	}
	
	

}
