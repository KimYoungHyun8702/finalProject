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
	text-align:center;
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
	font-family:돋움체;
}
</style>
<title>Insert title here</title>
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
			var txt1 = "";
			var txt2 = "";
			var txt3 = "";
			var txt4 = "";
			$.each(result,function(){
			txt1 += "<tr><td align='center'>"+(this.info.usersPhoto==null?'':this.info.usersPhoto)+"</td><td align='center'>"+this.info.proId+"</td><td align='center'>"+this.info.usersName+"</td><td align='center'>"+this.info.usersEngName+"</td><td align='center'>"+this.info.usersRRN+
			"</td><td align='center'>"+this.info.usersEmail+"</td></tr>"
			
			txt2 += "<tr><td align='center'>"+this.info.usersPhoneNum+"</td><td align='center>'"+this.info.usersCellNum+"</td><td align='center'>"+this.info.usersNational+"</td><td align='center'>"+this.info.usersCurrentAddr+"</td><td align='center'>"+this.info.usersBornAddr+"</td><td align='center'>"+this.info.usersEnable+"</td></tr>"
			
			txt3 += "<tr><td align='center'>"+this.info.proUniversity+"</td><td align='center'>"+this.info.proGradSchool+"</td><td align='center'>"+(this.info.proOfficePhoneNum == null?"":this.info.proOfficePhoneNum)+"</td><td align='center'>"+(this.info.proLaboratoryPhoneNum == null?"":this.info.proLaboratoryPhoneNum)+"</td><td align='center'>"+(this.major == null?"":this.major.majorName)+"</td><td align='center'>"
					+(this.office == null?"":this.office.buildingName+",")+(this.office == null?"":this.office.officeName)+"</td></tr>"
			
			txt4 +=	"<tr><td align='center'>"+(this.laboratory == null?"":this.laboratory.buildingName+",")+(this.laboratory == null?"":this.laboratory.laboratoryName)+"</td><td align='center'><button onclick='update_professor("+this.info.usersId+")'>수정</button></td><td align='center'><button onclick='delete_professor("+this.info.usersId+")'>삭제</button></td></tr>"
			})
			$("#infoTbody1").html(txt1);
			$("#infoTbody2").html(txt2);
			$("#infoTbody3").html(txt3);
			$("#infoTbody4").html(txt4);
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
<hr>
	
	검색할 이름: <input type="text" name="usersName" id="usersName"/><button id="searchProfessor">조회</button><br>
	<br>
	<table id="selectProfessor" border="1" >
		<thead>
			<tr class="filters">
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수 이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수 주민번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수 이메일" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="상세정보보기" disabled></th>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>
	
	<hr id="hr"/>
	<h3>교수 상세 정보</h3>
	<table id="infoProfessor" border="1">
		<thead>
			<tr class="filters">
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="사진" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="영문이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="주민번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="이메일" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody1"></tbody>
			
		<thead>
			<tr class="filters">
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="집 전화번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="핸드폰 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="국적" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="현 거주지 주소" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="본적지 주소" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="인증가능 상태" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody2"></tbody>
				
		<thead>
			<tr class="filters">
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="졸업 대학" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="졸업 대학원" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수실 전화번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="연구실 전화번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="소속학과" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="교수실" disabled></th>
				
			</tr>
		</thead>
		<tbody id="infoTbody3"></tbody>
		
		<thead>
			<tr class="filters">	
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="연구실" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="수정" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="삭제" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody4"></tbody>
	</table>
	<br>	
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>

</body>