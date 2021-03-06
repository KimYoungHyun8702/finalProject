<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUGS</title>
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
	
}
th {
	bgcolor:peru;
}
td{
	padding: 5px;
	border: 1px solid black;
}
select{
	width:120px;
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
.form-controler {
	color:black;
}
h3{
	font-family:굴림체;
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
					$("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='학기' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='과목번호' disabled></th><th><input style='width:170px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input style='width:170px' type='text' class='form-control' placeholder='재수강여부' disabled></th>");
					$("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
				$.each(list, function(){
					if(this.creditGrade!='포기'){
					allCredit+=this.subject.subjectCredit;
					acquireCredit+=this.creditAcquire;
						score+=this.creditScore;
		      		 txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
			             +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.subject.recourse+"</td><tr>";
					}else{
						count-=1;
					}
					})
				if(isNaN(score/count)){
					txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
					
				}else{
					txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>";
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
			<h3>당학기 성적 조회</h3><br>
			<center><table border="2" style="border-color: black">
				<thead id="thead"></thead>
				   <tr class="filters"></tr>
				<tbody id="tbody"></tbody>
			</table></center><br><br>
			<center><table border="2" style="border-color: black">
					<thead id="thead2" style="height:30px"></thead>
					   <tr class="filters"></tr>
					<tbody id="tbody2" style="height:30px"></tbody>
				</table></center><br>
				
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
			<script>alert("${map.message}");</script>
	</c:otherwise>
	</c:choose>
<br>
 <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>