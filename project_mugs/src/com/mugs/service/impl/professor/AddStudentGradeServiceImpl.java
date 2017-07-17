package com.mugs.service.impl.professor;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.AcademicProbationDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Student;

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
	@Autowired
	private AcademicCalendarDao acDao;
	
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
	@Override
	public String getCalendarCheck(){
		Date nowDate = new Date();
        List<String> evaluationPeriodResult = acDao.selectCalendarName(nowDate);
        String nowSemester = null;
        Integer nowYear = new Date().getYear() + 1900;
        
        if (evaluationPeriodResult.size() != 0) {
            for (int i = 0; i < evaluationPeriodResult.size(); i++) {
               if (evaluationPeriodResult.get(i).contains("성적등록")) {
                  nowSemester = evaluationPeriodResult.get(i);
                  return "접근허용";
               }
            }
         }
        
		return "성적공고기간이 아닙니다!";
	}

}
