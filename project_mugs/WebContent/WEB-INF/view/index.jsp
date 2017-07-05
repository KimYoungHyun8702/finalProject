<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Index</h1>

<h2>이병문 학생</h2>
<a href="/project_mugs/teststudentInfo.do">test페이지로 이동</a>
<h2>김영현교수</h2>
<a href="${initParam.rootPath }/professorInfo.do">교수 개인 정보</a><br>
<a href="${initParam.rootPath }/guidanceStudent.do">지도학생</a><br>
<a href="${initParam.rootPath }/SubjectPlan.do">강의계획서</a><br>


<h1>조새롬 학생</h1>
<a href="${initParam.rootPath }/student/getCollegeList.do">기준학점조회</a><br>
<a href="${initParam.rootPath }/student/getMyTimeTable.do">나의 시간표 조회</a><br>
<a href="${initParam.rootPath }/student/getMyCourseListByJoin.do">수강신청내역조회 클릭기기</a><br>
<a href="${initParam.rootPath }/student/getEvaluationValueList.do">설문응답평가조회</a><br>


<hr>
<h1>백진현 학생</h1>
<hr>
<a href="/project_mugs/student/subjectType.do">수강신청</a>

<hr>
<h1>현동준 관리자</h1>
<hr>
<a href="/${initParam.rootPath }/admin/selectStudentController.do">학생 조회</a>
<a href="insertStudent.do">학생 등록</a>
<a href="selectProfessor.do">교수 조회</a>
<a href="insertProfessor.do">교수 등록</a>
<a href="selectSubject.do">과목 조회</a>
<a href="insertSubject.do">과목 등록</a>
<a href="selectMajor.do">학과 조회</a>
<a href="insertMajor.do">학과 등록</a>
<a href="selectCollege.do">단과대학 조회</a>
<a href="insertCollege.do">단과대학 등록</a>
<a href="${initParam.rootPath }/admin/selectBuildingListController.do">건물 조회</a>
<a href="${initParam.rootPath }/insertBuilding.do">건물 등록</a>
<a href="selectCollege.do">강의실 조회</a>
<a href="${initParam.rootPath }/insertRoom.do">강의실 등록</a>

<hr>
<h1>김진광 학생</h1>
<hr>
<a href="${initParam.rootPath }/gradeInquiry.do">성적 조회 -딘강</a>
<br>
<a href="${initParam.rootPath }/student/currentGradeInquiry.do">당학기 성적조회 -딘강</a>
<br>
<a href="${initParam.rootPath }/student/academicProbationInquiry.do">학사경고내역 조회-딘강</a>
</body>
</html>