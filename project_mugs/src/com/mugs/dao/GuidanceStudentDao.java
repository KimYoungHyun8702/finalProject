package com.mugs.dao;

import java.util.List;

import com.mugs.vo.GuidanceStudent;

public interface GuidanceStudentDao {

	/**
	 * 지도학생 insert하는 메소드
	 * @param guidanceStudent
	 * @return
	 */
	int insertguidanceStudent(GuidanceStudent guidanceStudent);
	
	/**
	 * 지도학생 update하는 메소드
	 * @param guidanceStudent
	 * @return
	 */
	int updateguidanceStudentById(GuidanceStudent guidanceStudent);
	
	/**
	 * 매개변수로 guidanceStudentId를 받아 해당하는 지도학생 delete하는 메소드
	 * @param guidanceStudentId
	 * @return
	 */
	int deleteguidanceStudent(int guidanceStudentId);
	
	/**
	 * 지도학생 전체 조회 메소드
	 * @return
	 */
	List<GuidanceStudent> selectguidanceStudentList();
	
	/**
	 * 매개변수로 guidanceStudentId를 받아 해당하는 지도학생 조회하는 메소드
	 * @param guidanceStudentId
	 * @return
	 */
	GuidanceStudent selectguidanceStudentById(int guidanceStudentId);
}
