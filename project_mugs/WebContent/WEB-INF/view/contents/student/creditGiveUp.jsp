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
		var creditTbodyTxt = "<tr><td colspan='8' style='text-align:center'>포기할수 있는 학점이 없습니다.</td></tr>"
		$("#creditTbody").html(creditTbodyTxt);
	}

	if(creditGiveUpTbodySize == 0) {
		var creditGiveUpTbodyTxt = "<tr><td colspan='8' style='text-align:center'>학점포기신청내역이 없습니다.</td></tr>"
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
				
				if(map.creditGiveUpList) {
					var creditGiveUpTbodyTxt = "";
					$.each(map.creditGiveUpList, function() {
						if(this.cgustate == '대기') {
							creditGiveUpTbodyTxt += "<tr><td style='text-align:center'>" + this.cguyear + 
							"</td><td style='text-align:center'>" + this.cgusemester + "</td><td style='text-align:center'>" + this.credit.subject.subjectName +
							"</td><td style='text-align:center'>" + this.credit.subject.subjectType + "</td><td style='text-align:center'>" + this.credit.creditAcquire +
							"</td><td style='text-align:center'>" + this.credit.creditGrade + "</td><td style='text-align:center'>" + this.cgustate + 
							"</td><td style='text-align:center'>" + "<button id=" + "cancelBtn style='text-align:center'>" + "신청취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.cguid + ">" + "</td></tr>";
						} else {
							creditGiveUpTbodyTxt += "<tr><td style='text-align:center'>" + this.cguyear + 
							"</td><td style='text-align:center'>" + this.cgusemester + "</td><td style='text-align:center'>" + this.credit.subject.subjectName +
							"</td><td style='text-align:center'>" + this.credit.subject.subjectType + "</td><td style='text-align:center'>" + this.credit.creditAcquire +
							"</td><td style='text-align:center'>" + this.credit.creditGrade + "</td><td style='text-align:center'>" + this.cgustate + 
							"</td><td style='text-align:center'>" + "</td></tr>";
						}
					});
					$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
				} else {
					var creditGiveUpTbodyTxt = "<tr><h2>학점포기신청내역이 없습니다.</h2></tr>";
					$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
				}
				
				if(map.creditList) {
					var creditTbodyTxt = "";
					$.each(map.creditList, function() {
						creditTbodyTxt += "<tr><td style='text-align:center'>" + this.creditYear + "</td><td style='text-align:center'>" + this.creditSemester + 
									"</td><td style='text-align:center'>" + this.subject.subjectName + "</td><td style='text-align:center'>" + this.subject.subjectType + 
									"</td><td style='text-align:center'>" + this.creditAcquire + "</td><td style='text-align:center'>" + this.creditGrade + 
									"</td><td style='text-align:center'>" + "<button id=" + "creditGiveUpBtn style='text-align:center'>" + "학점포기신청</button>" + 
									"<input style='text-align:center' type='hidden' value=" + this.creditId + ">" + "</td></tr>";
					});
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
					
					if(map.creditGiveUpList) {
						var creditGiveUpTbodyTxt = "";
						$.each(map.creditGiveUpList, function() {
							if(this.cgustate == '대기') {
								creditGiveUpTbodyTxt += "<tr><td style='text-align:center'>" + this.cguyear + 
								"</td><td style='text-align:center'>" + this.cgusemester + "</td><td style='text-align:center'>" + this.credit.subject.subjectName +
								"</td><td style='text-align:center'>" + this.credit.subject.subjectType + "</td><td style='text-align:center'>" + this.credit.creditAcquire +
								"</td><td style='text-align:center'>" + this.credit.creditGrade + "</td><td style='text-align:center'>" + this.cgustate + 
								"</td><td style='text-align:center'>" + "<button id=" + "cancelBtn style='text-align:center'>" + "신청취소</button>"+ "<input style='text-align:center' type='hidden' value=" + this.cguid + ">" + "</td></tr>";
							} else {
								creditGiveUpTbodyTxt += "<tr><td style='text-align:center'>" + this.cguyear + 
								"</td><td style='text-align:center'>" + this.cgusemester + "</td><td style='text-align:center'>" + this.credit.subject.subjectName +
								"</td><td style='text-align:center'>" + this.credit.subject.subjectType + "</td><td style='text-align:center'>" + this.credit.creditAcquire +
								"</td><td style='text-align:center'>" + this.credit.creditGrade + "</td><td style='text-align:center'>" + this.cgustate + 
								"</td><td style='text-align:center'>" + "</td></tr>";
							}
						});
						$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
					} else {
						var creditGiveUpTbodyTxt = "<tr><h2>학점포기신청내역이 없습니다.</h2></tr>"
						$("#creditGiveUpTbody").html(creditGiveUpTbodyTxt);
					}
					
					if(map.creditList) {
						var creditTbodyTxt = "";
						$.each(map.creditList, function() {
							creditTbodyTxt += "<tr><td style='text-align:center'>" + this.creditYear + "</td><td style='text-align:center'>" + this.creditSemester + 
										"</td><td style='text-align:center'>" + this.subject.subjectName + "</td><td style='text-align:center'>" + this.subject.subjectType + 
										"</td><td style='text-align:center'>" + this.creditAcquire + "</td><td style='text-align:center'>" + this.creditGrade + 
										"</td><td style='text-align:center'>" + "<button id=" + "creditGiveUpBtn style='text-align:center'>" + "학점포기신청</button>" + 
										"<input style='text-align:center' type='hidden' value=" + this.creditId + ">" + "</td></tr>";
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
<h3>학점포기 신청 및 내역 조회</h3><br>
<ul><li><h4>학점포기 조회</h4></li></ul><br>
<table border="2" style="border-color: black">
	<thead id="creditGiveUpThead">
		<tr>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='연도' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='학기' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='과목명' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='이수구분' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='학점' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='등급' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='진행상태' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='취소버튼' disabled></th>
		</tr>
	</thead>
	<tbody id="creditGiveUpTbody">
		<c:forEach items="${requestScope.creditGiveUpList }" var="creditGiveUpList">
			<c:choose>
				<c:when test="${creditGiveUpList.CGUState eq '대기' }">
					<tr>					
						<td style='text-align:center'>${creditGiveUpList.CGUYear }</td>
						<td style='text-align:center'>${creditGiveUpList.CGUSemester }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.subject.subjectName }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.subject.subjectType }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.creditAcquire }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.creditGrade }</td>
						<td style='text-align:center'>${creditGiveUpList.CGUState }</td>
						<td style='text-align:center'><button id="cancelBtn">취소버튼</button>
						<input type="hidden" value="${creditGiveUpList.CGUId }">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style='text-align:center'>${creditGiveUpList.CGUYear }</td>
						<td style='text-align:center'>${creditGiveUpList.CGUSemester }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.subject.subjectName }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.subject.subjectType }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.creditAcquire }</td>
						<td style='text-align:center'>${creditGiveUpList.credit.creditGrade }</td>
						<td style='text-align:center'>${creditGiveUpList.CGUState }</td>
						<td style='text-align:center'></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>
<br><br>

<ul><li><h4>학점포기 신청</h4></li></ul><br>
<table border="2" style="border-color: black">
	<thead id="creditThead">
		<tr>	
			<th><input style='text-align:center' type='text' class='form-control' placeholder='연도' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='학기' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='과목명' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='이수구분' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='학점' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='등급' disabled></th>
			<th><input style='text-align:center' type='text' class='form-control' placeholder='신청버튼' disabled></th>
		</tr>
	</thead>
	<tbody id="creditTbody">
		<c:forEach items="${requestScope.creditList }" var="creditList">
			<tr>					
				<td style='text-align:center'>${creditList.creditYear }</td>
				<td style='text-align:center'>${creditList.creditSemester }</td>
				<td style='text-align:center'>${creditList.subject.subjectName }</td>
				<td style='text-align:center'>${creditList.subject.subjectType }</td>
				<td style='text-align:center'>${creditList.creditAcquire }</td>
				<td style='text-align:center'>${creditList.creditGrade }</td>
				<td style='text-align:center'><button id="creditGiveUpBtn">학점포기신청</button>
				<input type="hidden" value="${creditList.creditId }">
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>