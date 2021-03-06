package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.StandardDao;
import com.mugs.vo.Standard;

@Repository
public class StandardDaoImpl implements StandardDao {
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String id){
		return "com.mugs.config.mapper.standardMapper."+id;
	}

	@Override
	public int insertStandard(Standard standard) {
		return session.insert(makeSql("insertStandard"),standard);
	}

	@Override
	public int updateStandard(Standard standard) {
		return session.update(makeSql("updateStandard"),standard);
	}

	@Override
	public int deleteStandard(int standardYear, int majorId) {//매개변수가 2개라서 변수 선언해줄때 Map선언해주고 Map에 담아줘야 합니다.
		HashMap<String, Integer> param = new HashMap<>();
		param.put("standardYear", standardYear);
		param.put("majorId", majorId);
		return session.delete(makeSql("deleteStandard"),param);
	}
	
	@Override
	public Standard selectStandardById(int standardYear, int majorId) {//매개변수가 2개라서 변수 선언해줄때 Map선언해주고 Map에 담아줘야 합니다.
		HashMap<String, Integer> param = new HashMap<>();
		param.put("standardYear", standardYear);
		param.put("majorId", majorId);
		return session.selectOne(makeSql("selectStandardById"), param);
	}


	@Override
	public List<Standard> selectStandardList() {
		return session.selectList(makeSql("selectStandardList"));
	}

	@Override
	public List<String> selectMajorList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Standard> selectYearListByMajorId(int majorId) {
		return session.selectList(makeSql("selectYearListByMajorId"), majorId);
	}

	@Override
	public Standard selectStandardValue(int collegeId, int majorId, int standardYear) {
		HashMap params = new HashMap();
		params.put("collegeId", collegeId);
		params.put("majorId", majorId);
		params.put("standardYear", standardYear);
		return session.selectOne(makeSql("selectStandardValue"), params);
	}

	@Override
	public List<Standard> selectListByMajorId(int majorId) {
		return session.selectList(makeSql("selectListByMajorId"),majorId);
	}

	
}
