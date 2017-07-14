package com.mugs.service.impl.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CourseDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.ProfessorSubject;

@Service
public class AddStudentGradeServiceImpl implements AddStudentGradeService{

	@Autowired
	private ProfessorSubjectDao dao;
	@Autowired
	private CourseDao dao2;
	@Autowired
	private CreditDao dao3;
	
	@Override
	public List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId) {
		return dao.selectProfessorSubjectListJoinByProId(proId);
	}

	@Override
	public List<Course> getCourseByThreeId(int courseYear, String courseSemester, int subjectId) {
		return dao2.selectCourseByThreeId(courseYear, courseSemester, subjectId);
	}

	@Override
	public List<Course> getCourseByTwoId(int subjectId, String stuId) {
		// TODO Auto-generated method stub
		return dao2.selectCourseByTwoId(subjectId, stuId);
	}
	
	@Override
	public void addCredit(Credit credit) {
		dao3.insertCredit(credit);
	}


}
