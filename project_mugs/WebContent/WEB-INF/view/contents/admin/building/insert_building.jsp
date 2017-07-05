<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>건물 등록</h2>
<hr>
	<form action="${initParam.rootPath }/admin/insertBuildingController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
			건물 이름 : <input type="text" name="buildingName"/><br>
			<input type="submit" value="등록">
	</form>
</body>