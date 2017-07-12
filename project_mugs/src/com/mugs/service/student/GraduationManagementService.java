package com.mugs.service.student;

import java.util.List;
import java.util.Map;

public interface GraduationManagementService {
	
	/**
	 * 학과리스트를 조회하는 메소드
	 * @return
	 */
	List<String> getMajorList();
	
	/**
	 * 학생 한 명의 해당 연도와 학기의 학점을 조회하는 메소드
	 * + 해당 학생이 속해있는 학과의 졸업기준학점
	 * @return 학생 정보 => 해당 연도와 학기의 학점들, 해당학과 졸업기준학점
	 */
	Map<String,Object> getCreditByYearAndSemesterAndUsersIdForGraduInfo();
	
	
}
