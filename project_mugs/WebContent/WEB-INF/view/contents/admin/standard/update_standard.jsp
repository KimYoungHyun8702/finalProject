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
function standard_delete(){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteStandardController.do?majorId="+$("#majorId").val()+"&standardYear="+$("#standardYear").val()
	}else{
		return false;
	}
};
</script>
</head>
<body>
<h2>수강 기준 학점  수정</h2>
<hr>
	<form action="${initParam.rootPath }/admin/updateStandardController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
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
	최소 학점 : <input type="number" name="standardMinCredit"/><br>
	최대 학점 : <input type="number" name="standardMaxCredit"/><br>
	장학금 최소 학점 : <input type="number" name="standardMinScholarship"/><br>
	유예 최소 학점 : <input type="number" name="standardDelayMinCredit"/><br>
	유예 최대 학점 : <input type="number" name="standardDelayMaxCredit"/><br>
	<input type="submit" value="수정">
	<input type="button" id="delete" onclick="standard_delete()" value="삭제"/>
	<sec:csrfInput/>
</form>
<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>