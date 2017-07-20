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
		var creditTbodyTxt = "<tr><td colspan='8' style='text-align:center'>포기할수 있는 학점이 없습니다.</td></tr>";
		$("#creditTbody").html(creditTbodyTxt);
	}

	if(creditGiveUpTbodySize == 0) {
		var creditGiveUpTbodyTxt = "<tr><td colspan='8' style='text-align:center'>학점포기신청내역이 없습니다.</td></tr>";
		$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
	}
	
	$(document).on("click", "#creditGiveUpBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addCreditGiveUp.do",
			"type":"post",
			"dataType":"json",
			"data":{'creditId':$(this).next().val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"success":function(map) {
				alert(map.msg);
				
				if(map.creditGiveUpList != "") {
					var creditGiveUpTbodyTxt = "";
					$.each(map.creditGiveUpList, function() {
						if(this.cgustate == '대기') {
							creditGiveUpTbodyTxt += "<tr><td>" + this.cguyear + 
							"</td><td>" + this.cgusemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" + this.credit.creditAcquire +
							"</td><td>" + this.credit.creditGrade + "</td><td>" + this.cgustate + 
							"</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" + "<input type='hidden' value=" + this.cguid + ">" + "</td></tr>";
						} else {
							creditGiveUpTbodyTxt += "<tr><td>" + this.cguyear + 
							"</td><td>" + this.cgusemester + "</td><td>" + this.credit.subject.subjectName +
							"</td><td>" + this.credit.subject.subjectType + "</td><td>" + this.credit.creditAcquire +
							"</td><td>" + this.credit.creditGrade + "</td><td>" + this.cgustate + 
							"</td><td>" + "</td></tr>";
						}
					});
					$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
				} else {
					var creditGiveUpTbodyTxt = "<tr><td colspan='8' style='text-align:center'>학점포기신청내역이 없습니다.</td></tr>";
					$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
				}
				
				if(map.creditList != "") {
					var creditTbodyTxt = "";
					$.each(map.creditList, function() {
						creditTbodyTxt += "<tr><td>" + this.creditYear + "</td><td>" + this.creditSemester + 
									"</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectType + 
									"</td><td>" + this.creditAcquire + "</td><td>" + this.creditGrade + 
									"</td><td>" + "<button id=" + "creditGiveUpBtn>" + "학점포기신청</button>" + 
									"<input type='hidden' value=" + this.creditId + ">" + "</td></tr>";
					});
					$("#creditTbody").html(creditTbodyTxt);	
				} else {
					var creditTbodyTxt = "<tr><td colspan='8' style='text-align:center'>포기할수 있는 학점이 없습니다.</td></tr>";
					$("#creditTbody").html(creditTbodyTxt);	
				}
			},
		});
	});
	
	$(document).on("click", "#cancelBtn", function() {
		if(confirm("정말 취소하시겠습니까?") == true) {
			$.ajax({
				"url":"/project_mugs/student/deleteCreditGiveUp.do",
				"type":"post",
				"dataType":"json",
				"data":{'CGUId':$(this).next().val(), '${_csrf.parameterName}':'${_csrf.token}'},
				"success":function(map) {
					alert(map.msg);

					if(map.creditGiveUpList != "") {
						var creditGiveUpTbodyTxt = "";
						$.each(map.creditGiveUpList, function() {
							if(this.cgustate == '대기') {
								creditGiveUpTbodyTxt += "<tr><td>" + this.cguyear + 
								"</td><td>" + this.cgusemester + "</td><td>" + this.credit.subject.subjectName +
								"</td><td>" + this.credit.subject.subjectType + "</td><td>" + this.credit.creditAcquire +
								"</td><td>" + this.credit.creditGrade + "</td><td>" + this.cgustate + 
								"</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>"+ "<input type='hidden' value=" + this.cguid + ">" + "</td></tr>";
							} else {
								creditGiveUpTbodyTxt += "<tr><td>" + this.cguyear + 
								"</td><td>" + this.cgusemester + "</td><td>" + this.credit.subject.subjectName +
								"</td><td>" + this.credit.subject.subjectType + "</td><td>" + this.credit.creditAcquire +
								"</td><td>" + this.credit.creditGrade + "</td><td>" + this.cgustate + 
								"</td><td>" + "</td></tr>";
							}
						});
						$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
					} else {
						var creditGiveUpTbodyTxt = "<tr><td colspan='8' style='text-align:center'>학점포기신청내역이 없습니다.</td></tr>";
						$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
					}
					
					if(map.creditList) {
						var creditTbodyTxt = "";
						$.each(map.creditList, function() {
							creditTbodyTxt += "<tr><td>" + this.creditYear + "</td><td>" + this.creditSemester + 
										"</td><td>" + this.subject.subjectName + "</td><td>" + this.subject.subjectType + 
										"</td><td>" + this.creditAcquire + "</td><td>" + this.creditGrade + 
										"</td><td>" + "<button id=" + "creditGiveUpBtn>" + "학점포기신청</button>" + 
										"<input type='hidden' value=" + this.creditId + ">" + "</td></tr>";
						});
						$("#creditTbody").html(creditTbodyTxt);	
					}
				},
			});
		} else {
			return;
		}
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
<h2>학점포기조회</h2>
<table>
	<thead id="creditGiveUpThead">
		<tr>
			<td>연도</td>
			<td>학기</td>
			<td>과목명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>등급</td>
			<td>진행상태</td>
			<td>취소버튼</td>
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

<h2>학점포기신청</h2>
<table>
	<thead id="creditThead">
		<tr>
			<td>연도</td>
			<td>학기</td>
			<td>과목명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>등급</td>
			<td>신청버튼</td>
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
</body>
</html>