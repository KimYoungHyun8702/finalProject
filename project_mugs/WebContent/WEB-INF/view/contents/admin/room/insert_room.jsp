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
	if($("#buildingId").val() == '강의동 선택'){
		alert("강의동을 선택해주세요");
		return false;
	}else if($("#roomName").val() == '' || $("#roomName").val().trim() == 0	){
		alert("강의실 이름을 입력하세요");
		return false
	}else{
		return confirm("등록하시겠습니까 ?");
	}
}
</script>
</head>
<body>
<h2>강의실 등록</h2>
<hr>
<form action="${initParam.rootPath }/admin/insertRoomController.do" method="post" onsubmit="return check()">
<select name="buildingId" id="buildingId" >
<option>강의동 선택</option>
<c:forEach var="list" items="${requestScope.list }">
<option value=${list.buildingId }>
${list.buildingName }
</option> 
</c:forEach>
</select>
강의실 이름 : <input type="text" name="roomName" id="roomName"/><br>
<input type="submit" value="등록">
<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>

</body>