<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta>
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/project_mugs/professor/searchByJoin.do",
			"type":"POST",
			"data":{"proId":$("#id").val()},
			"dataType":"json",
			"success":function(obj){
				alert("개인정보 조회완료");
				$("#usersId").val(obj.usersId);
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
				$("#professorRegiste").empty().append("졸업대학 : " + obj.proUniversity + "<br>"+ "졸업대학원 : " + obj.proGradSchool 
						+ "<br>"+"교수실전화번호 : " + obj.proOfficePhoneNum + "<br>");
			},
			"error":function(){
				alert("에러발생");
			}
		});
	}); 
});

</script>

</head>
<body>
교수개인정보~~~<br>

ID<input type="text" id="id" name="id">
<button type="button" id="searchBtn">검색</button>


<form action="/project_mugs/professor/updateProfile.do" method="post">

아이디<input type="text" id="usersId" name="usersId" value="" readonly="readonly"><br>
비밀번호<input type="text" id="usersPassword" name="usersPassword" value="" readonly="readonly"><br>
성명<input type="text" id="usersName" name="usersName" value="${param.userName }"><br>
영문성명<input type="text" id="usersEngName" name="usersEngName" value=""><br>
주민번호<input type="text" id="usersRRN" name="usersRRN" value=""><br>
이메일<input type="text" id="usersEmail" name="usersEmail" value=""><br>
전화번호<input type="text" id="usersPhoneNum" name="usersPhoneNum" value=""><br>
핸드폰번호<input type="text" id="usersCellNum" name="usersCellNum" value=""><br>
국적<input type="text" id="usersNational" name="usersNational" value=""><br>
현주소<input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value=""><br>
본적지<input type="text" id="usersBornAddr" name="usersBornAddr" value=""><br>
뭐더라..<input type="text" id="usersEnable" name="usersEnable" value=""><br>
사진주소<input type="text" id="usersPhoto" name="usersPhoto" value=""><br>

<button type="submit" id="updateBtn">수정</button>
</form>

<div id="professorRegiste">

</div>



</body>
</html>

