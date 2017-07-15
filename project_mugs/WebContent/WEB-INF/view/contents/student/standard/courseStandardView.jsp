<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-theme.min.css">
	<link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#college").on("change", function(){
		var index = $("#college option").index($("#college option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getMajorListByCollegeId.do",
			"type":"post",
			"data":{"collegeId":$("#college").val(), ${_csrf.parameterName}:'${_csrf.token}'},
			//"data":{"collegeId=" + $("#college").val(), "${_csrf.parameterName}="+'${_csrf.token}'},
			"dataType":"json",
			"beforeSend":function(){
				if(index == 0){
					alert("학부를 선택하세요");
					return false;
				}
			},
			"success":function(arr){
				 var text="<option>학과선택</option>";
				$.each(arr, function(){
					text += "<option value="+this.majorId+">"+this.majorName+"</option>";					
				});//end of each
				$("#major").html(text); 
			}
		});//end of ajax
	});//end of college 

	
	$("#major").on("change", function(){
		var index = $("#major option").index($("#major option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getYearListByMajorId.do",
			"type":"post",
			"data":{"majorId":$("#major").val(), ${_csrf.parameterName}:'${_csrf.token}'},
			//"data":{"majorId=" + $("#major").val(), "${_csrf.parameterName}="+'${_csrf.token}'},
			"dataType":"json",
			"beforeSend":function(){
				if(index == 0){
					alert("학과를 선택하세요");
					return false;
				}
			},
			"success":function(arr){
				 var text="<option>년도선택</option>";
				$.each(arr, function(){
					text += "<option value="+this.majorId+">"+this.standardYear+"</option>";					
				});//end of each
				$("#year").html(text); 
			}
		});//end of ajax
	});//end of major 

	
	  $("#year").on("change", function(){
	      var index = $("#year option").index($("#year option:selected"));
	      //alert($("#year option:selected").text());
	      $.ajax({
	         "url":"/project_mugs/student/getStandardValue.do",
	         "type":"post",
	         "data":({"majorId":$("#major").val(), "collegeId":$("#college").val(), "standardYear":$("#year option:selected").text(), ${_csrf.parameterName}:'${_csrf.token}'}),
	         "dataType":"json",
	         "beforeSend":function(){
	            if(index == 0){
	               alert("년도를 선택하세요");
	               return false;
	            }
	         },
	         "success":function(arr){
	            alert("조회 중 입니다. 잠시만 기다려주세요.");
					var	tableHead = "<th><input type='text' class='form-control' placeholder='최소학점' disabled></th><th><input type='text' class='form-control' placeholder='최대학점' disabled></th><th><input type='text' class='form-control' placeholder='장학금최소학점' disabled></th><th><input type='text' class='form-control' placeholder='장학금최대학점' disabled></th>"
					var tableBody = "<tr value="+arr.standardYear+"><td>"+arr.standardMinCredit+"</td><td>"+arr.standardMaxCredit+"</td><td>"+arr.standardMinScholarship+"</td><td>"+arr.standardDelayMaxCredit+"</td></tr>"
			   		$("#thead").html(tableHead);
					$("#tbody").html(tableBody);
	         }, 
	         "error":function(){
					alert("에러가 발생했습니다.");
				}   
	      });
	});
});


</script>
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
	
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}
select{
	width:150px;
	height: 35px;
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
	font-family:돋움체;
}
</style>
<title>학부당 학과당 년도별 수강신청기준학점조회페이지</title>
</head>
<body>
<h3>학부당 학과당 년도별 수강신청기준학점조회페이지</h3>
<hr style="border: solid px black">
학부선택 :
<select name="college" id="college">
	<option>학부선택</option>
<c:forEach items="${requestScope.collegeList}" var="collegeList">
	<option value="${collegeList.collegeId }">${collegeList.collegeName}</option>
</c:forEach>
</select>
학과선택 :
<select name="major" id="major">
	<option>학과선택</option>
</select>
년도선택 :
<select name="year" id="year">
	<option>년도선택</option>
</select><br><br>

<table border="1">
	<thead id="thead"></thead>
	   <tr class="filters"></tr>
	<tbody id="tbody"></tbody>
</table>

<!-- <table>
	<thead id="thead"></thead>
	<tbody id="tbody"></tbody>
</table><br><br><br><br> -->
<br>
<center><button onclick="location.href='${initParam.rootPath}/'" type="button" class="btn btn-primary">이전페이지로</button></center>
<script src="jquery-1.10.2.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>