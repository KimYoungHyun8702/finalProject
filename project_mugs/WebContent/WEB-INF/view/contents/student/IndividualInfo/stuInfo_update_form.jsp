<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#showUpdateImg").hide();
})

function deleteImg(){		
		$("#imageSpace").html('<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="138px" height="100px">');		
} 
  
function showUpImg(){
		$("#showUpdateImg").toggle();
};

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
	<h1>학생정보조회</h1>
	<h5>성명, 주민번호, 학번, 학적정보 등 기존 사항은 수정할 수 없습니다.</h5>
	<p>
	<table border="1">
	<tr> 		
		<td id="imageSpace">
		<c:choose>
		<c:when test="${requestScope.reFormDateStu.stuInfo.usersPhoto != null}">
			<img src ="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}" id="imageSpace" width="138px" height="100px">
		</c:when>
		<c:otherwise>
			<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="138px" height="100px">
		</c:otherwise>
		</c:choose>
		</td>							
	</tr>  
	<tr>
		<td><input type="button" value="이미지변경 " id="updateImg" onclick="showUpImg();">
			<input type="button" value="삭제" onclick="deleteImg();"></td> 
	</tr> 
	</table>
	<br>
	<table border="2" id="showUpdateImg">
		<tr>
			<td align="center">프로필 사진 변경</td>
		</tr> 
		<tr> 
			<td><input type="file" id="upImage" name ="upImage"></td>
		</tr>
	</table>
	
	<br>
	<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">성명</td>    
		<td bgcolor="lightgray">학번</td>
		<td bgcolor="lightgray">주민번호</td>
		<td bgcolor="lightgray">이메일</td>
		<td bgcolor="lightgray">전화번호</td>
		<td bgcolor="lightgray">핸드폰번호</td>		
	</tr>
	<tr align="center">  
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
	<tr align="center">
		<td bgcolor="lightgray">영문성명</td>
		<td bgcolor="lightgray">국적</td>
		<td colspan="2" bgcolor="lightgray">본적지</td>
		<td colspan="2" bgcolor="lightgray">현주소</td>
	</tr>
	<tr align="center">
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
<p>


<table border="2" style="width: 600px; border-color: black"> 
	<tr align="center"> 
		<td bgcolor="lightgray">학년</td>    
		<td bgcolor="lightgray">학기</td>
		<td bgcolor="lightgray">주전공</td>
		<td bgcolor="lightgray">부전공</td>
		<td bgcolor="lightgray">입학일자</td>
		<td bgcolor="lightgray">졸업일자</td>		
	</tr>
	<tr align="center">  
		<td>${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
		<td>${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
		<td>${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
		<td>${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
		<td>${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
		<td>${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
	</tr>
	<tr align="center">
		<td bgcolor="lightgray">과정구분</td>
		<td bgcolor="lightgray">병영구분</td>
		<td bgcolor="lightgray">학적구분</td>
		<td bgcolor="lightgray">학생구분</td>
		<td bgcolor="lightgray">조기졸업<br>대상여부</td>
		<td bgcolor="lightgray">복수전공</td>
	</tr>
	<tr align="center">
		<td>${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
		<td>${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
		
		<td>${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
		<td>${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
	</tr>
</table>
	<p>
	
	<a href = "${initParam.rootPath}/student/moveUpdatePwd.do" >비밀번호 변경 페이지로 이동</a>
	<br>
	<input type="hidden" name="usersPassword" value="${requestScope.reFormDateStu.stuInfo.usersPassword}">
	<input type="submit" id="upBtn" value="수정" ><br>
	</form> 
	
</body>
</html>