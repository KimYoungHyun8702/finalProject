<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					$("#thead1").empty();
					$("#tbody1").empty();
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
					$("#thead1").empty();
					$("#tbody1").empty();
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
		var index = $("#major option").index($("#major option:selected"));
		var now = new Date();
		var nowYear = now.getFullYear();
		var nowMonth = (now.getMonth()+1);
		$.ajax({
			"url":"/project_mugs/student/subject.do",
			"type":"post",
			"dataType":"json",
			"data":({majorId:$("#major").val(), nowYear:nowYear, nowMonth:nowMonth}),
			"beforeSend":function() {
				if(index == 0) {
					alert("학과를 선택하세요.");
					$("#thead1").empty();
					$("#tbody1").empty();
					return false;
				}
			},
			"success":function(list) {
				var headTxt = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>정원</td><td>신청</td><td>여석</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>신청버튼</td></tr>";
				var bodyTxt= "";
				$.each(list, function(){
					bodyTxt += "<tr><td>" + this.subject.subjectGrade +
								"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
								"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + 
								"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.majorId + "<input type='hidden' value=" + this.subjectId + ">" + "<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.proSubjectSemester + ">" + "</td><td>" + "<button id=" + "btn1>" + "수강신청</button>" + "</td></tr>";
				});
				$("#thead1").html(headTxt);
				$("#tbody1").html(bodyTxt);
			},
		});
	});
	
	$(document).on("click", "#btn1", function() {
		var subId = $(this).parent().prev().children().val();
		var sms = $(this).parent().prev().children().next().next().next().val();
		var pro = $(this).parent().prev().children().next().val();
		var major = $(this).parent().prev().children().next().next().val();
		var tbodySize = $("#tbody2 tr").length;
		$.ajax({
			"url":"/project_mugs/student/getMySubject.do",
			"type":"post",
			"dataType":"json",
			"data":({subjectId:subId, semester:sms, proId:pro, majorId:major}),
			"beforeSend":function(){
				if(tbodySize != 0) {
					for(var i = 0; i < tbodySize; i++) {
						var value = $("#tbody2 tr").eq(i).children().eq(8).children().val();
						if(value == subId) {
							alert("이미 신청한 강좌입니다.");
							return false;
						}
					}
				}
			},
			"success":function(list) {
				var bodyTxt= "";
				$.each(list, function(){
					bodyTxt += "<tr><td>" + this.subject.subjectGrade +
					"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
					"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + 
					"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.majorId + "<input type='hidden' value=" + this.subjectId + ">" + "<input type='hidden' value=" + this.proId + ">" +
					"<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.proSubjectSemester + ">" + "</td><td>" + "<button id=" + "btn1>" + "수강신청</button>" + "</td></tr>";
				});
				$("#tbody1").html(bodyTxt);
				var headTxt = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>취소버튼</td></tr>";
				var txt = "";
				
				$.each(list, function(){
					if(this.subjectId == subId) {
						txt += "<tr><td>" + this.subject.subjectGrade +
						"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
						"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
						"</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.majorId + "<input type='hidden' value=" + this.subjectId + ">" +
						"<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + 
						"<input type='hidden' value=" + this.proSubjectSemester + ">" + "</td><td>" + "<button id=" + "btn2>" + "수강취소</button>" + "</td></tr>";
					}
				});
				
				if(tbodySize == 0) {
					$("#thead2").html(headTxt);
					$("#tbody2").html(txt);
					$("#course_info_layer").show();
				} else {
					$("#tbody2").append(txt);
				}
			},
		});
	});
	
	$(document).on("click", "#btn2", function() {
		var subId = $(this).parent().prev().children().val();
		var sms = $(this).parent().prev().children().next().next().next().val();
		var pro = $(this).parent().prev().children().next().val();
		var major = $(this).parent().prev().children().next().next().val();
		var tbodySize = $("#tbody2 tr").length;
		$.ajax({
			"url":"/project_mugs/student/deleteMySubject.do",
			"type":"post",
			"dataType":"json",
			"data":({subjectId:subId, semester:sms, proId:pro, majorId:major}),
			"beforeSend":function() {
				
			},
			"success":function(list) {
				var head1Txt = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>정원</td><td>신청</td><td>여석</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>신청버튼</td></tr>";
				var body1Txt = "";
				var head2Txt = "";
				var body2Txt = "";
				$.each(list, function(){
					body1Txt += "<tr><td>" + this.subject.subjectGrade +
								"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
								"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + 
								"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.majorId + "<input type='hidden' value=" + this.subjectId + ">" + "<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.proSubjectSemester + ">" + "</td><td>" + "<button id=" + "btn1>" + "수강신청</button>" + "</td></tr>";
					
				});
				
				for(var i = 0; i < tbodySize; i++) {
					var value = $("#tbody2 tr").eq(i).children().eq(8).children().val();
					if(subId != list[i].subjectId && value == list[i].subjectId) {	
						body2Txt += "<tr><td>" + list[i].subject.subjectGrade +
						"</td><td>" + list[i].subject.subjectType + "</td><td>" + list[i].subject.subjectClass + "</td><td>" + list[i].subject.subjectName + 
						"</td><td>" + list[i].professor.usersName + "</td><td>" + list[i].subject.subjectCredit + "</td><td>" + list[i].subject.subjectTime + 
						"</td><td>" + list[i].subject.lectureId + "</td><td>" + list[i].subject.majorId + "<input type='hidden' value=" + list[i].subjectId + ">" +
						"<input type='hidden' value=" + list[i].proId + ">" + "<input type='hidden' value=" + list[i].subject.majorId + ">" + 
						"<input type='hidden' value=" + list[i].proSubjectSemester + ">" + "</td><td>" + "<button id=" + "btn2>" + "수강취소</button>" + "</td></tr>";
					} 
				}
				$("#thead1").html(head1Txt);
				$("#tbody1").html(body1Txt);
				/* if() {
					$("#thead2").html(head2Txt);
				} */
				$("#tbody2").html(body2Txt);
			},
		});
	});
});
</script>

<style type="text/css">
table, td{
	border: 1px solid black;
}
table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
}
select{
	width:150px;
	height: 35px;
	padding: 5px;
}
#course_info_layer{
	display: none;/*최초 로딩시에는 안보이도록 처리*/
}
#tbody{
	cursor: pointer;
}
</style>
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


<table>
	<thead id="thead1"></thead>
	<tbody id="tbody1"></tbody>
</table>

<hr>
<div id="course_info_layer">
<h2>수강신청 내역</h2>
<button id="btn3">저장하기</button>
	<table>
		<thead id="thead2"></thead>
		<tbody id="tbody2"></tbody>
	</table>
</div>
</body>
</html>