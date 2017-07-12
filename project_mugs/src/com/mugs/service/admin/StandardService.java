package com.mugs.service.admin;

import java.util.List;

import com.mugs.vo.Standard;

public interface StandardService {
	
	/**
	 * 하나의 수강 기준 학점 등록 메소드
	 * @param standard
	 * @return
	 */
	String insertStandard(Standard standard);
	
	/**
	 * 하나의 수강 기준 학점 수정 메소드
	 * @param standard
	 * @return
	 */
	String updateStandard(Standard standard);
	
	/**
	 * 하나의 수강 기준 학점 제거 메소드
	 * @param standardYear
	 * @param majorId
	 * @return
	 */
	String deleteStandard(int standardYear, int majorId);
	
	/**
	 * 수강 기준 학점 전체 조회 메소드
	 * @return
	 */
	List<Standard> selectStandardList();
	
	/**
	 * 매개변수로 standardYear, majorId를 받아 해당하는 수강 기준 학점 조회 메소드
	 * @param standardYear
	 * @return
	 */
	Standard selectStandardInfo(int standardYear, int majorId);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 수강 기준 학점 조회 메소드
	 * @param majorId
	 * @return
	 */
	List<Standard> selectStandardByMajorId(int majorId);
}
