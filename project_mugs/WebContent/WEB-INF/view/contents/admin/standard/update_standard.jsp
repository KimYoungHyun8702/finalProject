<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
}
td{
	border: 1px solid black;
	font-size: 15px;
}
select{
	width:150px;
	height: 35px;
	padding: 5px;
}
#product_info_layer{
	width:700px;
	border: 1px solid gray;
	padding:5px;
	display: none;/*최초 로딩시에는 안보이도록 처리*/
}
#tbody{
	cursor: pointer;
}
h3{
	font-family:굴림체;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#standardYear").val() == '적용 연도 선택'){
		alert("연도를 선택하세요");
		return false;
	}else if($("#standardMinCredit").val() == "" || $("#standardMinCredit").val().trim() == 0 ){
		alert("최소 학점을 입력하세요");
		return false;
	}else if($("#standardMaxCredit").val() == "" || $("#standardMaxCredit").val().trim() == 0){
		alert("최대 학점을 입력하세요");
		return false;
	}else if($("#standardMinScholarship").val() == "" || $("#standardMinScholarship").val().trim() == 0){
		alert("장학금 최소 학점을 입력하세요");
		return false;
	}else if($("#standardDelayMinCredit").val() == "" || $("#standardDelayMinCredit").val().trim() == 0){
		alert("유예 최소 학점을 입력하세요");
		return false;
	}else if($("#standardDelayMaxCredit").val() == "" || $("#standardDelayMaxCredit").val().trim() == 0){
		alert("유예 최대 학점을 입력하세요");
		return false;
	}else{
		return confirm("수정하시겠습니까 ?");
	}
}
function standard_delete(){
	if($("#standardYear").val() == '적용 연도 선택'){
		alert("연도를 입력하세요");
		return false;
	}
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteStandardController.do?majorId="+$("#majorId").val()+"&standardYear="+$("#standardYear").val()
	}else{
		return false;
	}
};
$(document).ready(function(){
	$("#standardYear").on("change",function(){
		if($("#standardYear").val() == '적용 연도 선택'){
			$("#standardMinCredit").val("")
			$("#standardMaxCredit").val("")
			$("#standardMinScholarship").val("")
			$("#standardDelayMinCredit").val("")
			$("#standardDelayMaxCredit").val("")
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectStandardForUpdateController.do",
				"data":({majorId:$("#majorId").val(),standardYear:$("#standardYear").val()}),
				"success":function(result){
					$("#standardMinCredit").empty().val(result.standardMinCredit);
					$("#standardMaxCredit").empty().val(result.standardMaxCredit);
					$("#standardMinScholarship").empty().val(result.standardMinScholarship);
					$("#standardDelayMinCredit").empty().val(result.standardDelayMinCredit);
					$("#standardDelayMaxCredit").empty().val(result.standardDelayMaxCredit);
				}
			})//end of ajax
		}//end of else
	})//end of standardYear
})//end of document
</script>
</head>
<body>
<h2>수강 기준 학점  수정</h2>
<br>
	<form action="${initParam.rootPath }/admin/updateStandardController.do" method="post" onsubmit="return check()">
		<table border="2">
			<thead>
				<tr>
					<th align="center"><input type="text" class="form-control" placeholder="학과 이름" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="적용 연도" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="최소 학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="최대 학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="장학금 최소 학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="유예 최소 학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="유예 최대 학점" disabled></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><input type="text" value="${requestScope.list[0].majorName }" readonly style="border: 0"/></td>
					<td align="center"><select name="standardYear" id="standardYear" >
											<option>적용 연도 선택</option>
											<c:forEach var="list" items="${requestScope.list }">
												<option value=${list.standardYear }>
													${list.standardYear }
												</option> 
											</c:forEach>
										</select></td>
					<td align="center"><input type="number" name="standardMinCredit" id="standardMinCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="standardMaxCredit" id="standardMaxCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="standardMinScholarship" id="standardMinScholarship" style="border: 0"/></td>
					<td align="center"><input type="number" name="standardDelayMinCredit" id="standardDelayMinCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="standardDelayMaxCredit" id="standardDelayMaxCredit" style="border: 0"/></td>
				</tr>
			</tbody>
		</table>
	<br>
	<input type="hidden" id="majorId" name="majorId" value="${requestScope.list[0].majorId }"/>
	<center><input type="submit" value="수정">
	<input type="button" id="delete" onclick="standard_delete()" value="삭제"/></center>
	<sec:csrfInput/>
</form><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>