package com.mugs.service.admin;

import java.util.Map;

import com.mugs.vo.Notice;

public interface NoticeService {

	/**
	 * 처음 공지사항 등록 메소드
	 * @param notice
	 * @return
	 */
	String insertNotice(Notice notice);
	
	/**
	 * 공지사항 수정 메소드
	 * @param notice
	 * @return
	 */
	String updateNotice(Notice notice);
	
	/**
	 * 공지사항 조회 메소드
	 * @return
	 */
	Map selectNotice();
}
