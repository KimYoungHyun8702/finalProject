<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function approval(LRApplicationId){
	if(confirm("승인하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/approveLeaveReturnApplicationController.do?LRApplicationId="+LRApplicationId
	}else{
		return false;
	}
}
function refuse(LRApplicationId){
	if(confirm("거절하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/refuseLeaveReturnApplicationController.do?LRApplicationId="+LRApplicationId
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h2>휴.복학 신청 현황</h2>
<hr>
<c:if test="${sessionScope.lrApproveMessage != null}">
		<script type="text/javascript">
			alert("승인되었습니다");
		</script>
		<% session.removeAttribute("lrApproveMessage"); %>
</c:if>
<c:if test="${sessionScope.lrRefuseMessage != null}">
		<script type="text/javascript">
			alert("거절되었습니다");
		</script>
		<% session.removeAttribute("lrRefuseMessage"); %>
</c:if>
<table border="1">
		<thead>
			<tr>
				<td align="center">신청 번호</td>
				<td align="center">학과</td>
				<td align="center">학생 학번</td>
				<td align="center">학생 이름</td>
				<td align="center">신청 타입</td>
				<td align="center">신청 날짜</td>
				<td align="center">신청 상태</td>
				<td align="center">승인</td>
				<td align="center">거절</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td align="center">${list.LRApplicationId }</td>
				<td align="center">${list.majorName }</td>
				<td align="center">${list.usersId }</td>
				<td align="center">${list.usersName }</td>
				<td align="center">${list.LRApplicationType }</td>
				<td align="center">${list.LRApplicationStartDate }</td>
				<td align="center">${list.LRApplicationState }</td>
				<td align="center"><button onclick="approval('${list.LRApplicationId }')">승인</button></td>
				<td align="center"><button onclick="refuse('${list.LRApplicationId }')">거절</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>