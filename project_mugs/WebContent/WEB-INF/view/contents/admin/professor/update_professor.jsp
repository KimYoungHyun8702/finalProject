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
<h2>교수 수정</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/updateProfessorController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
	사진 : <input type="text" name="usersPhoto" value="${requestScope.info.usersPhoto }"/><br>
	교수 번호 : <input type="text" name="usersId" value="${requestScope.info.usersId }" readonly/><br>
	비밀 번호 : <input type="text" name="usersPassword" value="${requestScope.info.usersPassword }"/><br>
	이름 : <input type="text" name="usersName" value="${requestScope.info.usersName }"/><br>
	영문 성명 : <input type="text" name="usersEngName" value="${requestScope.info.usersEngName }"/><br>
	주민 번호 : <input type="text" name="usersRRN" value="${requestScope.info.usersRRN }"/><br>
	이메일 : <input type="text" name="usersEmail" value="${requestScope.info.usersEmail }"/><br>
	집 전화번호 : <input type="text" name="usersPhoneNum" value="${requestScope.info.usersPhoneNum }"/><br>
	핸드폰 번호 : <input type="text" name="usersCellNum" value="${requestScope.info.usersCellNum }"/><br>
	국적 
	<select name="usersNational" id="usersNational">
		<option>국적</option>
		<c:choose>
			<c:when test="${requestScope.info.usersNational == '한국' }">
				<option selected>한국</option>
			</c:when>
			<c:otherwise>
				<option>한국</option>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${requestScope.info.usersNational == '중국' }">
				<option selected>중국</option>
			</c:when>
			<c:otherwise>
				<option>중국</option>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${requestScope.info.usersNational == '일본' }">
				<option selected>일본</option>
			</c:when>
			<c:otherwise>
				<option>일본</option>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${requestScope.info.usersNational == '북한' }">
				<option selected>북한</option>
			</c:when>
			<c:otherwise>
				<option>북한</option>
			</c:otherwise>
		</c:choose>
	</select><br>
	현 거주지 주소 : <input type="text" name="usersCurrentAddr" value="${requestScope.info.usersCurrentAddr }"/><br>
	본적지 주소 : <input type="text" name="usersBornAddr" value="${requestScope.info.usersBornAddr }"/><br>
	인증가능상태 : <input type="text" name="usersEnable" value="${requestScope.info.usersEnable }"/><br>
	졸업 대학 : <input type="text" name="proUniversity" value="${requestScope.info.proUniversity }"/><br>
	졸업 대학원 : <input type="text" name="proGradSchool" value="${requestScope.info.proGradSchool }"/><br>
	교수실 전화 번호 : <input type="text" name="proOfficePhoneNum" value="${requestScope.info.proOfficePhoneNum }"/><br>
	연구실 전화번호 : <input type="text" name="proLaboratoryPhoneNum" value="${requestScope.info.proLaboratoryPhoneNum }"/><br>
	소속 학과 : 
		<select name="majorId" id="majorId">
			<option>학과 선택</option>
			<c:choose>
					<c:when test="${requestScope.proMajor == null }">
						<option value="0" selected>없음</option>
					</c:when>
					<c:otherwise>
						<option value="0">없음</option>
					</c:otherwise>
				</c:choose>
			<c:forEach var="list" items="${requestScope.majorList }">
				<c:choose>
					<c:when test="${requestScope.proMajor.majorId == list.majorId }">
						<option value=${list.majorId } selected>${list.majorName }</option>
					</c:when>
					<c:otherwise>
						<option value=${list.majorId }>${list.majorName }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select> 
	교수실 
		<select name="office" id="office">
				<option>강의동 선택</option>
				<c:choose>
					<c:when test="${requestScope.office == null }">
						<option selected>없음</option>
					</c:when>
					<c:otherwise>
						<option >없음</option>
					</c:otherwise>
				</c:choose>
					<c:forEach var="list" items="${requestScope.building }">
						<c:choose>
							<c:when test="${requestScope.office.buildingName == list.buildingName  }">
								<option value=${list.buildingId } selected>${list.buildingName }</option>
							</c:when>
							<c:otherwise>
								<option value=${list.buildingId }>${list.buildingName }</option>
							</c:otherwise>
						</c:choose>
				</c:forEach>
		   </select>
		   <select name="proRoomOfficeId" id="proRoomOfficeId">
		   <c:choose>
					<c:when test="${requestScope.office == null }">
							<option selected>없음</option>
					</c:when>
					<c:otherwise>
						<option value="${requestScope.office.proRoomOfficeId }" selected>${requestScope.office.officeName }</option> 
					</c:otherwise>
			</c:choose>
	       </select>
	연구실 
		   <select name="buildingId" id="buildingId">
				<option>강의동 선택</option>
				<c:choose>
					<c:when test="${requestScope.laboratory == null }">
						<option selected>없음</option>
					</c:when>
					<c:otherwise>
						<option >없음</option>
					</c:otherwise>
				</c:choose>
					<c:forEach var="list" items="${requestScope.building }">
						<c:choose>
							<c:when test="${requestScope.laboratory.buildingName == list.buildingName  }">
								<option value=${list.buildingId } selected>${list.buildingName }</option>
							</c:when>
							<c:otherwise>
								<option value=${list.buildingId }>${list.buildingName }</option>
							</c:otherwise>
						</c:choose>
				</c:forEach>
		   </select>
		   <select name="proRoomLaboratoryId" id="proRoomLaboratoryId">
				 <c:choose>
					<c:when test="${requestScope.laboratory == null }">
							<option selected>없음</option>
					</c:when>
					<c:otherwise>
						<option value="${requestScope.office.proRoomLaboratoryId }" selected>${requestScope.office.laboratoryName }</option> 
					</c:otherwise>
			</c:choose>
	       </select><br>
			<input type="submit" value="수정">
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>