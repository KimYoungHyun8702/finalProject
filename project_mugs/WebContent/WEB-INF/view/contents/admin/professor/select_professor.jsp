<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
	
}
th {
	bgcolor:peru;
}
td{
	padding: 5px;
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
<title>MUGS</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function update_professor(usersId){
	location.href="${initParam.rootPath }/admin/selectProfessorForupdateController.do?usersId="+usersId
}
function delete_professor(usersId){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteProfessorController.do?usersId="+usersId
	}else{
		return false;
	}
}
function info_professor(proId){
	$.ajax({
		"url":"${initParam.rootPath }/admin/selectProfessorInfoByIdController.do",
		"data":"proId="+proId,
		"success":function(result){
			var photo = "";
			var txt1 = "";
			var txt2 = "";
			var txt3 = "";
			var txt4 = "";
			var usersId = "";
			var usersName = "";
			var usersEngName = "";
			var usersRRN = "";
			var proUniversity = "";
			var proGradSchool = "";
			var proOfficePhoneNum = "";
			var proLaboratoryPhoneNum = "";
			var majorId = "";
			var proRoomOfficeId = "";
			var proRoomLaboratoryId = "";
			var usersBornAddr = "";
			var usersCurrentAddr = "";
			var usersNational = "";
			var usersPhoneNum = "";
			var usersCellNum = "";
			var usersEmail = "";
			var usersEnable = "";
			$.each(result,function(){
			if(this.info.usersPhoto == null){
				photo += "<img src ='${initParam.rootPath}/resource/up_image/1.jpg' width='150px' height='150px'>"
			}else{
				photo += "<img src ='${initParam.rootPath}/resource/up_image/"+this.info.usersPhoto+"' width='150px' height='150px'>"
			}
			usersId += this.info.usersId
			usersName += this.info.usersName
			usersEngName += this.info.usersEngName
			usersRRN += this.info.usersRRN
			proUniversity += this.info.proUniversity
			proGradSchool += this.info.proGradSchool
			proOfficePhoneNum += (this.info.proOfficePhoneNum == null?"":this.info.proOfficePhoneNum)
			proLaboratoryPhoneNum += (this.info.proLaboratoryPhoneNum == null?"":this.info.proLaboratoryPhoneNum)
			majorId += (this.major == null?"":this.major.majorName)
			proRoomOfficeId += (this.office == null?"":this.office.buildingName+",")+(this.office == null?"":this.office.officeName)
			proRoomLaboratoryId += (this.laboratory == null?"":this.laboratory.buildingName+",")+(this.laboratory == null?"":this.laboratory.laboratoryName)
			usersBornAddr += this.info.usersBornAddr
			usersCurrentAddr += this.info.usersCurrentAddr
			usersNational += this.info.usersNational
			usersPhoneNum += this.info.usersPhoneNum
			usersCellNum += this.info.usersCellNum
			usersEmail += this.info.usersEmail
			usersEnable += this.info.usersEnable
			})
			$("#photo").html(photo);
			$("#usersId").html(usersId);
			$("#usersName2").html(usersName);
			$("#usersEngName").html(usersEngName);
			$("#usersRRN").html(usersRRN);
			$("#proUniversity").html(proUniversity);
			$("#proGradSchool").html(proGradSchool);
			$("#proOfficePhoneNum").html(proOfficePhoneNum);
			$("#proLaboratoryPhoneNum").html(proLaboratoryPhoneNum);
			$("#majorId").html(majorId);
			$("#proRoomOfficeId").html(proRoomOfficeId);
			$("#proRoomLaboratoryId").html(proRoomLaboratoryId);
			$("#usersBornAddr").html(usersBornAddr);
			$("#usersCurrentAddr").html(usersCurrentAddr);
			$("#usersNational").html(usersNational);
			$("#usersPhoneNum").html(usersPhoneNum);
			$("#usersCellNum").html(usersCellNum);
			$("#usersEmail").html(usersEmail);
			$("#usersEnable").html(usersEnable);
			$("#infoProfessor").show();	
			$("#infoProfessor2").show();	
			$("#infoProfessor3").show();	
			$("#h1").show();
			$("#h2").show();
			$("#h3").show();
			$("#h4").show();
			$("#update").show();
			$("#delete").show();
		}
	})//end of ajax
} 
$(document).ready(function(){
	$("#h1").hide();
	$("#h2").hide();
	$("#h3").hide();
	$("#h4").hide();
	$("#update").hide();
	$("#delete").hide();
	$("#selectProfessor").hide();	
	$("#infoProfessor").hide();	
	$("#infoProfessor2").hide();	
	$("#infoProfessor3").hide();	
	$("#searchProfessor").on("click",function(){
		if($("#usersName").val() == ''){
			alert("검색어를 입력하세요");
			$("#h1").hide();
			$("#h2").hide();
			$("#h3").hide();
			$("#h4").hide();
			$("#update").hide();
			$("#delete").hide();
			$("#selectProfessor").hide();	
			$("#infoProfessor").hide();	
			$("#infoProfessor2").hide();	
			$("#infoProfessor3").hide();
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectProfessorByNameController.do",
			"data":"usersName="+$("#usersName").val(),
			"success":function(result){
				if(result == ''){
					alert("조회할 내용이 없습니다")
					$("#h1").hide();
					$("#h2").hide();
					$("#h3").hide();
					$("#h4").hide();
					$("#update").hide();
					$("#delete").hide();
					$("#selectProfessor").hide();	
					$("#infoProfessor").hide();	
					$("#infoProfessor2").hide();	
					$("#infoProfessor3").hide();
				}else{
				var txt = "";
				$.each(result,function(){
				txt += "<tr><td align='center' style='height: 34px;font-size: 15px'>"+this.proId+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersName+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersRRN+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersEmail+
				"</td><td align='center' style='height: 34px;font-size: 15px'><button onclick='info_professor("+this.proId+")'>상세정보보기</button></td></tr>"})
				$("#selectTbody").html(txt);
				$("#selectProfessor").show();
				}
			}
		});//end of ajax
			
		}
	})
});//end of document
</script>
</head>
<body>
<h3>교수 조회</h3>
<br>
<c:if test="${sessionScope.proinsertMessage != null}">
		<script type="text/javascript">
			alert("등록되었습니다");
		</script>
		<% session.removeAttribute("proinsertMessage"); %>
</c:if>
<c:if test="${sessionScope.proupdateMessage != null}">
		<script type="text/javascript">
			alert("수정되었습니다");
		</script>
		<% session.removeAttribute("proupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.prodeleteMessage != null}">
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<% session.removeAttribute("prodeleteMessage"); %>
</c:if>
	검색할 이름: <input type="text" name="usersName" id="usersName"/><button id="searchProfessor">조회</button><br>
	<br>
	<table id="selectProfessor" border="2" >
		<thead>
			<tr>
				<th align="center"><input type="text" class="form-control" placeholder="교수 번호" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="교수 이름" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="교수 주민번호" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="교수 이메일" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="상세정보보기" disabled></th>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>
	<h3 id="h1">교수 상세 정보</h3>
	<ul id="h2"><li><h4>교수 기본 정보</h4></li></ul>
	<table id="infoProfessor" border="2">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="60%">
		</colgroup>
		<thead>
			<tr>
				<td rowspan="4" id="photo" align="center"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="교수번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersId"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="교수이름" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersName2"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="영문이름" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersEngName"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="주민번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersRRN"></td>
		</thead>
		</table>
	<ul id="h3"><li><h4>교수 학적 정보</h4></li></ul>
	<table id="infoProfessor2" border="2">
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="졸업 대학" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proUniversity"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="졸업 대학원" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proGradSchool"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="소속 학과" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="majorId"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="인증가능 상태" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersEnable"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="교수실" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proRoomOfficeId"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="교수실 전화 번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proOfficePhoneNum"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="연구실" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proRoomLaboratoryId"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="연구실 전화 번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="proLaboratoryPhoneNum"></td>
			</tr>
		</thead>
	</table>
	<ul id="h4"><li><h4>교수 카드 정보</h4></li></ul>
	<table id="infoProfessor3" border="2">
		<colgroup>
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="본적지 주소" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" colspan="5" id="usersBornAddr"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="현 거주지 주소" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" colspan="5" id="usersCurrentAddr"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="국적" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersNational"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="집 전화번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersPhoneNum"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="핸드폰 번호" disabled> </th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersCellNum"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="이메일" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" colspan="5" id="usersEmail"></td>
			</tr>
		</thead>	
	</table>
	<br>	
	<center><button id="update" onclick="update_professor($('#usersId').text())">수정</button>
	<button id="delete" onclick="delete_professor($('#usersId').text())">삭제</button><br><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>

</body>