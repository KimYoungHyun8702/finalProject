<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("input#submit").hide();
	if($("#lectureId").val() != null){
		$("input#submit").show();
	}
	$("#buildingId").on("change",function(){
		if($("#buildingId").val() == "강의동 선택"){
			alert("강의동을 선택하세요");
			$("input#submit").hide();
			$("#lectureId").empty().append("<option>강의실 선택</option>");
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
		if($("#lectureId").val() == "강의실 선택"){
			alert("강의실을 선택하세요");
			$("input#submit").hide();
		}else{
			$("input#submit").show();
		}
	})
})//end of document
</script>
</head>
<body>
<h2>과목 수정</h2>
	<hr>
	<form id="updateForm" action="${initParam.rootPath }/admin/updateSubjectContorller.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
	 <table id="selectSubject" border="1">
		<thead>
			<tr>
				<td align="center">과목 이름</td>
				<td align="center">강의 시간</td>
				<td align="center">이수 구분</td>
				<td align="center">학점</td>
				<td align="center">정원</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="subjectName" value="${requestScope.subject.subjectName }"/></td>
				<td align="center"><input type="text" name="subjectTime" value="${requestScope.subject.subjectTime }"/></td>
				<td align="center"><select name="subjectType" id="subjectType">
							<option>이수구분</option>
							<c:choose>
								<c:when test="${requestScope.subject.subjectType == '선택전공'}">
									<option selected>선택전공</option>
								</c:when>
								<c:otherwise>
									<option>선택전공</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${requestScope.subject.subjectType == '필수전공'}">
									<option selected>필수전공</option>
								</c:when>
								<c:otherwise>
									<option>필수전공</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${requestScope.subject.subjectType == '선택교양'}">
									<option selected>선택교양</option>
								</c:when>
								<c:otherwise>
									<option>선택교양</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${requestScope.subject.subjectType == '필수교양'}">
									<option selected>필수교양</option>
								</c:when>
								<c:otherwise>
									<option>필수교양</option>
								</c:otherwise>
							</c:choose>
					</select></td>
				<td align="center"><input type="number" name="subjectCredit" max="3" min="1" value="${requestScope.subject.subjectCredit }"/></td>
				<td align="center"><input type="number" name="subjectCapacity" value="${requestScope.subject.subjectCapacity }"/></td>
			</tr>
		</tbody>
		
		<thead>
			<tr>
				<td align="center">학년</td>
				<td align="center">분반</td>
				<td align="center">폐강 여부</td>
				<td align="center">학기</td>
				<td align="center">강의실</td>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td align="center"><input type="number" name="subjectGrade" max="4" min="1" value="${requestScope.subject.subjectGrade }"/></td>
				<td align="center"><input type="text" name="subjectClass" value="${requestScope.subject.subjectClass }"/></td>
				<td align="center"><input type="text" name="subjectCloseClass" value="${requestScope.subject.subjectCloseClass }"/></td>
				<td align="center"><input type="text" name="subjectSemester" value="${requestScope.subject.subjectSemester }"/></td>
				<td align="center"><select name="buildingId" id="buildingId">
							<option>강의동 선택</option>
							<c:forEach var="list" items="${requestScope.building }">
								<c:choose>
									<c:when
										test="${requestScope.subject.building.buildingId == list.buildingId }">
										<option value=${list.buildingId } selected>${list.buildingName }</option>
									</c:when>
									<c:otherwise>
										<option value=${list.buildingId }>${list.buildingName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select> <select name="lectureId" id="lectureId">
							<option value="${requestScope.subject.room.roomId }">${requestScope.subject.room.roomName }</option>
					</select></td>
			</tr>
		</tbody>
	</table>
		<input type="hidden" name="subjectId" value="${requestScope.subject.subjectId }"/>
		<input type="hidden" name="collegeId" value="${requestScope.subject.college.collegeId }"/>
		<input type="hidden" name="majorId" value="${requestScope.subject.majorId }"/>
		<input type="hidden" name="subjectRequest" value="${requestScope.subject.subjectRequest }"/>
			<input type="submit" id="submit" value="수정">
			<sec:csrfInput/>
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>