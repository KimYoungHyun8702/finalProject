<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${not empty message}">
		<script>alert("${message}");</script>
</c:if>

<form action="${initParam.rootPath}/admin/idFind.do" method="post">
		이름 : <input type="text" id="name" name="name" class="form-control"><br>
		주민등록번호 :<input type="number" id="rrn1" name="rrn1" class="form-control">-<input type="number" id="rrn2" name="rrn2" class="form-control"><br>
	<sec:csrfInput/>
	<button type="submit">확인</button>
</form>
