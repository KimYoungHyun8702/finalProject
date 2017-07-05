package com.mugs.dao;

import java.util.ArrayList;
import java.util.List;

import com.mugs.vo.Standard;

public interface standardDao {

	/**
	 * 하나의 학점기준을 insert하는 메소드
	 * @param standard
	 * @return
	 */
	int insertStandard(Standard standard);
	

	/**
	 * 하나의 학점기준을 update하는 메소드
	 * @param standard
	 * @return
	 */
	int updateStandard(Standard standard);
	
	
	/**
	 * 입학년도와 학과id를 매개변수로 받아서 해당되는 학점기준을 delete하는 메소드
	 * @param standardYear
	 * @param majorId
	 * @return
	 */
	int deleteStandard(int standardYear, int majorId);//매개변수가 2개라서 변수 선언해줄때 Map선언해주고 Map에 담아줘야 합니다.
	
	
	/**
	 * 입학년도와 학과id를 매개변수로 받아서 해당되는 학점기준을 select하는 메소드
	 * @param standardYear
	 * @param majorId
	 * @return
	 */
	int selectStandardById(int standardYear, int majorId);//매개변수가 2개라서 변수 선언해줄때 Map선언해주고 Map에 담아줘야 합니다.
	
	
	/**
	 * Standard테이블의 모든 학점기준 정보를 select하는 메소드
	 * @return
	 */
	List<Standard> selectStandardList();
	
	/**
	 * 학과리스트를 조회하는 메소드
	 * @return
	 */
	List<String> selectMajorList();
	
	
	/**
	 * 학과id로 년도를 뽑아오는 메소드
	 * @return
	 */
	List<Standard> selectYearListByMajorId(int majorId);
	
	
	/**
	 * 년도로 기준학점리스트를 조회하는 메소드 or 학부, 학과, 년도를 다 매개변수로 줘야 하나???
	 * @param year
	 * @return
	 */
	Standard selectStandardValue(int collegeId, int majorId, int standardYear);
	
}
