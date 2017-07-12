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
function room_delete(roomId){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteRoomController.do?roomId="+roomId
	}else{
		return false;
	}
};
$(document).ready(function(){	
	$("#buildingId").on("change",function(){
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectRoomByReferenceController.do",
			"data":"buildingId="+$("#buildingId").val(),
			"success":function(result){
				$("select#roomId").empty().append("<option>강의실</option>");
				$.each(result,function(){
					$("select#roomId").append($("<option value="+this.roomId+">").append(this.roomName));
				})
			}
		})//end of ajax
	})//end of first_category
});//end of document
</script>
</head>
<body>
<h2>강의실 수정</h2>
<hr>

<form action="${initParam.rootPath }/admin/updateRoomController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
<select name="buildingId" id="buildingId" >
<option>강의동 선택</option>
<c:forEach var="list" items="${requestScope.list }">
<option value=${list.buildingId }>
${list.buildingName }
</option> 
</c:forEach>
</select>
<select name="roomId" id="roomId">
	<option>강의실</option>
</select>
변경된 이름 : <input type="text" name="roomName"/><br>
<input type="submit" value="수정">
<input type="button" id="delete" onclick="room_delete($('#roomId').val())" value="삭제"/>
<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>