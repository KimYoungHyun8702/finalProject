<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function approval(creditGiveUpId){
	if(confirm("승인하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/approveCreditGiveUpController.do?creditGiveUpId="+creditGiveUpId
	}else{
		return false;
	}
}
function refuse(creditGiveUpId){
	if(confirm("거절하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/refuseCreditGiveUpController.do?creditGiveUpId="+creditGiveUpId
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h2>학점 포기 신청 현황</h2>
<c:if test="${sessionScope.cguApproveMessage != null}">
		<script type="text/javascript">
			alert("승인되었습니다");
		</script>
		<% session.removeAttribute("cguApproveMessage"); %>
</c:if>
<c:if test="${sessionScope.cguRefuseMessage != null}">
		<script type="text/javascript">
			alert("거절되었습니다");
		</script>
		<% session.removeAttribute("cguRefuseMessage"); %>
</c:if>
<hr>
	<table border="1">
		<thead>
			<tr>
				<td align="center">신청 번호</td>
				<td align="center">학과</td>
				<td align="center">학생 학번</td>
				<td align="center">학생 이름</td>
				<td align="center">과목 이름</td>
				<td align="center">신청 학기</td>
				<td align="center">신청 날짜</td>
				<td align="center">신청 상태</td>
				<td align="center">승인</td>
				<td align="center">거절</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td align="center">${list.CGUId }</td>
				<td align="center">${list.majorName }</td>
				<td align="center">${list.usersId }</td>
				<td align="center">${list.usersName }</td>
				<td align="center">${list.subjectName }</td>
				<td align="center">${list.CGUSemester }</td>
				<td align="center">${list.CGUStartDate }</td>
				<td align="center">${list.CGUState }</td>
				<td align="center"><button onclick="approval('${list.CGUId }')">승인</button></td>
				<td align="center"><button onclick="refuse('${list.CGUId }')">거절</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>