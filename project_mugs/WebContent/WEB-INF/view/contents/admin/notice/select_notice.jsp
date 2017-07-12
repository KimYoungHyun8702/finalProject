<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지사항</h2>
<hr>
${requestScope.notice.usersName }
${requestScope.date }<br>
${requestScope.notice.noticeContent }
<br>

<button onclick="location.href='${initParam.rootPath }/admin/selectNoticeForUpdateController.do'">공지사항 수정</button><br>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>