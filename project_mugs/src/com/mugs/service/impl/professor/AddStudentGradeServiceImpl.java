package com.mugs.service.impl.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CourseDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.vo.Course;
import com.mugs.vo.ProfessorSubject;

@Service
public class AddStudentGradeServiceImpl implements AddStudentGradeService{

	@Autowired
	private ProfessorSubjectDao dao;
	/**-------영현이꼬--*/
	@Autowired
	private CourseDao dao2;
	
	@Override
	public List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId) {
		return dao.selectProfessorSubjectListJoinByProId(proId);
	}

	@Override
	public List<Course> getCourseByThreeId(int courseYear, String courseSemester, int subjectId) {
		return dao2.selectCourseByThreeId(courseYear, courseSemester, subjectId);
	}

}
