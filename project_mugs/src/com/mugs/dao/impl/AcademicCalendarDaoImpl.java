package com.mugs.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.vo.AcademicCalendar;

@Repository
public class AcademicCalendarDaoImpl implements AcademicCalendarDao {

	@Autowired
	private SqlSessionTemplate session;

	private String makeSql(String tagId) {
		return "com.mugs.config.mapper.academicCalendarMapper." + tagId;
	}

	@Override
	public int insertAcademicCalendar(AcademicCalendar academicCalendar) {
		// TODO Auto-generated method stub
		return session.insert(makeSql("insertAcademicCalendar"), academicCalendar);
	}

	@Override
	public int updateAcademicCalendarById(AcademicCalendar academicCalendar) {
		// TODO Auto-generated method stub
		return session.update(makeSql("updateAcademicCalendarById"), academicCalendar);
	}

	@Override
	public int deleteAcademicCalendar(int calendarId) {
		// TODO Auto-generated method stub
		return session.delete(makeSql("deleteAcademicCalendar"), calendarId);
	}

	@Override
	public AcademicCalendar selectAcademicCalendarById(int calendarId) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectAcademicCalendarById"), calendarId);
	}

	@Override
	public List<AcademicCalendar> selectAcademicCalendarList() {
		// TODO Auto-generated method stub
		return session.selectList(makeSql("selectAcademicCalendarList"));
	}

	@Override
	public AcademicCalendar selectCalendarByYearCalName(int year, String calName) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("calName", calName);
		return session.selectOne(makeSql("selectCalendarByYearCalName"), map);
	}

	@Override
	public String selectCalendarName(Date date) {
		System.out.println("서비스임플 학기일정이름 조회 전");
		System.out.println(date);
		return session.selectOne(makeSql("selectCalendarName"), date);
	}
}
