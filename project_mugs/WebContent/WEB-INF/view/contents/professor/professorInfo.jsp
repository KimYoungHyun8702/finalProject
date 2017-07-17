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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var x = "";

$(document).on("click", "#updateBtn", function(){
	$.ajax({
	"success":function(){
		openchild();
	},
	"error":function(txt){	
		alert('에러발생');
		}
	});//ajax
});//document(click);  //집에서 처리

</script>

</head>

<body>
교수개인정보~~~<br>

	<c:choose>
		<c:when test="${sessionScope.professor.usersPhoto != null}">
			<img src ="${initParam.rootPath}/resource/up_image/${sessionScope.professor.usersPhoto}" id="imageSpace" width="110px" height="100px">
		</c:when>
	<c:otherwise>
			<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="110px" height="100px">
		</c:otherwise>
	</c:choose>
	
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
		<td><input type="text" id="usersId" name="usersId" value="${sessionScope.professor.usersId}" readonly="readonly"></td>
	    <input type="text" id="usersPassword" name="usersPassword" value="${sessionScope.professor.usersPassword}" readonly="readonly" style="display: none;">
		<td><input type="text" id="usersName" name="usersName" value="${sessionScope.professor.usersName}" readonly="readonly"></td>
		<td><input type="text" id="usersEngName" name="usersEngName" value="${sessionScope.professor.usersEngName}" readonly="readonly"></td>		
		<td><input type="text" id="usersRRN" name="usersRRN" value="${sessionScope.professor.usersRRN}" readonly="readonly"></td>
		<td><input type="text" name ="usersEmail" id="usersEmail" value="${sessionScope.professor.usersEmail}" readonly="readonly"></td>
		<td><input type="text" name ="usersPhoneNum" id="usersPhoneNum" value="${sessionScope.professor.usersPhoneNum}" readonly="readonly"></td>
	</tr>
	<tr align="center">
		<td bgcolor="lightgray">핸드폰번호</td>
		<td bgcolor="lightgray">국적</td>
		<td colspan="2" bgcolor="lightgray">본적지</td>
		<td colspan="2" bgcolor="lightgray">현주소</td>
	</tr>
	<tr align="center">
	    <td><input type="text" name ="usersCellNum" id="usersCellNum" value="${sessionScope.professor.usersCellNum}" readonly="readonly"></td>
		<td><input type="text" id="usersNational" name="usersNational" value="${sessionScope.professor.usersNational}" readonly="readonly"></td>
		<td colspan="2"><input type="text" id="usersBornAddr" name="usersBornAddr" value="${sessionScope.professor.usersBornAddr}"></td>
		<td colspan="2"><input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value="${sessionScope.professor.usersCurrentAddr}"></td>
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
		<td id ="proUniversity">${sessionScope.professor.proUniversity}</td>
		<td id ="proGradSchool">${sessionScope.professor.proGradSchool}</td>
		<td id ="proOfficePhoneNum">${sessionScope.professor.proOfficePhoneNum}</td>
		<td id ="proLaboratoryPhoneNum">${sessionScope.professor.proLaboratoryPhoneNum}</td>
	</tr>
</table>

	<input type="text" id="usersEnable" name="usersEnable" value="${sessionScope.professor.usersId}" style="display: none;">
	<form action="/project_mugs/professor/professorInfoUpdate.do" method="get">
	<input type="submit" id="UpdateBtn" value="수정 페이지로">
	<sec:csrfInput/>
	</form>


</body>
<script type="text/javascript">
	var openWin;
	
	function openchild(obj){
		alert("${initParam.rootPath}"+"/resource/up_image/"+"${sessionScope.professor.usersPhoto}");
		// window.name = "부모창 이름"; planId
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");          
        openWin = window.open("/project_mugs/professorInfoUpdate.do", "교수정보수정", "width=500, height=400 resizable=no");
        setTimeout(function(){
        	openWin.document.getElementById("usersId").value = document.getElementById("usersId").value;
        	openWin.document.getElementById("usersPassword").value = document.getElementById("usersPassword").value;
        	openWin.document.getElementById("usersName").value = document.getElementById("usersName").value;
        	openWin.document.getElementById("usersEngName").value = document.getElementById("usersEngName").value;
        	openWin.document.getElementById("usersRRN").value = document.getElementById("usersRRN").value;
        	openWin.document.getElementById("usersEmail").value = document.getElementById("usersEmail").value;
        	openWin.document.getElementById("usersPhoneNum").value = document.getElementById("usersPhoneNum").value;
        	openWin.document.getElementById("usersCellNum").value = document.getElementById("usersCellNum").value;
        	openWin.document.getElementById("usersNational").value = document.getElementById("usersNational").value;
        	openWin.document.getElementById("usersCurrentAddr").value = document.getElementById("usersCurrentAddr").value;
        	openWin.document.getElementById("usersBornAddr").value = document.getElementById("usersBornAddr").value;
        	openWin.document.getElementById("usersEnable").value = document.getElementById("usersEnable").value;
        	//openWin.document.getElementById("usersPhoto").value = document.getElementById("usersPhoto").value;
        	openWin.document.getElementById("proUniversity").innerText = document.getElementById("proUniversity").value;
        	openWin.document.getElementById("proGradSchool").innerText = document.getElementById("proGradSchool").value;
        	openWin.document.getElementById("proOfficePhoneNum").innerText = document.getElementById("proOfficePhoneNum").value;
        	openWin.document.getElementById("proLaboratoryPhoneNum").innerHTML = document.getElementById("proLaboratoryPhoneNum").value;  
        	openWin.document.getElementById("imageSpace").setAttribute("src","${initParam.rootPath}"+"/resource/up_image/"+"${sessionScope.professor.usersPhoto}");
        }, 1000);                
	}
</script>
</html>

