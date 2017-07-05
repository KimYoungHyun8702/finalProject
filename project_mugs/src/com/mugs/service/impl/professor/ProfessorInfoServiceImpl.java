package com.mugs.service.impl.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.ProfessorDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.professor.ProfessorInfoService;
import com.mugs.vo.Professor;
import com.mugs.vo.Users;

@Service
public class ProfessorInfoServiceImpl implements ProfessorInfoService{

	@Autowired
	private UsersDao dao;
	@Autowired
	private ProfessorDao dao2;
	
	@Override
	public void updateProfessorInfo(Users users) {
		dao.updateUsersById(users);
	}

	@Override
	public Professor getProfessorInfoByJoin(String proId) {
		return dao2.selectProfessorInfoByJoin(proId);
	}

	

}
