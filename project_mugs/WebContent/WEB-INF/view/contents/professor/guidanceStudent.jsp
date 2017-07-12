<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/project_mugs/professor/searchList.do",
			"type":"POST",
			"data":{"proId":$("#id").val()},
			"dataType":"json",
			"success":function(obj){
				alert("지도학생 목록 조회완료");
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
학생지도
ID<input type="text" id="id" name="id">
<button type="button" id="searchBtn">검색</button>

<div id="guidanceStudent">

</div>

</body>
</html>