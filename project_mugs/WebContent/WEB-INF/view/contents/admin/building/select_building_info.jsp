<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function room_update(){
	if($("#room").text() == ''){
		alert("먼저 등록하세요");
		return false
	}else{
		location.href='${initParam.rootPath }/admin/selectBuildingNameForUpdateController.do'
	}
}
	function Building_delete(buildingId){
		if(confirm("삭제하시겠습니까?")){
			location.href="${initParam.rootPath }/admin/deleteBuildingController.do?buildingId="+buildingId
		}else{
			return false;
		}
	};
</script>
</head>
<body>
<h2>건물 상세 조회</h2>
<c:if test="${sessionScope.buiinsertMessage != null}">
		<script type="text/javascript">
			alert("등록되었습니다");
		</script>
		<% session.removeAttribute("buiinsertMessage"); %>
</c:if>
<c:if test="${sessionScope.buiupdateMessage != null}">
		<script type="text/javascript">
			alert("수정되었습니다");
		</script>
		<% session.removeAttribute("buiupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.roominsertMessage != null}">
		<script type="text/javascript">
			alert("등록되었습니다");
		</script>
		<% session.removeAttribute("roominsertMessage"); %>
</c:if>
<c:if test="${sessionScope.roomupdateMessage != null}">
		<script type="text/javascript">
			alert("수정되었습니다");
		</script>
		<% session.removeAttribute("roomupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.roomdeleteMessage != null}">
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<% session.removeAttribute("roomdeleteMessage"); %>
</c:if>
<hr>
<table border="1">
		<thead>
			<tr>
				<td align="center">건물 ID</td>
				<td align="center">건물 이름</td>
				<td align="center">건물 전화번호</td>
				<td align="center">건물 주소</td>
				<td align="center">건물 사진</td>
				<td align="center">강의실 이름</td>
				
			</tr>
		</thead>
		<tbody>
				<tr>
					<td align="center">${requestScope.building.buildingId }</td>
					<td align="center">${requestScope.building.buildingName }</td>
					<td align="center">${requestScope.building.buildingPhoneNum }</td>
					<td align="center">${requestScope.building.buildingAddr }</td>
					<td align="center"> <img src ="${requestScope.building.buildingImg }" id="imageSpace" width="110px" height="100px"></td>
					<td id="room"><select><c:forEach items="${requestScope.building.roomList }" var="roomList">
								
									<option>${roomList.roomName }</option></c:forEach></select></td>
				</tr>
		</tbody>
	</table>
	<button id="update" onclick="location.href='${initParam.rootPath }/update_building.do?buildingId=${requestScope.building.buildingId }&buildingName=${requestScope.building.buildingName }&buildingImg=${requestScope.building.buildingImg }&buildingX=${requestScope.building.buildingX }&buildingY=${requestScope.building.buildingY }&buildingPhoneNum=${requestScope.building.buildingPhoneNum }&buildingAddr=${requestScope.building.buildingAddr }'">수정</button>
	<button id="delete" onclick="Building_delete(${requestScope.building.buildingId})">삭제</button>
	<button onclick="location.href='${initParam.rootPath }/admin/selectBuildingNameController.do'">강의실/연구실 등록</button>
	<button onclick="room_update()">강의실/연구실 수정 및 삭제</button>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
	
</body>