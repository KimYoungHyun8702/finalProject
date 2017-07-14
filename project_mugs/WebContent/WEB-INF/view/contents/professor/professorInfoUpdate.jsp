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
</head>
<body>

	<h1>학생정보조회</h1>
	<h3>성명, 주민번호, 학번, 학적정보 등 기존 사항은 수정할 수 없습니다.</h3>
	<p>
<form action="/project_mugs/professor/updateProfile.do" method="post">
<sec:csrfInput/>
	
	<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">교수번호</td>
		<td bgcolor="lightgray" >성명</td>
		<td bgcolor="lightgray">영문성명</td>
		<td bgcolor="lightgray">주민번호</td>
		<td bgcolor="lightgray">이메일</td>
		<td bgcolor="lightgray">집전화번호</td>		
	</tr>
	<tr align="center">  
		<td><input type="text" id="usersId" name="usersId" value="" readonly="readonly"></td>
	        <input type="text" id="usersPassword" name="usersPassword" value="" readonly="readonly" style="display: none;">
		<td><input type="text" id="usersName" name="usersName" value="" readonly="readonly"></td>
		<td><input type="text" id="usersEngName" name="usersEngName" value="" readonly="readonly"></td>
		<td><input type="text" id="usersRRN" name="usersRRN" value="" readonly="readonly"></td>
		<td><input type="text" name ="usersEmail" id="usersEmail" value="" ></td>
		<td><input type="text" name ="usersPhoneNum" id="usersPhoneNum" value=""></td>
	</tr>
	<tr align="center">
		<td bgcolor="lightgray">핸드폰번호</td>
		<td bgcolor="lightgray">국적</td>
		<td colspan="2" bgcolor="lightgray">본적지</td>
		<td colspan="2" bgcolor="lightgray">현주소</td>
	</tr>
	<tr align="center">
	    <td><input type="text" name ="usersCellNum" id="usersCellNum" value=""></td>
		<td><input type="text" id="usersNational" name="usersNational" value="" readonly="readonly"></td>
		<td colspan="2"><input type="text" id="usersBornAddr" name="usersBornAddr" value=""></td>
		<td colspan="2"><input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value=""></td>
	</tr>
</table>

<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">졸업대학교</td>    
		<td bgcolor="lightgray">졸업대학원</td>
		<td bgcolor="lightgray">교수실전화번호</td>
		<td bgcolor="lightgray">연구실전화번호</td>	
	</tr>
	<tr align="center">  
		<td id ="proUniversity"></td>
		<td id ="proGradSchool"></td>
		<td id ="proOfficePhoneNum"></td>
		<td id ="proLaboratoryPhoneNum"></td>
	</tr>
</table>
	<p>
	<table border="1" style="float: left">
		<tr>
			<td align="center">프로필 사진 변경</td>
		</tr> 
		<tr> 
			<td><input type="file" id="upImage" name ="upImage" ></td>
		</tr>
	</table>
	<br>
	<input type="text" id="usersEnable" name="usersEnable" value="" style="display: none;">
	사진주소<input type="text" id="usersPhoto" name="usersPhoto" value="">
	<button type="submit" id="updateBtn">수정</button>
</form>	










<br>


</body>
</html>