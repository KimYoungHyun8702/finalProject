package com.mugs.service.admin;

import java.util.List;

import com.mugs.vo.College;

public interface CollegeService {

	/**
	 * 하나의 단과대학 등록 메소드
	 * @param college
	 * @return
	 */
	int insertCollege(College college);
	
	/**
	 * 하나의 단과대학 수정 메소드
	 * @param college
	 * @return
	 */
	int updateCollegeById(College college);
	
	/**
	 * 매개변수로 collegeId를 받아 해당하는 단과대학 삭제 메소드
	 * @param collegeId
	 * @return
	 */
	int deleteCollege(int collegeId);
	
	/**
	 * 단과대학 전체 조회 메소드
	 * @return
	 */
	List<College> selectCollegeList();
	
	/**
	 * 매개변수로 collegeId를 받아 해당하는 단과대학 조회 메소드
	 * @param collegeId
	 * @return
	 */
	College selectCollegeById(int collegeId);
}
