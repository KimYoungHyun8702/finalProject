<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>단과대학 수정</h2>
<br>
	<form action="${initParam.rootPath }/admin/updateCollegeController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
			건물 이름 : <input type="text" name="collegeName" value="${param.collegeName }"/>&nbsp;&nbsp;
			<input type="hidden" name="collegeId" value="${param.collegeId }"/>
			<input type="submit" value="수정">
			<sec:csrfInput/>
	</form>
</body>