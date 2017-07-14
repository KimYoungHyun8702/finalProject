<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>단과대학 등록</h2>
<hr>
	<form action="${initParam.rootPath }/admin/insertCollegeController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
			단과대학 이름 : <input type="text" name="collegeName"/><br>
			<input type="submit" value="등록">
			<sec:csrfInput/>
	</form>
</body>