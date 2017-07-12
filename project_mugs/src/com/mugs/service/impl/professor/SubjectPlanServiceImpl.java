package com.mugs.service.impl.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.dao.SubjectPlanDao;
import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.SubjectPlan;

@Service
public class SubjectPlanServiceImpl implements SubjectPlanService{

	@Autowired
	private ProfessorSubjectDao dao;
	@Autowired
	private SubjectPlanDao dao2;
	
	@Override
	public List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId) {
		return dao.selectProfessorSubjectListJoinByProId(proId);
	}

	@Override
	public SubjectPlan getSubjectPlanByFourId(int planYear, String planSemester, int subjectId, String proId) {	
		return dao2.selectSubjectPlanByFourId(planYear, planSemester, subjectId, proId);
	}

	@Override
	public void addSubjectPlan(SubjectPlan sp) {
		dao2.insertSubjectPlan(sp);	
	}

	@Override
	public void setSubjectPlan(SubjectPlan sp) {
		dao2.updateSubjectPlanById(sp);
		
	}

	@Override
	public void deleteSubjectPlanById(int planId) {
		dao2.deleteSubjectPlan(planId);
	}

}
