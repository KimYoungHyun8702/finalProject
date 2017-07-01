package com.mugs.service.student;

import java.util.List;

import com.mugs.vo.College;
import com.mugs.vo.Major;

public interface CourseRegistrationService {

	// 
	List<College> allCollegeList();
	
	//
	List<String> SubjectType();
	
	//
	List<Major> selectMajorByCollegeId(int collegeId);
}
