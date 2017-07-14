<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	width:700px;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	function selectCredit(){
		$.ajax({
			url:"/project_mugs/student/creditByYearSemester.do",
			type:"post",
			dataType:"json",
			data:{"year":"${map.year}", "semester":"${map.semester}", ${_csrf.parameterName}:'${_csrf.token}'},
			success:function(list){
				var txt="";
				var txt2="";
					var allCredit= 0;
					var acquireCredit=0;
					var score=0;
					var count =list.length;
					<th><input type='text' class='form-control' placeholder='최소학점' disabled></th>
				$("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강(대체)과목' disabled></th>");
				$("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
				$.each(list, function(){
					allCredit+=this.subject.subjectCredit;
					acquireCredit+=this.creditAcquire;
						score+=this.creditScore;
		      		 txt += "<tr><td>"+this.creditYear+"</td><td>"+this.creditSemester+ "</td><td>"
			             +this.subjectId+"</td><td>"+this.subject.subjectName+"</td><td>"+this.subject.subjectClass+"</td><td>"+this.subject.subjectType+"</td><td>"+this.subject.subjectCredit+"</td><td>"+this.creditGrade+"</td><td>"+this.creditScore+"</tr>";
				})
				if(isNaN(score/count)){
					txt2+="<tr><td>"+allCredit+"</td><td>"+acquireCredit+"</td><td>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
					
				}else{
					txt2+="<tr><td>"+allCredit+"</td><td>"+acquireCredit+"</td><td>"+(score/count)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>";
				}
					$("#tbody2").html(txt2);
				$("#tbody").html(txt);
			},
			error:function(){
				alert("오류발생!!");
			}
		});
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${map.message=='접근허용'}">
			<script>selectCredit();</script>
			<h3>당학기 성적조회</h3>
			<hr style="border: solid px black">
			<div class="row">
			<div class="panel panel-primary filterable">
			<table class="table">
				<thead id="thead"></thead>
				   <tr class="filters"></tr>
				<tbody id="tbody"></tbody>
			</table>
			</div>
			</div>
			<hr style="border: solid px black">
				<div class="row">
				<div class="panel panel-primary filterable">
				<table class="table2">
					<thead id="thead2"></thead>
					   <tr class="filters"></tr>
					<tbody id="tbody2"></tbody>
				</table>
				</div>
				</div>
				
			<!-- <table id="table">
				<thead id="thead"></thead>
				<tbody id="tbody"></tbody>
			</table>
			<hr>
				<table id="table2">
					<thead id="thead2"></thead>
					<tbody id="tbody2"></tbody>
				</table> -->
		</c:when>
		<c:otherwise>
			<script>alert("성적조회기간이 아닙니다!!.");</script>
	</c:otherwise>
	</c:choose>
	
</body>
</html>