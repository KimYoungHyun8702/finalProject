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
	$("#table").hide();
	$("#searchBtn").on("click", function(){
		$.ajax({
			"url":"/project_mugs/professor/searchSubjectList.do",
			"type":"POST",
			"data":{"proId":$("#id").val()},
			"dataType":"json",
			"success":function(list){
				var txt = "";// undefined값
				$.each(list, function(){ // style="display: none" 적용해서  + "</td><td>" 등등 삽입해두기!!
					txt += "<tr><td>" + this.proSubjectYear + "</td><td>" + this.proSubjectSemester + "</td><td>" + this.proId + "</td><td>" + this.subject.subjectId
					+ "</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.subjectType
					+ "</td><td>" + this.subject.subjectGrade + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectCapacity 
					+ "</td><td>" + "<button id=" + "Btn>" + "학생리스트 보기 </button>" + "</td></tr>"
				});
				$("#tbody").html(txt);
				$("#table").show();
			},
			"error":function(){
				alert("에러발생");				
			}
		});
	});
	
	$(document).on("click", "#Btn", function(){
		
		var planYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var planSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		
		$.ajax({
			"url":"/project_mugs/professor/searchCourseByThreeId.do",
			"type":"POST",
			"data":{"courseYear":planYear, "courseSemester":planSemester, "subjectId":subjectId},
			"dataType":"json",
			"success":function(list){
				var txt = "";// undefined값
				$.each(list, function(){ // style="display: none" 적용해서  + "</td><td>" 등등 삽입해두기!!
					txt += "<tr><td>" + this.student.usersId +"</td><td>" + this.student.usersName +"</td><td>" + "<button id=" + "Btn2>" + "성적주기 </button>" + "</td></tr>"
				});
				$("#tfoot").html(txt);
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
<h2>성적주기</h2>

ID<input type="text" id="id" name="id">
<button type="button" id="searchBtn">검색</button>

<table id="table" border="1">
	<thead>
		<tr>
			<td>연도</td>
			<td>학기</td>
			<td>교수번호</td>
			<td>과목번호</td>
			<td>과목명</td>
			<td>강의시간</td>
			<td>이수구분</td>
			<td>학년</td>
			<td>학점</td>
			<td>정원</td>
			
			<td style="display: none">연도</td>
			<td style="display: none">학기</td>
			<td style="display: none">과목번호</td>
			<td style="display: none">과목명</td>
			<td style="display: none">이수구분</td>
			<td style="display: none">학년</td>
			<td style="display: none">학점</td>
			<td style="display: none">강의시간</td>
			<td style="display: none">교수ID</td>
			<td style="display: none">교수명</td>
			<td style="display: none">영문이름</td>
			<td style="display: none">핸드폰</td>
			<td style="display: none">이메일</td>
			
			<td>학생리스트 보기</td>
		</tr>
	</thead>
	<tbody id="tbody"></tbody>		
	<tfoot id="tfoot"></tfoot>	
</table>
</body>
</html>