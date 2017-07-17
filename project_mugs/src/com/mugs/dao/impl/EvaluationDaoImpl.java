package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.EvaluationDao;
import com.mugs.vo.Evaluation;

@Repository
public class EvaluationDaoImpl implements EvaluationDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String id){
		return "com.mugs.config.mapper.evaluationMapper."+id;
	}
	
	@Override
	public int insertEvaluation(Evaluation e) {
		return session.insert(makeSql("insertEvaluation"), e);
	}

	@Override
	public int deleteEvaluationById(int evalId) {
		return session.delete(makeSql("deleteEvaluationById"),evalId);
	}

	@Override
	public int updateEvaluationById(Evaluation e) {
		return session.update(makeSql("updateEvaluationById"),e);
	}

	@Override
	public Evaluation selectEvaluationById(int evalId) {
		return session.selectOne(makeSql("selectEvaluationById"),evalId);
	}

	@Override
	public List<Evaluation> selectEvaluationAll() {
		return session.selectList(makeSql("selectEvaluationAll"));
	}

	@Override
	public List<Evaluation> selectEvaluationByYearProIdSubjectId(String proId, int subjectId, int beforeYear) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("proId", proId);
		map.put("subjectId", subjectId);
		map.put("beforeYear", beforeYear);
		return session.selectList(makeSql("selectEvaluationByYearProIdSubjectId"), map);
	}

	

	

}
