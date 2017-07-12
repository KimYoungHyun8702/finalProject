<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table, td{
	border: 1px solid black;
}
table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
}
</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>

<title>Insert title here</title>
<style type="text/css">
table, td{
	border: 1px solid black;
}
table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<h2>수강정보목록조회하는 jsp</h2>
여기다가 현재 수강하고 있는 과목 목록 뿌려주면댐
	<table>
	<thead id="thead">
		<tr>
			<td>과목id</td>
			<td>과목명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>담당교수</td>
			<td>강의시간</td>
			<td>강의실</td>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach items="${requestScope.myCourseListResult}" var="courseList">
			<tr>
				<td>${courseList.subjectId}</td>
				<td>${courseList.subject.subjectName}</td>
				<td>${courseList.subject.subjectType}</td>
				<td>${courseList.subject.subjectCredit}</td>
				<td>${courseList.professor.usersName}</td>
				<td>${courseList.subject.subjectTime}</td>
				<td>${courseList.subject.lectureId}</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
<button onclick="location.href='${initParam.rootPath}/'">이전페이지로</button>
</body>
</html>