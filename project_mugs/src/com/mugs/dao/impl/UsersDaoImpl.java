package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.UsersDao;
import com.mugs.vo.Users;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertUsers(Users user) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertUsers"), user);
	}

	@Override
	public int updateUsersById(Users user) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateUsersById"), user);
	}

	@Override
	public int deleteUsers(String id) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteUsers"), id);
	}

	@Override
	public Users selectUsersById(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectUsersById"), id);
	}

	@Override
	public List<Users> selectUsersList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectUsersList"));
	}

	private String makeSqlId(String id) {
		return "com.mugs.config.mapper.usersMapper." + id;
	}

}
