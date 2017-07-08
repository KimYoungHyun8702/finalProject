<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
function update_subject(subjectId){
	location.href="${initParam.rootPath }/admin/selectSubjectInfoBySubjectIdForUpdateController.do?subjectId="+subjectId
};
function update_minor_subject(subjectId){
	location.href="${initParam.rootPath }/admin/selectSubjectInfoBySubjectIdForMinorUpdateController.do?subjectId="+subjectId
};
function delete_subject(subjectId){
	location.href="${initParam.rootPath }/admin/deleteSubjectBySubjectIdController.do?subjectId="+subjectId
};
$(document).ready(function(){	
	$("#college").hide();
	$("#major").hide();
	$("#subject").hide();
	$("#time").hide();
	$("#majorButton").hide();
	$("#minorButton").hide();
	$("#selectSubject").hide();
	$("#subjectType").on("change",function(){
		$("#selectSubject").hide();
		if($("#subjectType").val() == "선택전공" || $("#subjectType").val() == "필수전공"){
			$("#college").show();
			$("#major").show();
			$("#subject").show();
			$("#time").hide();
			$("#minorButton").hide();
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectCollegeIdBySubjectTypeController.do",
			"data":"subjectType="+$("#subjectType").val(),
			"success":function(result){
				$("#college").empty().append("<option>단과대학 선택</option>");
				$.each(result,function(){
					$("#college").append($("<option value="+this.college.collegeId+">").append(this.college.collegeName));
				})
			}
		});//end of ajax
	}else if($("#subjectType").val() == "선택교양" || $("#subjectType").val() == "필수교양"){
			$("#selectSubject").hide();
			$("#time").show();
			$("#college").hide();
			$("#major").hide();
			$("#subject").hide();
			$("#majorButton").hide();
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectCollegeIdBySubjectTypeMinorController.do",
			"data":"subjectType="+$("#subjectType").val(),
			"success":function(result){
				$("#time").empty().append("<option>시간표 선택</option>");
				$.each(result,function(){
					$("#minorButton").show();
					$("#time").append($("<option>").append(this.subjectTime));
				})
			}
		});//end of ajax 
	}else{
		alert("이수구분을 선택하세요");
		$("#selectSubject").hide();
		$("#college").hide();
		$("#major").hide();
		$("#subject").hide();
		$("#time").hide();
		$("#majorButton").hide();
		$("#minorButton").hide();
		$("#college").empty().append("<option>단과대학 선택</option>");
		$("#major").empty().append("<option>학과 선택</option>");
		$("#subject").empty().append("<option>과목 선택</option>");
		$("#time").empty().append("<option>시간표 선택</option>");
	};
	})//end of subjectType
	$("#college").on("change",function(){
		$("#selectSubject").hide();
		if($("#college").val() == "단과대학 선택"){
			$("#majorButton").hide();
			alert("단과대학을 선택하세요");
			$("#major").empty().append("<option>학과 선택</option>");
			$("#subject").empty().append("<option>과목 선택</option>");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectMajorIdByCollegeIdController.do", 
			"data":({collegeId:$("#college").val(),subjectType:$("#subjectType").val()}),
			"success":function(result){
				$("#major").show();
				$("#major").empty().append("<option>학과 선택</option>");
				$.each(result,function(){
					$("#major").append($("<option value="+this.major.majorId+">").append(this.major.majorName));
				})
			}
		})//end of ajax
		};
	});//end of college
	$("#major").on("change",function(){
		$("#selectSubject").hide();
		if($("#major").val() == "학과 선택"){
			$("#majorButton").hide();
			alert("학과를 선택하세요");
			$("#subject").empty().append("<option>과목 선택</option>");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectSubjectByMajorIdController.do", 
			"data":({majorId:$("#major").val(),collegeId:$("#college").val(),subjectType:$("#subjectType").val()}),
			"success":function(result){
				$("#subject").show();
				$("#majorButton").show();
				$("#subject").empty().append("<option>과목 선택</option>");
				$.each(result,function(){
					$("#subject").append($("<option value="+this.subjectId+">").append(this.subjectName));
				})
			}
		})//end of ajax
		};
	});//end of major
	 $("#minorButton").on("click",function(){
		if($("#time").val() == '시간표 선택'){
			alert("시간표를 선택해주세요");
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectSubjectInfoBySubjectTimeController.do", 
				"data":({subjectTime:$("#time").val(),subjectType:$("#subjectType").val()}),
				"success":function(result){
					var txt = "";
					$.each(result,function(){
					txt += "<tr><td align='center'>"+this.subjectId+"</td><td align='center'>"+this.subjectName+"</td><td align='center'>"+this.subjectTime+"</td><td align='center'>"+this.subjectType+"</td><td align='center'>"+this.subjectCredit+"</td><td align='center'>"
							+this.subjectCapacity+"</td><td align='center'>"+this.subjectRequest+"</td><td align='center'>"+this.subjectGrade+"</td><td align='center'>"+this.subjectClass+"</td><td align='center'>"+this.subjectCloseClass+"</td><td align='center'>"+this.subjectSemester+"</td><td align='center'>"
							+"</td><td align='center'>"+this.building.buildingName+"</td><td align='center'>"+this.room.roomName+"</td><td align='center'><button onclick='update_minor_subject("+this.subjectId+")'>수정</button></td><td align='center'><button onclick='delete_subject("+this.subjectId+")'>삭제</button></td></tr>"
					})
					$("#tbody").html(txt);
					$("#selectSubject").show();			
				}
			})//end of ajax
		}
	})//end of time 
	$("#majorButton").on("click",function(){
		if($("#subject").val() == "과목 선택"){
			alert("과목을 선택하세요");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectSubjectInfoBySubjectNameController.do",
			"data":"subjectId="+$("#subject").val(),
			"success":function(result){
					var txt = "";
						txt += "<tr><td align='center'>"+result.subjectId+"</td><td align='center'>"+result.subjectName+"</td><td align='center'>"+result.subjectTime+"</td><td align='center'>"+result.subjectType+"</td><td align='center'>"+result.subjectCredit+"</td><td align='center'>"
								+result.subjectCapacity+"</td><td align='center'>"+result.subjectRequest+"</td><td align='center'>"+result.subjectGrade+"</td><td align='center'>"+result.subjectClass+"</td><td align='center'>"+result.subjectCloseClass+"</td><td align='center'>"+result.subjectSemester+"</td><td align='center'>"
								+result.major.majorName+"</td><td align='center'>"+result.building.buildingName+"</td><td align='center'>"+result.room.roomName+"</td><td align='center'><button onclick='update_subject("+result.subjectId+")'>수정</button></td><td align='center'><button onclick='delete_subject("+result.subjectId+")'>삭제</button></td></tr>"
					$("#tbody").html(txt);
					$("#selectSubject").show();
			}
		})//end of ajax
		}
	});//end of majorButton
	
});
</script>
</head>
<body>
	<h2>과목 조회</h2>
	<hr>
	<select name="subjectType" id="subjectType">
		<option>이수 구분 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list }>${list }</option>
		</c:forEach>
	</select>
	
	<select id="college">
	<option>단과 대학 선택</option>
	</select>
	
	<select id="major">
	<option>학과 선택</option>
	</select>
	
	<select id="subject">
	<option>과목 선택</option>
	</select>
	
	<select id="time">
	<option>시간표 선택</option>
	</select>
	
	
	<button id="majorButton">조회</button>
	<button id="minorButton">조회</button>
	
	<table id="selectSubject" border="1">
		<thead>
			<tr>
				<td align="center">과목 ID</td>
				<td align="center">과목 이름</td>
				<td align="center">강의 시간</td>
				<td align="center">이수 구분</td>
				<td align="center">학점</td>
				<td align="center">정원</td>
				<td align="center">신청인원</td>
				<td align="center">학년</td>
				<td align="center">분반</td>
				<td align="center">폐강 여부</td>
				<td align="center">학기</td>
				<td align="center">학과</td>
				<td align="center">강의동</td>
				<td align="center">강의실</td>
				<td align="center">수정</td>
				<td align="center">삭제</td>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>