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
	font-size: 15;
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
	height: 30px;
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
	font-family:굴림체;
}
</style>
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
<h3>교수 개인정보 조회</h3>

<br>
<ul><li><h4>교수 기본 정보</h4></li></ul>	
	<table border="2">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="60%">
		</colgroup>
		<thead>
			<tr>
				<td rowspan="4" style="height: 34px" align="center"><c:choose>
														<c:when test="${sessionScope.professor.usersPhoto != null}">
																<img src ="${initParam.rootPath}/resource/up_image/${sessionScope.professor.usersPhoto}" id="imageSpace" width="150px" height="150px">
															</c:when>
														<c:otherwise>
																<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="150px" height="150px">
															</c:otherwise>
														</c:choose></td>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="교수번호" disabled></th>
				<td align="center" style="height: 34px"><input style="border: 0" type="text" id="usersId" name="usersId" value="${sessionScope.professor.usersId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="성명" disabled></th>
				<td align="center" style="height: 34px"><input style="border: 0" type="text" id="usersName" name="usersName" value="${sessionScope.professor.usersName}" readonly="readonly"></td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="영문성명" disabled></th>
				<td align="center" style="height: 34px"><input style="border: 0" type="text" id="usersEngName" name="usersEngName" value="${sessionScope.professor.usersEngName}" readonly="readonly"></td>	
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="주민번호" disabled></th>
				<td align="center" style="height: 34px"><input style="border: 0" type="text" id="usersRRN" name="usersRRN" value="${sessionScope.professor.usersRRN}" readonly="readonly"></td>
			</tr>
		</thead>
	</table>
<ul><li><h4>교수 학적 정보</h4></li></ul>
	<table border="2">
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="졸업대학교" disabled></th>
				<td align="center" style="height: 34px" id ="proUniversity">${sessionScope.professor.proUniversity}</td>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="졸업대학원" disabled></th>
				<td align="center" style="height: 34px" id ="proGradSchool">${sessionScope.professor.proGradSchool}</td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="교수실전화번호" disabled></th>
				<td align="center" style="height: 34px" id ="proOfficePhoneNum">${sessionScope.professor.proOfficePhoneNum}</td>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="연구실전화번호" disabled></th>	
				<td align="center" style="height: 34px" id ="proLaboratoryPhoneNum">${sessionScope.professor.proLaboratoryPhoneNum}</td>
			</tr>
		</thead>
	</table>
<ul><li><h4>교수 카드 정보</h4></li></ul>
	<table border="2">
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
				<th><input type="text" style="height: 40px" class="form-control" placeholder="본적지" disabled></th>
				<td align="center" style="height: 34px" colspan="5"><input type="text" style="border: 0;width: 500px" id="usersBornAddr" name="usersBornAddr" value="${sessionScope.professor.usersBornAddr}"></td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="현주소" disabled></th>
				<td align="center" style="height: 34px" colspan="5"><input type="text" id="usersCurrentAddr" style="border: 0;width: 500px" name="usersCurrentAddr" value="${sessionScope.professor.usersCurrentAddr}"></td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="국적" disabled></th>
				<td align="center" style="height: 34px"><input type="text" id="usersNational" style="border: 0" name="usersNational" value="${sessionScope.professor.usersNational}" readonly="readonly"></td>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="집 전화번호" disabled></th>
				<td align="center" style="height: 34px"><input type="text" name ="usersPhoneNum" style="border: 0" id="usersPhoneNum" value="${sessionScope.professor.usersPhoneNum}" readonly="readonly"></td>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="핸드폰번호" disabled></th>
			    <td align="center" style="height: 34px"><input type="text" name ="usersCellNum" style="border: 0" id="usersCellNum" value="${sessionScope.professor.usersCellNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<th><input type="text" style="height: 40px" class="form-control" placeholder="이메일" disabled></th>
				<td align="center" style="height: 34px" colspan="5"><input type="text" name ="usersEmail" style="border: 0;width: 500px" id="usersEmail" value="${sessionScope.professor.usersEmail}" readonly="readonly"></td>
			</tr>
		</thead>
	</table>
	<input type="hidden" id="usersEnable" name="usersEnable" value="${sessionScope.professor.usersId}" readonly>

	<form action="/project_mugs/professor/professorInfoUpdate.do" method="get"><br>
	<center><input type="submit" id="UpdateBtn" value="수정"></center>
	<sec:csrfInput/>
	</form>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
<!-- <script type="text/javascript">
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
</script> -->
</html>

