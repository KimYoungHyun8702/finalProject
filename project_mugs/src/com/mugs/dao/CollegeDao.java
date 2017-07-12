package com.mugs.dao;

import java.util.List;


import com.mugs.vo.College;

public interface CollegeDao {
	
	/**
	 * 한 학부의 데이터를 insert하는 메소드
	 * 
	 * @param college 
	 * @return
	 */
	int insertCollege(College college);
	
	/**
	 * 매개변수로 받은 College 객체의 id와 일치하는 학부의 나머지 정보를 update 하는 메소드
	 * 
	 * @param college
	 * @return
	 */
	int updateCollegeById(College college);
	
	/**
	 * 매개변수로 받은 collegeId와 일치하는 college data를 삭제하는 메소드.
	 * 
	 * @param collegeId
	 * @return
	 */
	int deleteCollege(int collegeId);
	
	/**
	 * 매개변수로 받은 collegeId와 일치하는 college data를 select하는 메소드
	 * 
	 * @param collegeId
	 * @return
	 */
	College selectCollegeById(int collegeId);
	
	/**
	 * 모든 College data들을 select하는 메소드
	 * 
	 * @return
	 */
	List<College> selectCollegeList();
}
