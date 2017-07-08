<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학과 수정</h2>
	<hr>
	<form action="${initParam.rootPath }/admin/updateMajorController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
		학과 이름 : <input type="text" name="majorName"/><br>
		<input type="hidden" name="collegeId" value="${requestScope.major.collegeId }"/>
		<input type="hidden" name="majorId" value="${requestScope.major.majorId }"/>
		<input type="submit" value="수정">
	</form>
</body>