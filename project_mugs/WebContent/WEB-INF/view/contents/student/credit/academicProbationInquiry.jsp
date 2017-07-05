<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		selectProbation();
	});
	
	function selectProbation(){
		$.ajax({
			url:"/project_mugs/student/academicProbationInquiry.do",
			type:"post",
			dataType:"json",
			data:{"id":"사용자1"},
			success:function(list){
				var txt="";
				var count=0;
				$("#thead").html("<tr><td>년도</td><td>학기</td><td>평점평균</td><td>학사경고횟수</td></tr>");
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
<h2>학사경고 내역</h2>
<hr>
	<table id="table">
		<thead id="thead"></thead>
		<tbody id="tbody"></tbody>
	</table>
<h2 id="warning"></h2>	
</body>
</html>