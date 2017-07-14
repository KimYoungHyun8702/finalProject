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
	$("#subjectTypeList").change(function() {
		var index = $("#subjectTypeList option").index($("#subjectTypeList option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getCollegeListAjax.do",
			"type":"post",
			"dataType":"json",
			"data":{${_csrf.parameterName}:'${_csrf.token}'},
			"beforeSend":function(){
				if(index == 0) {
					alert("이수구분을 선택하세요.");
					var txt = "<option>선택하세요.</option>"
					$("#collegeList").html(txt);
					$("#majorList").html(txt);
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(list) {
				var txt = "<option>선택하세요.</option>";
				$.each(list, function(){
					txt += "<option value=" + this.collegeId + ">" + this.collegeName + "</option>";
				});
				$("#collegeList").html(txt);
			},
		});
	});
	
	$("#collegeList").change(function() {
		var index = $("#collegeList option").index($("#collegeList option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getMajorListByCollegeId.do",
			"type":"post",
			"data":{"collegeId":$("#collegeList").val(), ${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"beforeSend":function() {
				if(index == 0) {
					alert("단과대학을 선택하세요.");
					var txt = "<option>선택하세요.</option>"
					$("#majorList").html(txt);
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(list) {
				var txt = "<option>선택하세요.</option>";
				$.each(list, function(){
					txt += "<option value=" + this.majorId + ">" + this.majorName + "</option>";
				});
				$("#majorList").html(txt);
			},
		});
	});
	
	$("#majorList").change(function() {
		var index = $("#majorList option").index($("#majorList option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getSubjectListByJoin.do",
			"type":"post",
			"dataType":"json",
			"data":({majorId:$("#majorList").val(), semester:$("#semester").val(), nowYear:$("#nowYear").val(), subjectType:$("#subjectTypeList").val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"beforeSend":function() {
				if(index == 0) {
					alert("학과를 선택하세요.");
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(map) {
				var subjectTbody = "";
				var subjectThead = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>정원</td><td>신청</td><td>여석</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>재수강여부</td><td>신청버튼</td></tr>";
				$.each(map.professorSubjectList, function(){
					subjectTbody += "<tr><td>" + this.subject.subjectGrade +
								"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
								"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
								"</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
								"</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + "</td><td>" + this.subject.recourse +
								"</td><td>" + "<button id=" + "enrolment>" + "수강신청</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
								"<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
				});
				$("#subjectThead").html(subjectThead);
				$("#subjectTbody").html(subjectTbody);
			},
		});
	});
	
	$(document).on("click", "#enrolment", function() {
		var tbodySize = $("#tbodyMySubject tr").length;
		$.ajax({
			"url":"/project_mugs/student/addCourseMySubject.do",
			"type":"post",
			"data":({semester:$("#semester").val(), nowYear:$("#nowYear").val(), 
				majorId:$("#majorList").val(), proId:$(this).next().next().val(), 
				subjectType:$("#subjectTypeList").val(), subjectId:$(this).next().val(), 
				recourse:$(this).parent().prev().text(), stuRegister:$("#stuRegister").val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"dataType":"json",
			"beforeSend":function() {
				
			},
			"success":function(map) {
				if(map.msg) {
					alert(map.msg);
				} else {
					alert("수강신청 완료")
					var subjectThead = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>정원</td><td>신청</td><td>여석</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>재수강여부</td><td>신청버튼</td></tr>";
					var subjectTbody = "";
					$.each(map.professorSubjectList, function() {
						subjectTbody += "<tr><td>" + this.subject.subjectGrade +
									"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
									"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
									"</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
									"</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + "</td><td>" + this.subject.recourse +
									"</td><td>" + "<button id=" + "enrolment>" + "수강신청</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
									"<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
					});
					
					var theadMySubject = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>취소버튼</td></tr>";
					var tbodyMySubject = "";
					$.each(map.courseSubjectList, function() {
						tbodyMySubject += "<tr><td>" + this.subject.subjectGrade + "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass +
									"</td><td>" + this.subject.subjectName + "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCredit + 
									"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + 
									"</td><td>" + "<button id=" + "cancelCourse>" + "수강취소</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
									"<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.subject.subjectType + ">" + 
									"</td></tr>"
					});
					$("#subjectThead").html(subjectThead);
					$("#subjectTbody").html(subjectTbody);
					$("#theadMySubject").html(theadMySubject);
					$("#tbodyMySubject").html(tbodyMySubject);
				}
			},
		});
	});
	
	$(document).on("click", "#cancelCourse", function() {
		if(confirm("정말 취소하시겠습니까?") == true) {			
			var subjectTbodySize = $("#subjectTbody tr").length;
			$.ajax({
				"url":"/project_mugs/student/removeMySubject.do",
				"type":"post",
				"dataType":"json",
				"data":({majorId:$(this).next().next().next().val(), semester:$("#semester").val(), nowYear:$("#nowYear").val(), 
					proId:$(this).next().next().val(), subjectId:$(this).next().val(), subjectType:$(this).next().next().next().next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
				"beforeSend":function() {
					
				},
				"success":function(map) {
					alert("수강취소 완료");
					if(subjectTbodySize != 0) {
						var subjectThead = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>정원</td><td>신청</td><td>여석</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>재수강여부</td><td>신청버튼</td></tr>";
						var subjectTbody = "";
						$.each(map.professorSubjectList, function() {
							subjectTbody += "<tr><td>" + this.subject.subjectGrade +
										"</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
										"</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
										"</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
										"</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + "</td><td>" + this.subject.recourse +
										"</td><td>" + "<button id=" + "enrolment>" + "수강신청</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
										"<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
						});
						
						var theadMySubject = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>취소버튼</td></tr>";
						var tbodyMySubject = "";
						$.each(map.courseSubjectList, function() {
							tbodyMySubject += "<tr><td>" + this.subject.subjectGrade + "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass +
										"</td><td>" + this.subject.subjectName + "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCredit + 
										"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + 
										"</td><td>" + "<button id=" + "cancelCourse>" + "수강취소</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
										"<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.subject.subjectType + ">" + 
										"</td></tr>"
						});
						$("#subjectThead").html(subjectThead);
						$("#subjectTbody").html(subjectTbody);
						$("#theadMySubject").html(theadMySubject);
						$("#tbodyMySubject").html(tbodyMySubject);
					} else {
						var theadMySubject = "<tr><td>학년</td><td>이수구분</td><td>분반</td><td>강의명</td><td>담당교수</td><td>학점</td><td>강의시간</td><td>강의실</td><td>개설학과</td><td>취소버튼</td></tr>";
						var tbodyMySubject = "";
						$.each(map.courseSubjectList, function() {
							tbodyMySubject += "<tr><td>" + this.subject.subjectGrade + "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass +
										"</td><td>" + this.subject.subjectName + "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCredit + 
										"</td><td>" + this.subject.subjectTime + "</td><td>" + this.subject.lectureId + "</td><td>" + this.subject.major.majorName + 
										"</td><td>" + "<button id=" + "cancelCourse>" + "수강취소</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
										"<input type='hidden' value=" + this.proId + ">" + "<input type='hidden' value=" + this.subject.majorId + ">" + "<input type='hidden' value=" + this.subject.subjectType + ">" + 
										"</td></tr>"
						});
						$("#theadMySubject").html(theadMySubject);
						$("#tbodyMySubject").html(tbodyMySubject);
					}
				}
			});
		} else {
			return;
		}
	});
	
	$(document).on("click", "#completed", function() {
		var tbodyMySubjectSize = $("#tbodyMySubject tr").length;
		var myCourseCreditSum = 0;
		var stuRegister = $("#stuRegister").val();	// 재적상태
		var standardMinCredit = $("#standardMinCredit").val();	// 재학생 최저 인정가능 학점
		var standardMinScholarship = $("#standardMinScholarship").val();	// 장학금 최저 인정가능 학점
		var standardDelayMinCredit = $("#standardDelayMinCredit").val();	// 졸업유예자 최저 인정가능 학점
				
		for(var i = 0; i < tbodyMySubjectSize; i++) {
			myCourseCreditSum += $("#tbodyMySubject tr").eq(i).children().eq(5).text()*1;
		}
		
		if(stuRegister == "재학") {
			if(myCourseCreditSum < standardMinCredit) {
				if(confirm("신청학점이 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }";
				} else {
					return;
				}
			}
			
			if(myCourseCreditSum > standardMinCredit && myCourseCreditSum < standardMinScholarship) {
				if(confirm("신청학점이 장학금 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }";
				} else {
					return;
				}
			}
		} else {
			if(myCourseCreditSum < standardDelayMinCredit) {
				if(confirm("신청학점이 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }";
				} else {
					return;
				}
			}
			
			if(myCourseCreditSum > standardDelayMinCredit && myCourseCreditSum < standardMinScholarship) {
				if(confirm("신청학점이 장학금 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }";
				} else {
					return;
				}
			}
		}
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
	
	#tbody{
		cursor: pointer;
	}
</style>
</head>
<body>

<h2>
	<input type="hidden" id="stuRegister" value="${stuRegister }">
	<input type="hidden" id="semester" value="${semester }">
	<input type="hidden" id="nowYear" value="${nowYear }">
	<input type="hidden" id="standardMinCredit" value="${standard.standardMinCredit }">
	<input type="hidden" id="standardMaxCredit" value="${standard.standardMaxCredit }">
	<input type="hidden" id="standardMinScholarship" value="${standard.standardMinScholarship }">
	<input type="hidden" id="standardDelayMinCredit" value="${standard.standardDelayMinCredit }">
	<input type="hidden" id="standardDelayMaxCredit" value="${standard.standardDelayMaxCredit }">
	${nowYear }연도 ${semester } 수강신청
</h2>

이수구분 : 
<select name="subjectTypeList" id="subjectTypeList" >
	<option>선택하세요.</option>
		<c:forEach items="${requestScope.subjectTypeList }" var="subjectType">
			<option>${subjectType }</option>
		</c:forEach>
</select>
		 
단과대학 : 
<select id="collegeList">
	<option>선택하세요.</option>
</select>

학과 : 
<select id="majorList">
	<option>선택하세요.</option>
</select>


<table>
	<thead id="subjectThead"></thead>
	<tbody id="subjectTbody"></tbody>
</table>

<hr>
<div id="course_info_layer">
	<h2>수강신청 내역</h2>
		<button id="completed">수강신청완료</button>
		<table>
			<thead id="theadMySubject">
				<tr>
					<td>학년</td>
					<td>이수구분</td>
					<td>분반</td>
					<td>강의명</td>
					<td>담당교수</td>
					<td>학점</td>
					<td>강의시간</td>
					<td>강의실</td>
					<td>개설학과</td>
					<td>취소버튼</td>
				</tr>
			</thead>
			<tbody id="tbodyMySubject">
				<c:forEach items="${requestScope.myCourseList }" var="course">
					<tr>
						<td>${course.subject.subjectGrade }</td>
						<td>${course.subject.subjectType }</td>
						<td>${course.subject.subjectClass }</td>
						<td>${course.subject.subjectName }</td>
						<td>${course.professor.usersName }</td>
						<td>${course.subject.subjectCredit }</td>
						<td>${course.subject.subjectTime }</td>
						<td>${course.subject.lectureId }</td>
						<td>${course.subject.major.majorName }</td>
						<td><button id="cancelCourse">수강취소</button>
						<input type="hidden" value="${course.subjectId }">
						<input type="hidden" value="${course.proId }">
						<input type="hidden" value="${course.subject.majorId }">
						<input type="hidden" value="${course.subject.subjectType }">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
</body>
</html>