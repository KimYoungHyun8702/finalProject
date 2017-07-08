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
	$("#office").on("change",function(){
		if($("#office").val() == "강의동 선택"){
			$("#proRoomOfficeId").empty().append("<option>교수실 선택</option>");
		}else if($("#office").val() == "없음"){
			$("#proRoomOfficeId").empty().append("<option>없음</option>");
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectRoomForProfessorController.do",
				"data":"office="+$("#office").val(),
				"success":function(result){
					$("#proRoomOfficeId").empty().append("<option>교수실 선택</option>");
					$.each(result,function(){
						$("#proRoomOfficeId").append($("<option value="+this.roomId+">").append(this.roomName));
					})
				}
			});//end of ajax
		}//end of else
	})//end of buildingId
	$("#buildingId").on("change",function(){
		if($("#buildingId").val() == "강의동 선택"){
			$("#proRoomLaboratoryId").empty().append("<option>연구실 선택</option>");
		}else if($("#buildingId").val() == "없음"){
			$("#proRoomLaboratoryId").empty().append("<option>없음</option>");
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectRoomByReferenceController.do",
				"data":"buildingId="+$("#buildingId").val(),
				"success":function(result){
					$("#proRoomLaboratoryId").empty().append("<option>연구실 선택</option>");
					$.each(result,function(){
						$("#proRoomLaboratoryId").append($("<option value="+this.roomId+">").append(this.roomName));
					})
				}
			});//end of ajax
		}//end of else
	})//end of buildingId
})//end of document
</script>
</head>
<body>
<h2>교수 등록</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertProfessorController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	사진 : <input type="text" name="usersPhoto"/><br>
	교수 번호 : <input type="text" name="usersId" /><br>
	비밀 번호 : <input type="text" name="usersPassword"/><br>
	이름 : <input type="text" name="usersName" /><br>
	영문 성명 : <input type="text" name="usersEngName" /><br>
	주민 번호 : <input type="text" name="usersRRN"/><br>
	이메일 : <input type="text" name="usersEmail" /><br>
	집 전화번호 : <input type="text" name="usersPhoneNum"/><br>
	핸드폰 번호 : <input type="text" name="usersCellNum"/><br>
	국적 
	<select name="usersNational" id="usersNational">
			<option>국적</option>
			<option>한국</option>
			<option>중국</option>
			<option>일본</option>
			<option>북한</option>
	</select><br>
	현 거주지 주소 : <input type="text" name="usersCurrentAddr"/><br>
	본적지 주소 : <input type="text" name="usersBornAddr"/><br>
	인증가능상태 : <input type="text" name="usersEnable"/><br>
	졸업 대학 : <input type="text" name="proUniversity"/><br>
	졸업 대학원 : <input type="text" name="proGradSchool"/><br>
	교수실 전화 번호 : <input type="text" name="proOfficePhoneNum"/><br>
	연구실 전화번호 : <input type="text" name="proLaboratoryPhoneNum"/><br>
	소속 학과 : 
		<select name="majorId" id="majorId">
			<option>학과 선택</option>
			<option value="0">없음</option>
			<c:forEach var="list" items="${requestScope.major }">
					<option value=${list.majorId }>${list.majorName }</option>
			</c:forEach>
		</select> 
	교수실 
		<select name="office" id="office">
				<option>강의동 선택</option>
				<option>없음</option>
					<c:forEach var="list" items="${requestScope.building }">
						<option value=${list.buildingId }>${list.buildingName }</option>
					</c:forEach>
		   </select>
		   <select name="proRoomOfficeId" id="proRoomOfficeId">
				<option>교수실 선택</option>
	       </select>
	연구실 
		   <select name="buildingId" id="buildingId">
				<option>강의동 선택</option>
				<option>없음</option>
					<c:forEach var="list" items="${requestScope.building }">
						<option value=${list.buildingId }>${list.buildingName }</option>
					</c:forEach>
		   </select>
		   <select name="proRoomLaboratoryId" id="proRoomLaboratoryId">
				<option>연구실 선택</option>
	       </select><br>
			<input type="submit" value="등록">
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>