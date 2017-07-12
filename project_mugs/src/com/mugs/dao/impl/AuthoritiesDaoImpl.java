package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.AuthoritiesDao;
import com.mugs.vo.Authorities;
import com.mugs.vo.Users;

@Repository
public class AuthoritiesDaoImpl implements AuthoritiesDao {

	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String tagId) {
		return "com.mugs.config.mapper.authoritiesMapper." + tagId;
	}

	@Override
	public int insertAuthorities(Authorities authorities) {
		return session.insert(makeSql("insertAuthorities"), authorities);
	}

	@Override
	public int updateAuthoritiesById(Authorities authorities) {
		return session.update(makeSql("updateAuthoritiesById"), authorities);
	}

	@Override
	public int deleteAuthorities(String userId) {
		return session.delete(makeSql("deleteAuthorities"), userId);
	}

	@Override
	public Authorities selectAuthoritiesById(String userId) {
		return session.selectOne(makeSql("selectAuthoritiesById"), userId);
	}

	@Override
	public List<Authorities> selectAuthoritiesList() {
		return session.selectList(makeSql("selectAuthoritiesList"));
	}

	@Override
	public Users selectUserByUserId(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectUserByUserId"), userId);
	}

	@Override
	public Authorities selectAuthoritiesByUserId(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectAuthoritiesByUserId"), userId);
	}

}
