<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
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
			var txt = "";
			var txtb = "";
			$.each(result,function(){
			txt += "<tr><td align='center'>"+(this.info.usersPhoto==null?'':this.info.usersPhoto)+"</td><td align='center'>"+this.info.proId+"</td><td align='center'>"+this.info.usersName+"</td><td align='center'>"+this.info.usersRRN+
			"</td><td>"+this.info.usersEmail+"</td><td>"+this.info.usersPhoneNum+"</td><td>"+this.info.usersCellNum+"</td><td>"+this.info.usersNational+"</td><td>"+this.info.usersCurrentAddr+"</td><td>"+this.info.usersBornAddr+"</td><tr>"
			
			txtb += "<tr><td align='center'>"+this.info.usersEnable+"</td><td>"+this.info.proUniversity+"</td><td>"+this.info.proGradSchool+"</td><td>"+(this.info.proOfficePhoneNum == null?"":this.info.proOfficePhoneNum)+"</td><td>"+(this.info.prolaboratoryPhoneNum == null?"":this.info.proLaboratoryPhoneNum)+"</td><td>"+(this.major == null?"":this.major.majorName)+"</td><td>"
			+(this.office == null?"":this.office.buildingName+",")+(this.office == null?"":this.office.officeName)+"</td><td>"+(this.laboratory == null?"":this.laboratory.buildingName+",")+(this.laboratory == null?"":this.laboratory.laboratoryName)+"</td><td align='center'><button onclick='update_professor("+this.info.usersId+")'>수정</button></td><td align='center'><button onclick='delete_professor("+this.info.usersId+")'>삭제</button></td></tr>"
			})
			$("#infoTbody").html(txt);
			$("#infoTbodyb").html(txtb);
			$("#infoProfessor").show();	
			$("#hr").show();
			$("h1").show();
		}
	})//end of ajax
} 
$(document).ready(function(){
	$("#hr").hide();	
	$("h1").hide();
	$("#selectProfessor").hide();	
	$("#infoProfessor").hide();	
	$("#searchProfessor").on("click",function(){
		if($("#usersName").val() == ''){
			alert("검색어를 입력하세요");
			$("#hr").hide();	
			$("h1").hide();
			$("#selectProfessor").hide();	
			$("#infoProfessor").hide();	
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectProfessorByNameController.do",
			"data":"usersName="+$("#usersName").val(),
			"success":function(result){
				if(result == ''){
					alert("조회할 내용이 없습니다")
					$("#hr").hide();	
					$("h1").hide();
					$("#selectProfessor").hide();	
					$("#infoProfessor").hide();	
				}else{
				var txt = "";
				$.each(result,function(){
				txt += "<tr><td align='center'>"+this.proId+"</td><td align='center'>"+this.usersName+"</td><td align='center'>"+this.usersRRN+"</td><td align='center'>"+this.usersEmail+
				"</td><td align='center'><button onclick='info_professor("+this.proId+")'>상세정보보기</button></td></tr>"})
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
<h2>교수 조회</h2>
<hr>
	
	검색할 이름 <input type="text" name="usersName" id="usersName"/><button id="searchProfessor">조회</button><br>
	
	
	<table id="selectProfessor" border="1">
		<thead>
			<tr>
				<td align="center">교수 번호</td>
				<td align="center">교수 이름</td>
				<td align="center">교수 주민 번호</td>
				<td align="center">교수 이메일</td>
				<td align="center">상세 정보 보기</td>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>
	<hr id="hr"/>
	<h1>교수 상세 정보</h1>
	<table id="infoProfessor" border="1">
		<thead>
			<tr>
				<td align="center">사진</td>
				<td align="center">번호</td>
				<td align="center">이름</td>
				<td align="center">주민 번호</td>
				<td align="center">이메일</td>
				<td align="center">집 전화번호</td>
				<td align="center">핸드폰 번호 </td>
				<td align="center">국적</td>
				<td align="center">현 거주지 주소</td>
				<td align="center">본적지 주소</td>
				</tr>
				</thead>
		<tbody id="infoTbody"></tbody>
		
		<thead>
			<tr>
			<td align="center">인증가능 상태</td>
				<td align="center">졸업 대학</td>
				<td align="center">졸업 대학원</td>
				<td align="center">교수실 전화 번호</td>
				<td align="center">연구실 전화 번호</td>
				<td align="center">소속 학과</td>
				<td align="center">교수실</td>
				<td align="center">연구실</td>
				<td align="center">수정</td>
				<td align="center">삭제</td>
			</tr>
		</thead>
			<tbody id="infoTbodyb"></tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>

</body>