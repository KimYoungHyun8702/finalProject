<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="${initParam.rootPath }/admin/updateBuildingController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
			건물 이름 : <input type="text" name="buildingName" value="${param.buildingName }"/><br>
			<input type="hidden" name="buildingId" value="${param.buildingId }"/>
			<input type="submit" value="수정">
	</form>
</body>