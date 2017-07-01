<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0"/>

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#subjectType").change(function() {
		var index = $("#subjectType option").index($("#subjectType option:selected"));
		$.ajax({
			"url":"/project_mugs/student/college.do",
			"type":"post",
			"dataType":"json",
			"beforeSend":function(){
				if(index == 0) {
					alert("이수구분을 선택하세요.");
					var txt = "<option>선택하세요.</option>"
					$("#college").html(txt);
					$("#major").html(txt);
					//$("#product_info_layer").hide();
					//$("#thead").empty();
					//$("#tbody").empty();
					return false;
				}
			},
			"success":function(list) {
				var txt = "<option>선택하세요.</option>";
				$.each(list, function(){
					txt += "<option value=" + this.collegeId + ">" + this.collegeName + "</option>";
				});
				$("#college").html(txt);
			},
		});
	});
	
	$("#college").change(function() {
		var index = $("#college option").index($("#college option:selected"));
		$.ajax({
			"url":"/project_mugs/student/major.do",
			"type":"post",
			"data":"collegeId=" + $("#college").val(),
			"dataType":"json",
			"beforeSend":function() {
				if(index == 0) {
					alert("단과대학을 선택하세요.");
					var txt = "<option>선택하세요.</option>"
					$("#major").html(txt);
					return false;
				}
			},
			"success":function(list) {
				var txt = "<option>선택하세요.</option>";
				$.each(list, function(){
					txt += "<option value=" + this.majorId + ">" + this.majorName + "</option>";
				});
				$("#major").html(txt);
			},
		});
	});
	
	$("#major").change(function() {
		var index = $("major option").index($("#major option:selected"));
		var now = new Date();
		var nowYear = now.getFullYear();
		var nowMonth = now.getMonth();
		var nowDate = now.getDate();
		$.ajax({
			"url":"/project_mugs/student/???.do",
			"type":"post",
			"dataType":"json",
			"data":"" + ,
			"beforeSend":function() {
				
			},
			"success":function() {
				
			},
		});
	});
});
</script>
</head>
<body>
이수구분 : 
<select name="subjectType" id="subjectType" >
<option>선택하세요.</option>
	<c:forEach items="${requestScope.subjectTypeList }" var="subjectType">
		<option value="${subjectType }">${subjectType }</option>
	</c:forEach>
</select>

단과대학 : 
<select id="college">
	<option>선택하세요.</option>
</select>

학과 : 
<select id="major">
	<option>선택하세요.</option>
</select>

</body>
</html>