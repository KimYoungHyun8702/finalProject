package com.mugs.service.student;

import java.util.HashMap;

import com.mugs.vo.Building;


public interface TimetableManagementService {

	/**
	 * 학생id, 해당년도, 해당학기를 이용하여 해당시기에 수강하고 있는 수강과목들의 정보와 교수명 조회 - 시간표조회용
	 * 
	 * @param loginId
	 * @param nowYear
	 * @param nowSemester
	 * @return
	 */
	HashMap<String, Object> findMyTimeTableByJoin(String loginId);

	/**
	 * 매개변수로 빌딩 이름을 받아 그에 맞는 빌딩 정보 조회.
	 * 
	 * @param buildingName
	 * @return
	 */
	public Building findBuildingByBuildingName(String buildingName);
}