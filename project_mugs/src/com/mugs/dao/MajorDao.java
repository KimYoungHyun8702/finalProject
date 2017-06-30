package com.mugs.dao;

import java.util.List;

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
	 * 매개변수로 majorId를 받아 해당하는 학과를 조회하는 메소드
	 * @param majorId
	 * @return
	 */
	Major selectMajorById(int majorId);
}