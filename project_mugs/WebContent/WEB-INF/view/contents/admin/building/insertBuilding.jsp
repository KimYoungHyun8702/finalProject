<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${initParam.rootPath }/admin/insertBuildingController.do" method="post">
			건물 이름 : <input type="text" name="buildingName"/><br>
			<input type="submit" value="등록">
	</form>
</body>