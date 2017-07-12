package com.mugs.service.admin;

import java.util.List;
import java.util.Map;

import com.mugs.vo.Major;

public interface MajorService {
	
	/**
	 * 하나의 학과 등록 메소드
	 * @param major
	 * @return
	 */
	int insertMajor(Major major);
	
	/**
	 * 하나의 학과 수정 메소드
	 * @param major
	 * @return
	 */
	int updateMajor(Major major);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 학과 삭제 메소드
	 * @param majorId
	 * @return
	 */
	int deleteMajor(int majorId);
	
	/**
	 * 학과 전체 조회 메소드
	 * @return
	 */
	List<Major> selectMajorList();
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 학과 조회 메소드
	 * @param majorId
	 * @return
	 */
	Major selectMajorById(int majorId);
	
	/**
	 * 매개변수로 collegeId를 받아 해당하는 학과 조회 메소드
	 * @param collegeId
	 * @return
	 */
	List<Major> selectMajorBycollegeId(int collegeId);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 학과 및 졸업학점 및 기준 학점 조회 메소드
	 * @param majorId
	 * @return
	 */
	Map selectMajorGraduationCreditByMajorId(int majorId);
	
}
