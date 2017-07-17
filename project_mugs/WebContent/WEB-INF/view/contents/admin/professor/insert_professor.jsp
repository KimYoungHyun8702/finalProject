<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input{
	text-align:center;
}
table{
	width:700px;
	
}
th {
	bgcolor:peru;
	
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}
select{
	width:150px;
	height: 35px;
	padding: 5px;
}
#product_info_layer{
	width:700px;
	border: 1px solid gray;
	padding:5px;
	display: none;/*최초 로딩시에는 안보이도록 처리*/
}
#tbody{
	cursor: pointer;
}
.form-controler {
	color:black;
}
h3{
	font-family:돋움체;
}
option {
	height:25px;
}

</style>
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#usersId").val() == "" || $("#usersId").val().trim() == 0 ){
		alert("교수 번호를 입력하세요");
		return false;
	}else if($("#usersName").val() == "" || $("#usersName").val().trim() == 0 ){
		alert("이름을 입력하세요")
		return false;
	}else if($("#usersEngName").val() == "" || $("#usersEngName").val().trim() == 0){
		alert("영어 이름을 입력하세요")
		return false;
	}else if($("#usersRRN").val() == "" || $("#usersRRN").val().trim() == 0){
		alert("주민번호를 입력하세요")
		return false;
	}else if($("#usersEmail").val() == "" || $("#usersEmail").val().trim() == 0){
		alert("이메일을 입력하세요")
		return false;
	}else if($("#usersPhoneNum").val() == "" || $("#usersPhoneNum").val().trim() == 0){
		alert("집 전화번호를 입력하세요")
		return false;
	}else if($("#usersCellNum").val() == "" || $("#usersCellNum").val().trim() == 0){
		alert("핸드폰 번호를 입력하세요")
		return false;
	}else if($("#usersNational").val() == "국적" ){
		alert("국적를 입력하세요")
		return false;
	}else if($("#usersCurrentAddr").val() == "" || $("#usersCurrentAddr").val().trim() == 0){
		alert("현 거주지 주소를 입력하세요")
		return false;
	}else if($("#usersBornAddr").val() == "" || $("#usersBornAddr").val().trim() == 0){
		alert("본적지 주소를 입력하세요")
		return false;
	}else if($("#usersEnable").val() == "" || $("#usersEnable").val().trim() == 0){
		alert("인증가능 상태를 입력하세요")
		return false;
	}else if($("#proUniversity").val() == "" || $("#proUniversity").val().trim() == 0){
		alert("졸업 대학을 입력하세요")
		return false;
	}else if($("#proGradSchool").val() == "" || $("#proGradSchool").val().trim() == 0){
		alert("졸업 대학원을 입력하세요")
		return false;
	}else if($("#majorId").val() == "학과 선택"){
		alert("학과를 선택하세요");
		return false;
	}else if($("#proRoomOfficeId").val() == "교수실 선택"){
		alert("교수실을 선택하세요");
		return false;
	}else if($("#proRoomLaboratoryId").val() == "연구실 선택"){
		alert("연구실을 선택하세요");
		return false;
	}else{
		return confirm("등록하시겠습니까 ?")
	}
};
$(document).ready(function(){
	$("#office").on("change",function(){
		if($("#office").val() == "강의동 선택"){
			$("#proRoomOfficeId").empty().append("<option>교수실 선택</option>");
		}else if($("#office").val() == "없음"){
			$("#proRoomOfficeId").empty().append("<option value='0'>없음</option>");
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
			$("#proRoomLaboratoryId").empty().append("<option value='0'>없음</option>");
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
<c:if test="${requestScope.error != null}">
	<script type="text/javascript">
		alert("교수 번호가 중복되었습니다");
	</script>
</c:if>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertProfessorController.do" method="post" onsubmit="return check()">
		<center><table id="infoProfessor" border="1">
			<thead>
				<tr class="filters">
					<th align="center"><input type="text" class="form-control" placeholder="교수번호" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="교수이름" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="영문이름" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="주민번호" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="이메일" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="집 전화번호" disabled></th>
				</tr>
			</thead>
			<tbody id="infoTbody1">
				<tr class="filters">
					<td align="center"><input type="number" name="usersId" id="usersId" value="${param.usersId }"/></td>
					<td align="center"><input type="text" name="usersName" id="usersName" value="${param.usersName }"/></td>
					<td align="center"><input type="text" name="usersEngName" id="usersEngName" value="${param.usersEngName }"/></td>
					<td align="center"><input type="text" name="usersRRN" id="usersRRN" value="${param.usersRRN }"/></td>
					<td align="center"><input type="email" name="usersEmail" id="usersEmail" value="${param.usersEmail }"/></td>
					<td align="center"><input type="text" name="usersPhoneNum" id="usersPhoneNum" value="${param.usersPhoneNum }"/></td>
				</tr>
			</tbody>

			<thead>
				<tr>
		            <tr class="filters">
			            <th align="center"><input type="text" class="form-control" placeholder="핸드폰 번호" disabled></th>
			            <th align="center"><input type="text" class="form-control" placeholder="국적" disabled></th>
			            <th align="center"><input type="text" class="form-control" placeholder="현 거주지 주소" disabled></th>
			            <th align="center" ><input type="text" class="form-control" placeholder="본적지 주소" disabled></th>
			            <th align="center"><input type="text" class="form-control" placeholder="인증가능 상태" disabled></th>
						 <th align="center"><input type="text" class="form-control" placeholder="졸업대학" disabled></th>
				</tr>
			</thead>

			<tbody id="infoTbody2">
				<tr class="filters">
					<td align="center"><input type="number" name="usersCellNum" id="usersCellNum" value="${param.usersCellNum }"/></td>
					<td align="center"><select name="usersNational" id="usersNational">
									<option>국적</option>
									<c:choose>
										<c:when test="${param.usersNational == '한국' }">
											<option selected>한국</option>
										</c:when>
										<c:otherwise>
											<option>한국</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${param.usersNational == '중국' }">
											<option selected>중국</option>
										</c:when>
										<c:otherwise>
											<option>중국</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${param.usersNational == '일본' }">
											<option selected>일본</option>
										</c:when>
										<c:otherwise>
											<option>일본</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${param.usersNational == '북한' }">
											<option selected>북한</option>
										</c:when>
										<c:otherwise>
											<option>북한</option>
										</c:otherwise>
									</c:choose>
									</select></td>
					<td align="center"><input type="text" name="usersCurrentAddr" id="usersCurrentAddr" value="${param.usersCurrentAddr }"/></td>
					<td align="center"><input type="text" name="usersBornAddr" id="usersBornAddr" value="${param.usersBornAddr }"/></td>
					<td align="center"><input type="text" name="usersEnable" id="usersEnable" value="${param.usersEnable }"/></td>
					<td align="center"><input type="text" name="proUniversity" id="proUniversity" value="${param.proUniversity }"/></td>
				</tr>
			</tbody>

			<thead>
				<tr class="filters">
					<th align="center"><input type="text" class="form-control" placeholder="졸업 대학원" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="교수실 전화번호" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="연구실 전화번호" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="소속학과" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="교수실" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="연구실" disabled></th>
				</tr>
			</thead>
			<tbody id="infoTbody3">
				<tr>
					<td align="center"><input type="number" name="proGradSchool" id="proGradSchool" value="${param.proGradSchool }"/></td>
					<td align="center"><input type="text" name="proOfficePhoneNum" id="proOfficePhoneNum" value="${param.proOfficePhoneNum }"/></td>
					<td align="center"><input type="text" name="proLaboratoryPhoneNum" id="proLaboratoryPhoneNum" value="${param.proLaboratoryPhoneNum }"/></td>
					<td align="center"><select name="majorId" id="majorId">
							<option>학과 선택</option>
							<c:choose>
								<c:when test="${param.majorId == 0 }">
									<option value="0" selected>없음</option>
								</c:when>
								<c:otherwise>
									<option value="0">없음</option>
								</c:otherwise>
							</c:choose>
							<c:forEach var="list" items="${requestScope.major }">
								
								<c:choose>
									<c:when test="${list.majorId == param.majorId }">
										<option value=${list.majorId } selected>${list.majorName }</option>
									</c:when>
									<c:otherwise>
										<option value=${list.majorId }>${list.majorName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
					</select></td>
					<td align="center"><select name="proRoomOfficeId"
						id="proRoomOfficeId">
							<option>교수실 선택</option>
							<c:choose>
								<c:when test="${param.proRoomOfficeId == 0 }">
									<option value="0" selected>없음</option>
								</c:when>
								<c:otherwise>
									<option value="0">없음</option>
								</c:otherwise>
							</c:choose>
							<c:forEach var="list" items="${requestScope.office }">
								<c:forEach items="${list.roomList}" var="list">
									<c:choose>
										<c:when test="${list.roomId == param.proRoomOfficeId }">
											<option value=${list.roomId } selected>${list.roomName }</option>
										</c:when>
										<c:otherwise>
											<option value=${list.roomId }>${list.roomName }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:forEach>
					</select></td>
					<td align="center"><select name="proRoomLaboratoryId"
						id="proRoomLaboratoryId">
							<option>연구실 선택</option>
							<c:choose>
								<c:when test="${param.proRoomLaboratoryId == 0 }">
									<option value="0" selected>없음</option>
								</c:when>
								<c:otherwise>
									<option value="0">없음</option>
								</c:otherwise>
							</c:choose>
							<c:forEach var="list" items="${requestScope.laboratory }">
								<c:forEach items="${list.roomList}" var="list">
									<c:choose>
										<c:when test="${list.roomId == param.proRoomLaboratoryId }">
											<option value=${list.roomId } selected>${list.roomName }</option>
										</c:when>
										<c:otherwise>
											<option value=${list.roomId }>${list.roomName }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:forEach>
					</select></td>
				</tr>
			</tbody>
		</table></center><br><br>
		 <center><input type="submit" id="submit" value="등록"></center>
         <sec:csrfInput/>
   </form><br><br>
   <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>