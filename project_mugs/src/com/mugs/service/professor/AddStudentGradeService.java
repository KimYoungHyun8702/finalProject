package com.mugs.service.professor;

import java.util.List;

import com.mugs.vo.AcademicProbation;
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
	
	/** ---------영현이꼬-----------
	 * 4배개변수가 일치하는 학점 을 조회한다.
	 *  
	 */
	
	Credit getCreditByFourId(int creditYear, String creditSemester, String stuId, int subjectId);
	
	/** ------------영현이꼬---------
	 * 하나의 학점을 update 시킨다.
	 * 4개의 매개변수를 받는다.
	 * @param 
	 * @return
	 */
	void setCreditByFourId(Credit credit);
	
	/** ------------영현이꼬---------
	 * 한 학생의 학점 평균을 가져온다
	 * 3개의 매개변수를 받는다
	 * long type으로 리턴받는다.
	 * @param 
	 * @return
	 */
	double getCreditAvgByThreeId(int creditYear, String creditSemester, String stuId);
	
	/**------------------영현이꼬---------------
	 * 3개의 매개변수와 일치하는 학사경고 내역을 삭제한다.
	 *  @param 
	 * @return
	 */
	void removeAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId);
	
	/**------------------영현이꼬---------------
	 * 하나의 학사경고 내역을 insert 한다.
	 *  @param AcademicProbation
	 * @return
	 */
	void addAcademicProbation(AcademicProbation academicProbation);
	
	/**------------------영현이꼬---------------
	 * 3개의 매개변수가 일치하는 하나의 학사경고 내역을 select 한다.
	 *  @param int probationYear, String probationSemester, String stuId
	 * @return
	 */
	AcademicProbation getAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId);
}
