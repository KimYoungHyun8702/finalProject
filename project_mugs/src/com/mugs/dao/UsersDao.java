package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Users;

public interface UsersDao {
	/**
	 * 한 명의 사용자에 대한 데이터를 insert하는 메소드
	 * 
	 * @param user
	 * @return
	 */
	int insertUsers(Users users);

	/**
	 * 한 명의 사용자에 대한 데이터를 매개변수로 받은 Users 객체의 Id와 일치하는 사용자의 정보를 update하는 메소드.
	 * 
	 * @param user
	 * @return
	 */
	int updateUsersById(Users users);

	/**
	 * 매개변수로 받은 사용자Id와 일치하는 Data 삭제.
	 * 
	 * @param id
	 * @return
	 */
	int deleteUsers(String id);

	/**
	 * 매개변수로 받은 사용자Id와 일치하는 사용자의 Data 조회.
	 * 
	 * @param id
	 * @return
	 */
	Users selectUsersById(String id);

	/**
	 * 모든 Users Data들을 select하는 메소드.
	 * 
	 * @return
	 */
	List<Users> selectUsersList();
}
