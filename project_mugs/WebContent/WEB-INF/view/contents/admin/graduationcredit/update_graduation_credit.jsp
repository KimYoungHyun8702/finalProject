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
	if($("#graduationCreditYear").val() == '적용 연도 선택'){
		alert("연도를 선택하세요");
		return false;
	}else if($("#gradVitalEduCredit").val() == "" || $("#gradVitalEduCredit").val().trim() == 0 ){
		alert("필수교양 졸업학점을 입력하세요");
		return false;
	}else if($("#gradSelectEduCredit").val() == "" || $("#gradSelectEduCredit").val().trim() == 0){
		alert("선택교양 졸업학점을 입력하세요");
		return false;
	}else if($("#gradVitalMajorCredit").val() == "" || $("#gradVitalMajorCredit").val().trim() == 0){
		alert("필수전공 졸업학점을 입력하세요");
		return false;
	}else if($("#gradSelectMajorCredit").val() == "" || $("#gradSelectMajorCredit").val().trim() == 0){
		alert("선택전공 졸업학점을 입력하세요");
		return false;
	}else{
		return confirm("수정하시겠습니까 ?")
	}
}
function graduation_credit_delete(roomId){
	if($("#graduationCreditYear").val() == '적용 연도 선택'){
		alert("연도를 입력하세요");
		return false;
	}
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteGraduationCreditController.do?majorId="+$("#majorId").val()+"&graduationCreditYear="+$("#graduationCreditYear").val()
	}else{
		return false;
	}
};
$(document).ready(function(){
	$("#graduationCreditYear").on("change",function(){
		if($("#graduationCreditYear").val() == '적용 연도 선택'){
			$("#gradVitalEduCredit").val("")
			$("#gradSelectEduCredit").val("")
			$("#gradVitalMajorCredit").val("")
			$("#gradSelectMajorCredit").val("")
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectGraduationCreditForUpdateController.do",
			"data":({majorId:$("#majorId").val(),graduationCreditYear:$("#graduationCreditYear").val()}),
			"success":function(result){
				$("#gradVitalEduCredit").empty().val(result.gradVitalEduCredit);
				$("#gradSelectEduCredit").empty().val(result.gradSelectEduCredit);
				$("#gradVitalMajorCredit").empty().val(result.gradVitalMajorCredit);
				$("#gradSelectMajorCredit").empty().val(result.gradSelectMajorCredit);
			}
		})//end of ajax
		}
	});//end of option
});
</script>
</head>
<body>
<h2>졸업 학점 수정</h2>
<hr>
	<form action="${initParam.rootPath }/admin/updateGraduationCreditController.do" method="post" onsubmit="return check()">
	<input type="text" value="${requestScope.list[0].majorName }" readonly/><br>
	<input type="hidden" id="majorId" name="majorId" value="${requestScope.list[0].majorId }"/>
	<select name="graduationCreditYear" id="graduationCreditYear" >
	<option id="option">적용 연도 선택</option>
	<c:forEach var="list" items="${requestScope.list }">
	<option value=${list.graduationCreditYear }>
	${list.graduationCreditYear }
	</option> 
	</c:forEach>
	</select><br>
	필수교양 졸업학점 : <input type="number" name="gradVitalEduCredit" id="gradVitalEduCredit"/><br>
	선택교양 졸업학점 : <input type="number" name="gradSelectEduCredit" id="gradSelectEduCredit"/><br>
	필수전공 졸업학점 : <input type="number" name="gradVitalMajorCredit" id="gradVitalMajorCredit"/><br>
	선택전공 졸업학점 : <input type="number" name="gradSelectMajorCredit" id="gradSelectMajorCredit"/><br>
	<input type="submit" value="수정">
	<input type="button" id="delete" onclick="graduation_credit_delete()" value="삭제"/>
	<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
	
</body>