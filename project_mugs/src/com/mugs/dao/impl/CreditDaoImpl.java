package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.CreditDao;
import com.mugs.vo.Credit;

@Repository
public class CreditDaoImpl implements CreditDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertCredit(Credit credit) {
		// TODO Auto-generated method stub
		return session.insert(makeSqlId("insertCredit"), credit);
	}

	@Override
	public int updateCreditById(Credit credit) {
		// TODO Auto-generated method stub
		return session.update(makeSqlId("updateCreditById"), credit);
	}

	@Override
	public int deleteCredit(int id) {
		// TODO Auto-generated method stub
		return session.delete(makeSqlId("deleteCredit"), id);
	}

	@Override
	public Credit selectCreditById(int id) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSqlId("selectCreditById"), id);
	}

	@Override
	public List<Integer> selectYearByStuId(String id) {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectYearByStuId"), id);
	}

	@Override
	public List<Credit> selectAllCreditByStuId(String id) {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectAllCreditByStuId"), id);
	}

	@Override
	public List<String> selectSemesterByYear(String id, int year) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("year", year);
		System.out.println(id+"--"+year);
		return session.selectList(makeSqlId("selectSemesterByYear"), map);
	}

	@Override
	public List<Credit> selectCreditList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSqlId("selectCreditList"));
	}

	@Override
	public List<Credit> selectCreditByYear(String id, int year) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("year", year);
		return session.selectList(makeSqlId("selectCreditByYear"), map);
	}

	@Override
	public List<Credit> selectCreditBySemester(String id, String semester) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("semester", semester);
		return session.selectList(makeSqlId("selectCreditBySemester"), map);
	}

	@Override
	public List<Credit> selectCreditByType(String id, int year, String semester, String type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("year", year);
		map.put("semester", semester);
		map.put("type", type);
		return session.selectList(makeSqlId("selectCreditByType"), map);
	}

	@Override
	public List<Credit> selectCreditByOneType(String id, String type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return session.selectList(makeSqlId("selectCreditByOneType"), map);
	}

	@Override
	public List<Credit> selectCreditByYearAndSemester(String id, int year, String semester) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("year", year);
		map.put("semester", semester);
		return session.selectList(makeSqlId("selectCreditByYearAndSemester"), map);
	}

	private String makeSqlId(String id) {
		return "com.mugs.config.mapper.creditMapper." + id;
	}

	@Override
	public List<Credit> selectCreditByYearType(String id, int year, String type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("year", year);
		map.put("type", type);
		
		return session.selectList(makeSqlId("selectCreditByYearType"), map);
	}
	
	//병문 DaoImpl
	@Override
	public List<Credit> selectCreditByYearSemesterAndUsersId(int year, String semester,String usersId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("semester", semester);
		map.put("usersId", usersId);
		return session.selectList(makeSqlId("selectCreditByYearSemesterAndUsersId"),map);
	}
   

	@Override
	public List<Double> selectCreditScoreBySubjectIdStuId(int subjectId, String stuId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("subjectId", subjectId);
		map.put("stuId", stuId);
		return session.selectList(makeSqlId("selectCreditScoreBySubjectIdStuId"), map);
	}

	@Override
	public List<Credit> selectCreditByYearSemesterStdId(int nowYear, String semester, String stuId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("nowYear", nowYear);
		map.put("semester", semester);
		map.put("stuId", stuId);
		return session.selectList(makeSqlId("selectCreditByYearSemesterStuId"), map);
	}
	
	public Credit selectCreditByFourId(int creditYear, String creditSemester, String stuId, int subjectId) {
		HashMap params = new HashMap();
		params.put("creditYear", creditYear);
		params.put("creditSemester", creditSemester);
		params.put("stuId", stuId);
		params.put("subjectId", subjectId);
		return session.selectOne(makeSqlId("selectCreditByFourId"),params);
	}

	@Override
	public int updateCreditByFourId(Credit credit) {
		return session.update(makeSqlId("updateCreditByFourId"),credit);
	}

	@Override
	public double selectCreditAvgByThreeId(int creditYear, String creditSemester, String stuId) {
		HashMap params = new HashMap();
		params.put("creditYear", creditYear);
		params.put("creditSemester", creditSemester);
		params.put("stuId", stuId);
		return session.selectOne(makeSqlId("selectCreditAvgByThreeId"),params);
	}
}
