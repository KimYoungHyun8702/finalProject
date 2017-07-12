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
		if($("#usersId").val() == "" || $("#usersId").val().trim() == 0 ){
			alert("학번을 입력하세요");
			return false;
		}else if($("#usersName").val() == "" || $("#usersName").val().trim() == 0 ){
			alert("이름을를 입력하세요")
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
<h2>학생 등록</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertStudentController.do" method="post" onsubmit="return check()">
	<table id="infoStudent" border="1">
		<thead>
			<tr>
				<td align="center">학번</td>
				<td align="center">이름</td>
				<td align="center">영문 이름</td>
				<td align="center">주민 번호</td>
				<td align="center">이메일</td>
				<td align="center">집 전화번호</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="number" name="usersId" id="usersId"/></td>
				<td align="center"><input type="text" name="usersName" id="usersName"/></td>
				<td align="center"><input type="text" name="usersEngName" id="usersEngName"/></td>
				<td align="center"><input type="text" name="usersRRN" id="usersRRN"/></td>
				<td align="center"><input type="email" name="usersEmail" id="usersEmail"/></td>
				<td align="center"><input type="text" name="usersPhoneNum" id="usersPhoneNum"/></td>
			</tr>
		</tbody>
		<thead>	
			<tr>
				<td align="center">핸드폰 번호 </td>
				<td align="center">국적</td>
				<td align="center">현 거주지 주소</td>
				<td align="center">본적지 주소</td>
				<td align="center">인증가능 상태</td>
				<td align="center">과정 구분</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="usersCellNum" id="usersCellNum"/></td>
				<td align="center"><select name="usersNational" id="usersNational" id="usersNational">
										<option>국적</option>
										<option>한국</option>
										<option>중국</option>
										<option>일본</option>
										<option>북한</option>
									</select><br></td>
				<td align="center"><input type="text" name="usersCurrentAddr" id="usersCurrentAddr"/></td>
				<td align="center"><input type="text" name="usersBornAddr" id="usersBornAddr"/></td>
				<td align="center"><input type="text" name="usersEnable" id="usersEnable"/></td>
				<td align="center"><input type="text" name="stuCourse" id="stuCourse"/></td>
			</tr>
		</tbody>
		<thead>
			<tr>
				<td align="center">병영 구분</td>
				<td align="center">입학 일자</td>
				<td align="center">학적 구분</td>
				<td align="center">학생 구분</td>
				<td align="center">학년</td>
				<td align="center">졸업시험 패스 여부</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="stuArmy" id="stuArmy"/></td>
				<td align="center"><input type="date" name="stuAdmissionDate" id="stuAdmissionDate"/></td>
				<td align="center"><input type="text" name="stuRegisterState" id="stuRegisterState"/></td>
				<td align="center"><input type="text" name="stuStudentState" id="stuStudentState"/></td>
				<td align="center"><input type="number" name="stuGrade" id="stuGrade"/></td>
				<td align="center"><input type="text" name="stuGraduationExam" id="stuGraduationExam"/></td>
			</tr>
		</tbody>
		<thead>
			<tr>
				<td align="center">조기졸업 대상 여부</td>
				<td align="center">학기</td>
				<td align="center">소속 학과</td>
				<td align="center">복수 전공</td>
				<td align="center">부전공</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><input type="text" name="stuEarlyGraduation" id="stuEarlyGraduation"/></td>
				<td align="center"><input type="text" name="stuSemester" id="stuSemester"/></td>
				<td align="center"><select name="majorId" id="majorId">
										<option>학과 선택</option>
											<c:forEach var="list" items="${requestScope.major }">
												<option value=${list.majorId }>${list.majorName }</option>
											</c:forEach>
					    		   </select></td>
				<td align="center"><select name="majorDualId" id="majorDualId">
										<option>학과 선택</option>
										<option value="0">없음</option>
											<c:forEach var="list" items="${requestScope.majorDual }">
												<option value=${list.majorId }>${list.majorName }</option>
											</c:forEach>
									</select> <br></td>
				<td align="center"><select name="majorMinorId" id="majorMinorId">
										<option>학과 선택</option>
										<option value="0">없음</option>
											<c:forEach var="list" items="${requestScope.majorMinor }">
												<option value=${list.majorId }>${list.majorName }</option>
											</c:forEach>
									</select> <br></td>
			</tr>
		</tbody>
	</table>
	<input type="submit" id="submit" value="등록">
			<sec:csrfInput/>
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>