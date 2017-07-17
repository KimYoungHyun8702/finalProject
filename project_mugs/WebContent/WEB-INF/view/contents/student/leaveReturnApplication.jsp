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
		var txt = "<tr><td colspan='4' style='text-align:center'>휴복학 신청내역이 없습니다.</td></tr>"
		$("#tbody").html(txt);
	}
	
	$(document).on("click", "#leaveBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addLeaveReturnApplication.do",
			"data":{'LRApplicationType':$(this).val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"type":"post",
			"success":function(map) {
				alert(map.msg);
				
				if(map.leaveReturnApplicationlist) {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						if(leaveReturnApplicationlist.LRApplicationStartDate == '대기') {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" +
							"<input type='hidden' value=" + this.LRApplicationId + ">" + "</td></tr>";
						} else {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
						}
					});
				$("#tbody").html(tbodyTxt);	
				}	
			},
		});
	});
	
	$(document).on("click", "#returnBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addLeaveReturnApplication.do",
			"data":{'LRApplicationType':$(this).val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"type":"post",
			"success":function(map) {
				alert(map.msg);
				
				if(map.leaveReturnApplicationlist) {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						if(leaveReturnApplicationlist.LRApplicationStartDate == '대기') {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" +
							"<input type='hidden' value=" + this.LRApplicationId + ">" + "</td></tr>";
						} else {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
						}
					});
				$("#tbody").html(tbodyTxt);	
				}	
			},
		});
	});
	
	$(document).on("click", "#cancelBtn", function() {
		$.ajax({
			"uri":"",
			"type":"post",
			"dataType":"json",
			"data":({LRApplicationId:$(this).next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"success":function(map) {
				if(map.leaveReturnApplicationlist) {
					var txt = "<tr><td colspan='4' style='text-align:center'>휴복학 신청내역이 없습니다.</td></tr>"
					$("#tbody").html(txt);
				} else {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
						"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
					});
					$("#tbody").html(tbodyTxt);	
				}
			},
		});
	});
});
</script>

<style type="text/css">
	table, td{
		border: 1px solid black;
	}

	table{
		width:700px;
		border-collapse: collapse;
	}

	td{
		padding: 5px;
	}
	
	#tbody{
		cursor: pointer;
	}
</style>

</head>
<body>
<h2>휴/복학신청</h2>
<table>
	<thead>
		<tr id="thead">
			<td>신청구분</td>
			<td>결재상태</td>
			<td>신청일자</td>
			<td>취소버튼</td>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach items="${requestScope.leaveReturnApplicationList }" var="leaveReturnApplication">
			<c:choose>
				<c:when test="${leaveReturnApplication.LRApplicationState eq '대기' }">
					<tr>
						<td>${leaveReturnApplication.LRApplicationType }</td>
						<td>${leaveReturnApplication.LRApplicationState }</td>
						<td>${leaveReturnApplication.LRApplicationStartDate }</td>
						<td><button id="cancelBtn">신청취소</button>
						<input type="hidden" value="${leaveReturnApplication.LRApplicationId }">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${leaveReturnApplication.LRApplicationType }</td>
						<td>${leaveReturnApplication.LRApplicationState }</td>
						<td>${leaveReturnApplication.LRApplicationStartDate }</td>
						<td></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>

휴복학 신청이 되지 않으시면 과사로 연락해주세요.<button id="leaveBtn" value="휴학">휴학신청</button><button id="returnBtn" value="복학">복학신청</button>
</body>
</html>