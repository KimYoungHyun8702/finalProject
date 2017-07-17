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
<style type="text/css">
table{
	width:100%;
	border-collapse: collapse;
}
td{
	padding: 5px;
	text-align:center;
	border: 1px solid black;
}
th, input{
	text-align:center;
}
h3{
	font-family:돋움체;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#showUpdateImg").hide();
})

function deleteImg(){		
		$("#imageSpace").html('<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="138px" height="100px">');		
} 
  
function showUpImg(){
		$("#showUpdateImg").toggle();
};

/* function check(){
    if($("#usersEmail").val() == "" || $("#usersEmail").val().trim() == 0){
       alert("이메일을 입력하세요")
       return false;
    }else if($("#usersPhoneNum").val() == "" || $("#usersPhoneNum").val().trim() == 0){
       alert("집 전화번호를 입력하세요")
       return false;
    }else if($("#usersCellNum").val() == "" || $("#usersCellNum").val().trim() == 0){
       alert("핸드폰 번호를 입력하세요")
       return false;
    }else if($("#usersCurrentAddr").val() == "" || $("#usersCurrentAddr").val().trim() == 0){
       alert("현 거주지 주소를 입력하세요")
       return false;
    }else if($("#usersBornAddr").val() == "" || $("#usersBornAddr").val().trim() == 0){
       alert("본적지 주소를 입력하세요")
       return false;
    }else{
       
       
    	return confirm("등록하시겠습니까 ?")
    }
 }; */

</script>
</head>
<body>
<%-- ${initParam.rootPath}/resource/up_image/1.jpg --%>
	<h1>학생정보조회</h1>
	<h3>성명, 주민번호, 학번, 학적정보 등 기존 사항은 수정할 수 없습니다.</h3>
	<p>

	<center><table border="1" style="width:600px"s>
	<tr> 		
		<td id="imageSpace">
		<c:choose>
		<c:when test="${sessionScope.professor.usersPhoto != null}">
			<img src ="${initParam.rootPath}/resource/up_image/${sessionScope.professor.usersPhoto}" id="imageSpace" width="138px" height="100px">
		</c:when>
		<c:otherwise>
			<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="138px" height="100px">
		</c:otherwise>
		</c:choose>
		</td>								
	</tr>  
	<tr>
		<td><input type="button" value="이미지변경 " id="updateImg" onclick="showUpImg();">
			<input type="button" value="삭제" onclick="deleteImg();"></td> 
	</tr> 
	</table></center>
<br><br>
<form action="/project_mugs/professor/updateProfile.do" method="post">
<sec:csrfInput/>
	
	<center><table border="1" style="width:500px"> 
	<tr align="center"> 
		<th><input type="text" class="form-control" placeholder="교수번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="성명" disabled></th>
		<th><input type="text" class="form-control" placeholder="영문성명" disabled></th>
		<th><input type="text" class="form-control" placeholder="주민번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="이메일" disabled></th>
		<th><input type="text" class="form-control" placeholder="집 전화번호" disabled></th>
	</tr>
	<tr align="center">  
		<td><input type="text" id="usersId" name="usersId" value="${sessionScope.professor.usersId}" readonly="readonly"></td>
	   <%--  <input type="text" id="usersPassword" name="usersPassword" value="${sessionScope.professor.usersPassword}" readonly="readonly" style="display: none;"> --%>
		<td><input type="text" id="usersName" name="usersName" value="${sessionScope.professor.usersName}" readonly="readonly"></td>
		<td><input type="text" id="usersEngName" name="usersEngName" value="${sessionScope.professor.usersEngName}" readonly="readonly"></td>		
		<td><input type="text" id="usersRRN" name="usersRRN" value="${sessionScope.professor.usersRRN}" readonly="readonly"></td>
		<td><input type="text" name ="usersEmail" id="usersEmail" value="${sessionScope.professor.usersEmail}" readonly="readonly"></td>
		<td><input type="text" name ="usersPhoneNum" id="usersPhoneNum" value="${sessionScope.professor.usersPhoneNum}" readonly="readonly"></td>
	</tr>
	<tr align="center">
		<th><input type="text" class="form-control" placeholder="핸드폰번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="국적" disabled></th>
		<th colspan='2'><input type="text" class="form-control" placeholder="본적지" disabled></th>
		<th colspan='2'><input type="text" class="form-control" placeholder="현주소" disabled></th>
	</tr>
	<tr align="center">
	    <td><input type="text" name ="usersCellNum" id="usersCellNum" value="${sessionScope.professor.usersCellNum}" readonly="readonly"></td>
		<td><input type="text" id="usersNational" name="usersNational" value="${sessionScope.professor.usersNational}" readonly="readonly"></td>
		<td colspan="2"><input type="text" id="usersBornAddr" name="usersBornAddr" value="${sessionScope.professor.usersBornAddr}"></td>
		<td colspan="2"><input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value="${sessionScope.professor.usersCurrentAddr}"></td>
	
	</tr>
</table></center>
<br><br>
<center><table border="1" style="width: 600px; border-color: black" style="width:600px"> 
	<tr align="center"> 
		<th><input type="text" class="form-control" placeholder="졸업대학교" disabled></th>
		<th><input type="text" class="form-control" placeholder="졸업대학원" disabled></th>
		<th><input type="text" class="form-control" placeholder="교수실전화번호" disabled></th>
		<th><input type="text" class="form-control" placeholder="연구실전화번호" disabled></th>	
	</tr>
	<tr align="center">  
	<td id ="proUniversity">${sessionScope.professor.proUniversity}</td>
		<td id ="proGradSchool">${sessionScope.professor.proGradSchool}</td>
		<td id ="proOfficePhoneNum">${sessionScope.professor.proOfficePhoneNum}</td>
		<td id ="proLaboratoryPhoneNum">${sessionScope.professor.proLaboratoryPhoneNum}</td>
	</tr>
</table></center>
    <input type="text" id="usersEnable" name="usersEnable" value="${sessionScope.professor.usersId}" style="display: none;">
	<%-- <input type="text" id="usersPhoto" name="usersPhoto" value="${sessionScope.professor.usersPhoto}" style="display: none;"> --%>

	
	<center><table border="1" id="showUpdateImg" style="width:600px">
		<tr>
			<td align="center">프로필 사진 변경</td>
		</tr> 
		<tr> 
			<td><input type="file" id="usersPhoto" name="usersPhoto"></td>
		</tr>
	</table></center>
	<br>
	<input type="hidden" name="usersPassword" value="${sessionScope.professor.usersPassword}">
	<center><button type="submit" id="updateBtn">수정</button></center>
</form>	










<br>


</body>
</html>