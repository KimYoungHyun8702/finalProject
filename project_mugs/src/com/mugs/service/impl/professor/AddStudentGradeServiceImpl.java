package com.mugs.service.impl.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicProbationDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.vo.AcademicProbation;
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
	@Autowired
	private AcademicProbationDao dao4;
	
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

	@Override
	public Credit getCreditByFourId(int creditYear, String creditSemester, String stuId, int subjectId) {
		return dao3.selectCreditByFourId(creditYear, creditSemester, stuId, subjectId);
	}

	@Override
	public void setCreditByFourId(Credit credit) {
		dao3.updateCreditByFourId(credit);		
	}

	@Override
	public double getCreditAvgByThreeId(int creditYear, String creditSemester, String stuId) {
		return dao3.selectCreditAvgByThreeId(creditYear, creditSemester, stuId);
	}

	@Override
	public void removeAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId) {
		dao4.deleteAcademicProbationByThreeId(probationYear, probationSemester, stuId);
		
	}

	@Override
	public void addAcademicProbation(AcademicProbation academicProbation) {
		dao4.insertAcademicProbation(academicProbation);
		
	}

	@Override
	public AcademicProbation getAcademicProbationByThreeId(int probationYear, String probationSemester, String stuId) {
		return dao4.selectAcademicProbationByThreeId(probationYear, probationSemester, stuId);
	}
	
}
