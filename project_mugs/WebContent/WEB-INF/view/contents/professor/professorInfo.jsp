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
				alert("��ȸ�Ϸ�");
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
������������~~~
<form action="/project_mugs/professor/searchById.do" method="post">
ID<input type="text" id="userId" name="userId">
<button type="button" id="searchBtn">�˻�</button>
<div id="result">
</form>
���̵�<input type="text" id="id" value="" readonly="readonly"><br>
��й�ȣ<input type="text" id="usersPassword" value="" readonly="readonly"><br>
����<input type="text" id="usersName" value=""><br>
��������<input type="text" id="usersEngName" value=""><br>
�ֹι�ȣ<input type="text" id="usersRRN" value=""><br>
�̸���<input type="text" id="usersEmail" value=""><br>
��ȭ��ȣ<input type="text" id="usersPhoneNum" value=""><br>
�ڵ�����ȣ<input type="text" id="usersCellNum" value=""><br>
����<input type="text" id="usersNational" value=""><br>
���ּ�<input type="text" id="usersCurrentAddr" value=""><br>
������<input type="text" id="usersBornAddr" value=""><br>
������..<input type="text" id="usersEnable" value=""><br>
�����ּ�<input type="text" id="usersPhoto" value=""><br>
<form action="/project_mugs/professor/searchById.do" method="post">
<button type="button" id="updateBtn">����</button>
</form>

</body>
</html>

