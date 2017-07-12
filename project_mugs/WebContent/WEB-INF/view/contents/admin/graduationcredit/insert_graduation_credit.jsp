<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>졸업 학점 등록</h2>
<hr>
	<form action="${initParam.rootPath }/admin/insertGraduationCreditController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
			학과 이름 : <input type="text" value="${param.majorName }" readonly/><br>
			적용 연도 : <input type="number" name="graduationCreditYear"/><br>
			교양필수 졸업학점 : <input type="number" name="gradVitalEduCredit"/><br>
			교양선택 졸업학점 : <input type="number" name="gradSelectEduCredit"/><br>
			전공필수 졸업학점 : <input type="number" name="gradVitalMajorCredit"/><br>
			전공선택 졸업학점 : <input type="number" name="gradSelectMajorCredit"/><br>
			<input type="hidden" name="majorId" value="${param.majorId }"/>
			<input type="submit" value="등록">
			<sec:csrfInput/>
	</form>
</body>