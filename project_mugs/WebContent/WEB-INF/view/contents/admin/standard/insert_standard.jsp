<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#standardYear").val() == "" || $("#standardYear").val().trim() == 0 ){
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
		return confirm("등록하시겠습니까 ?")
	}
}
</script>
</head>
<body>
<h2>수강 기준 학점 등록</h2>
<br>
<form action="${initParam.rootPath }/admin/insertStandardController.do" method="post" onsubmit="return check()">
	학과 이름 : <input type="text" value="${param.majorName }" readonly/><br>
	적용 연도 : <input type="number" name="standardYear" id="standardYear"/><br>
	최소 학점 : <input type="number" name="standardMinCredit"  id="standardMinCredit"/><br>
	최대 학점 : <input type="number" name="standardMaxCredit" id="standardMaxCredit"/><br>
	장학금 최소 학점 : <input type="number" name="standardMinScholarship" id="standardMinScholarship"/><br>
	유예 최소 학점 : <input type="number" name="standardDelayMinCredit" id="standardDelayMinCredit"/><br>
	유예 최대 학점 : <input type="number" name="standardDelayMaxCredit" id="standardDelayMaxCredit"/><br>
	<input type="hidden" name="majorId" value="${param.majorId }"/>
	<input type="submit" value="등록">
	<sec:csrfInput/>
</form>
</body>