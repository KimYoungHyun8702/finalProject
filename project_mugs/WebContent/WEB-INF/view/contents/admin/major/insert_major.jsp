<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>학과 등록</h2>
	<hr>
	
	<form id="insertForm" action="${initParam.rootPath }/admin/insertMajorController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	<select name="collegeId" id="collegeId">
		<option>단과대학 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list.collegeId }>${list.collegeName }</option>
		</c:forEach>
	</select>
			학과 이름 : <input type="text" name="majorName"/><br>
			<input type="submit" value="등록">
			<sec:csrfInput/>
	</form>
</body>