<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input{
   text-align:center;
   font-size: 15px;
}
table{
   width:100%;
}
td{
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
.form-controler {
   color:black;
}
h3{
   font-family:돋움체;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#upImage").hide();
})

function deleteImg(){		
		$("#imageSpace").html('<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="150px" height="100px"><br>'
		+'<input type="file" id="upImage" name ="upImage">'
		+'<input type="button" value="이미지변경 " id="updateImg" onclick="showUpImg();">'
		+' <input type="button" value="삭제" onclick="deleteImg();">');
} 
  
function showUpImg(){
		$("#upImage").toggle();
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
       
       
    	return confirm("수정하시겠습니까 ?")
    }
 };

</script>
</head>
<body>

	<form action="${initParam.rootPath}/student/updateStuAndSelect.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data"  onsubmit="return check();">
	<sec:csrfInput/>
	<h3>학생 정보 수정</h3>
	<br>
	<ul><li><h4>학생 기본 정보</h4></li></ul>
	<h5 style="color: red">사진만 수정 가능합니다</h5>
	<table border="2">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="60%">
		</colgroup>
		<thead>
			<tr>
				<td rowspan="4" style="height: 34px" id="imageSpace"><c:choose>
														<c:when test="${requestScope.reFormDateStu.stuInfo.usersPhoto != null}">
															<img src ="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}" id="imageSpace" width="150px" height="100px">
														</c:when>
														<c:otherwise>
															<img src ="${initParam.rootPath}/resource/up_image/1.jpg" width="150px" height="100px">
														</c:otherwise>
														</c:choose>
				<input type="file" id="upImage" name ="upImage">
				<input type="button" value="이미지변경 " id="updateImg" onclick="showUpImg();">
				<input type="button" value="삭제" onclick="deleteImg();">
				</td>
				<th align="center" ><input type="text" style="height: 40px" class="form-control" placeholder="학번" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuId}</td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px"class="form-control" placeholder="이름" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.usersName}</td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="영문 이름" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.usersEngName}</td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="주민 번호" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.usersRRN}</td>
			</tr>
		</thead>
	</table>
	<ul><li><h4>학생 학적 정보</h4></li></ul>
	<table border="2">
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr>
	   			<th align="center" ><input type="text" style="height: 40px" class="form-control" placeholder="과정 구분" disabled></th>
	   			<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuCourse}</td>
	   			<th align="center" ><input type="text" style="height: 40px" class="form-control" placeholder="병영 구분" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuArmy}</td>
	   		</tr>
	   		<tr>
	   			<th align="center" ><input type="text" style="height: 40px" class="form-control" placeholder="학년" disabled></th>
	   			<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuGrade}</td><!-- 학년 -->
	   			<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학기" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuSemester}</td><!-- 학기 -->
	   		</tr>
	   		<tr>
	   			<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학적 구분" disabled></th>
	   			<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuRegisterState}</td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 구분" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.stuStudentState}</td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="입학 일자" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuAdmissionDate}</td><!-- 입학일자 -->
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="졸업 일자" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuGraduationDate}</td><!-- 졸업일자 -->
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="조기졸업 대상 여부" disabled></th>
				<td style="height: 34px">${(requestScope.reFormDateStu.stuInfo.stuEarlyGraduation=='y')?'조기졸업가능':'조기졸업불가'}</td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="소속 학과" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.mainMajor.majorName}</td><!-- 주전공 -->
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="복수 전공" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.multiMajor.majorName}</td>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="부전공" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.subMajor.majorName}</td><!-- 부전공 -->
			</tr>
		</thead>
	</table>
	<ul><li><h4>학생 카드 정보</h4></li></ul>
	<h5 style="color: red">학생 카드 정보만 수정 가능합니다. 국적 수정은 관리자에게 문의하세요.</h5>
	<table border="2">
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
				<th align="center" ><input type="text" style="height: 40px" class="form-control" placeholder="본적지 주소" disabled></th>
				<td colspan="5" style="height: 34px"><input type="text" style="width: 500px;border:0" name ="usersBornAddr" id="usersBornAddr" value="${requestScope. reFormDateStu. stuInfo.usersBornAddr}"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="현 거주지 주소" disabled></th>
				<td colspan="5" style="height: 34px"><input type="text" style="width: 500px;border:0" name ="usersCurrentAddr" id="usersCurrentAddr" value="${requestScope. reFormDateStu. stuInfo.usersCurrentAddr}"></td>
			</tr>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="국적" disabled></th>
				<td style="height: 34px">${requestScope.reFormDateStu.stuInfo.usersNational}</td>
				<th align="center" ><input type="text"  style="height: 40px"class="form-control" placeholder="집 전화번호" disabled></th>
				<td style="height: 34px"><input type="text" name ="usersPhoneNum" style="border: 0" id="usersPhoneNum" value="${requestScope. reFormDateStu. stuInfo.usersPhoneNum}"></td>
				<th align="center"><input type="text"  style="height: 40px"class="form-control" placeholder="핸드폰 번호" disabled></th>
				<td style="height: 34px"><input type="text" name ="usersCellNum" style="border: 0" id="usersCellNum" value="${requestScope. reFormDateStu. stuInfo.usersCellNum}"></td>
			</tr>
			<tr>
				<th align="center"><input type="text"  style="height: 40px"class="form-control" placeholder="이메일" disabled></th>
				<td colspan="5" style="height: 34px"><input type="text" name ="usersEmail" style="width: 500px;border:0" id="usersEmail" value="${requestScope. reFormDateStu. stuInfo.usersEmail}" ></td>
			</tr>
		</thead>
	</table>
	<a href = "${initParam.rootPath}/student/moveUpdatePwd.do" >비밀번호 변경 페이지로 이동</a>
	<br>
	<input type="hidden" name="usersPassword" value="${requestScope.reFormDateStu.stuInfo.usersPassword}">
	<input type="submit" id="upBtn" value="수정" ><br>
	</form> 
	
</body>
</html>