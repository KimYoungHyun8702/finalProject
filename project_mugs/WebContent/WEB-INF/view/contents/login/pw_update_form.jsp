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
<c:if test="${not empty message}">
	<script>
		alert("비밀번호 변경 완료");
		close();
	</script>
</c:if>
<c:if test="${not empty error}">
	<script>
		alert("${error}");
	</script>
</c:if>
<form action="${initParam.rootPath}/admin/pwChange.do" method="post">
		<input name="id" type="hidden" value="${user.usersId }">
		새로운비밀번호 : <input type="text" name="pw"><br>
		비밀번호 재입력 : <input type="text" name="chkPw"><br>
	<sec:csrfInput/>
	<button type="submit">확인</button>
</form>
</body>
</html>