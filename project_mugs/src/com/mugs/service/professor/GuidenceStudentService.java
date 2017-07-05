package com.mugs.service.professor;

import com.mugs.vo.GuidanceStudent;
import com.mugs.vo.Student;


public interface GuidenceStudentService {

	/**
	 * proId 로 지도학생 list를 가져오는 메소드
	 * @param proId
	 * @return
	 */
	GuidanceStudent getGuidanceStudentListByJoin(String proId);
	
	/**
	 * stuId로 학생 개인-학적 정보 조회
	 * user와 조인관계에 있다
	 * @param stuId
	 * @return
	 */
	Student getStudentInfoByJoin(String stuId);
}
