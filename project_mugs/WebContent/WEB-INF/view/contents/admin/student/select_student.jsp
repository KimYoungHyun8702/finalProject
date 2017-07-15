<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
input{
	text-align:center;
}
table{
	width:100%;
	
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
<script src="jquery-1.10.2.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function update_student(usersId){
	location.href="${initParam.rootPath }/admin/selectStudentForUpdateController.do?usersId="+usersId
}
function delete_student(usersId){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteStudentController.do?usersId="+usersId
	}else{
		return false;
	}
}
function info_student(stuId){
	$.ajax({
		"url":"${initParam.rootPath }/admin/selectStudentInfoByIdController.do",
		"data":"stuId="+stuId,
		"success":function(result){
			var txt1 = "";
			var txt2 = "";
			var txt3 = "";
			var txt4 = "";
			var txt5 = "";
			$.each(result,function(){
			txt1 += "<tr><td align='center'>"+(this.info.usersPhoto==null?'':this.info.usersPhoto)+"</td><td align='center'>"+this.info.stuId+"</td><td align='center'>"
					+this.info.usersName+"</td><td align='center'>"+this.info.usersEngName+"</td><td align='center'>"+this.info.usersRRN
					+"</td><td>"+this.info.usersEmail+"</td></tr>"
			
			txt2 += "<tr><td align='center'>"+this.info.usersPhoneNum+"</td><td align='center'>"+this.info.usersCellNum+"</td><td align='center'>"+this.info.usersNational
					+"</td><td align='center'>"+this.info.usersCurrentAddr+"</td><td align='center'>"+this.info.usersBornAddr+"</td><td align='center'>"+this.info.usersEnable
					+"</td></tr>"
			
			txt3 += "<tr><td align='center'>"+this.info.stuCourse+"</td><td align='center'>"+(this.info.stuArmy==null?"":this.info.stuArmy)+"</td><td align='center'>"+this.stuAdmissionDate
					+"</td><td align='center'>"+(this.stuGraduationDate==null?"":this.stuGraduationDate)+"</td><td align='center'>"+this.info.stuRegisterState
					+"</td><td align='center'>"+this.info.stuStudentState+"</td></tr>"
				
			txt4 += "<tr><td align='center'>"+this.info.stuGrade+"</td><td align='center'>"+this.info.stuGraduationExam+"</td><td align='center'>"+this.info.stuEarlyGraduation+"</td><td align='center'>"+this.info.stuSemester
					+"</td><td align='center'>"+(this.major.majorName == null?"":this.major.majorName)+"</td><td align='center'>"+(this.majorDual == null?"":(this.majorDual.majorDualName==null?"":this.majorDaul.majorDaulName))
					+"</td></tr>"
		
			txt5 += "<tr><td align='center'>"+(this.majorMinor == null?"":(this.majorMinor.majorMinorName==null?"":this.majorMinor.majorMinorName))
					+"</td><td align='center'><button onclick='update_student("+this.info.usersId+")'>수정</button></td><td align='center'><button onclick='delete_student("+this.info.usersId+")'>삭제</button></td></tr>"
			})
			$("#infoTbody1").html(txt1);
			$("#infoTbody2").html(txt2);
			$("#infoTbody3").html(txt3);
			$("#infoTbody4").html(txt4);
			$("#infoTbody5").html(txt5);
			$("#infoStudent").show();	
			$("#hr").show();
			$("h1").show();
		}
	})//end of ajax
} 
$(document).ready(function(){
	$("#hr").hide();	
	$("#h1").hide();
	$("#selectStudent").hide();	
	$("#infoStudent").hide();	
	$("#searchStudent").on("click",function(){
		if($("#usersName").val() == ''){
			alert("검색어를 입력하세요");
			$("#hr").hide();	
			$("h1").hide();
			$("#selectStudent").hide();	
			$("#infoStudent").hide();	
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectStudentByNameController.do",
			"data":"usersName="+$("#usersName").val(),
			"success":function(result){
				if( result == '' ){
					alert("조회할 내용이 없습니다");
					$("#hr").hide();	
					$("h1").hide();
					$("#selectStudent").hide();	
					$("#infoStudent").hide();	
				}else{
				var txt = "";
				$.each(result,function(){
				txt += "<tr><td align='center'>"+this.stuId+"</td><td align='center'>"+this.usersName+"</td><td align='center'>"+this.usersRRN+"</td><td align='center'>"+this.usersEmail+
				"</td><td align='center'><button onclick='info_student("+this.stuId+")'>상세정보보기</button></td></tr>"
				})
				$("#selectTbody").html(txt);
				$("#selectStudent").show();					
				}
		}
		});//end of ajax
		}
	})
});//end of document
</script>
</head>
<body>
<h2>학생 조회</h2>
<c:if test="${sessionScope.stuinsertMessage != null}">
		<script type="text/javascript">
			alert("등록되었습니다");
		</script>
		<% session.removeAttribute("stuinsertMessage"); %>
</c:if>
<c:if test="${sessionScope.stuupdateMessage != null}">
		<script type="text/javascript">
			alert("수정되었습니다");
		</script>
		<% session.removeAttribute("stuupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.studeleteMessage != null}">
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<% session.removeAttribute("studeleteMessage"); %>
</c:if>
<hr>
	검색할 이름 <input type="text" name="usersName" id="usersName"/>&nbsp;&nbsp;<button id="searchStudent">조회</button><br>
	<br>

	<table id="selectStudent" border="1">
		<thead id="thead">
			<tr>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학생 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학생 이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학생 주민 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학생 이메일" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="상세 정보 보기" disabled></th>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>

	<hr id="hr"/>
	<h3>학생 상세 정보</h3>
	
	
	<table id="infoStudent" border="1" >
		<thead id="thead">
			<tr >
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="사진" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="영문 이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="주민 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="이메일" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody1"></tbody>
		
		<thead id="thead">
			<tr >
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="집 전화번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="핸드폰 번호" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="국적" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="현 거주지 주소" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="본적지 주소" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="인증가능 상태" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody2"></tbody>
		
		<thead id="thead">
			<tr >
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="과정 구분" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="병영 구분" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="입학 일자" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="졸업 일자" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학적 구분" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학생 구분" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody3"></tbody>
		
		<thead id="thead">
			<tr >	
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학년" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="졸업시험 패스 여부" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="조기졸업 대상 여부" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학기" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="소속 학과" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="복수 전공" disabled></th>
			</tr>
		</thead>
		<tbody id="infoTbody4"></tbody>
			
		<thead id="thead">
			<tr >
				<th align="center"  bgcolor="peru"><input type="text" class="form-control" placeholder="부전공" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="수정" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="삭제" disabled></th>
			</tr>
		</thead>	
		<tbody id="infoTbody5"></tbody>
		</table>
	
<br>
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>