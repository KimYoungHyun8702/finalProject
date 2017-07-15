<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${initParam.rootPath }/admin/updateBuildingController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
			<table border="1">
				<thead>
					<tr>
						<td align="center">건물 이름</td>
						<td align="center">건물 사진</td>
						<td align="center">건물 X좌표</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center"><input type="text" name="buildingName" value="${param.buildingName }"/></td>
						<td align="center"><input type="text" name="buildingImg" id="buildingImg" value="${param.buildingImg }"/></td>
						<td align="center"><input type="text" name="buildingX" id="buildingX" value="${param.buildingX }"/></td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<td align="center">건물 Y좌표</td>
						<td align="center">건물 전화번호</td>
						<td align="center">건물 주소</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center"><input type="text" name="buildingY" id="buildingY" value="${param.buildingY }"/></td>
						<td align="center"><input type="text" name="buildingPhoneNum" id="buildingPhoneNum" value="${param.buildingPhoneNum }"/></td>
						<td align="center"><input type="text" name="buildingAddr" id="buildingAddr" value="${param.buildingAddr }"/></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="buildingId" value="${param.buildingId }"/>
			<input type="submit" value="수정">
			<sec:csrfInput/>
	</form>
</body>