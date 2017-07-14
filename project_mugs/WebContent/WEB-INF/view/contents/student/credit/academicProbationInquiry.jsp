<%@ page contentType="text/html;charset=UTF-8"%>
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
	$(document).ready(function(){
		selectProbation();
	});
	
	function selectProbation(){
		$.ajax({
			url:"/project_mugs/student/academicProbationInquiry.do",
			type:"GET",
			dataType:"json",
			data:{${_csrf.parameterName}:'${_csrf.token}'},
			success:function(list){
				var txt="";
				var count=0;
				$("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th><th><input type='text' class='form-control' placeholder='학사경고횟수' disabled></th>");
				$.each(list, function(){
					count++;
		      		 txt += "<tr><td>"+this.probationYear+"</td><td>"+this.probationSemester+"</td><td>"
			             +this.probationCreditAverage+"</td><td>"+count+"</tr>";
			             
				})
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
<h3>학사경고 내역</h3>
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
<h2 id="warning"></h2>	
</body>
</html>