<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/project_mugs/professor/searchById.do",
			"type":"POST",
			"data":{"userId":$("#userId").val()},
			"dataType":"json",
			"success":function(obj){
				alert("조회완료");
				$("#id").val(obj.usersId);
				$("#usersPassword").val(obj.usersPassword);
				$("#usersName").val(obj.usersName);
				$("#usersEngName").val(obj.usersEngName);
				$("#usersRRN").val(obj.usersRRN);
				$("#usersEmail").val(obj.usersEmail);
				$("#usersPhoneNum").val(obj.usersPhoneNum);
				$("#usersCellNum").val(obj.usersCellNum);
				$("#usersNational").val(obj.usersNational);
				$("#usersCurrentAddr").val(obj.usersCurrentAddr);
				$("#usersBornAddr").val(obj.usersBornAddr);
				$("#usersEnable").val(obj.usersEnable);
				$("#usersPhoto").val(obj.usersPhoto);
			}
		});	
	});
});

</script>

</head>
<body>
교수개인정보~~~
<form action="/project_mugs/professor/searchById.do" method="post">
ID<input type="text" id="userId" name="userId">
<button type="button" id="searchBtn">검색</button>
<div id="result">
</form>
아이디<input type="text" id="id" value="" readonly="readonly"><br>
비밀번호<input type="text" id="usersPassword" value="" readonly="readonly"><br>
성명<input type="text" id="usersName" value=""><br>
영문성명<input type="text" id="usersEngName" value=""><br>
주민번호<input type="text" id="usersRRN" value=""><br>
이메일<input type="text" id="usersEmail" value=""><br>
전화번호<input type="text" id="usersPhoneNum" value=""><br>
핸드폰번호<input type="text" id="usersCellNum" value=""><br>
국적<input type="text" id="usersNational" value=""><br>
현주소<input type="text" id="usersCurrentAddr" value=""><br>
본적지<input type="text" id="usersBornAddr" value=""><br>
뭐더라..<input type="text" id="usersEnable" value=""><br>
사진주소<input type="text" id="usersPhoto" value=""><br>
<form action="/project_mugs/professor/searchById.do" method="post">
<button type="button" id="updateBtn">수정</button>
</form>

</body>
</html>

