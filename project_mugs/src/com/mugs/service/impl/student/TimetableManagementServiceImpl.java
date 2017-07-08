package com.mugs.service.impl.student;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CourseDao;
import com.mugs.service.student.TimetableManagementService;
import com.mugs.vo.Course;

@Service
public class TimetableManagementServiceImpl implements TimetableManagementService {

	@Autowired
	private CourseDao courseDaoImpl;

	// 내 강의시간표 조회해주는 메소드(findMyTimeTableByJoin)
	@Override
	public List<Course> findMyTimeTableByJoin(String loginId) {

		Date date = new Date();
		int nowYear = date.getYear() + 1900;
		// int nowMonth = date.getMonth();
		String nowSemester = "1학기";//학기는 원래 여기서 해주지 않고 디비를 통해서 서비스에서 가져오는 건데 일단 이렇게 

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드 - 학사일정테이블 필요
		// String nowSemester = courseDaoImpl.selectHackGiIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";

		// daoImpl메소드 호출 -> 매퍼에서 써준 쿼리문을 실행해서 원하는 값을 갖게되는 메소드.(원하는 값 : 내 시간표정보)
		List<Course> result = courseDaoImpl.selectMyTimeTableByJoin(loginId, nowYear, nowSemester);
		for (int i = 0; i < result.size(); i++) {

			String yAndS = result.get(i).getSubject().getSubjectTime();

			String[] timeArr = yAndS.split("/");
			String st1 = timeArr[0]; // "월(1,2)"
			String st2 = timeArr[1];// "수(3,4)"

			String[] st1Arr = st1.split("<");
			String st1_1 = st1Arr[0];// "월"
			String st1_2 = st1Arr[1];// "1,2)"

			String[] st2Arr = st2.split("<");
			String st2_1 = st2Arr[0];// "수"
			String st2_2 = st2Arr[1];// "3,4)"

			String[] st1_2Arr = st1_2.split(",");
			String st1_2_1 = st1_2Arr[0];// "1"
			String st1_2_2 = st1_2Arr[1];// "2)"

			String[] st2_2Arr = st2_2.split(",");
			String st2_2_1 = st2_2Arr[0];// "3"
			String st2_2_2 = st2_2Arr[1];// "4)"

			String[] st1_2_2Arr = st1_2_2.split(">");
			String st1_2_2_1 = st1_2_2Arr[0];// 2

			String[] st2_2_2Arr = st2_2_2.split(">");
			String st2_2_2_1 = st2_2_2Arr[0];// 4

		}
		return result;
	}
}
