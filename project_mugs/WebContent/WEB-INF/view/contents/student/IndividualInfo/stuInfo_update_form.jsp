<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 style="color:'red'">성명, 주민번호, 학적정보는 수정할 수 없습니다.</h3>
	<form action="/project_mugs/student/updateStu.do" method="post">
<input type="hidden" name="usersId" value="${param.usersId}"><br>
<input type="hidden" name="usersName" value="${param.usersName}">
<input type="hidden" name="usersEngName" value="${param.usersEngName}">
<input type="hidden" name="usersRRN" value="${param.usersRRN}">
<input type="hidden" name="usersEnable" value="${param.usersEnable}">
<input type="hidden" name="usersNoticeList" value="${param.usersNoticeList}">

비밀번호		<input type="text" name="usersPassword" value="${param.usersPassword}" ><br>
이메일		<input type="text" name="usersEmail" value="${param.usersEmail}"><br>
전화번호	  	<input type="text" name="usersPhoneNum" value="${param.usersPhoneNum}"><br>
핸드폰번호	<input type="text" name="usersCellNum" value="${param.usersCellNum}"><br>
국적			<input type="text" name="usersNational" value="${param.usersNational}"><br>
현주소		<input type="text" name="usersCurrentAddr" value="${param.usersCurrentAddr}"><br>
본적지		<input type="text" name="usersBornAddr" value="${param.usersBornAddr}"><br>
사진주소		<input type="text" name="usersPhoto" value="${param.usersPhoto}"><br>
	<input type="submit" value="수정">
	</form>
</body>
</html>