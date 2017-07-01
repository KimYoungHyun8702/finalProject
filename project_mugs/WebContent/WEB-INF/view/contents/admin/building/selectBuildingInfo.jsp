<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
<hr>
<table border="1">
		<thead>
			<tr>
				<td align="center">건물 ID</td>
				<td align="center">건물 이름</td>
				<td align="center">강의실 이름</td>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${requestScope.building.buildingId }</td>
					<td>${requestScope.building.buildingName }</td>
					<td><c:forEach items="${requestScope.building.roomList }" var="roomList">
					${roomList.roomId }</c:forEach></td>
				</tr>
		</tbody>
	</table>
	<button id="update" onclick="location.href='${initParam.rootPath }/updateBuilding.do?buildingId=${requestScope.building.buildingId }&buildingName=${requestScope.building.buildingName }'">수정</button>
	<button id="delete" onclick="Building_delete(${requestScope.building.buildingId})">삭제</button>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>