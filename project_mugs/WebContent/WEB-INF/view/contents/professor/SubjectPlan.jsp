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
					+ "</td><td>" + "<button class=" + "Btn>" + "강의계획서조회 </button>" + "</td><td>" + "<button class=" + "Btn2 style='display: none'>" + "강의계획서등록 </button>"+"</td></tr>"	
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
			//$(this).parent().next().find("input").attr("style","display: inline");
			$this.parent().next().children().css("display", "inline");
		/* 	console.log($this);
			console.log($this.parent());
			console.log($this.parent().next());
			console.log($this.parent().next().children()); */
		}
	});//ajax
});//document(click);

</script>

</head>
<body>
안뇽안뇽

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
			
			<td>강의계획서</td>
			<td>강의계획서 등록</td>
		</tr>
	</thead>
	<tbody id="tbody"></tbody>			
</table>
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
        }, 1000);                
      /*   var html = "";
		
		html += '<form id="form"> '
			 + '교과목개요<input type="text" id="planSummary" value="' + obj.planSummary + '"><br>'
			 + '학습목표<input type="text" id="planLessonGoal" value=""><br>'
			 + '주차별강의내용<input type="text" id="planWeekContent" value=""><br>'
			 + '채점방식<input type="text" id="planMarkingMethod" value=""><br>'
			 + '교재<input type="text" id="planBookinfo" value=""><br>'
			 + '연도<input type="text" id="planYear" value=""><br>'
			 + '학기<input type="text" id="planSemester" value=""><br>'
			 + '비고<input type="text" id="planNote" value=""><br>'
			 + '참고문헌<input type="text" id="planBibliography" value=""><br>'
			 + '</form>'; */
		//openWin.document.write(html);
	}
	$(document).on("click", ".Btn2", function openchild2(){
		var proSubjectYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var proSubjectSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectName = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectType = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectGrade = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectCredit = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var subjectTime = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var usersId = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var usersName = $(this).parent().prev().prev().prev().prev().prev().text();
		var usersEngName = $(this).parent().prev().prev().prev().prev().text();
		var usersCellNum = $(this).parent().prev().prev().prev().text();
		var usersEmail = $(this).parent().prev().prev().text();
		window.name = "parentForm";
		openWin = window.open("/project_mugs/SubjectPlan_insert.do", "강의계획서등록", "width=500, height=400 resizable=no");
		setTimeout(function() {
			openWin.document.getElementById("planYear").value = proSubjectYear
			openWin.document.getElementById("planSemester").value = proSubjectSemester
			openWin.document.getElementById("subjectId").value = subjectId
			openWin.document.getElementById("subjectName").value = subjectName
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
</script>
</html>