package com.mugs.service.impl.student;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.BuildingDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.impl.BuildingDaoImpl;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.TimetableManagementService;
import com.mugs.vo.Building;
import com.mugs.vo.Course;
import com.mugs.vo.Student;

@Service
public class TimetableManagementServiceImpl implements TimetableManagementService {

   @Autowired
   private CourseDao courseDaoImpl;
   @Autowired
   private AcademicCalendarDao academicCalendarDaoImpl;

   @Autowired
   private BuildingDaoImpl buildingDao;

   @Autowired
   private StudentDao studentDaoImpl;

   @Override
   public HashMap<String, Object> findMyTimeTableByJoin(String loginId) {
      // TODO Auto-generated method stub
      HashMap<String, Object> map = new HashMap<>();
      Date nowDate = new Date(); // 오늘 날짜

      List<String> evaluationPeriodResult = academicCalendarDaoImpl.selectCalendarName(nowDate); // 오늘
                                                                           // 날짜를
                                                                           // 기준으로
                                                                           // 학사일정명을
                                                                           // 뽑아온다.

      String message = null; // 메세지 담을 메소드
      String nowSemester = null; // 바로 직전학기 담을 메소드
      Integer nowYear = new Date().getYear() + 1900; // 현재 연도 추출
      Student student = studentDaoImpl.selectStudentById(loginId); // 현재 로그인한
                                                      // 학생정보를
                                                      // 가져온다.
      String stuRegister = student.getStuRegisterState(); // 지금 로그인한 학생의 재적상태를
                                             // 담는 메소드

      // 오늘 날짜기준으로 학사일정명을 뽑아온 리스트중에 학기(수강기간)이 있으면 nowSemester변수에 담는다.
      if (evaluationPeriodResult.size() != 0) {
         for (int i = 0; i < evaluationPeriodResult.size(); i++) {
            if (evaluationPeriodResult.get(i).contains("학기") && evaluationPeriodResult.get(i).length() < 5) {
               nowSemester = evaluationPeriodResult.get(i);
            }
         }
      }

      if (!stuRegister.equals("휴학") && !stuRegister.equals("군휴학")) {
         if (nowSemester == null) {
            // 만약 현재 로그인한 학생이 휴학, 군휴학 상태가 아닌 정상적인 재적상태라면에서 현재가 학기(수강기간) 기간이
            // 아니면
            // 설문응답이 아니라는 메시지를 담고 map 담는다.
            message = "현재 수강하고 있는 과목이 없습니다.";
            map.put("message", message);
         } else {

            List<Course> timeTableResult = courseDaoImpl.selectMyTimeTableByJoin(loginId, nowYear, nowSemester);

            String firstYoYil = "";
            String secondYoYil = "";
            String firstGyoshi = "";
            String secondGyoshi = "";
            String thirdGyoshi = "";
            String fourthGyoshi = "";
            String firstYG = "";
            String secondYG = "";

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

               firstYoYil = st1_1;// 월
               secondYoYil = st2_1;// 수
               firstGyoshi = st1_2_1;// 1
               secondGyoshi = st2_2_1;// 3
               thirdGyoshi = st1_2_2_1;// 2
               fourthGyoshi = st2_2_2_1;// 4
               timeTableResult.get(i).getSubject().setYoYil1(firstYoYil);
               timeTableResult.get(i).getSubject().setYoYil2(secondYoYil);
               timeTableResult.get(i).getSubject().setGyoShi1(firstGyoshi);
               timeTableResult.get(i).getSubject().setGyoShi2(secondGyoshi);

               if(i == 0) {
            	   timeTableResult.get(i).setColor("red");
               } else if(i == 1) {
            	   timeTableResult.get(i).setColor("blue");
               } else if(i == 2) {
            	   timeTableResult.get(i).setColor("gray");
               } else if(i == 3) {
            	   timeTableResult.get(i).setColor("pink");
               } else if(i == 4) {
            	   timeTableResult.get(i).setColor("green");
               } else if(i == 5) {
            	   timeTableResult.get(i).setColor("orange");
               } else if(i == 6) {
            	   timeTableResult.get(i).setColor("purple");
               } else if(i == 7) {
            	   timeTableResult.get(i).setColor("yellow");
               } else if(i == 8) {
            	   timeTableResult.get(i).setColor("cyan");
               } else if(i == 9) {
            	   timeTableResult.get(i).setColor("red");
               } else if(i == 10) {
            	   timeTableResult.get(i).setColor("red");
               } 
            }

            map.put("myTimeTableResult", timeTableResult);
            map.put("message", ""); // 현재 로그인한 학생이 재적상태도 정상적인 재적상태이고 현재가
                              // 학기(수강기간)이면 msg "" 공백으로 map 담고
            // 바로 윗줄에서는 시간표 페이지에서 보여줄 내가 수강하고 있는 수강리스트를 담는다.
         }
      } else {
         map.put("stuRegisterTimeTable", stuRegister); // 현재 재적 상태가 휴학 상태이거나,
                                             // 군휴학 이면 map에 담는다.
      }
      return map;
   }

   @Override
   public Building findBuildingByBuildingName(String buildingName) {
      // TODO Auto-generated method stub
      return buildingDao.selectBuildingByBuildingName(buildingName);
   }
}