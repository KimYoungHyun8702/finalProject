<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2>학점 포기 신청 현황</h2>
<hr>
	<table border="1">
		<thead>
			<tr>
				<td>신청 번호</td>
				<td>학과</td>
				<td>학생 학번</td>
				<td>학생 이름</td>
				<td>신청 학기</td>
				<td>신청 날짜</td>
				<td>신청 상태</td>
				<td>승인</td>
				<td>거절</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td>${list.CGUId }</td>
				<td>학과</td>
				<td>학생 학번</td>
				<td>학생 이름</td>
				<td>${list.CGUSemester }</td>
				<td>${list.CGUStartDate }</td>
				<td>${list.CGUState }</td>
				<td><button>승인</button></td>
				<td><button>거절</button></td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>
</body>