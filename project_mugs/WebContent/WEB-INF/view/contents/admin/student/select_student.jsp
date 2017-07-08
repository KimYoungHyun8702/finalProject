<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
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
			var txt = "";
			var txtb = "";
			$.each(result,function(){
			txt += "<tr><td align='center'>"+(this.info.usersPhoto==null?'':this.info.usersPhoto)+"</td><td align='center'>"+this.info.stuId+"</td><td align='center'>"+this.info.usersName+"</td><td align='center'>"+this.info.usersRRN+
			"</td><td>"+this.info.usersEmail+"</td><td>"+this.info.usersPhoneNum+"</td><td>"+this.info.usersCellNum+"</td><td>"+this.info.usersNational+"</td><td>"+this.info.usersCurrentAddr+"</td><td>"+this.info.usersBornAddr+"</td><td align='center'>"+this.info.usersEnable+
			"</td><td>"+this.info.stuCourse+"</td><td>"+(this.info.stuArmy==null?"":this.info.stuArmy)+"</td></tr>"
			
			txtb += "<tr><td align='center'>"+this.stuAdmissionDate+"</td><td>"+(this.stuGraduationDate==null?"":this.stuGraduationDate)+"</td><td>"+this.info.stuRegisterState+"</td><td>"+this.info.stuStudentState+"</td><td>"+
			this.info.stuGrade+"</td><td>"+this.info.stuGraduationExam+"</td><td>"+this.info.stuEarlyGraduation+"</td><td>"+this.info.stuSemester+"</td><td>"+(this.major.majorName == null?"":this.major.majorName)+"</td><td>"
			+(this.majorDual == null?"":(this.majorDual.majorDualName==null?"":this.majorDaul.majorDaulName))+"</td><td>"+(this.majorMinor == null?"":(this.majorMinor.majorMinorName==null?"":this.majorMinor.majorMinorName))+"</td><td align='center'><button onclick='update_student("+this.info.usersId+")'>수정</button></td><td align='center'><button onclick='delete_student("+this.info.usersId+")'>삭제</button></td></tr>"

			})
			$("#infoTbody").html(txt);
			$("#infoTbodyb").html(txtb);
			$("#infoStudent").show();	
			$("#hr").show();
			$("h1").show();
		}
	})//end of ajax
} 
$(document).ready(function(){
	$("#hr").hide();	
	$("h1").hide();
	$("#selectStudent").hide();	
	$("#infoStudent").hide();	
	if(updateMessage != ''	){
		
	}
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
					alert("조회할 내용이 없음");
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
<hr>
	
	검색할 이름 <input type="text" name="usersName" id="usersName"/><button id="searchStudent">조회</button><br>
	
	
	<table id="selectStudent" border="1">
		<thead>
			<tr>
				<td align="center">학생 번호</td>
				<td align="center">학생 이름</td>
				<td align="center">학생 주민 번호</td>
				<td align="center">학생 이메일</td>
				<td align="center">상세 정보 보기</td>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>
	<hr id="hr"/>
	<h1>학생 상세 정보</h1>
	<table id="infoStudent" border="1">
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
				<td align="center">인증가능 상태</td>
				<td align="center">과정 구분</td>
				<td align="center">병영 구분</td>
				</tr>
				</thead>
		<tbody id="infoTbody"></tbody>
		
		<thead>
			<tr>
				<td align="center">입학 일자</td>
				<td align="center">졸업 일자</td>
				<td align="center">학적 구분</td>
				<td align="center">학생 구분</td>
				<td align="center">학년</td>
				<td align="center">졸업시험 패스 여부</td>
				<td align="center">조기졸업 대상 여부</td>
				<td align="center">학기</td>
				<td align="center">소속 학과</td>
				<td align="center">복수 전공</td>
				<td align="center">부전공</td>
				<td align="center">수정</td>
				<td align="center">삭제</td>
			</tr>
		</thead>
			<tbody id="infoTbodyb"></tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>