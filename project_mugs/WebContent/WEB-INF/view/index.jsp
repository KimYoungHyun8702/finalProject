<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
table{
   width:100%;
}
h3{
	font-family:돋움체;
}
</style>
</head>
<body bgcolor="black">
<br><br><br><br><br>
<h3 align="center">환영합니다 ~~</h3>


<br>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<button onclick="location.href='${initParam.rootPath }/admin/selectNoticeForUpdateController.do'">공지사항 수정</button><br>
</sec:authorize>
</body>
</html>