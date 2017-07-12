<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>수강 기준 학점 등록</h2>
<hr>
<form action="${initParam.rootPath }/admin/insertStandardController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	학과 이름 : <input type="text" value="${param.majorName }" readonly/><br>
	적용 연도 : <input type="number" name="standardYear"/><br>
	최소 학점 : <input type="number" name="standardMinCredit"/><br>
	최대 학점 : <input type="number" name="standardMaxCredit"/><br>
	장학금 최소 학점 : <input type="number" name="standardMinScholarship"/><br>
	유예 최소 학점 : <input type="number" name="standardDelayMinCredit"/><br>
	유예 최대 학점 : <input type="number" name="standardDelayMaxCredit"/><br>
	<input type="hidden" name="majorId" value="${param.majorId }"/>
	<input type="submit" value="등록">
	<sec:csrfInput/>
</form>
</body>