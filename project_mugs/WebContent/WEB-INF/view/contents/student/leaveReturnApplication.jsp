<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0"/>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var tbodySize = $("#tbody tr").length;
	
	if(tbodySize == 0) {
		var txt = "<tr><h2>휴/복학 신청내역이 없습니다.</h2></tr>"
	}
	
	$(document).on("click", "#leaveBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addLeaveReturnApplication.do",
			"data":({LRApplicationType:$(this).val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"dataType":"json",
			"type":"post",
			"success":function(list) {
				
			},
		});
	});
});
</script>
</head>
<body>
<h2>휴/복학신청</h2>
<table>
	<thead>
		<tr id="thead">
			<td>신청구분</td>
			<td>결재상태</td>
			<td>신청일자</td>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach items="${requestScope.leaveReturnApplicationList }" var="leaveReturnApplication">
			<tr>
				<td>${leaveReturnApplication.LRApplicationType }</td>
				<td>${leaveReturnApplication.LRApplicationState }</td>
				<td>${leaveReturnApplication.LRApplicationStartDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<button id="leaveBtn" value="휴학">휴학신청</button><button id="returnBtn" value="복학">복학신청</button>
</body>
</html>