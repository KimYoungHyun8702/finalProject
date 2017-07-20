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
	font-size: 15px;
}
table{
	width:100%;
}
td{
	padding: 5px;
	border: 1px solid black;
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
<h3>내 정보 조회</h3>
<br>
<ul><li><h4>학생 기본 정보</h4></li></ul>
<table border="2"  style="border-color: black"> 
	<colgroup>
		<col width="20%">
		<col width="20%">
		<col width="60%">
	</colgroup>
	<thead>
		<tr>
			<td style="text-align:center;" rowspan="4" style="height: 34px"><c:choose>
					<c:when
						test="${requestScope.reFormDateStu.stuInfo.usersPhoto!=null}">
						<img
							src="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}"
							width="150px" height="150px">
					</c:when>
					<c:otherwise>
						<img src="${initParam.rootPath}/resource/up_image/1.jpg"  width="150px" height="150px">
					</c:otherwise>
				</c:choose></td>
				<th><input type="text"  style="height: 40px"style="height: 40px" class="form-control" placeholder="학번" disabled></th>
				<td  style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuId}</td><!-- 학번 -->
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"style="height: 40px" class="form-control" placeholder="성명" disabled></th><!-- 성명 -->
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersName}</td>
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"style="height: 40px" class="form-control" placeholder="영문성명" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersEngName}</td>
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"style="height: 40px" class="form-control" placeholder="주민번호" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersRRN}</td><!-- 주민번호 -->
		</tr>
	</thead>
</table>
<ul><li><h4>학생 학적 정보</h4></li></ul>
<table border="2"  style="border-color: black"> 
	<colgroup>
		<col width="20%">
		<col width="30%">
		<col width="20%">
		<col width="30%">
	</colgroup>
	<thead>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="과정구분" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="병영구분" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
		</tr>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="학년" disabled></th>   
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="학기" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
		</tr>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="학적구분" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="학생구분" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
		</tr>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="조기졸업대상여부" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="입학일자" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
		</tr>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="졸업일자" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="주전공" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
		</tr>
		<tr> 
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="부전공" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="복수전공" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
		</tr>
	</thead>
</table>
<ul><li><h4>학생 카드 정보</h4></li></ul>
<table border="2"  style="border-color: black"> 
	<colgroup>
		<col width="15%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
	</colgroup>
	<thead>
		<tr>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="본적지" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px"colspan="5">${requestScope.reFormDateStu.stuInfo.usersBornAddr}</td>
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="현주소" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px"colspan="5">${requestScope.reFormDateStu.stuInfo.usersCurrentAddr}</td>
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="국적" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersNational}</td>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="전화번호" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersPhoneNum}</td><!-- 전화번호 -->
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="핸드폰번호" disabled></th>	
			<td style="height: 34px; text-align:center;font-size: 15px">${requestScope.reFormDateStu.stuInfo.usersCellNum}</td><!-- 핸드폰번호 -->
		</tr>
		<tr>
			<th><input type="text"  style="height: 40px"class="form-control" placeholder="이메일" disabled></th>
			<td style="height: 34px; text-align:center; font-size: 15px"colspan="5">${requestScope.reFormDateStu.stuInfo.usersEmail}</td><!-- 이메일 -->
		</tr>
	</thead>
</table>

<form action="/project_mugs/student/moveUpdateForm.do" method="get"><br>
<center><input type="submit" id="stuUpdateBtn" value="수정"  type="button"></center>
<sec:csrfInput/>
</form>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>