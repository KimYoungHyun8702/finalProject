<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2>학생 등록</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertStudentController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	사진 : <input type="text" name="usersPhoto"/><br>
	학생 번호 : <input type="text" name="usersId" /><br>
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
	과정 구분 : <input type="text" name="stuCourse"/><br>
	병영 구분 : <input type="text" name="stuArmy"/><br>
	입학 일자 : <input type="date" name="stuAdmissionDate"/><br>
	졸업 일자 : <input type="date" name="stuGraduationDate"/><br>
	학적 구분 : <input type="text" name="stuRegisterState"/><br>
	학생 구분 : <input type="text" name="stuStudentState"/><br>
	학년 : <input type="number" name="stuGrade"/><br>
	졸업시험 패스 여부 : <input type="text" name="stuGraduationExam"/><br>
	조기졸업 대상 여부 : <input type="text" name="stuEarlyGraduation"/><br>
	학기 : <input type="text" name="stuSemester"/><br>
	소속 학과 
		<select name="majorId" id="majorId">
			<option>학과 선택</option>
			<c:forEach var="list" items="${requestScope.major }">
					<option value=${list.majorId }>${list.majorName }</option>
			</c:forEach>
		</select>
	복수 전공 
		<select name="majorDualId" id="majorDualId">
			<option>학과 선택</option>
			<option value="0">없음</option>
			<c:forEach var="list" items="${requestScope.majorDual }">
					<option value=${list.majorId }>${list.majorName }</option>
			</c:forEach>
		</select> <br>
	부전공 
		<select name="majorMinorId" id="majorMinorId">
			<option>학과 선택</option>
			<option value="0">없음</option>
			<c:forEach var="list" items="${requestScope.majorMinor }">
					<option value=${list.majorId }>${list.majorName }</option>
			</c:forEach>
		</select> <br>
			<input type="submit" value="등록">
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>