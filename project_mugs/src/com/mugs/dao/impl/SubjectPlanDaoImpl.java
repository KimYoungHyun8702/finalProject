package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.SubjectPlanDao;
import com.mugs.vo.SubjectPlan;

@Repository
public class SubjectPlanDaoImpl implements SubjectPlanDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertSubjectPlan(SubjectPlan sp) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertSubjectPlan"), sp);
	}

	@Override
	public int updateSubjectPlanById(SubjectPlan sp) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateSubjectPlanById"), sp);
	}

	@Override
	public int deleteSubjectPlan(int id) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteSubjectPlan"), id);
	}

	@Override
	public SubjectPlan selectSubjectPlanById(int id) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectSubjectPlanById"), id);
	}

	@Override
	public List<SubjectPlan> selectSubjectPlanList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectPlanList"));
	}

	private String makeSqlId(String id) {
		return "com.mugs.config.mapper.subjectPlanMapper." + id;
	}
}
