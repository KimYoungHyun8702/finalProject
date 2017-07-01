<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Index</h1>

<form action="${initParam.rootPath }/student/login.do" method="post">
ID : <input type="text" name="id"><br>
PW : <input type="password" name="pw"><br>
<input type="submit" value="로그인">
</form>
<hr>
<a href="${initParam.rootPath }/gradeInquiry.do">성적 조회 -딘강</a>

</body>
</html>