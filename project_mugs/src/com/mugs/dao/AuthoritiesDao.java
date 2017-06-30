package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Authorities;

public interface AuthoritiesDao {
	
	/**
	 * 하나의 권한을 insert 하는 메소드
	 * @param authorities
	 * @return
	 */
	int insertAuthorities(Authorities authorities);
	
	/**
	 * 하나의 권한을 update하는 메소드
	 * @param authorities
	 * @return
	 */
	int updateAuthoritiesById(Authorities authorities);
	
	/**
	 * 매개변수로 유저id를 받아서 하나의 권한을 delete하는 메소드
	 * @param usersId
	 * @return
	 */
	int deleteAuthorities(String usersId);
	
	/**
	 * 매개변수로 유저id를 받아서 권한 정보를 select하는 메소드
	 * @param usersId
	 * @return
	 */
	Authorities selectAuthoritiesById(String usersId);
	
	/**
	 * Authorities테이블의 모든 권한 정보를 select하는 메소드
	 * @return
	 */
	List<Authorities> selectAuthoritiesList();
	
}
