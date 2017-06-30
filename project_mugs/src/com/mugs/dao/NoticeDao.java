package com.mugs.dao;

import java.util.List;

import com.mugs.vo.Notice;

public interface NoticeDao {
	
	/**
	 * 공지사항 한 개  insert하는 메소드
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	
	/**
	 * 공지사항 update하는 메소드
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);
	
	/**
	 * 매개변수로 noticeId를 받아 공지사항 delete하는 메소드
	 * @param noticeId
	 * @return
	 */
	int deleteNotice(int noticeId);
	
	/**
	 * 공지사항 전체 조회하는 메소드
	 * @return
	 */
	List<Notice> SelectNoticeList();
	
	/**
	 * 매개변수로 noticeId를 받아 해당되는 공지사항 조회하는 메소드
	 * @param noticeId
	 * @return
	 */
	Notice SelectNoticeById(int noticeId);
}
