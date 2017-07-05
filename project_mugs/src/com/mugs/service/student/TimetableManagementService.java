package com.mugs.service.student;

import java.util.List;


import com.mugs.vo.Course;




public interface TimetableManagementService {
	

	
	
	/**
	 * 학생id, 해당년도, 해당학기를 이용하여 해당시기에 수강하고 있는 수강과목들의 정보와 교수명 조회 - 시간표조회용
	 * @param loginId
	 * @param nowYear
	 * @param nowSemester
	 * @return
	 */
	public List<Course> findMyTimeTableByJoin(String loginId);
	

}
