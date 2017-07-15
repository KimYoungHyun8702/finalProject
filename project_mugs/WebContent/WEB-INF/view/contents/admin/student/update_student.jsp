<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
	
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

</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#usersId").val() == "" || $("#usersId").val().trim() == 0 ){
		alert("학번을 입력하세요");
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
	}else if($("#stuCourse").val() == "" || $("#stuCourse").val().trim() == 0){
		alert("과정 구분를 입력하세요")
		return false;
	}else if(!$("#stuAdmissionDate").val()){
		alert("입학 일자를 입력하세요")
		return false;
	}else if(!$("#stuRegisterState").val() || $("#stuRegisterState").val().trim() == 0){
		alert("학적 구분을 입력하세요")
		return false;
	}else if(!$("#stuStudentState").val() || $("#stuStudentState").val().trim() == 0){
		alert("학생 구분을 입력하세요")
		return false;
	}else if(!$("#stuGrade").val() || $("#stuGrade").val().trim() == 0){
		alert("학년을 입력하세요")
		return false;
	}else if(!$("#stuGraduationExam").val() || $("#stuGraduationExam").val().trim() == 0){
		alert("졸업시험 패스 여부를 입력하세요")
		return false;
	}else if(!$("#stuEarlyGraduation").val() || $("#stuGraduationExam").val().trim() == 0){
		alert("조기 졸업 대상여부를 입력하세요")
		return false;
	}else if(!$("#stuSemester").val() || $("#stuGraduationExam").val().trim() == 0){
		alert("학기를 입력하세요")
		return false;
	}else if($("#majorId").val() == "학과 선택"){
		alert("소속 학과를 입력하세요")
		return false;
	}else{
		return confirm("등록하시겠습니까 ?")
	}
};
</script>
</head>
<body>
<h3>학생 등록</h3>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/updateStudentController.do" method="post" onsubmit="return check()">
	
	<table id="infoStudent" border="1">
		<thead id="thead">
	   		<tr>
	   			<th align="center"><input type="text" class="form-control" placeholder="학번" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="이름" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="영문 이름" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="주민 번호" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="이메일 번호" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="집 전화번호" disabled></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="number" name="usersId" value="${requestScope.info.usersId }" id="usersId" readonly/></td>
				<td align="center"><input type="text" name="usersName" value="${requestScope.info.usersName }" id="usersName"/></td>
				<td align="center"><input type="text" name="usersEngName" value="${requestScope.info.usersEngName }" id="usersEngName"/></td>
				<td align="center"><input type="text" name="usersRRN" value="${requestScope.info.usersRRN }" id="usersRRN"/></td>
				<td align="center"><input type="email" name="usersEmail" value="${requestScope.info.usersEmail }" id="usersEmail"/></td>
				<td align="center"><input type="text" name="usersPhoneNum" value="${requestScope.info.usersPhoneNum }" id="usersPhoneNum"/></td>
			</tr>
		</tbody>
		<thead id="thead">
	   		<tr>
				<th align="center"><input type="text" class="form-control" placeholder="핸드폰 번호" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="국적" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="현 거주지 주소" disabled></th>
				<th align="center" ><input type="text" class="form-control" placeholder="본적지 주소" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="인증가능 상태" disabled></th>
				<th align="center" ><input type="text" class="form-control" placeholder="과정 구분" disabled></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="usersCellNum" value="${requestScope.info.usersCellNum }" id="usersCellNum"/></td>
				<td align="center"><select name="usersNational" id="usersNational ">
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
								</select><br></td>
				<td align="center"><input type="text" name="usersCurrentAddr" value="${requestScope.info.usersCurrentAddr }" id="usersCurrentAddr"/></td>
				<td align="center"><input type="text" name="usersBornAddr" value="${requestScope.info.usersBornAddr }" id="usersBornAddr"/></td>
				<td align="center"><input type="text" name="usersEnable" value="${requestScope.info.usersEnable }" id="usersEnable"/></td>
				<td align="center"><input type="text" name="stuCourse" value="${requestScope.info.stuCourse }" id="stuCourse"/></td>
			</tr>
		</tbody>
		<thead id="thead">
	   		<tr>
				<th align="center" ><input type="text" class="form-control" placeholder="병영 구분" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="입학 일자" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="졸업 일자" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="학적 구분" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="학생 구분" disabled></th>
				<th align="center" ><input type="text" class="form-control" placeholder="학년" disabled></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				
				<td align="center"><input type="text" name="stuArmy" value="${requestScope.info.stuArmy }" id="stuArmy"/></td>
				<td align="center"><input type="date" name="stuAdmissionDate" value="${requestScope.stuAdmissionDate }" id="stuAdmissionDate"/></td>
				<td align="center"><input type="date" name="stuGraduationDate" value="${requestScope.stuGraduationDate }" id="stuGraduationDate"/></td>
				<td align="center"><input type="text" name="stuRegisterState" value="${requestScope.info.stuRegisterState }" id="stuRegisterState"/></td>
				<td align="center"><input type="text" name="stuStudentState" value="${requestScope.info.stuStudentState }" id="stuStudentState"/></td>
				<td align="center"><input type="number" name="stuGrade" value="${requestScope.info.stuGrade }" id="stuGrade"/></td>
			</tr>
		</tbody>
		<thead id="thead">
	   		<tr>
				<th align="center"><input type="text" class="form-control" placeholder="졸업시험 패스 여부" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="조기졸업 대상 여부" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="학기" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="소속 학과" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="복수 전공" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="부전공" disabled></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="stuGraduationExam" value="${requestScope.info.stuGraduationExam }" id="stuGraduationExam"/></td>
				<td align="center"><input type="text" name="stuEarlyGraduation" value="${requestScope.info.stuEarlyGraduation }" id="stuEarlyGraduation"/></td>
				<td align="center"><input type="text" name="stuSemester" value="${requestScope.info.stuSemester }" id="stuSemester"/></td>
				<td align="center"><select name="majorId" id="majorId">
									<option>학과 선택</option>
									<c:choose>
											<c:when test="${requestScope.major == null }">
												<option value="0" selected>없음</option>
											</c:when>
											<c:otherwise>
												<option value="0">없음</option>
											</c:otherwise>
										</c:choose>
									<c:forEach var="list" items="${requestScope.majorList }">
										<c:choose>
											<c:when test="${requestScope.major.majorId == list.majorId }">
												<option value=${list.majorId } selected>${list.majorName }</option>
											</c:when>
											<c:otherwise>
												<option value=${list.majorId }>${list.majorName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select></td>
				<td align="center"><select name="majorDualId" id="majorDualId">
									<option>학과 선택</option>
									<c:choose>
											<c:when test="${requestScope.majorDual == null }">
												<option value="0" selected>없음</option>
											</c:when>
											<c:otherwise>
												<option value="0">없음</option>
											</c:otherwise>
										</c:choose>
									<c:forEach var="list" items="${requestScope.majorMinorList }">
										<c:choose>
											<c:when test="${requestScope.majorDual.majorDualId == list.majorId }">
												<option value=${list.majorId } selected>${list.majorName }</option>
											</c:when>
											<c:otherwise>
												<option value=${list.majorId }>${list.majorName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select> </td>
				<td align="center"><select name="majorMinorId" id="majorMinorId">
									<option>학과 선택</option>
										<c:choose>
												<c:when test="${requestScope.majorMinor == null }">
													<option value="0" selected>없음</option>
												</c:when>
												<c:otherwise>
													<option value="0">없음</option>
												</c:otherwise>
											</c:choose>
										<c:forEach var="list" items="${requestScope.majorDualList }">
											<c:choose>
												<c:when test="${requestScope.majorMinor.majorMinorId == list.majorId }">
													<option value=${list.majorId } selected>${list.majorName }</option>
												</c:when>
												<c:otherwise>
													<option value=${list.majorId }>${list.majorName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select></td>
			</tr>
		</tbody>
	</table>


			<input type="hidden" name="usersPassword" value="${requestScope.info.usersPassword }"/>
			<center><input type="submit" value="수정"></center><br><br>
			<sec:csrfInput/>
	</form>
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>