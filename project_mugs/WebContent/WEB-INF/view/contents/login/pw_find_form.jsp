<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty message}">
		<script>alert("${message}");</script>
</c:if>

<form action="${initParam.rootPath}/admin/pwFind.do" method="post">
		학번ID : <input type="text" name="id"><br>
		이름 : <input type="text" name="name"><br>
		주민등록번호 :<input type="number" name="rrn1">-<input type="number" name="rrn2"><br>
	<sec:csrfInput/>
	<button type="submit">확인</button>
</form>
