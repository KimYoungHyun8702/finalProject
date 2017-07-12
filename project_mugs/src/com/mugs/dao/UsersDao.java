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
	int insertUsers(Users user);

	/**
	 * 한 명의 사용자에 대한 데이터를 매개변수로 받은 Users 객체의 Id와 일치하는 사용자의 정보를 update하는 메소드.
	 * 
	 * @param user
	 * @return
	 */
	int updateUsersById(Users user);

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
	
	/**
	 * 학생의 인적사항을 수정하는 메소드( id, 이름 등 관리자만 변경할 수 있는 부분 제외)
	 * @author 병문
	 * @return 변경된 행의 수
	 */
	int updateStudentHumanInfo(Users user);
	
	/**
	 * 학생의 비밀번호를 변경하는 메소드
	 * @param usersPassword
	 * @return 변경된 행의 수
	 */
	int updateStudentPassword(Users user);

}
