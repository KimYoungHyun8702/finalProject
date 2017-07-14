<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input{
	text-align:center;
	height:30px;
}
table{
	width:100%;
}
.table2 {
	width:100%;
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
	height:10px;
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
<script type="text/javascript">
$(document).ready(function(){
	$("#upBtn").on("click",function(){
		if($("#upImage").val()==null){
			alert('기존 사진을 사용합니다.');
		};
	});		
});

function check(){
    if($("#usersEmail").val() == "" || $("#usersEmail").val().trim() == 0){
       alert("이메일을 입력하세요")
       return false;
    }else if($("#usersPhoneNum").val() == "" || $("#usersPhoneNum").val().trim() == 0){
       alert("집 전화번호를 입력하세요")
       return false;
    }else if($("#usersCellNum").val() == "" || $("#usersCellNum").val().trim() == 0){
       alert("핸드폰 번호를 입력하세요")
       return false;
    }else if($("#usersCurrentAddr").val() == "" || $("#usersCurrentAddr").val().trim() == 0){
       alert("현 거주지 주소를 입력하세요")
       return false;
    }else if($("#usersBornAddr").val() == "" || $("#usersBornAddr").val().trim() == 0){
       alert("본적지 주소를 입력하세요")
       return false;
    }else{
       return confirm("등록하시겠습니까 ?")
    }
 };

</script>
</head>
<body>

	<form action="${initParam.rootPath}/student/updateStuAndSelect.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data"  onsubmit="return check();">
	<sec:csrfInput/>
	<h3>학생정보조회</h3>
	<hr style="border: solid px black">
	<h3>성명, 주민번호, 학번, 학적정보 등 기존 사항은 수정할 수 없습니다.</h3>
	<hr style="border: solid px black">
    <div class="panel panel-primary filterable">
	<table border="2" style="border-color: black" class="table"> 
	<tr align="center" class="filters"> 
		<td bgcolor="palegoldenrod">성명</td>    
		<td bgcolor="palegoldenrod">학번</td>
		<td bgcolor=palegoldenrod>주민번호</td>
		<td bgcolor="palegoldenrod">이메일</td>
		<td bgcolor="palegoldenrod">전화번호</td>
		<td bgcolor="palegoldenrod">핸드폰번호</td>		
	</tr>
	<tr align="center" class="filters">  
		<td>${requestScope.reFormDateStu.stuInfo.usersName}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuId}</td>
		<td>${requestScope.reFormDateStu.stuInfo.usersRRN}</td>
		<td >
			<input type="text" name ="usersEmail" id="usersEmail" value="${requestScope. reFormDateStu. stuInfo.usersEmail}" >
		</td>
		<td >
			<input type="text" name ="usersPhoneNum" id="usersPhoneNum" value="${requestScope. reFormDateStu. stuInfo.usersPhoneNum}">
		</td>
		<td>
			<input type="text" name ="usersCellNum" id="usersCellNum" value="${requestScope. reFormDateStu. stuInfo.usersCellNum}">
		</td>
	</tr>
	<tr align="center" class="filters">
		<td bgcolor="palegoldenrod">영문성명</td>
		<td bgcolor="palegoldenrod">국적</td>
		<td colspan="2" bgcolor="palegoldenrod">본적지</td>
		<td colspan="2" bgcolor="palegoldenrod">현주소</td>
	</tr>
	<tr align="center" class="filters">
		<td>${requestScope.reFormDateStu.stuInfo.usersEngName}</td>
		<td>${requestScope.reFormDateStu.stuInfo.usersNational}</td>
		<td colspan="2">
			<input type="text" name ="usersBornAddr" id="usersBornAddr" value="${requestScope. reFormDateStu. stuInfo.usersBornAddr}">
		</td>
		<td colspan="2">
			<input type="text" name ="usersCurrentAddr" id="usersCurrentAddr" value="${requestScope. reFormDateStu. stuInfo.usersCurrentAddr}">
		</td>
	</tr>
</table>
</div>
<p>

<div class="panel panel-primary filterable">
<table border="2" style="border-color: black" class="table2"> 
	<tr align="center" class="filters"> 
		<td bgcolor="palegoldenrod">학년</td>    
		<td bgcolor="palegoldenrod" width="120px">학기</td>
		<td bgcolor="palegoldenrod">주전공</td>
		<td bgcolor="palegoldenrod">부전공</td>
		<td bgcolor="palegoldenrod" width="150px">입학일자</td>
		<td bgcolor="palegoldenrod">졸업일자</td>		
	</tr>
	<tr align="center" class="filters">   
		<td>${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
		<td>${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
		<td>${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
		<td>${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
		<td>${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
	</tr>
	<tr align="center" class="filters">
		<td bgcolor="palegoldenrod">과정구분</td>
		<td bgcolor="palegoldenrod" width="120px">병영구분</td>
		<td bgcolor="palegoldenrod">학적구분</td>
		<td bgcolor="palegoldenrod">학생구분</td>
		<td bgcolor="palegoldenrod" width="150px">조기졸업<br>대상여부</td>
		<td bgcolor="palegoldenrod">복수전공</td>
	</tr>
	<tr align="center" class="filters">
		<td>${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
		
		<td>${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
		<td>${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
	</tr>
</table>
</div>
	<p>
<div class="panel panel-primary filterable">
	<table border="1" style="float: left">
		<tr>
			<td align="center">프로필 사진 변경</td>
		</tr> 
		<tr> 
			<td><input type="file" id="upImage" name ="upImage"></td>
		</tr>
	</table>
	</div>
	<br>
	<center><button onclick="location.href='${initParam.rootPath}/student/moveUpdatePwd.do'" type="button" class="btn btn-primary">비밀번호 변경 페이지로 이동</button></center>
	<input type="hidden" name="usersPassword" value="${requestScope.reFormDateStu.stuInfo.usersPassword}"><br>
	<center><input type="submit" id="upBtn" value="수정"></center>
	</form> 

</body>
</html>