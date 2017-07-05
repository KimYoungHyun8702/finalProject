<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery.js"></script>
</head>
<body>
	<h2>건물 조회</h2>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<td align="center">건물 ID</td>
				<td align="center">건물 이름</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
				<tr>
					<td>${list.buildingId }</td>
					<td><a href="${initParam.rootPath }/admin/selectBuildingByIdController.do?buildingId=${list.buildingId}">${list.buildingName }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>