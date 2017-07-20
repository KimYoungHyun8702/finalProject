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
	if($("#graduationCreditYear").val() == "" || $("#graduationCreditYear").val().trim() == 0 ){
		alert("연도를 입력하세요");
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
		return confirm("등록하시겠습니까 ?")
	}
}
</script>
</head>
<body>
<h2>졸업 학점 등록</h2>
<br>
	<form action="${initParam.rootPath }/admin/insertGraduationCreditController.do" method="post" onsubmit="return check()">
			학과 이름 : <input type="text" value="${param.majorName }" readonly/><br>
			적용 연도 : <input type="number" name="graduationCreditYear" id="graduationCreditYear"/><br>
			필수교양 졸업학점 : <input type="number" name="gradVitalEduCredit"  id="gradVitalEduCredit"/><br>
			선택교양 졸업학점 : <input type="number" name="gradSelectEduCredit"  id="gradSelectEduCredit"/><br>
			필수전공 졸업학점 : <input type="number" name="gradVitalMajorCredit" id="gradVitalMajorCredit"/><br>
			선택전공 졸업학점 : <input type="number" name="gradSelectMajorCredit" id="gradSelectMajorCredit"/><br>
			<input type="hidden" name="majorId" value="${param.majorId }"/>
			<input type="submit" value="등록">
			<sec:csrfInput/>
	</form>
</body>