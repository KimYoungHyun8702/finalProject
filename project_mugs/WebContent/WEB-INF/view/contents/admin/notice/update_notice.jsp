<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지사항 수정</h2>
<hr>
<form id="insertForm" action="${initParam.rootPath }/admin/updateNoticeController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
	공지 내용<br><textarea cols="130" rows="20" name="noticeContent" >${requestScope.notice.noticeContent }</textarea><br>
	<input type="hidden" name="noticeId" value="${requestScope.notice.noticeId }"/>
	<input type="hidden" name="usersId" value="${requestScope.notice.usersId }"/>
				<input id="submit" type="submit" value="수정">
</form>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>