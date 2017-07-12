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
function graduation_credit_delete(roomId){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteGraduationCreditController.do?majorId="+$("#majorId").val()+"&graduationCreditYear="+$("#graduationCreditYear").val()
	}else{
		return false;
	}
};
</script>
</head>
<body>
<h2>졸업 학점 수정</h2>
<hr>
	<form action="${initParam.rootPath }/admin/updateGraduationCreditController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
	<input type="text" value="${requestScope.list[0].majorName }" readonly/><br>
	<input type="hidden" id="majorId" name="majorId" value="${requestScope.list[0].majorId }"/>
	<select name="graduationCreditYear" id="graduationCreditYear" >
	<option>적용 연도 선택</option>
	<c:forEach var="list" items="${requestScope.list }">
	<option value=${list.graduationCreditYear }>
	${list.graduationCreditYear }
	</option> 
	</c:forEach>
	</select><br>
	교양필수 졸업학점 : <input type="number" name="gradVitalEduCredit"/><br>
	교양선택 졸업학점 : <input type="number" name="gradSelectEduCredit"/><br>
	전공필수 졸업학점 : <input type="number" name="gradVitalMajorCredit"/><br>
	전공선택 졸업학점 : <input type="number" name="gradSelectMajorCredit"/><br>
	<input type="submit" value="수정">
	<input type="button" id="delete" onclick="graduation_credit_delete()" value="삭제"/>
	<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
	
</body>