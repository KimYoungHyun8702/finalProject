package com.mugs.service.impl.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.SubjectDao;
import com.mugs.dao.standardDao;
import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Major;
import com.mugs.vo.Standard;

@Service
public class CourseRegistrationServiceImpl implements CourseRegistrationService {

	@Autowired
	private CollegeDao collegeDaoImpl;

	@Autowired
	private SubjectDao subjectDaoImpl;

	@Autowired
	private MajorDao majorDaoImpl;

	@Autowired
	private CourseDao courseDaoImpl;
	
	@Autowired
	private standardDao standardDaoImpl;

	@Override
	public List<College> getCollegeList() {
		// TODO Auto-generated method stub
		return collegeDaoImpl.selectCollegeList();
	}

	@Override
	public List<String> getSubjectType() {
		// TODO Auto-generated method stub
		return subjectDaoImpl.subjectTypeList();
	}

	@Override
	public List<Major> findMajorByCollegeId(int collegeId) {
		// TODO Auto-generated method stub
		return majorDaoImpl.selectMajorByCollegeId(collegeId);
	}

	@Override
	public List<Course> findMyCourseListByJoin(String loginId) {
		// 여기서 년도랑 학기를 뽑아오는 메소드를 호출해서 지금년도, 지금학기와 비교하여... 해당학기, 해당년도를 조회한다.
		Date date = new Date();
		int nowYear = date.getYear() + 1900;
		// int nowMonth = date.getMonth();
		String nowSemester = "1학기";

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드
		// String nowSemester = courseDao.selectHackGiIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";
		// System.out.println("현재학기 : " + nowSemester);
		//System.out.println("현재년도 : " + nowYear + "현재학기 : " + nowSemester);
		List<Course> myCourseList = courseDaoImpl.selectMyCourseListByJoin(loginId, nowYear, nowSemester);
		return myCourseList;
	}

	@Override
	public List<Standard> findYearListByMajorId(int majorId) {
		List<Standard> yearList = standardDaoImpl.selectYearListByMajorId(majorId);
		return yearList;
	}

	@Override
	public Standard findStandardValue(int collegeId, int majorId, int standardYear) {
		Standard standardValue = standardDaoImpl.selectStandardValue(collegeId, majorId, standardYear);
		return standardValue;
	}

}
