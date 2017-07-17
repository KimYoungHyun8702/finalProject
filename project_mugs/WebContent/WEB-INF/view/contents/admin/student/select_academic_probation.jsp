<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function expel(usersId){
	if(confirm("제적 처리 하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/expelProbationController.do?usersId="+usersId
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h2>학생 제적 현황</h2>
<c:if test="${sessionScope.expelMessage != null}">
		<script type="text/javascript">
			alert("제적 처리 되었습니다");
		</script>
		<% session.removeAttribute("expelMessage"); %>
</c:if>
<hr>
	<table border="1">
		<thead>
			<tr>
				<td align="center">학과</td>
				<td align="center">학생 학번</td>
				<td align="center">학생 이름</td>
				<td align="center">학사 경고 받은 학기</td>
				<td align="center">제적</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td align="center">${list.majorName }</td>
				<td align="center">${list.usersId }</td>
				<td align="center">${list.usersName }</td>
				<td align="center">
				<c:forEach items="${requestScope.year}" var="year">
				 	${year.probationYear} ${year.probationSemester }
				 </c:forEach>
				</td>
				<td align="center"><button onclick="expel('${list.usersId }')">제적 승인</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>