package com.mugs.service.student;

import java.util.List;
import java.util.Map;

import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Student;
import com.mugs.vo.Subject;
import com.mugs.vo.Users;

public interface StudentIndividualService {
	//병문 서비스 
	/**
	 * 학생 한 명의 인적정보를 수정하는 서비스
	 * @param 수정할 학생
	 */
	void updateStudentHumanInfo(Users users);
	
	/**
	 * 학생 한 명의 인적, 학적, 전공을 조회하는 서비스
	 * @param studentId
	 * @return 학생
	 */
	Map findStudentInfoById(String stuId);
	
	/**
	 * 학부 전체의 정보를 가져온다.
	 * @return 학부 리스트
	 */
	List<College> getCollegeList();
	
	/**
	 * 단과대학 id를 받아 해당 학과이름을 받아온다.
	 * @return 학과 리스트
	 */
	List<Major> getMajorList(int collegeId);
	
	/**
	 * 전공 id로 과목 리스트를 조회
	 * @param majorId
	 * @return 과목 리스트
	 */
	List<Object> getSubjectTypeListByMajorId(int majorId,String semester);
	
	
	/**
	 * 이수구분으로 과목 리스트 조회
	 * @param subjectType
	 * @return 과목 리스트
	 */
	Map<String,Object> getSubjectBySubjectTypeAndMajorId(String semester, Integer majorId, String subjectType);	
	
	/**
	 * @param 유저의 정보
	 */
	void updateStudentPassword(Users user);
	/**
	 * 학기 정보 가져옴
	 * @return
	 */
	public List<String> getSemesterInfo();

}
