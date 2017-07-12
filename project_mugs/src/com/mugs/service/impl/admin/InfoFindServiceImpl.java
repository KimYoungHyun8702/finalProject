package com.mugs.service.impl.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.UsersDao;
import com.mugs.service.admin.InfoFindService;
import com.mugs.vo.Users;

@Service
public class InfoFindServiceImpl implements InfoFindService {
	
	@Autowired
	UsersDao dao ;

	@Override
	public String getIdByInfo(String name, String rrn) {
		// TODO Auto-generated method stub
		if(dao.selectUsersByInfo(name, rrn)==null){
			return null;
		}
		return dao.selectUsersByInfo(name, rrn).getUsersId();
	}
	
	@Override
	public Users getIdByInfo(String id, String name, String rrn) {
		// TODO Auto-generated method stub
		if(dao.selectUsersByInfo(id, name, rrn)==null){
			return null;
		}
		return dao.selectUsersByInfo(id, name, rrn);
	}

	@Override
	public int changePassword(String id, String pw) {
		// TODO Auto-generated method stub
		return dao.updatePassword(id, pw);
	}

}
