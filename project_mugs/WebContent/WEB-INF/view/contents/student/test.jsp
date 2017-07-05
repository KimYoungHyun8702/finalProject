<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>학생정보조회</h1>
<body>
<form action="/project_mugs/student/getStudentInfoById.do" method="post">
	<input type="text" name="stuId" placeholder="찾을 id를 입력하세요">
	<input type="submit" value="조회">
</form>
</body>
</html>