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
	var creditTbodySize = $("#creditTbody tr").length;
	var creditGiveUpTbodySize = $("#creditGiveUpTbody tr").length;
	var msg = "${msg}";
	
	if(creditTbodySize == 0) {
		var creditTbodyTxt = "<tr><td colspan='7' style='text-align:center'>" + msg + "</td></tr>"
		$("#creditTbody").html(creditTbodyTxt);
	}

	if(creditGiveUpTbodySize == 0) {
		var creditGiveUpTbodyTxt = "<tr><td colspan='8' style='text-align:center'>학점포기신청내역이 없습니다.</td>></tr>"
		$("#creditGiveUpTbody").html(creditTbodyTxt);
	}
	
	$(document).on("click", "#creditGiveUpBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addCreditGiveUp.do",
			"type":"post",
			"dataType":"json",
			"data":({creditId:$(this).next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"success":function(map) {
				alert(map.msg);
				
				if(map.creditGiveUpList) {
					var creditGiveUpTbodyTxt = "";
					$.each(map.creditGiveUpList, function() {
						if(this.CGUState == '대기') {
							creditGiveUpTbodyTxt += "<tr><td>" + this.CGUYear + 
							"</td><td>" + this.CGUSemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" +
							"</td><td>" + this.credit.creditAcquire + "</td><td>" + 
							"</td><td>" + this.credit.creditGrade + "</td><td>" + 
							"</td><td>" + this.CGUState + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" + 
							"<input type='hidden' value=" + this.CGUId + ">" + "</td></tr>";
						} else {
							creditGiveUpTbodyTxt += "<tr><td>" + this.CGUYear + 
							"</td><td>" + this.CGUSemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" +
							"</td><td>" + this.credit.creditAcquire + "</td><td>" + 
							"</td><td>" + this.credit.creditGrade + "</td><td>" + 
							"</td><td>" + this.CGUState + "</td><td>" + "</td></tr>";
						}
					});
					$("#creditGiveUpTbody").html(creditTbodyTxt);
				} else {
					var creditGiveUpTbodyTxt = "<tr><h2>학점포기신청내역이 없습니다.</h2></tr>"
					$("#creditGiveUpTbody").html(creditTbodyTxt);
				}
				
				if(map.creditList) {
					var creditTbodyTxt = "";
					$.each.(map.creditList, function() {
						creditTbodyTxt += "<tr><td>" + this.creditYear + "</td><td>" + this.creditSemester + 
									"</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectType + 
									"</td><td>" + this.creditAcquire + "</td><td>" + this.creditGrade + 
									"</td><td>" + "<button id=" + "creditGiveUpBtn>" + "신청취소</button>" + 
									"<input type='hidden' value=" + this.creditId + ">" + "</td></tr>";
					});
					$("#creditTbody").html(creditTbodyTxt);	
				}
			},
		});
	});
	
	$(document).on("click", "#cancelBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/deleteCreditGiveUp.do",
			"type":"post",
			"dataType":"json",
			"data":({CGUId:$(this).next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"success":function(map) {
				alert(map.msg);
				
				if(map.creditGiveUpList) {
					var creditGiveUpTbodyTxt = "";
					$.each(map.creditGiveUpList, function() {
						if(this.CGUState == '대기') {
							creditGiveUpTbodyTxt += "<tr><td>" + this.CGUYear + 
							"</td><td>" + this.CGUSemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" +
							"</td><td>" + this.credit.creditAcquire + "</td><td>" + 
							"</td><td>" + this.credit.creditGrade + "</td><td>" + 
							"</td><td>" + this.CGUState + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" + 
							"<input type='hidden' value=" + this.CGUId + ">" + "</td></tr>";
						} else {
							creditGiveUpTbodyTxt += "<tr><td>" + this.CGUYear + 
							"</td><td>" + this.CGUSemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" +
							"</td><td>" + this.credit.creditAcquire + "</td><td>" + 
							"</td><td>" + this.credit.creditGrade + "</td><td>" + 
							"</td><td>" + this.CGUState + "</td><td>" + "</td></tr>";
						}
					});
					$("#creditGiveUpTbody").html(creditTbodyTxt);
				} else {
					var creditGiveUpTbodyTxt = "<tr><h2>학점포기신청내역이 없습니다.</h2></tr>"
					$("#creditGiveUpTbody").html(creditTbodyTxt);
				}
				
				if(map.creditList) {
					var creditTbodyTxt = "";
					$.each.(map.creditList, function() {
						creditTbodyTxt += "<tr><td>" + this.creditYear + "</td><td>" + this.creditSemester + 
									"</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectType + 
									"</td><td>" + this.creditAcquire + "</td><td>" + this.creditGrade + 
									"</td><td>" + "<button id=" + "creditGiveUpBtn>" + "신청취소</button>" + 
									"<input type='hidden' value=" + this.creditId + ">" + "</td></tr>";
					});
					$("#creditTbody").html(creditTbodyTxt);	
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
		width:100%;
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
<h3>학점포기조회</h3>
<hr style="border: solid px black;">
<table border="2" style="border-color: black">
	<thead id="creditGiveUpThead">
		<tr>
			<th><input type='text' class='form-control' placeholder='연도' disabled></th>
			<th><input type='text' class='form-control' placeholder='학기' disabled></th>
			<th><input type='text' class='form-control' placeholder='과목명' disabled></th>
			<th><input type='text' class='form-control' placeholder='이수구분' disabled></th>
			<th><input type='text' class='form-control' placeholder='학점' disabled></th>
			<th><input type='text' class='form-control' placeholder='등급' disabled></th>
			<th><input type='text' class='form-control' placeholder='진행상태' disabled></th>
			<th><input type='text' class='form-control' placeholder='취소버튼' disabled></th>
		</tr>
	</thead>
	<tbody id="creditGiveUpTbody">
		<c:forEach items="${requestScope.creditGiveUpList }" var="creditGiveUpList">
			<c:choose>
				<c:when test="${creditGiveUpList.CGUState eq '대기' }">
					<tr>					
						<td>${creditGiveUpList.CGUYear }</td>
						<td>${creditGiveUpList.CGUSemester }</td>
						<td>${creditGiveUpList.credit.subject.subjectName }</td>
						<td>${creditGiveUpList.credit.subject.subjectType }</td>
						<td>${creditGiveUpList.credit.creditAcquire }</td>
						<td>${creditGiveUpList.credit.creditGrade }</td>
						<td>${creditGiveUpList.CGUState }</td>
						<td><button id="cancelBtn">취소버튼</button>
						<input type="hidden" value="${creditGiveUpList.CGUId }">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${creditGiveUpList.CGUYear }</td>
						<td>${creditGiveUpList.CGUSemester }</td>
						<td>${creditGiveUpList.credit.subject.subjectName }</td>
						<td>${creditGiveUpList.credit.subject.subjectType }</td>
						<td>${creditGiveUpList.credit.creditAcquire }</td>
						<td>${creditGiveUpList.credit.creditGrade }</td>
						<td>${creditGiveUpList.CGUState }</td>
						<td></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>
<br><br>

<h3>학점포기신청</h3>
<hr style="border: solid px black;">
<table border="2" style="border-color: black">
	<thead id="creditThead">
		<tr>	
			<th><input type='text' class='form-control' placeholder='연도' disabled></th>
			<th><input type='text' class='form-control' placeholder='학기' disabled></th>
			<th><input type='text' class='form-control' placeholder='과목명' disabled></th>
			<th><input type='text' class='form-control' placeholder='이수구분' disabled></th>
			<th><input type='text' class='form-control' placeholder='학점' disabled></th>
			<th><input type='text' class='form-control' placeholder='등급' disabled></th>
			<th><input type='text' class='form-control' placeholder='신청버튼' disabled></th>
		</tr>
	</thead>
	<tbody id="creditTbody">
		<c:forEach items="${requestScope.creditList }" var="creditList">
			<tr>					
				<td>${creditList.creditYear }</td>
				<td>${creditList.creditSemester }</td>
				<td>${creditList.subject.subjectName }</td>
				<td>${creditList.subject.subjectType }</td>
				<td>${creditList.creditAcquire }</td>
				<td>${creditList.creditGrade }</td>
				<td><button id="creditGiveUpBtn">학점포기신청</button>
				<input type="hidden" value="${creditList.creditId }">
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
</html>