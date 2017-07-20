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
			var photo = "";
			var usersId = "";
			var usersName = "";
			var usersEngName ="";
			var usersRRN = "";
			var stuCourse = "";
			var stuArmy = "";
			var stuGrade = "";
			var stuSemester = "";
			var stuRegisterState = "";
			var stuStudentState = "";
			var stuGraduationExam = "";
			var stuEarlyGraduation = ""; 
			var stuAdmissionDate = "";
			var stuGraduationDate = ""; 
			var majorId = "";
			var majorDualId = "";
			var majorMinorId = "";
			var usersBornAddr = "";
			var usersCurrentAddr = "";
			var usersNational = "";
			var usersPhoneNum = "";
			var usersCellNum = "";
			var usersEmail = "";
			$.each(result,function(){
			if(this.info.usersPhoto == null){
				photo += "<img src ='${initParam.rootPath}/resource/up_image/1.jpg' width='150px' height='150px'>"
			}else{
				photo += "<img src ='${initParam.rootPath}/resource/up_image/"+this.info.usersPhoto+"' width='150px' height='150px'>"
			}
			usersId += this.info.stuId
			usersName += this.info.usersName
			usersEngName += this.info.usersEngName
			usersRRN += this.info.usersRRN
			stuCourse += this.info.stuCourse
			stuArmy += (this.info.stuArmy==null?"":this.info.stuArmy)
			stuGrade += this.info.stuGrade
			stuSemester += this.info.stuSemester
			stuRegisterState += this.info.stuRegisterState
			stuStudentState += this.info.stuStudentState
			stuGraduationExam += (this.info.stuGraduationExam==null?"":this.info.stuGraduationExam)
			stuEarlyGraduation += this.info.stuEarlyGraduation
			stuAdmissionDate += this.stuAdmissionDate
			stuGraduationDate += (this.stuGraduationDate==null?"":this.stuGraduationDate)
			majorId += this.major.majorName
			majorDualId += (this.majorDual == null?"":(this.majorDual.majorDualName==null?"":this.majorDual.majorDualName))
			majorMinorId += (this.majorMinor == null?"":(this.majorMinor.majorMinorName==null?"":this.majorMinor.majorMinorName))
			usersEnable += this.info.usersEnable
			usersBornAddr += this.info.usersBornAddr
			usersCurrentAddr += this.info.usersCurrentAddr
			usersNational += this.info.usersNational
			usersPhoneNum += this.info.usersPhoneNum
			usersCellNum += this.info.usersCellNum
			usersEmail += this.info.usersEmail
			})
			$("#photo").html(photo);
			$("#usersId").html(usersId);
			$("#usersName2").html(usersName);
			$("#usersEngName").html(usersEngName);
			$("#usersRRN").html(usersRRN);
			$("#stuCourse").html(stuCourse);
			$("#stuArmy").html(stuArmy);
			$("#stuGrade").html(stuGrade);
			$("#stuSemester").html(stuSemester);
			$("#stuRegisterState").html(stuRegisterState);
			$("#stuStudentState").html(stuStudentState);
			$("#stuGraduationExam").html(stuGraduationExam);
			$("#stuEarlyGraduation").html(stuEarlyGraduation);
			$("#stuAdmissionDate").html(stuAdmissionDate);
			$("#stuGraduationDate").html(stuGraduationDate);
			$("#majorId").html(majorId);
			$("#majorDualId").html(majorDualId);
			$("#majorMinorId").html(majorMinorId);
			$("#usersBornAddr").html(usersBornAddr);
			$("#usersCurrentAddr").html(usersCurrentAddr);
			$("#usersNational").html(usersNational);
			$("#usersPhoneNum").html(usersPhoneNum);
			$("#usersCellNum").html(usersCellNum);
			$("#usersEmail").html(usersEmail);
			$("#infoStudent").show();
			$("#infoStudent2").show();
			$("#infoStudent3").show();
			$("#hr").show();
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
	$("#hr").hide();	
	$("#h1").hide();
	$("#h2").hide();
	$("#h3").hide();
	$("#h4").hide();
	$("#update").hide();
	$("#delete").hide();
	$("#selectStudent").hide();	
	$("#infoStudent").hide();
	$("#infoStudent2").hide();
	$("#infoStudent3").hide();
	$("#searchStudent").on("click",function(){
		if($("#usersName").val() == ''){
			alert("검색어를 입력하세요");
			$("#hr").hide();	
			$("#h1").hide();
			$("#h2").hide();
			$("#h3").hide();
			$("#h4").hide();
			$("#update").hide();
			$("#delete").hide();
			$("#selectStudent").hide();	
			$("#infoStudent").hide();	
			$("#infoStudent2").hide();
			$("#infoStudent3").hide();
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectStudentByNameController.do",
			"data":"usersName="+$("#usersName").val(),
			"success":function(result){
				if( result == '' ){
					alert("조회할 내용이 없습니다");
					$("#hr").hide();	
					$("#h1").hide();
					$("#h2").hide();
					$("#h3").hide();
					$("#h4").hide();
					$("#update").hide();
					$("#delete").hide();
					$("#selectStudent").hide();	
					$("#infoStudent").hide();
					$("#infoStudent2").hide();
					$("#infoStudent3").hide();
				}else{
				var txt = "";
				$.each(result,function(){
				txt += "<tr style='height: 34px'><td align='center' style='height: 34px;font-size: 15px'>"+this.stuId+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersName+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersRRN+"</td><td align='center' style='height: 34px;font-size: 15px'>"+this.usersEmail+
				"</td><td align='center' style='height: 34px;font-size: 15px'><button onclick='info_student("+this.stuId+")'>상세정보보기</button></td></tr>"
				})
				$("#selectTbody").html(txt);
				$("#hr").show();	
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
<h3>학생 조회</h3>
<br>
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
	검색할 이름 <input type="text" name="usersName" id="usersName"/>&nbsp;&nbsp;<button id="searchStudent">조회</button><br>
	<br>
	<table id="selectStudent" border="1">
		<thead>
			<tr style="height: 34px;font-size: 15px">
				<th align="center"><input type="text"  class="form-control" placeholder="학생 번호" disabled></th>
				<th align="center"><input type="text"  class="form-control" placeholder="학생 이름" disabled></th>
				<th align="center"><input type="text"  class="form-control" placeholder="학생 주민 번호" disabled></th>
				<th align="center"><input type="text"  class="form-control" placeholder="학생 이메일" disabled></th>
				<th align="center"><input type="text"  class="form-control" placeholder="상세 정보 보기" disabled></th>
			</tr>
		</thead>
		<tbody id="selectTbody"></tbody>
	</table>

	<h3 id="h1">학생 상세 정보</h3>
	<ul id="h2"><li><h4>학생 기본 정보</h4></li></ul>
	<table id="infoStudent" border="2">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="60%">
		</colgroup>
		<thead>
	   		<tr>
	   			<td rowspan="4" id="photo" style="height: 34px;font-size: 15px" align="center"></td>
	   			<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학번" disabled></th>
	   			<td align="center" style="height: 34px;font-size: 15px" id="usersId"></td>
	   		</tr>
	   		<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="이름" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersName2"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="영문 이름" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersEngName"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="주민 번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersRRN"></td>
			</tr>
		</thead>
	</table>
	<ul id="h3"><li><h4>학생 학적 정보</h4></li></ul>
	<table id="infoStudent2" border="2">
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="과정 구분" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuCourse"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="병영 구분" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuArmy"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학년" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuGrade"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학기" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuSemester"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학적 구분" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuRegisterState"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 구분" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuStudentState"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="졸업시험 패스 여부" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuGraduationExam"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="조기졸업 대상 여부" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuEarlyGraduation"></td>			
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="입학 일자" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuAdmissionDate"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="졸업 일자" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="stuGraduationDate"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="소속 학과" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="majorId"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="복수 전공" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="majorDualId"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="부전공" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="majorMinorId"></td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="인증가능 상태" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersEnable"></td>
			</tr>
		</thead>
	</table>
	<ul id="h4"><li><h4>학생 카드 정보</h4></li></ul>
	<table id="infoStudent3" border="2">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
		<thead>
			<tr style="height: 34px;font-size: 15px" >
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
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="핸드폰 번호" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" id="usersCellNum"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="이메일" disabled></th>
				<td align="center" style="height: 34px;font-size: 15px" colspan="5" id="usersEmail"></td>
			</tr>
		</thead>
		</table>
<br>
	<center><button id="update" onclick="update_student($('#usersId').text())">수정</button>
	<button id="delete" onclick="delete_student($('#usersId').text())">삭제</button><br><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>