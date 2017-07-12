<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지사항 등록</h2>
<hr>
<form id="insertForm" action="${initParam.rootPath }/admin/insertNoticeController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	공지 내용<br><textarea cols="130" rows="20" name="noticeContent"></textarea><p>
				<input id="submit" type="submit" value="등록">
	<input type="hidden" name="usersId" value="0"/>
	<sec:csrfInput/>
</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>