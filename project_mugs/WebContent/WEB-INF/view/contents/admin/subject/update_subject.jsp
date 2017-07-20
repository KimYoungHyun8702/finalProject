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
function check(){
   if($("#subjectName").val() == "" || $("#subjectName").val().trim() == 0 ){
      alert("과목 이름을 입력하세요");
      return false;
   }else if($("#subjectTime").val() == "" || $("#subjectTime").val().trim() == 0 ){
      alert("강의시간을 입력하세요")
      return false;
   }else if($("#subjectType").val() == "이수구분"){
      alert("이수 구분을 입력하세요")
      return false;
   }else if($("#subjectCredit").val() == "" || $("#subjectCredit").val().trim() == 0){
      alert("학점을 입력하세요")
      return false;
   }else if($("#subjectCapacity").val() == "" || $("#subjectCapacity").val().trim() == 0){
      alert("정원을 입력하세요")
      return false;
   }else if($("#subjectGrade").val() == "" || $("#subjectGrade").val().trim() == 0){
      alert("학년을 입력하세요")
      return false;
   }else if($("#subjectClass").val() == "" || $("#subjectClass").val().trim() == 0){
      alert("분반을 입력하세요")
      return false;
   }else if($("#subjectCloseClass").val() == "" || $("#subjectClass").val().trim() == 0 ){
      alert("폐강 여부를 입력하세요")
      return false;
   }else if($("#subjectSemester").val() == "" || $("#subjectSemester").val().trim() == 0){
      alert("학기를 입력하세요")
      return false;
   }else if($("#collegeId").val() == "단과대학 선택"){
      alert("단과대학을 선택하세요")
      return false;
   }else if($("#buildingId").val() == "강의동 선택"){
      alert("강의동을 선택하세요")
      return false;
   }else if($("#lectureId").val() == "강의실 선택"){
      alert("강의실을 선택하세요")
      return false;
   }else{
      return confirm("수정하시겠습니까 ?")
   }
};
$(document).ready(function(){
   $("#buildingId").on("change",function(){
      if($("#buildingId").val() == "강의동 선택"){
         $("#lectureId").empty().append("<option>강의실 선택</option>");
      }else if($("#subjectTime").val() == ""){
         alert("시간을 입력하세요");
         return false;
      }else if($("#subjectSemester").val() == ""){
         alert("학기를 입력하세요");
         return false;
      }else if($("#buildingId").val() == "강의동 선택"){
         $("#lectureId").empty().append("<option>강의실 선택</option>");
         return false;
      }else if($("#buildingId").val() == "없음"){
         $("#lectureId").empty().append("<option value='0'>없음</option>");
         return false;
      }else{
         $.ajax({
            "url":"${initParam.rootPath }/admin/selectForOverlapUpdateController.do",
            "data":({subjectTime:$("#subjectTime").val(),subjectSemester:$("#subjectSemester").val(),buildingId:$("#buildingId").val(),subjectId:$("#subjectId").val()}),
            "success":function(result){
               $("#lectureId").empty().append("<option>강의실 선택</option>");
               $.each(result,function(){
                  $("#lectureId").append($("<option value="+this.roomId+">").append(this.roomName));
               })
            }
         });//end of ajax
      }//end of else
   })//end of buildingId
})//end of document
</script>
</head>
<body>
<h2>과목 수정</h2>
	<br>
	<form action="${initParam.rootPath }/admin/updateSubjectContorller.do" method="post" onsubmit="return check()">
	 <table id="selectSubject" border="1">
		<thead>
			<tr>
				<td align="center">과목 이름</td>
				<td align="center">강의 시간</td>
				<td align="center">이수 구분</td>
				<td align="center">학점</td>
				<td align="center">정원</td>
				<td align="center">학년</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="subjectName" id="subjectName" value="${requestScope.subject.subjectName }"/></td>
				<td align="center"><input type="text" name="subjectTime" id="subjectTime" value="${requestScope.subject.subjectTime }"/></td>
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
				<td align="center"><input type="number" name="subjectCredit" id="subjectCredit" max="3" min="1" value="${requestScope.subject.subjectCredit }"/></td>
				<td align="center"><input type="number" name="subjectCapacity" id="subjectCapacity" value="${requestScope.subject.subjectCapacity }"/></td>
				<td align="center"><input type="number" name="subjectGrade" max="4" min="1" id="subjectGrade" value="${requestScope.subject.subjectGrade }"/></td>
			</tr>
		</tbody>
		
		<thead>
			<tr>
				<td align="center">분반</td>
				<td align="center">폐강 여부</td>
				<td align="center">학기</td>
				<td align="center">강의실</td>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td align="center"><input type="text" name="subjectClass" id="subjectClass" value="${requestScope.subject.subjectClass }"/></td>
				<td align="center"><input type="text" name="subjectCloseClass" id="subjectCloseClass" value="${requestScope.subject.subjectCloseClass }"/></td>
				<td align="center"><input type="text" name="subjectSemester" id="subjectSemester" value="${requestScope.subject.subjectSemester }"/></td>
				<td align="center"><select name="buildingId" id="buildingId">
							<option>강의동 선택</option>
							<c:choose>
							<c:when test="${requestScope.subject.building == null }">
								<option selected>없음</option>
							</c:when>
							<c:otherwise>
								<option>없음</option>
							</c:otherwise>
							</c:choose>
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
							<option>강의실 선택</option>
						<c:choose>
							<c:when test="${requestScope.subject.room == null }">
								<option value="0" selected>없음</option>
							</c:when>
							<c:otherwise>
								<option value=${requestScope.subject.room.roomId } selected>${requestScope.subject.room.roomName }</option>
							</c:otherwise>
							</c:choose>
					</select></td>
			</tr>
		</tbody>
	</table>
		<input type="hidden" name="subjectId" value="${requestScope.subject.subjectId }" id="subjectId"/>
		<input type="hidden" name="collegeId" value="${requestScope.subject.college.collegeId }"/>
		<input type="hidden" name="majorId" value="${requestScope.subject.majorId }"/>
		<input type="hidden" name="subjectRequest" value="${requestScope.subject.subjectRequest }"/>
			<input type="submit" id="submit" value="수정">
			<sec:csrfInput/>
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>