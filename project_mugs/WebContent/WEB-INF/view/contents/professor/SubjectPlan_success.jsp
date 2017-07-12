<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>
강의계획서<br>

강의계획서번호(sp)<input id="planId" value="" readonly="readonly"><br>
교과목개요(sp)<input id="planSummary" value="" readonly="readonly"><br>
채점방식(sp)<input id="planMarkingMethod" value="" readonly="readonly"><br>
학습목표(sp)<input id="planLessonGoal" value="" readonly="readonly"><br>
주차별강의내용(sp)<input id="planWeekContent" value="" readonly="readonly"><br>
교재(sp)<input id="planBookinfo" value="" readonly="readonly"><br>
참고문헌(sp)<input id="planBibliography" value="" readonly="readonly"><br>
연도(sp)<input id="planYear" value="" readonly="readonly"><br>
학기(sp)<input id="planSemester" value="" readonly="readonly"><br>
비고(sp)<input id="planNote" value="" readonly="readonly"><br>
교수ID(p)<input id="proId" value="" readonly="readonly"><br>
과목ID(s)<input id="subjectId" value="" readonly="readonly"><br>
과목명(s)<input id="subjectName" value="" readonly="readonly"><br>
이수구분(s)<input id="subjectType" value="" readonly="readonly"><br>
학년(s)<input id="subjectGrade" value="" readonly="readonly"><br>
학점(s)<input id="subjectCredit" value="" readonly="readonly"><br>
강의시간(s)<input id="subjectTime" value="" readonly="readonly"><br>
교수실ID(p)<input id="proRoomOfficeId" value="" readonly="readonly"><br>
이름(u)<input id="usersName" value="" readonly="readonly"><br>
영문성명(u)<input id="usersEngName" value="" readonly="readonly"><br>
이메일(u)<input id="usersEmail" value="" readonly="readonly"><br>
핸드폰번호(u)<input id="usersCellNum" value="" readonly="readonly"><br>
국적(u)<input id="usersNational" value="" readonly="readonly"><br>

<button type="button" id="updateBtn">수정</button>
<form action="/project_mugs/professor/removeSubjectPlan.do" method="post">
<input type="text" id="planId2" name="planId2" value="" readonly="readonly"><br><!-- style="display: none; -->
<button type="submit" id="deleteBtn">삭제</button>
</form>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var openWin;
	
	$(document).on("click", "#updateBtn", function openchild(){

		window.name = "parentForm";
		openWin = window.open("/project_mugs/SubjectPlan_update.do", "강의계획서수정", "width=500, height=400 resizable=no");
		setTimeout(function() {
			openWin.document.getElementById("planId").value = document.getElementById("planId").value;
			openWin.document.getElementById("planYear").value = document.getElementById("planYear").value;
        	openWin.document.getElementById("planSemester").value = document.getElementById("planSemester").value;
        	openWin.document.getElementById("planSummary").value =document.getElementById("planSummary").value;
        	openWin.document.getElementById("planLessonGoal").value = document.getElementById("planLessonGoal").value;
        	openWin.document.getElementById("planWeekContent").value = document.getElementById("planWeekContent").value;
        	openWin.document.getElementById("planMarkingMethod").value = document.getElementById("planMarkingMethod").value;
        	openWin.document.getElementById("planBookinfo").value = document.getElementById("planBookinfo").value;
        	openWin.document.getElementById("planBibliography").value = document.getElementById("planBibliography").value;
        	openWin.document.getElementById("subjectId").value = document.getElementById("subjectId").value;
        	openWin.document.getElementById("subjectName").value = document.getElementById("subjectName").value;
        	openWin.document.getElementById("subjectType").value = document.getElementById("subjectType").value;
        	openWin.document.getElementById("subjectGrade").value = document.getElementById("subjectGrade").value;
        	openWin.document.getElementById("subjectCredit").value = document.getElementById("subjectCredit").value;
        	openWin.document.getElementById("subjectTime").value = document.getElementById("subjectTime").value;
        	openWin.document.getElementById("proId").value = document.getElementById("proId").value;
        	openWin.document.getElementById("proRoomOfficeId").value = document.getElementById("proRoomOfficeId").value;
        	openWin.document.getElementById("usersName").value = document.getElementById("planYear").value;
        	openWin.document.getElementById("usersEngName").value = document.getElementById("usersName").value;
        	openWin.document.getElementById("usersEmail").value = document.getElementById("usersEmail").value;
        	openWin.document.getElementById("usersCellNum").value = document.getElementById("usersCellNum").value;
        	openWin.document.getElementById("usersNational").value = document.getElementById("usersNational").value;
         }, 1000);               
	});
</script>
</html>