package com.mugs.service.student;

import java.util.List;

import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Subject;

public interface CourseRegistrationService {

	// 
	List<College> allCollegeList();
	
	// 
	List<String> SubjectType();
	
	// 단과대학(학부)의 ID를 매개변수 받아서 해당대학(학부)에 속하는 전체 학과 정보 얻기
	List<Major> selectMajorByCollegeId(int collegeId);
	
	// 교수vo와 users vo의 extends의 관한 실험용
	Professor selectFullInfoProfessorById(String id);
	
	//
	List<ProfessorSubject> getProfessorSubjectList(int majorId, int nowYear, String subjectSemester);

	// 실헝용
	Subject getSubject(int num);
	
	
	List<ProfessorSubject> getMySubject(int subjectId, String proId, String semester, int majorId);
	
	
	//
	List<ProfessorSubject> deleteMySubject(int subjectId, String proId, String semester, int majorId);
}
