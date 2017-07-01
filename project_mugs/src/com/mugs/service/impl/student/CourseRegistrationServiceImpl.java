package com.mugs.service.impl.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.SubjectDao;
import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.College;
import com.mugs.vo.Major;

@Service
public class CourseRegistrationServiceImpl implements CourseRegistrationService{

	@Autowired
	private CollegeDao collegeDaoImpl;
	
	@Autowired
	private SubjectDao subjectDaoImpl;
	
	@Autowired
	private MajorDao majorDaoImpl;
	
	@Override
	public List<College> allCollegeList() {
		// TODO Auto-generated method stub
		return collegeDaoImpl.selectCollegeList();
	}

	@Override
	public List<String> SubjectType() {
		// TODO Auto-generated method stub
		return subjectDaoImpl.subjectTypeList();
	}

	@Override
	public List<Major> selectMajorByCollegeId(int collegeId) {
		// TODO Auto-generated method stub
		return majorDaoImpl.selectMajorByCollegeId(collegeId);
	}
}
