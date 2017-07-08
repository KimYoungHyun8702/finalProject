<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var periodResult = "${evaluationPeriodResult}";
	if(periodResult != "" ) {
		if(periodResult == '1학기' || periodResult == '2학기') {
		alert(periodResult + "11");
		//window.location.href="<c:url value='${initParam.rootPath }/student/selectEvaluationAnswerValueList.do'/>";
			window.location.href = '${initParam.rootPath }/student/selectEvaluationAnswerValueList.do';
		}
		else {
			alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.");
			return false;
		}
	}
})
/* 아이디가 evaluation에게 이벤트
받은 학사일정명이 1학기중간고사 1학기기말고사 2학기중간고사 2학기기말고사가 아니면
alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.")띄워지게끔 구현. 
일단 인덱스로 돌아와서 기간이 아니면 알러트창 띄우고 
기간이면 설문응답하는 리스트 뽑아오는 컨트롤러로이동하게끔 구현*/
/* $(document).ready(function(){
	$("#evaluation").on("click", function(){
		window.location.href="<c:url value='${initParam.rootPath }/student/compareEvaluationPeriod.do'/>";
		var param = "${evaluationPeriodResult}";
		if(param == '1학기 중간고사 설문응답기간' || '1학기 기말고사 설문응답기간' || '2학기 중간고사 설문응답기간' || '2학기 기말고사 설문응답기간') {
			//"${initParam.rootPath }/student/selectEvaluationAnswerValueList.do"로 이동
			window.location.href="<c:url value='${initParam.rootPath }/student/selectEvaluationAnswerValueList.do'/>";
		};
		alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.");
		return false;
	});
}); */

</script>
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
<a href="${initParam.rootPath }/student/selectEvaluationAnswerValueList.do">설문응답평가조회</a><br>
<a href="${initParam.rootPath }/student/compareEvaluationPeriod.do">설문응답평가조회-기간설정까지해준것</a>
<%-- <button id="evaluation">설문응답평가조회 - 기간설정까지 해준 경로</button>
${initParam.rootPath }/student/compareEvaluationPeriod.do --%>
<hr>
<h1>백진현 학생</h1>
<hr>
<a href="/project_mugs/student/subjectType.do">수강신청</a>

<hr>
<h1>현동준 관리자</h1>
<hr>
<a href="${initParam.rootPath }/admin/selectStudentController.do">학생 조회</a>
<a href="insertStudent.do">학생 등록</a>
<a href="selectProfessor.do">교수 조회</a>
<a href="insertProfessor.do">교수 등록</a>
<a href="${initParam.rootPath }/admin/selectSubjectTypeController.do">과목 조회</a>
<a href="${initParam.rootPath }/admin/selectForInsertSubjectController.do">과목 등록</a>
<a href="${initParam.rootPath }/admin/selectCollegeListForSelectController.do">학과 조회</a>
<a href="${initParam.rootPath }/admin/selectCollegeListForinsertController.do">학과 등록</a>
<a href="${initParam.rootPath }/admin/selectCollegeListController.do">단과대학 조회</a>
<a href="${initParam.rootPath }/insert_college.do">단과대학 등록</a>
<a href="${initParam.rootPath }/admin/selectBuildingListController.do">건물 조회</a>
<a href="${initParam.rootPath }/insert_building.do">강의동 등록</a>

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