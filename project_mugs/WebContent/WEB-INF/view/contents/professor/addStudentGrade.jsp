<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

var select1 = "<select class='selectBtn1'><option>F</option><option>A+</option><option>A</option><option>B+</option><option>B</option><option>C+</option><option>C</option><option>D+</option><option>D</option></select>";
var select2 = "<input class='selectInput' name='' value='0.0' size='4' readonly='readonly'>";
var select3 = "<select class='selectBtn1'><option>F</option><option>B+</option><option>B</option><option>C+</option><option>C</option><option>D+</option><option>D</option></select>";
var select4 = "<input class='selectInput' name='' value='0.0' size='4' readonly='readonly'>";

$(document).ready(function(){
	$("#table").hide();
	$("#table2").hide();
	$("#table3").hide();
	searchSubjectList();
});

var hash = {
	"A+" : "4.5",
	"A" : "4.0",
	"B+" : "3.5",
	"B" : "3.0",
	"C+" : "2.5",
	"C" : "2.0",
	"D+" : "1.5",
	"D" : "1.0",
	"F" : "0.0"		
}

var cnt = {
		"A+" : "0",
		"A" : "0",
		"B+" : "0"
}

$(document).on("change", ".selectBtn1", function(){
	var selectedVal = $(this).find("option:selected").val();
	$(this).parent().next().children().val(hash[selectedVal]);
	
/* 	$(this).$("selectBtn2").find("option:selected").val(hash[selectedVal]);
	console.log(hash[selectedVal]); */
	
});
	function searchSubjectList(){
		$.ajax({
			"url":"/project_mugs/professor/searchSubjectList.do",
			"type":"POST",
			"data":{${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"success":function(list){
				var txt = "";// undefined값
				$.each(list, function(){ 
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
		});//ajax
	}//메소드
	
	$(document).on("click", "#Btn", function(){
		
		var courseYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var courseSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var Capacity = $(this).parent().prev().text();
		var Acquire = $(this).parent().prev().prev().text();
		anotherNum(Capacity);
		$.ajax({
			"url":"/project_mugs/professor/searchCourseByThreeId.do",
			"type":"POST",
			"data":{"courseYear":courseYear,"courseSemester":courseSemester,"subjectId":subjectId,${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"success":function(list){
				stuNum(list);//리스트 숫자
				TotalNum();
				var txt = "";// undefined값
				$.each(list, function(){ // style="display: none" 적용해서  + "</td><td>" 등등 삽입해두기!!
					if(this.count=="1"){
					txt += "<tr><td>"  + "<input id='' name='' value='' size='2'>" + "</td><td>" + courseYear +"</td><td>" + courseSemester +"</td><td>" + Acquire + "</td><td id='change1'>" + select1  
						+"</td><td>" + select2 +"</td><td id='change2'>" + 'N' + "</td><td>" + subjectId + "</td><td>" + this.student.usersId + "</td><td>" + this.student.usersName 
						+ "</td><td>" + "<button id=" + "Btn2>" + "성적주기 </button>" + "</td></tr>"																		
					}else{
					txt += "<tr><td>"  + "<input id='' name='' value='' size='2'>" + "</td><td>" + courseYear +"</td><td>" + courseSemester +"</td><td>" + Acquire + "</td><td id='change1'>" + select3 
						+"</td><td>" + select4 +"</td><td id='change2'>" + 'Y' + "</td><td>" + subjectId + "</td><td>" + this.student.usersId + "</td><td>" + this.student.usersName 
						+ "</td><td>" + "<button id=" + "Btn2>" + "성적주기 </button>" + "</td></tr>"					
					}
				});//each
			$("#tbody3").html(txt);
			$("#table2").show();
			$("#table3").show();
			},//success
			"error":function(){		
				alert("등록된 학생 목록이 없습니다");
			}//error
		});//ajax
	});//click

	function stuNum(list){
		var t = list.length;
		$.ajax({			
			"success":function(){
				$("#total1").text(t);		
			}
		});//ajax
	}	
	
	function anotherNum(num){
		var t = num
		$.ajax({			
			"success":function(){
				$("#total2").text(t);		
			}
		});//ajax
		
	}	
	
	function TotalNum(){
		$.ajax({			
			"success":function(){
				var x = $("#total1").text();		
				var y = $("#total2").text();	
				
				/* alert(x); */
				var aa = x*0.2;
				var bb = x*0.2;
				var cc = x*0.3;
				
				var a = aa.toFixed(0);
				var b = bb.toFixed(0);
				var c = cc.toFixed(0);
				/* alert(aa);
				alert(a); */
				$("#total3").text(a);
				$("#total4").text(b);
				$("#total5").text(c);
				$("#total6").text(x-a-b-c);
			}
		});
	}
	
	$(document).on("click", "#Btn2", function(){		
		var creditId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().val();
		var creditYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var creditSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var creditAcquire = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var creditGrade = $(this).parent().prev().prev().prev().prev().prev().prev().children().val();
		var creditScore = $(this).parent().prev().prev().prev().prev().prev().children().val();
		var creditRecource = $(this).parent().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().text();
		var stuId = $(this).parent().prev().prev().text();

		$.ajax({
			"url":"/project_mugs/professor/registerCredit.do",
			"type":"POST",
			"data":{"creditId":creditId,"creditYear":creditYear,"creditSemester":creditSemester,
				    "creditAcquire":creditAcquire,"creditGrade":creditGrade,"creditScore":creditScore,
				    "creditRecource":creditRecource,"subjectId":subjectId,"stuId":stuId,
				    ${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"success":function(list){
				alert("성공");
			},//success
			"error":function(){		
				alert("이미 등록되었습니다.");
			}//error
		});//ajax

	
	});//click 
	
	
</script>
</head>
<body>

<h3>성적주기</h3>
<hr style="border: solid px black;">
<div class="panel panel-primary filterable">

	<table id="table" border="1">
	<thead>
		<tr>
			<th><input type="text" class="form-control" placeholder="연도" disabled></th>
			<th><input type="text" class="form-control" placeholder="학기" disabled></th>
			<th><input type="text" class="form-control" placeholder="교수번호" disabled></th>
			<th><input type="text" class="form-control" placeholder="과목번호" disabled></th>
			<th><input type="text" class="form-control" placeholder="과목명" disabled></th>
			<th><input type="text" class="form-control" placeholder="강의시간" disabled></th>
			<th><input type="text" class="form-control" placeholder="이수구분" disabled></th>
			<th><input type="text" class="form-control" placeholder="학년" disabled></th>
			<th><input type="text" class="form-control" placeholder="학점" disabled></th>
			<th><input type="text" class="form-control" placeholder="정원" disabled></th>
			
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
			
			<th><input type="text" class="form-control" placeholder="학생리스트보기" disabled></th>
		</tr>
	</thead>
	<tbody id="tbody"></tbody>			
</table><br>


<hr style="border: solid px black;">
<div class="panel panel-primary filterable">

	<table id="table2" border="1">

	<thead>
		<tr>
			<th><input type="text" class="form-control" placeholder="총학생수" disabled></th>
			<th><input type="text" class="form-control" placeholder="정원" disabled></th>
			<th><input type="text" class="form-control" placeholder="A가능수" disabled></th>
			<th><input type="text" class="form-control" placeholder="B가능수" disabled></th>
			<th><input type="text" class="form-control" placeholder="C가능수" disabled></th>
			<th><input type="text" class="form-control" placeholder="D가능수" disabled></th>
		</tr>
		
		<tr>
			<td id="total1"></td> 
			<td id="total2"></td> 
			<td id="total3"></td> 
			<td id="total4"></td> 
			<td id="total5"></td> 
			<td id="total6"></td> 
		</tr>
	</thead>
	<tbody id="tbody2"></tbody>			
</table><br>

<hr style="border: solid px black;">
<div class="panel panel-primary filterable">

	<table id="table3" border="1">
	<thead>
		<tr>
			<th><input type="text" class="form-control" placeholder="시퀀스(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="연도(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="학기(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="취득학점(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="등급(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="학점(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="재수강여부(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="과목ID(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="학생ID(c)" disabled></th>
			<th><input type="text" class="form-control" placeholder="학생성명" disabled></th>
			<th><input type="text" class="form-control" placeholder="성적주기" disabled></th>
		</tr>
	</thead>
	<tbody id="tbody3"></tbody>	
</table><br><br><br><br><br>
</body>
</html>