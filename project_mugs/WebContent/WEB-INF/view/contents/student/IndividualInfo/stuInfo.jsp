<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<h1>학생정보조회</h1>
<body>
	<p>
	
	<c:choose>
		<c:when test="${requestScope.reFormDateStu.stuInfo.usersPhoto!=null}">
			<img src ="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}" width="100px" height="100px">							
		</c:when> 
		<c:otherwise>
			사진 미등록   
		</c:otherwise>
	</c:choose>	
<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">성명</td>    
		<td bgcolor="lightgray">학번</td>
		<td bgcolor="lightgray">주민번호</td>
		<td bgcolor="lightgray">이메일</td>
		<td bgcolor="lightgray">전화번호</td>
		<td bgcolor="lightgray">핸드폰번호</td>		
	</tr>
	<tr align="center">  
		<td>${requestScope.reFormDateStu.stuInfo.usersName}</td><!-- 성명 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuId}</td><!-- 학번 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersRRN}</td><!-- 주민번호 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersEmail}</td><!-- 이메일 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersPhoneNum}</td><!-- 전화번호 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersCellNum}</td><!-- 핸드폰번호 -->
	</tr>
	<tr align="center">
		<td bgcolor="lightgray">영문성명</td>
		<td bgcolor="lightgray">국적</td>
		<td colspan="2" bgcolor="lightgray">본적지</td>
		<td colspan="2" bgcolor="lightgray">현주소</td>
	</tr>
	<tr align="center">
		<td>${requestScope.reFormDateStu.stuInfo.usersEngName}</td>
		<td>${requestScope.reFormDateStu.stuInfo.usersNational}</td>
		<td colspan="2">${requestScope.reFormDateStu.stuInfo.usersBornAddr}</td>
		<td colspan="2">${requestScope.reFormDateStu.stuInfo.usersCurrentAddr}</td>
	</tr>
</table>
<p>
<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">학년</td>    
		<td bgcolor="lightgray">학기</td>
		<td bgcolor="lightgray">주전공</td>
		<td bgcolor="lightgray">부전공</td>
		<td bgcolor="lightgray">입학일자</td>
		<td bgcolor="lightgray">졸업일자</td>		
	</tr>
	<tr align="center">  
		<td>${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
		<td>${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
		<td>${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
		<td>${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
		<td>${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
	</tr>
	<tr align="center">
		<td bgcolor="lightgray">과정구분</td>
		<td bgcolor="lightgray">병영구분</td>
		<td bgcolor="lightgray">학적구분</td>
		<td bgcolor="lightgray">학생구분</td>
		<td bgcolor="lightgray">조기졸업<br>대상여부</td>
		<td bgcolor="lightgray">복수전공</td>
	</tr>
	<tr align="center">
		<td>${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
		<td>${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
		<td>${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
	</tr>
</table>
<form action="/project_mugs/student/moveUpdateForm.do" method="get">
<input type="submit" id="stuUpdateBtn" value="수정 페이지로">
<sec:csrfInput/>
</form>
</body>
</html>