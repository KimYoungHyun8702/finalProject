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
<h2>강의실 등록</h2>
<hr>
<form action="${initParam.rootPath }/admin/insertRoomController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
<select name="buildingId" id="buildingId" >
<option>강의동 선택</option>
<c:forEach var="list" items="${requestScope.list }">
<option value=${list.buildingId }>
${list.buildingName }
</option> 
</c:forEach>
</select>
강의실 이름 : <input type="text" name="roomName"/><br>
<input type="submit" value="등록">
<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>

</body>