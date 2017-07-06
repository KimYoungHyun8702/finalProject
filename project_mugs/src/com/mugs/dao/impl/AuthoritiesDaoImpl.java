package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.AuthoritiesDao;
import com.mugs.vo.Authorities;
@Repository
public class AuthoritiesDaoImpl implements AuthoritiesDao{

	//Spring Container에서 SqlSessionTemplate을 주입받아서 instance변수로 대입
	@Autowired
	private SqlSessionTemplate session;
	private String makeSql(String tagId){
		return "com.mugs.config.mapper.authoritiesMapper."+tagId;
	}
		
	@Override
	public int insertAuthorities(Authorities authorities) {
		return session.insert(makeSql("insertAuthorities"));
	}

	@Override
	public int updateAuthoritiesById(Authorities authorities) {
		return session.update(makeSql("updateAuthoritiesById"));
	}

	@Override
	public int deleteAuthorities(String usersId) {
		return session.delete(makeSql("deleteAuthorities"));
	}

	@Override
	public Authorities selectAuthoritiesById(String usersId) {
		return session.selectOne(makeSql("selectAuthoritiesById"));
	}

	@Override
	public List<Authorities> selectAuthoritiesList() {
		return session.selectList(makeSql("selectAuthoritiesList"));
	}
	
}
