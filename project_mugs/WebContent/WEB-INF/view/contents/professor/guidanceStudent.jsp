<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/project_mugs/professor/searchList.do",
			"type":"POST",
			"data":{"proId":$("#id").val()},
			"dataType":"json",
			"success":function(obj){
				alert("�����л� ��� ��ȸ�Ϸ�");
			},
			"error":function(){
				alert("�����߻�");
			}
		});
	}); 
});

</script>
</head>
<body>
�л�����
ID<input type="text" id="id" name="id">
<button type="button" id="searchBtn">�˻�</button>

<div id="guidanceStudent">

</div>

</body>
</html>