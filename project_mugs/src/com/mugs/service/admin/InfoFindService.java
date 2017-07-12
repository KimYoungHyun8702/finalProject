package com.mugs.service.admin;

import com.mugs.vo.Users;

public interface InfoFindService {
	/**
	 * 매개변수로 이름과 주민등록번호를 입력받아 그에 맞는 사용자 Id 조회.
	 * @param name
	 * @param rrn
	 * @return
	 */
	String getIdByInfo(String name, String rrn);
	/**
	 * 매개변수로 id와 이름과 주민등록번호를 입력받아 그에 맞는 사용자 Id 조회.
	 * @param id
	 * @param name
	 * @param rrn
	 * @return
	 */
	Users getIdByInfo(String id, String name, String rrn);
	/**
	 * 매개변수로 받은 id와 일치하는 정보의 비밀번호를 변경한다.
	 * @param id
	 * @param pw
	 * @return
	 */
	int changePassword(String id, String pw);
}
