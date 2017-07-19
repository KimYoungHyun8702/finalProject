<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<style type="text/css">
table{
	width:100%;
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
h3, body{
	font-family:돋움체;
}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#table").hide();
	searchSubjectListById();
});	
	function searchSubjectListById(){
		$.ajax({
			"url":"/project_mugs/professor/searchSubjectListById.do",
			"type":"POST",
			"data":{${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"success":function(list){
				var txt = "";// undefined값
				$.each(list, function(){ // style="display: none" 적용해서  + "</td><td>" 등등 삽입해두기!!
					txt += "<tr><td>" + this.proSubjectYear + "</td><td>" + this.proSubjectSemester + "</td><td>" + this.proId + "</td><td>" + this.subject.subjectId
					+ "</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.subjectType
					+ "</td><td>" + this.subject.subjectGrade + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectCapacity 
					// style="display: none" 처리하는 부분
					+ "</td><td style='display: none'>" + this.proSubjectYear + "</td><td style='display: none'>" + this.proSubjectSemester + "</td><td style='display: none'>" + this.subject.subjectId + "</td><td style='display: none'>" + this.subject.subjectName
					+ "</td><td style='display: none'>" + this.subject.subjectType + "</td><td style='display: none'>" + this.subject.subjectGrade + "</td><td style='display: none'>" + this.subject.subjectCredit
					+ "</td><td style='display: none'>" + this.subject.subjectTime + "</td><td style='display: none'>" + this.professor.usersId + "</td><td style='display: none'>" + this.professor.usersName 
					+ "</td><td style='display: none'>" + this.professor.usersEngName + "</td><td style='display: none'>" + this.professor.usersCellNum + "</td><td style='display: none'>" + this.professor.usersEmail 
					+ "</td><td>" + "<button class=" + "Btn>" + "강의계획서조회 </button>" + "</td><td>" + "<button class=" + "Btn3>" + "강의계획서수정 </button>"+"</td><td>" + "<button class=" + "Btn2 style='display: none'>" + "강의계획서등록 </button>"+ "</td></tr>"	
				});
				$("#tbody").html(txt);
				$("#table").show();
			},
			"error":function(){
				alert("에러발생");	
			}
		});//ajax
	}//function(메소드)

	
$(document).on("click", ".Btn", function(){
	var $this = $(this);
	
		var planYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var planSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var proId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		$.ajax({
		"url":"/project_mugs/professor/searchSubjectPlanByFourId.do",
		"type":"POST",
		"data":{"planYear":planYear, "planSemester":planSemester, "subjectId":subjectId, "proId":proId, ${_csrf.parameterName}:"${_csrf.token}"},
		"dataType":"json",
		"success":function(obj){
			alert('성공')
			openchild(obj);
		},
		"error":function(txt){	
			alert('등록된 강의계획서가 없습니다');
			$this.parent().next().next().children().css("display", "inline");
		}
	});//ajax
});//document(click);

$(document).on("click", ".Btn3", function(){
	var $this = $(this);
	
		var planYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var planSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var proId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		$.ajax({
		"url":"/project_mugs/professor/searchSubjectPlanByFourId.do",
		"type":"POST",
		"data":{"planYear":planYear, "planSemester":planSemester, "subjectId":subjectId, "proId":proId, ${_csrf.parameterName}:"${_csrf.token}"},
		"dataType":"json",
		"success":function(obj){
			alert('성공')
			openchild3(obj);
		},
		"error":function(txt){	
			alert('등록된 강의계획서가 없습니다');
		}
	});//ajax
});//document(click);
</script>

</head>
<body>
<h3>강의계획서~안뇽안뇽</h3>
 <hr style="border: solid px black;">


	<table border="2" style="border-color: black">
	<thead id="thead">
		<tr class="filters">
		<tr>
			<th style="width:10px"><input style="width:50px" type="text" placeholder="연도" disabled></th>
			<th style="width:50px"><input style="width:50px" type="text" width="30px" placeholder="학기" disabled></th>
			<th style="width:50px"><input style="width:70px" type="text"  placeholder="교수번호" disabled></th>
			<th style="width:50px"><input style="width:60px" type="text"  placeholder="과목번호" disabled></th>
			<th style="width:50px"><input style="width:150px" type="text"  placeholder="과목명" disabled></th>
			<th style="width:50px"><input style="width:130px" type="text"  placeholder="강의시간" disabled></th>
			<th style="width:50px"><input style="width:80px" type="text"  placeholder="이수구분" disabled></th>
			<th style="width:10px"><input style="width:50px" type="text"  placeholder="학년" disabled></th>
			<th style="width:10px"><input style="width:50px" type="text"  placeholder="학점" disabled></th>
			<th style="width:50px"><input style="width:50px" type="text"  placeholder="정원" disabled></th>
			
			
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
			
			<th width="120px"><input style="width:120px" type="text"  placeholder="강의계획서" disabled></th>
			<th width="120px"><input style="width:120px" type="text"  placeholder="강의계획서 수정" disabled></th>
			<th width="120px"><input style="width:120px" type="text"  placeholder="강의계획서 등록" disabled></th>
		</tr>
	</thead>
	<tbody id="tbody"></tbody>			
</table>
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
<script type="text/javascript">
	var openWin;
	
	function openchild(obj){
		// window.name = "부모창 이름"; planId
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");          
        openWin = window.open("/project_mugs/SubjectPlan_success.do", "강의계획서조회", "width=500, height=400 resizable=no");
        
        setTimeout(function(){
        	openWin.document.getElementById("planId").value = obj.planId;
        	openWin.document.getElementById("planId2").value = obj.planId;
        	openWin.document.getElementById("planYear").value = obj.planYear;
        	openWin.document.getElementById("planSemester").value = obj.planSemester;
        	openWin.document.getElementById("planSummary").value = obj.planSummary;
        	openWin.document.getElementById("planLessonGoal").value = obj.planLessonGoal;
        	openWin.document.getElementById("planWeekContent").value = obj.planWeekContent;
        	openWin.document.getElementById("planMarkingMethod").value = obj.planMarkingMethod;
        	openWin.document.getElementById("planBookinfo").value = obj.planBookinfo;
        	openWin.document.getElementById("planBibliography").value = obj.planBibliography;
        	openWin.document.getElementById("planNote").value = obj.planNote;
        	openWin.document.getElementById("subjectId").value = obj.subject.subjectId;
        	openWin.document.getElementById("subjectName").value = obj.subject.subjectName;
        	openWin.document.getElementById("subjectName1").value = obj.subject.subjectName;
        	openWin.document.getElementById("subjectType").value = obj.subject.subjectType;
        	openWin.document.getElementById("subjectGrade").value = obj.subject.subjectGrade;
        	openWin.document.getElementById("subjectCredit").value = obj.subject.subjectCredit;
        	openWin.document.getElementById("subjectTime").value = obj.subject.subjectTime;
        	openWin.document.getElementById("proId").value = obj.professor.proId;
        	openWin.document.getElementById("proRoomOfficeId").value = obj.professor.proRoomOfficeId;
        	openWin.document.getElementById("usersName").value = obj.professor.usersName;
        	openWin.document.getElementById("usersEngName").value = obj.professor.usersEngName;
        	openWin.document.getElementById("usersEmail").value = obj.professor.usersEmail;
        	openWin.document.getElementById("usersCellNum").value = obj.professor.usersCellNum;
        	openWin.document.getElementById("usersNational").value = obj.professor.usersNational;
        }, 2000);                
	}
	
	$(document).on("click", ".Btn2", function openchild2(){
		var proSubjectYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var proSubjectSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectName = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectType = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectGrade = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectCredit = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectTime = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var usersId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var usersName = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var usersEngName = $(this).parent().prev().prev().prev().prev().prev().text();
		var usersCellNum = $(this).parent().prev().prev().prev().prev().text();
		var usersEmail = $(this).parent().prev().prev().prev().text();
		window.name = "parentForm";
		openWin = window.open("/project_mugs/SubjectPlan_insert.do", "강의계획서등록", "width=700, height=500 resizable=no");
		setTimeout(function() {
			openWin.document.getElementById("planYear").value = proSubjectYear
			openWin.document.getElementById("planSemester").value = proSubjectSemester
			openWin.document.getElementById("subjectId").value = subjectId
			openWin.document.getElementById("subjectName").value = subjectName
			openWin.document.getElementById("subjectName1").value = subjectName
			openWin.document.getElementById("subjectType").value = subjectType
			openWin.document.getElementById("subjectGrade").value = subjectGrade
			openWin.document.getElementById("subjectCredit").value = subjectCredit
			openWin.document.getElementById("subjectTime").value = subjectTime
			openWin.document.getElementById("proId").value = usersId
			openWin.document.getElementById("usersName").value = usersName
			openWin.document.getElementById("usersEngName").value = usersEngName
			openWin.document.getElementById("usersCellNum").value = usersCellNum
			openWin.document.getElementById("usersEmail").value = usersEmail
         }, 1000);               
	});
	
	function openchild3(obj){
		// window.name = "부모창 이름"; planId
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");          
        openWin = window.open("/project_mugs/SubjectPlan_update.do", "강의계획서수정", "width=500, height=400 resizable=no");
        
        setTimeout(function(){
        	openWin.document.getElementById("planId").value = obj.planId;
        	openWin.document.getElementById("planId2").value = obj.planId;
        	openWin.document.getElementById("planYear").value = obj.planYear;
        	openWin.document.getElementById("planSemester").value = obj.planSemester;
        	openWin.document.getElementById("planSummary").value = obj.planSummary;
        	openWin.document.getElementById("planLessonGoal").value = obj.planLessonGoal;
        	openWin.document.getElementById("planWeekContent").value = obj.planWeekContent;
        	openWin.document.getElementById("planMarkingMethod").value = obj.planMarkingMethod;
        	openWin.document.getElementById("planBookinfo").value = obj.planBookinfo;
        	openWin.document.getElementById("planBibliography").value = obj.planBibliography;
        	openWin.document.getElementById("planNote").value = obj.planNote;
        	openWin.document.getElementById("subjectId").value = obj.subject.subjectId;
        	openWin.document.getElementById("subjectName").value = obj.subject.subjectName;
        	openWin.document.getElementById("subjectName1").value = obj.subject.subjectName;
        	openWin.document.getElementById("subjectType").value = obj.subject.subjectType;
        	openWin.document.getElementById("subjectGrade").value = obj.subject.subjectGrade;
        	openWin.document.getElementById("subjectCredit").value = obj.subject.subjectCredit;
        	openWin.document.getElementById("subjectTime").value = obj.subject.subjectTime;
        	openWin.document.getElementById("proId").value = obj.professor.proId;
        	openWin.document.getElementById("proRoomOfficeId").value = obj.professor.proRoomOfficeId;
        	openWin.document.getElementById("usersName").value = obj.professor.usersName;
        	openWin.document.getElementById("usersEngName").value = obj.professor.usersEngName;
        	openWin.document.getElementById("usersEmail").value = obj.professor.usersEmail;
        	openWin.document.getElementById("usersCellNum").value = obj.professor.usersCellNum;
        	openWin.document.getElementById("usersNational").value = obj.professor.usersNational;
        }, 2000);                
	}
</script>
</html>