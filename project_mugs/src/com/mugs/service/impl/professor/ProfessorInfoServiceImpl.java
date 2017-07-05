package com.mugs.service.impl.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.UsersDao;
import com.mugs.service.professor.ProfessorInfoService;
import com.mugs.vo.Users;

@Service
public class ProfessorInfoServiceImpl implements ProfessorInfoService{

	@Autowired
	private UsersDao dao;
	
	@Override
	public Users getUsersByUsersId(String userId) {
		return dao.selectUsersById(userId);
	}

	@Override
	public void updateProfessorInfo(Users users) {
		dao.updateUsersById(users);
	}

}
