package com.mugs.service.impl.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.ProfessorSubject;
@Service
public class SubjectPlanServiceImpl implements SubjectPlanService{

	@Autowired
	private ProfessorSubjectDao dao;
	
	@Override
	public List<ProfessorSubject> getProfessorSubjectInfoByJoin(String proId) {
		return dao.selectProfessorSubjectListJoinByProId(proId);
	}

}
