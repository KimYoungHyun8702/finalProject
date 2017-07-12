package com.mugs.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.vo.EvaluationAnswer;

@Repository
public class EvaluationAnswerDaoImpl implements EvaluationAnswerDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String id){
		return "com.mugs.config.mapper.evaluationAnswerMapper."+id;
	}

	@Override
	public int insertEvaluationAnswer(EvaluationAnswer ea) {
		return session.insert(makeSql("insertEvaluationAnswer"),ea);
	}

	@Override
	public int updateEvaluationAnswerById(EvaluationAnswer ea) {
		return session.update(makeSql("updateEvaluationAnswerById"),ea);
	}

	@Override
	public int deleteEvaluationAnswerById(int eaId) {
		return session.delete(makeSql("deleteEvaluationAnswerById"),eaId);
	}

	@Override
	public List<EvaluationAnswer> selectEvaluationAnswerAll() {
		return session.selectList(makeSql("selectEvaluationAnswerAll"));
	}

	@Override
	public EvaluationAnswer selectEvaluationAnswerById(int eaId) {
		return session.selectOne(makeSql("selectEvaluationAnswerById"),eaId);
	}

	@Override
	public List<EvaluationAnswer> selectEvaluationAnswerValueList(String loginId, int nowYear, String nowSemester) {
		HashMap params = new HashMap();
		params.put("loginId", loginId);
		params.put("nowYear", nowYear);
		params.put("nowSemester", nowSemester);
		System.out.printf("로그인아이디-%s, 년도:%d, 학기:%s%n", loginId, nowYear, nowSemester);
		return session.selectList(makeSql("selectEvaluationAnswerValueList"), params);
	}

	@Override
	public int insertEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint,
			int evaluationPassionPoint, int evaluationQuestionPoint, int nowYear, String nowSemester, String loginId,
			int subjectId, String proId) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Object> updateEvaluationAnswerState(int nowYear, String nowSemester, String loginId, int subjectId) {
		HashMap params = new HashMap();
		params.put("nowYear", nowYear);
		params.put("nowSemester", nowSemester);
		params.put("loginId", loginId);
		params.put("subjectId", subjectId);
		System.out.println(nowYear);
		System.out.println(nowSemester);
		System.out.println(loginId);
		System.out.println(subjectId);
	    session.update(makeSql("updateEvaluationAnswerState"), params);
		System.out.println("업데이트확인");
		ArrayList<Object> list = new ArrayList<>();
		list.add(nowYear);
		list.add(nowSemester);
		list.add(loginId);
		list.add(subjectId);
		System.out.println("=================");
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		return list;
	}

	@Override
	public List<EvaluationAnswer> selectEvaluationAnswerValue(int nYear, String nSemester, String nowId, int subjctId) {
		System.out.println("!!매개변수확인 : " + nowId);
		HashMap params = new HashMap();
		params.put("nowYear", nYear);
		params.put("nowSemester", nSemester);
		params.put("loginId", nowId);
		params.put("subejectId", subjctId);
	    return session.selectOne(makeSql("selectEvaluationAnswerValue"), params);
	}

	/*@Override
	public int insertEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										   int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										   String nowSemester, String loginId, String subjectId, String proId) {
		HashMap params = new HashMap();
		params.put("evaluationTaskPoint", evaluationTaskPoint);
		params.put("evaluationExamPoint", evaluationExamPoint);
		params.put("evaluationReadyPoint", evaluationReadyPoint);
		params.put("evaluationPassionPoint", evaluationPassionPoint);
		params.put("evaluationQuestionPoint", evaluationQuestionPoint);
		params.put("nowYear", nowYear);
		params.put("nowYear", nowYear);
		params.put("nowSemester", nowSemester);
		params.put("loginId", loginId);
		params.put("subjectId", subjectId);
		params.put("proId", proId);
		
		return session.insert(makeSql("insertEvaluationAnswerValue"), params);
		
	}*/
	
	
	

}
