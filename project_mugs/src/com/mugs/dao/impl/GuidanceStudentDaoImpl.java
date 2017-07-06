package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.GuidanceStudentDao;
import com.mugs.vo.GuidanceStudent;
@Repository
public class GuidanceStudentDaoImpl implements GuidanceStudentDao{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.guidanceStudentMapper."+id;
		
	}

	@Override
	public int insertguidanceStudent(GuidanceStudent guidanceStudent) {
		return session.insert(makeSqlId("insertguidanceStudent"), guidanceStudent);
	}

	@Override
	public int updateguidanceStudentById(GuidanceStudent guidanceStudent) {
		return session.update(makeSqlId("updateguidanceStudentById"), guidanceStudent);
	}

	@Override
	public int deleteguidanceStudent(int guidanceStudentId) {
		return session.delete(makeSqlId("deleteguidanceStudent"), guidanceStudentId);
	}

	@Override
	public List<GuidanceStudent> selectguidanceStudentList() {
		return session.selectList(makeSqlId("selectguidanceStudentList"));
	}

	@Override
	public GuidanceStudent selectguidanceStudentById(int guidanceStudentId) {
		return session.selectOne(makeSqlId("selectguidanceStudentById"), guidanceStudentId);
	}

	/**-------------------- 영혀니꼬꼬 -------------------------*/
	@Override
	public GuidanceStudent selectguidanceStudentListByJoin(String proId) {
		return session.selectOne(makeSqlId("selectguidanceStudentListByJoin"), proId);
	}
	
	
}
