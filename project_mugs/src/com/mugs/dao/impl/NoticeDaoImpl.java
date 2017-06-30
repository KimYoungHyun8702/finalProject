package com.mugs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mugs.dao.NoticeDao;
import com.mugs.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id){
		return "com.mugs.config.mapper.noticeMapper."+id;
	}

	@Override
	public int insertNotice(Notice notice) {
		return session.insert(makeSqlId("insertNotice"),notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return session.update(makeSqlId("updateNotice"),notice);
	}

	@Override
	public int deleteNotice(int noticeId) {
		return session.delete(makeSqlId("deleteNoticeById"), noticeId);
	}

	@Override
	public List<Notice> SelectNoticeList() {
		return session.selectList(makeSqlId("selectNoticeList"));
	}

	@Override
	public Notice SelectNoticeById(int noticeId) {
		return session.selectOne(makeSqlId("selectNoticeById"), noticeId);
	}
	
	
	
}
