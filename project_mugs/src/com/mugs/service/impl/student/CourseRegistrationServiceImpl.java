package com.mugs.service.impl.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.dao.SubjectDao;
import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Subject;

@Service
public class CourseRegistrationServiceImpl implements CourseRegistrationService{

	@Autowired
	private CollegeDao collegeDaoImpl;
	
	@Autowired
	private SubjectDao subjectDaoImpl;
	
	@Autowired
	private MajorDao majorDaoImpl;
	
	@Autowired
	private ProfessorDao professorDaoImpl;
	
	@Autowired
	private ProfessorSubjectDao professorSubjectDaoImpl;
	
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

	@Override
	public Professor selectFullInfoProfessorById(String id) {
		// TODO Auto-generated method stub
		return professorDaoImpl.selectFullInfoProfessorById(id);
	}

	@Override
	public List<ProfessorSubject> getProfessorSubjectList(int majorId, int nowYear, String subjectSemester) {
		// TODO Auto-generated method stub
		return professorSubjectDaoImpl.selectProfessorSubjectList(majorId, nowYear, subjectSemester);
	}

	@Override
	public Subject getSubject(int num) {
		// TODO Auto-generated method stub
		return subjectDaoImpl.selectSubjectById(num);
	}
	
	@Override
	public List<ProfessorSubject> getMySubject(int subjectId, String proId, String semester, int majorId) {
		// TODO Auto-generated method stub
		// 일단 불러오는거 하나 과목
		Subject subject = subjectDaoImpl.selectSubjectById(subjectId);
		
		// 불러온거 업데이트 하나
		int requestNum = subject.getSubjectRequest() + 1;
		subject.setSubjectRequest(requestNum);
		subjectDaoImpl.updateSubjectById(subject);
		
		// 업데 끝나고 불러오는거 
		return professorSubjectDaoImpl.selectProfessorSubjectList(majorId, 2017, semester);
	}

	@Override
	public List<ProfessorSubject> deleteMySubject(int subjectId, String proId, String semester, int majorId) {
		// TODO Auto-generated method stub
		// 일단 불러오는거 하나 과목
		Subject subject = subjectDaoImpl.selectSubjectById(subjectId);
		
		// 불러온거 업데이트
		int requestNum = subject.getSubjectRequest() - 1;
		subject.setSubjectRequest(requestNum);
		subjectDaoImpl.updateSubjectById(subject);
		
		// 업데 끝나고 불러오는거
		return professorSubjectDaoImpl.selectProfessorSubjectList(majorId, 2017, semester);
	}
}
