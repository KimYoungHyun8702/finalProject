package com.mugs.service.professor;

import java.util.List;

import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.ProfessorSubject;

public interface AddStudentGradeService {

	/**
	 * proId로 담당과목 list를 조회
	 * subject/professor 와 조인관계에 있다.
	 * @param proId
	 * @return
	 */
	List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId);
	
	/** ------------영현이꼬---------
	 * 3개의 매개변수로 수강 data를 조회
	 * 
	 * @param proId
	 * @return
	 */
	List<Course> getCourseByThreeId(int courseYear, String courseSemester, int subjectId);
	
	/** ------------영현이꼬---------
	 * 2개의 매개변수로 학생수강 list를 조회
	 * 
	 * @param proId
	 * @return
	 */
	List<Course> getCourseByTwoId(int subjectId, String stuId);
	
	/** ------------영현이꼬---------
	 * 하나의 학점을 insert 시킨다.
	 * 
	 * @param Credit credit
	 * @return
	 */
	void addCredit(Credit credit);
	
}
