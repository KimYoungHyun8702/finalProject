package com.mugs.service.student;

import java.util.List;

public interface GradeService {
	/**
	 * 매개변수로 학생 id을 받아 학점테이블에서 연도를 조회한다.
	 * @param id
	 * @return
	 */
	List<Integer> getYear(String id);
	/**
	 * 매개변수로 연도를 받아 학점테이블에서 그 연도에 맞는 학기들을 조회한다.
	 * @param year
	 * @return
	 */
	List<String> getSemester(int year);
}
