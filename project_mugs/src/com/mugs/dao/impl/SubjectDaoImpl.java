package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.SubjectDao;
import com.mugs.vo.Subject;

@Repository
public class SubjectDaoImpl implements SubjectDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertSubject(Subject subject) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertSubject"), subject);
	}

	@Override
	public int updateSubjectById(Subject subject) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateSubjectById"), subject);
	}

	@Override
	public int deleteSubject(int subjectId) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteSubject"), subjectId);
	}

	@Override
	public Subject selectSubjectById(int subjectId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectSubjectById"), subjectId);
	}

	@Override
	public List<Subject> selectSubjectList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectList"));
	}
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.subjectMapper."+id;
	}

	@Override
	public List<String> selectSubjectTypeList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectTypeList"));
	}
	
	@Override
	public List<Subject> selectCollegeIdBySubjectType(String subjectType) {
		return session.selectList(makeSqlId("selectCollegeIdBySubjectType"),subjectType);
	}

	@Override
	public List<Subject> selectMajorIdByCollegeId(int collegeId, String subjectType) {
		Map<String,Object> map = new HashMap<>();
		map.put("collegeId", collegeId);
		map.put("subjectType", subjectType);
		return session.selectList(makeSqlId("selectMajorIdByCollegeId"), map);
	}

	@Override
	public List<Subject> selectSubjectByMajorId(int majorId, int collegeId, String subjectType) {
		Map<String,Object> map = new HashMap<>();
		map.put("majorId", majorId);
		map.put("collegeId", collegeId);
		map.put("subjectType", subjectType);		
		return session.selectList(makeSqlId("selectSubjectByMajorId"),map);
	}

	@Override
	public Subject selectSubjectInfoBySubjectName(int subjectId) {
		return session.selectOne(makeSqlId("selectSubjectInfoBySubjectName"),subjectId);
	}

	@Override
	public Subject selectSubjectInfoBySubjectIdForUpdate(int subjectId) {
		return session.selectOne(makeSqlId("selectSubjectInfoBySubjectIdForUpdate"),subjectId);
	}

	@Override
	public List<Subject> selectCollegeIdBySubjectTypeMinor(String subjectType) {
		return session.selectList(makeSqlId("selectSubjectTimeBySubjectTypeMinor"),subjectType);
	}

	@Override
	public List<Subject> selectSubjectInfoBySubjectTime(String subjectType, String subjectTime) {
		Map map = new HashMap();
		map.put("subjectType", subjectType);
		map.put("subjectTime", subjectTime);
		return session.selectList(makeSqlId("selectSubjectInfoBySubjectTime"),map);
	}

	@Override
	public Subject selectSubjectInfoBySubjectIdForMinorUpdate(int subjectId) {
		return session.selectOne(makeSqlId("selectSubjectInfoBySubjectIdForMinorUpdate"),subjectId);
	}

	@Override
	public List<Subject> selectForOverlap(String subjectTime, String subjectSemester, int buildingId) {
		Map map = new HashMap();
		map.put("subjectTime", subjectTime);
		map.put("subjectSemester", subjectSemester);
		map.put("buildingId", buildingId);
		return session.selectList(makeSqlId("selectForOverlap"),map);
	}
	
	//병문 DaoImpl
	@Override
	public List<Subject> selectSubjectTypeByMajorId(int majorId) {
		return session.selectList(makeSqlId("selectSubjectTypeByMajorId"),majorId);
	}

	@Override
	public List<Subject> selectSubjectListByMajorIdForAllTime(int majorId,String semester, int year) {
		Map<String,Object> map = new HashMap();
		map.put("majorId", majorId);
		map.put("semester", semester);
		map.put("year", year);
		return session.selectList(makeSqlId("selectSubjectListByMajorIdForAllTime"), map);
	}
	
	@Override
	public List<String> subjectTypeList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectSubjectType"));
	}

	@Override
	public List<Subject> selectSubjectBySubjectTypeAndMajorId(String semester, Integer majorId, String subjectType, int year) {
		Map map = new HashMap();
		map.put("subjectType", subjectType);
		map.put("majorId", majorId);
		map.put("semester", semester);
		map.put("year", year);
		return session.selectList(makeSqlId("selectSubjectBySubjectTypeAndMajorId"),map);
	}

	@Override
	public List<String> selectSemesterInfo() {
		return session.selectList(makeSqlId("selectSemesterInfo"));
	}
	// End BM
}
