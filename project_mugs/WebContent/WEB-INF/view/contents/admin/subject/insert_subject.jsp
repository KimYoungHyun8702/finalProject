<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").hide();
	$("#collegeId").on("change",function(){
		if($("#collegeId").val() == "단과대학 선택"){
			$("#majorId").empty().append("<option>학과 선택</option>");
			$("#submit").hide();
		}else if($("#collegeId").val() == "교양"){
			$("#majorId").empty().append("<option value=0>교양</option>");
		}else{
			$("#submit").hide();
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectMajorByCollegeIdController.do",
			"data":"collegeId="+$("#collegeId").val(),
			"success":function(result){
				$("#majorId").empty().append("<option>학과 선택</option>");
				$.each(result,function(){
					$("#majorId").append($("<option value="+this.majorId+">").append(this.majorName));
				})
			}
		});//end of ajax
		}//end of else
	})//end of collegeId
	$("#buildingId").on("change",function(){
		$("#submit").hide();
		if($("#buildingId").val() == "강의동 선택"){
			alert("강의동을 선택하세요")
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectRoomByReferenceController.do",
				"data":"buildingId="+$("#buildingId").val(),
				"success":function(result){
					$("#lectureId").empty().append("<option>강의실 선택</option>");
					$.each(result,function(){
						$("#lectureId").append($("<option value="+this.roomId+">").append(this.roomName));
					})
				}
			});//end of ajax
		}//end of else
	})//end of buildingId
	$("#lectureId").on("change",function(){
		$("#submit").hide();
		if($("#lectureId").val() != '강의실 선택' && $("#majorId").val() != '학과 선택'){
			$("#submit").show();
		}
	})
	$("#majorId").on("change",function(){
		$("#submit").hide();
		if($("#lectureId").val() != '강의실 선택' && $("#majorId").val() != '학과 선택'){
			$("#submit").show();
		}
	})
})//end of document
</script>
</head>
<body>
<h2>과목 등록</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertSubjectController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	과목 이름 : <input type="text" name="subjectName"/><br>
	강의 시간 : <input type="text" name="subjectTime"/><br>
	이수 구분 : <select name="subjectType" id="subjectType">
			<option>선택전공</option>
			<option>필수전공</option>
			<option>선택교양</option>
			<option>필수교양</option>
		</select> <br>
	학점 : <input type="number" name="subjectCredit" max="3" min="1"/><br>
	정원 : <input type="number" name="subjectCapacity"/><br>
	신청 인원 : <input type="number" name="subjectRequest" value="0"/><br>
	학년 : <input type="number" name="subjectGrade" max="4" min="1"/><br>
	분반 : <input type="text" name="subjectClass"/><br>
	폐강 여부 : <input type="text" name="subjectCloseClass"/><br>
	학기 : <input type="text" name="subjectSemester"/><br>
	학과 : 
		<select name="collegeId" id="collegeId">
			<option>단과대학 선택</option>
			<option>교양</option>
			<c:forEach var="list" items="${requestScope.college }">
					<option value=${list.collegeId }>${list.collegeName }</option>
			</c:forEach>
		</select> 
		<select name="majorId" id="majorId">
			<option>학과 선택</option>
		</select> 
	강의실 : <select name="buildingId" id="buildingId">
				<option>강의동 선택</option>
					<c:forEach var="list" items="${requestScope.building }">
						<option value=${list.buildingId }>${list.buildingName }</option>
					</c:forEach>
		   </select>
		   <select name="lectureId" id="lectureId">
				<option>강의실 선택</option>
	       </select>
	     	<br>
				<input id="submit" type="submit" value="등록">
	      
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>