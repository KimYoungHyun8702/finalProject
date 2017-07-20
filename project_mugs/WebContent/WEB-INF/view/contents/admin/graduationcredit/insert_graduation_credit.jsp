<%@ page contentType="text/html;charset=UTF-8"%>
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
<title>MUGS</title>
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
<h3>졸업 학점 등록</h3>
<br>
	<form action="${initParam.rootPath }/admin/insertGraduationCreditController.do" method="post" onsubmit="return check()">
		<table border="2">
			<thead>
				<tr>
					<th align="center"><input type="text" class="form-control" placeholder="학과 이름" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="적용 연도" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="필수교양 졸업학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="선택교양 졸업학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="필수전공 졸업학점" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="선택전공 졸업학점" disabled></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><input type="text" value="${param.majorName }" readonly style="border: 0"/></td>
					<td align="center"><input type="number" name="graduationCreditYear" id="graduationCreditYear" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradVitalEduCredit"  id="gradVitalEduCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradSelectEduCredit"  id="gradSelectEduCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradVitalMajorCredit" id="gradVitalMajorCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradSelectMajorCredit" id="gradSelectMajorCredit" style="border: 0"/></td>
				</tr>
			</tbody>
		</table><br>
			<input type="hidden" name="majorId" value="${param.majorId }"/>
			<center><input type="submit" value="등록"></center>
			<sec:csrfInput/>
	</form><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>