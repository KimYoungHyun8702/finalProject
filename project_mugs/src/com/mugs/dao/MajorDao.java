package com.mugs.dao;

import java.util.List;

import com.mugs.vo.GraduationCredit;
import com.mugs.vo.Major;

public interface MajorDao {
	
	/**
	 * 학과 insert하는 메소드
	 * @param major
	 * @return
	 */
	int insertMajor(Major major);
	
	/**
	 * 학과 update하는 메소드
	 * @param major
	 * @return
	 */
	int updateMajorById(Major major);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 학과를 delete하는 메소드
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
	 * 매개변수로 단과대학id를 받아 해당하는 학과 리스트를 조회하는 메소드
	 * @author 병문
	 * @param collegeId
	 * @return 해당하는 학과 리스트
	 */
	List<Major> selectMajorByCollegeId(int collegeId);
	
	/**
	 * 매개변수로 majorId를 받아 해당하는 학과 및 졸업 점수 조회 메소드
	 * @param majorId
	 * @return
	 */
	List<Major> selectMajorGraduationCreditByMajorId(int majorId);
}
