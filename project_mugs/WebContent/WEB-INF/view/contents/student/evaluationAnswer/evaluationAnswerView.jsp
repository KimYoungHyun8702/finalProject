<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<h2>설문응답조회하는 jsp</h2>
<a href="${initParam.rootPath }/evaluationAnswerRegisteration.do">설문응답평가하기로 이동하기</a><br>


<table>
	<thead id="thead">
		<tr>
			<td>과목ID</td>
			<td>과목명</td>
			<td>담당교수</td>
			<td>설문응답여부</td>
		</tr>
	</thead>
	<tbody id="tbody">
		<%-- <c:forEach items="${requestScope.evaluationValueList}" var="evaluationList">
			<tr>
				<td>${evaluationList.subjectId}</td>
				<td>${evaluationList.subject.subjectName}</td>
				<td>${evaluationList.subject.subjectType}</td>
				<td>${evaluationList.subject.subjectCredit}</td>
			</tr>
		</c:forEach> --%>
	</tbody>


</table>
</body>
</html>