package com.mugs.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.CourseDao;
import com.mugs.vo.Course;

@Repository
public class CourseDaoImpl implements CourseDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String id){
		return "com.mugs.config.mapper.courseMapper."+id;
	}

	@Override
	public int insertCourse(Course c) {
		return session.insert(makeSql("insertCourse"),c);
	}

	@Override
	public int updateCourseById(Course c) {
		return session.update(makeSql("updateCourseById"),c);
	}

	@Override
	public int deleteCourseById(int cId) {
		return session.delete(makeSql("deleteCourseById"),cId);
	}

	@Override
	public List<Course> selectCourseAll() {
		return session.selectList(makeSql("selectCourseAll"));
	}

	@Override
	public Course selectCourseById(int cId) {
		return session.selectOne(makeSql("selectCourseById"),cId);
	}
	

	@Override
	public String selectHackGiIlJung(int nowMonth) {
		return session.selectOne(makeSql("selectHackGiIlJung"), nowMonth);
	}
	
	@Override
	public List<Course> selectMyTimeTableByJoin(String loginId, int nowYear, String nowSemester) {
		HashMap params = new HashMap();
		params.put("loginId", loginId);
		params.put("nowYear", nowYear);
		params.put("nowSemester", nowSemester);
		return session.selectList(makeSql("selectMyTimeTableByJoin"), params);//매개변수들을 맵에 담아서 매퍼에 접근
	}

	@Override
	public List<Course> selectMyCourseListByJoin(String loginId, int nowYear, String nowSemester) {
		HashMap params = new HashMap();
		params.put("loginId", loginId);
		params.put("nowYear", nowYear);
		params.put("nowSemester", nowSemester);
		return session.selectList(makeSql("selectMyCourseListByJoin"), params);
	}

	@Override
	public int selectStudentCount(String semester, int nowYear, int subjectId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("semester", semester);
		map.put("nowYear", nowYear);
		map.put("subjectId", subjectId);
		return session.selectOne(makeSql("selectStudentCount"), map);
	}

	@Override
	public List<Course> selectMyCourseList(String stuId, int nowYear, String semester) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("semester", semester);
		map.put("nowYear", nowYear);
		map.put("stuId", stuId);
		return session.selectList(makeSql("selectMyCourseList"), map);
	}

	@Override
	public int deleteCourse(String stuId, int nowYear, String semester, int subjectId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("semester", semester);
		map.put("nowYear", nowYear);
		map.put("stuId", stuId);
		map.put("subjectId", subjectId);
		return session.delete(makeSql("deleteCourse"), map);
	}
}
