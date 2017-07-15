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
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}
select{
	width:150px;
	height: 35px;
	padding: 5px;
}
#product_info_layer{
	width:700px;
	border: 1px solid gray;
	padding:5px;
	display: none;/*최초 로딩시에는 안보이도록 처리*/
}
#tbody{
	cursor: pointer;
}
h3{
	font-family:돋움체;
}
input {
	font-color:black;
}
</style>
</head>
<body>
<h3>학생정보조회</h3>
<hr style="border: solid px black">
	<p>
	
	<c:choose>
		<c:when test="${requestScope.reFormDateStu.stuInfo.usersPhoto!=null}">
			<img src ="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}" width="100px" height="100px">							
		</c:when> 
		<c:otherwise>
			사진 미등록   
		</c:otherwise>
	</c:choose>	
	
<table border="2"  style="border-color: black" class="table1"> 
	<tr align="center" class="filters"> 
		<th><input type="text" class="form-control" placeholder="성명" disabled></th>
		<th><input type="text" class="form-control" placeholder="학번" disabled></th>
		<th><input type="text" class="form-control" placeholder="주민번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="이메일" disabled></th>
		<th><input type="text" class="form-control" placeholder="전화번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="핸드폰번호" disabled></th>	
	</tr>
	<tr align="center" class="filters">  
		<td>${requestScope.reFormDateStu.stuInfo.usersName}</td><!-- 성명 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuId}</td><!-- 학번 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersRRN}</td><!-- 주민번호 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersEmail}</td><!-- 이메일 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersPhoneNum}</td><!-- 전화번호 -->
		<td>${requestScope.reFormDateStu.stuInfo.usersCellNum}</td><!-- 핸드폰번호 -->
	</tr>
	<tr align="center" class="filters">
		<th><input type="text" class="form-control" placeholder="영문성명" disabled></th>
		<th><input type="text" class="form-control" placeholder="국적" disabled></th>
		<th colspan="2"><input type="text" class="form-control" placeholder="본적지" disabled></th>
		<th colspan="2"><input type="text" class="form-control" placeholder="현주소" disabled></th>
	</tr>
	<tr align="center" class="filters">
		<td>${requestScope.reFormDateStu.stuInfo.usersEngName}</td>
		<td>${requestScope.reFormDateStu.stuInfo.usersNational}</td>
		<td colspan="2">${requestScope.reFormDateStu.stuInfo.usersBornAddr}</td>
		<td colspan="2">${requestScope.reFormDateStu.stuInfo.usersCurrentAddr}</td>
	</tr>
</table>
<p>
<table border="2" style="border-color: black" class="table2"> 
	<tr align="center" class="filters"> 
		<th><input type="text" class="form-control" placeholder="학년" disabled></th>   
		<th><input type="text" class="form-control" placeholder="학기" disabled></th>
		<th><input type="text" class="form-control" placeholder="주전공" disabled></th>
		<th><input type="text" class="form-control" placeholder="부전공" disabled></th>
		<th><input type="text" class="form-control" placeholder="입학일자" disabled></th>
		<th><input type="text" class="form-control" placeholder="졸업일자" disabled></th>
	</tr>
	<tr align="center" class="filters">  
		<td>${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
		<td>${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
		<td>${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
		<td>${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
		<td>${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
	</tr>
	<tr align="center" class="filters">
		<th><input type="text" class="form-control" placeholder="과정구분" disabled></th>
		<th><input type="text" class="form-control" placeholder="병영구분" disabled></th>
		<th><input type="text" class="form-control" placeholder="학적구분" disabled></th>
		<th><input type="text" class="form-control" placeholder="학생구분" disabled></th>
		<th><input type="text" class="form-control" placeholder="조기졸업대상여부" disabled></th>
		<th><input type="text" class="form-control" placeholder="복수전공" disabled></th>
	</tr>
	<tr align="center" class="filters">
		<td>${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
		<td>${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
		<td>${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
	</tr>
</table>
<br>
<form action="/project_mugs/student/moveUpdateForm.do" method="get"><br>
<center><input type="submit" id="stuUpdateBtn" value="수정 페이지로"  type="button" class="btn btn-primary"></center>
<sec:csrfInput/>
</form>
</body>
</html>