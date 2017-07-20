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
<title>MUGS</title>
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
<h3>졸업 학점 수정</h3>
<br>
	<form action="${initParam.rootPath }/admin/updateGraduationCreditController.do" method="post" onsubmit="return check()">
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
					<td align="center"><input type="text" value="${requestScope.list[0].majorName }" readonly style="border: 0"/></td>
					<td align="center"><select name="graduationCreditYear" id="graduationCreditYear" >
							<option id="option">적용 연도 선택</option>
							<c:forEach var="list" items="${requestScope.list }">
							<option value=${list.graduationCreditYear }>
							${list.graduationCreditYear }
							</option> 
							</c:forEach>
							</select></td>
					<td align="center"><input type="number" name="gradVitalEduCredit" id="gradVitalEduCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradSelectEduCredit" id="gradSelectEduCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradVitalMajorCredit" id="gradVitalMajorCredit" style="border: 0"/></td>
					<td align="center"><input type="number" name="gradSelectMajorCredit" id="gradSelectMajorCredit" style="border: 0"/></td>
				</tr>
			</tbody>
		</table>	
	<input type="hidden" id="majorId" name="majorId" value="${requestScope.list[0].majorId }"/>
	<br>
	<center><input type="submit" value="수정">
	<input type="button" id="delete" onclick="graduation_credit_delete()" value="삭제"/></center>
	<sec:csrfInput/>
</form><br>
<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
	
</body>