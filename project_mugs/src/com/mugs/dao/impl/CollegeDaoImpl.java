package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.CollegeDao;
import com.mugs.vo.College;

@Repository
public class CollegeDaoImpl implements CollegeDao{
	
	//Spring Container에서 SqlSessionTemplate을 주입받아서 instance변수로 대입
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String tagId){
		return "com.mugs.config.mapper.collegeMapper."+tagId;
	}
	@Override
	public int insertCollege(College college) {
		return session.insert(makeSql("insertCollege"));
	}

	@Override
	public int updateCollegeById(College college) {
		return session.update(makeSql("updateCollegeById"));
	}

	@Override
	public int deleteCollege(int collegeId) {
		return session.delete(makeSql("deleteCollege"));
	}

	@Override
	public College selectCollegeById(int collegeId) {
		return session.selectOne(makeSql("selectCollegeById"));
	}

	@Override
	public List<College> selectCollegeList() {
		return session.selectList(makeSql("selectCollegeList"));
	}

}
