package com.mugs.service.impl.admin;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer.ContentSecurityPolicyConfig;
import org.springframework.stereotype.Service;

import com.mugs.dao.NoticeDao;
import com.mugs.service.admin.NoticeService;
import com.mugs.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public String insertNotice(Notice notice) {
		int cnt = noticeDao.insertNotice(notice);
		if(cnt == 0 ){
			return "실패";
		}else{
			return "성공";
		}
	}

	@Override
	public String updateNotice(Notice notice) {
		int cnt = noticeDao.updateNotice(notice);
		if(cnt == 0 ){
			return "실패";
		}else{
			return "성공";
		}
	}

	@Override
	public Map selectNotice() {
		Map map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		Notice notice = noticeDao.SelectNotice();
		String date = sdf.format(notice.getNoticeDate());
		String noticeContent = notice.getNoticeContent();
		noticeContent = noticeContent.replace("\r\n","<br>");
		notice.setNoticeContent(noticeContent);
		System.out.println(notice);
		map.put("notice", notice);
		map.put("date", date);
		return map;
	}
}
