<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#standardYear").val() == '적용 연도 선택'){
		alert("연도를 선택하세요");
		return false;
	}else if($("#standardMinCredit").val() == "" || $("#gradVitalEduCredit").val().trim() == 0 ){
		alert("최소 학점을 입력하세요");
		return false;
	}else if($("#standardMaxCredit").val() == "" || $("#gradSelectEduCredit").val().trim() == 0){
		alert("최대 학점을 입력하세요");
		return false;
	}else if($("#standardMinScholarship").val() == "" || $("#gradVitalMajorCredit").val().trim() == 0){
		alert("장학금 최소 학점을 입력하세요");
		return false;
	}else if($("#standardDelayMinCredit").val() == "" || $("#gradSelectMajorCredit").val().trim() == 0){
		alert("유예 최소 학점을 입력하세요");
		return false;
	}else if($("#standardDelayMaxCredit").val() == "" || $("#gradSelectMajorCredit").val().trim() == 0){
		alert("유예 최대 학점을 입력하세요");
		return false;
	}else{
		return confirm("수정하시겠습니까 ?")
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
<hr>
	<form action="${initParam.rootPath }/admin/updateStandardController.do" method="post" onsubmit="return check()">
	<input type="text" value="${requestScope.list[0].majorName }" readonly/><br>
	<input type="hidden" id="majorId" name="majorId" value="${requestScope.list[0].majorId }"/>
	<select name="standardYear" id="standardYear" >
		<option>적용 연도 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list.standardYear }>
				${list.standardYear }
			</option> 
		</c:forEach>
	</select><br>
	최소 학점 : <input type="number" name="standardMinCredit" id="standardMinCredit"/><br>
	최대 학점 : <input type="number" name="standardMaxCredit" id="standardMaxCredit"/><br>
	장학금 최소 학점 : <input type="number" name="standardMinScholarship" id="standardMinScholarship"/><br>
	유예 최소 학점 : <input type="number" name="standardDelayMinCredit" id="standardDelayMinCredit"/><br>
	유예 최대 학점 : <input type="number" name="standardDelayMaxCredit" id="standardDelayMaxCredit"/><br>
	<input type="submit" value="수정">
	<input type="button" id="delete" onclick="standard_delete()" value="삭제"/>
	<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>