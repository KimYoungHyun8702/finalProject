package com.mugs.service.impl.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.CourseDao;
import com.mugs.service.student.TimetableManagementService;
import com.mugs.vo.Course;

@Service
public class TimetableManagementServiceImpl implements TimetableManagementService {

	@Autowired
	private CourseDao courseDaoImpl;
	
	@Autowired
	private AcademicCalendarDao academicCalendarDaoImpl;

	// 내 강의시간표 조회해주는 메소드(findMyTimeTableByJoin)
	@Override
	public List<Course> findMyTimeTableByJoin(String loginId) {
		//ArrayList<Object> list = new ArrayList();
		//ArrayList<Object> ygList = new ArrayList();
		Date date = new Date();
		String nowSemester = academicCalendarDaoImpl.selectCalendarName(date);
		int nowYear = date.getYear() + 1900;
		//HashMap yAndG = new HashMap();
		String firstYoYil = "";
		String secondYoYil = "";
		String firstGyoshi = "";
		String secondGyoshi = "";
		String thirdGyoshi = "";
		String fourthGyoshi = "";
		String firstYG = "";
		String secondYG = "";
		// int nowMonth = date.getMonth();
		//String nowSemester = "1학기";//학기는 원래 여기서 해주지 않고 디비를 통해서 서비스에서 가져오는 건데 일단 이렇게 

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드 - 학사일정테이블 필요
		// String nowSemester = courseDaoImpl.selectHackSaIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";

		// daoImpl메소드 호출 -> 매퍼에서 써준 쿼리문을 실행해서 원하는 값을 갖게되는 메소드.(원하는 값 : 내 시간표정보)
		List<Course> timeTableResult = courseDaoImpl.selectMyTimeTableByJoin(loginId, nowYear, nowSemester);
		System.out.println(timeTableResult.get(0).getProfessor().getUsersName());
		for (int i = 0; i < timeTableResult.size(); i++) {

			String yAndS = timeTableResult.get(i).getSubject().getSubjectTime();

			String[] timeArr = yAndS.split("_");
			String st1 = timeArr[0]; // "월(1,2)"
			String st2 = timeArr[1];// "수(3,4)"

			String[] st1Arr = st1.split("<");
			String st1_1 = st1Arr[0];// "월"
			String st1_2 = st1Arr[1];// "1,2)"

			String[] st2Arr = st2.split("<");
			String st2_1 = st2Arr[0];// "수"
			String st2_2 = st2Arr[1];// "3,4)"

			String[] st1_2Arr = st1_2.split("&");
			String st1_2_1 = st1_2Arr[0];// "1"
			String st1_2_2 = st1_2Arr[1];// "2)"

			String[] st2_2Arr = st2_2.split("&");
			String st2_2_1 = st2_2Arr[0];// "3"
			String st2_2_2 = st2_2Arr[1];// "4)"

			String[] st1_2_2Arr = st1_2_2.split(">");
			String st1_2_2_1 = st1_2_2Arr[0];// 2

			String[] st2_2_2Arr = st2_2_2.split(">");
			String st2_2_2_1 = st2_2_2Arr[0];// 4
			
			
			firstYoYil = st1_1;//월
			secondYoYil = st2_1;//수
			firstGyoshi = st1_2_1;//1
			secondGyoshi = st2_2_1;//3
			thirdGyoshi = st1_2_2_1;//2
			fourthGyoshi = st2_2_2_1;//4
			timeTableResult.get(i).getSubject().setYoYil1(firstYoYil);
			timeTableResult.get(i).getSubject().setYoYil2(secondYoYil);
			timeTableResult.get(i).getSubject().setGyoShi1(firstGyoshi);
			timeTableResult.get(i).getSubject().setGyoShi2(secondGyoshi);
			
			System.out.println("첫번째 요일 :" +timeTableResult.get(i).getSubject().getYoYil1());
			System.out.println("두번째 요일 :" +timeTableResult.get(i).getSubject().getYoYil2());
			System.out.println("첫번째 교시 :" +timeTableResult.get(i).getSubject().getGyoShi1());
			System.out.println("두번째 교시 :" +timeTableResult.get(i).getSubject().getGyoShi2());
			
			//firstYG = firstYoil + firstGyoshi;
			//secondYG = secondYoil + thirdGyoshi;
			//System.out.println("각 인덱스에 해당하는 firstYG가 뭔데 : " + firstYG);
			//System.out.println("각 인덱스에 해당하는 secondYG가 뭔데 : " + secondYG);
	    }
		return timeTableResult;
	}
}
