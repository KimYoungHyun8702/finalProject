<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학생 등록</h2>
	<hr>
	<form id="insertForm" action="${initParam.rootPath }/admin/updateStudentController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
	사진 : <input type="text" name="usersPhoto" value="${requestScope.info.usersPhoto }"/><br>
	학생 번호 : <input type="text" name="usersId" value="${requestScope.info.usersId }"/><br>
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
	과정 구분 : <input type="text" name="stuCourse" value="${requestScope.info.stuCourse }"/><br>
	병영 구분 : <input type="text" name="stuArmy" value="${requestScope.info.stuArmy }"/><br>
	입학 일자 : <input type="date" name="stuAdmissionDate" value="${requestScope.stuAdmissionDate }"/><br>
	졸업 일자 : <input type="date" name="stuGraduationDate" value="${requestScope.stuGraduationDate }"/><br>
	학적 구분 : <input type="text" name="stuRegisterState" value="${requestScope.info.stuRegisterState }"/><br>
	학생 구분 : <input type="text" name="stuStudentState" value="${requestScope.info.stuStudentState }"/><br>
	학년 : <input type="number" name="stuGrade" value="${requestScope.info.stuGrade }"/><br>
	졸업시험 패스 여부 : <input type="text" name="stuGraduationExam" value="${requestScope.info.stuGraduationExam }"/><br>
	조기졸업 대상 여부 : <input type="text" name="stuEarlyGraduation" value="${requestScope.info.stuEarlyGraduation }"/><br>
	학기 : <input type="text" name="stuSemester" value="${requestScope.info.stuSemester }"/><br>
	소속 학과 
		<select name="majorId" id="majorId">
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
		</select>
	복수 전공 
		<select name="majorDualId" id="majorDualId">
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
		</select> <br>
	부전공 
		<select name="majorMinorId" id="majorMinorId">
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
		</select> <br>
			<input type="submit" value="수정">
	</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>