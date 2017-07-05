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
	<hr>
	<a href="${initParam.rootPath }/gradeInquiry.do">성적 조회 -딘강</a>
	<br>
	<a href="${initParam.rootPath }/student/currentGradeInquiry.do">당학기 성적조회 -딘강</a>
	<br>
	<a href="${initParam.rootPath }/student/academicProbationInquiry.do">학사경고내역 조회-딘강</a>
</body>
</html>