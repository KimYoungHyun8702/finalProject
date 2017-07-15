<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
<style>
input{
	text-align:center;
	width:200px;
	height:25px;
}

button {
	height:27px;
	font-size:12pt;
}
body {
	font-family:돋움체;
	align:center;
}

</style>
</head>
<body>

<form action="/project_mugs/professor/updateProfile.do" method="post">
아이디 : &nbsp;&nbsp;<input type="text" id="usersId" name="usersId" value="" readonly="readonly" placeholder="ID" disabled><br>
비밀번호 : <input type="text" id="usersPassword" name="usersPassword" value="" readonly="readonly"  placeholder="비밀번호" disabled><br>
성명 : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="usersName" name="usersName" value="" ><br>
영문성명 : <input type="text" id="usersEngName" name="usersEngName" value="" ><br>
주민번호 : <input type="text" id="usersRRN" name="usersRRN" value="" ><br>
이메일 : &nbsp;&nbsp;<input type="text" id="usersEmail" name="usersEmail" value="" ><br>
전화번호 : <input type="text" id="usersPhoneNum" name="usersPhoneNum" value=""><br>
핸드폰번호:<input type="text" id="usersCellNum" name="usersCellNum" value=""><br>
국적 : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="usersNational" name="usersNational" value=""><br>
현주소 : &nbsp;&nbsp;<input type="text" id="usersCurrentAddr" name="usersCurrentAddr"><br>
본적지 : &nbsp;&nbsp;<input type="text" id="usersBornAddr" name="usersBornAddr" value=""><br>
뭐더라.. : <input type="text" id="usersEnable" name="usersEnable" value=""><br>
사진주소 : <input type="text" id="usersPhoto" name="usersPhoto" value="">&nbsp;

<div id="professorRegiste">
졸업대학 : <input type="text" id="proUniversity" name="proUniversity" value="" readonly="readonly" placeholder="졸업대학" disabled><br>
졸업대학원:<input type="text" id="proGradSchool" name="proGradSchool" value="" readonly="readonly" placeholder="졸업대학원" disabled><br>
교수실전화번호:<input type="text" id="proOfficePhoneNum" name="proOfficePhoneNum" value="" readonly="readonly" placeholder="교수실전화번호" disabled><br>
</div>
<br>
<center><button type="submit" id="updateBtn" type="button" class="btn btn-primary">수정</button></center>
</form>
</body>

</html>