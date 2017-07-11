<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#stuRegisterInfoTable").hide();
	$("#stuHumanInfoTable").hide();
	$("#stuUpdateBtn").hide();
	$("#searchById").on("click",function(){
		if(!$("#stuId").val()){
			alert("값을 넣으세요");
			return;
		}
		$.ajax({
			"url" : "/project_mugs/student/getStudentInfoById.do",
			"type":"post",
			"data":{"stuId":$("#stuId").val()},
			"dataType":"json",
			"success":function(obj){
					//update할 때 가져갈 정보들
				 	$("#usersId").val(obj.stuId);
		            $("#usersPassword").val(obj.usersPassword);
		            $("#usersName").val(obj.usersName);
		            $("#usersEngName").val(obj.usersEngName);
		            $("#usersRRN").val(obj.usersRRN);
		            $("#usersEmail").val(obj.usersEmail);
		            $("#usersPhoneNum").val(obj.usersPhoneNum);
		            $("#usersCellNum").val(obj.usersCellNum);
		            $("#usersNational").val(obj.usersNational);
		            $("#usersCurrentAddr").val(obj.usersCurrentAddr);
		            $("#usersBornAddr").val(obj.usersBornAddr);
		            $("#usersEnable").val(obj.usersEnable);
		            $("#usersPhoto").val(obj.usersPhoto);
		            $("#usersNoticeList").val(obj.usersNoticeList);
		          
				 var txt="";
				 var txt2="";
				 //인적정보, 학적정보를 따로 보여준다.
				$.each(obj, function(){
					txt= 	"<tr><td>"+obj.stuId+
							"</td><td>"+obj.usersName+
							"</td><td>"+obj.usersEngName+
							"</td><td>"+obj.usersRRN+
							"</td><td>"+obj.usersEmail+
							"</td><td>"+obj.usersPhoneNum+
							"</td><td>"+obj.usersCellNum+
							"</td><td>"+obj.usersNational+
							"</td><td>"+obj.usersCurrentAddr+
							"</td><td>"+obj.usersBornAddr+
							"</td><td>"+obj.usersPhoto+
							"</td></tr><br>";
							
					var strSubMajorName = (obj.subMajor==null)?"없음":obj.subMajor.majorName;
					var strMultiMajorName = (obj.multiMajor==null)?"없음":obj.multiMajor.majorName;
	                var strStuArmy = (obj.stuArmy=="")?"해당사항없음":obj.stuArmy;
	                var strGraduationDate = (obj.stuGraduationDate==null)?"미졸업자":obj.stuGraduationDate;	               
	                
	                txt2 = "<tr><td>"+obj.mainMajor.majorName + "</td>"
	                  + "<td>"+strSubMajorName+"</td>"
	                  + "<td>"+strMultiMajorName+"</td>"                  
	                  + "<td>"+obj.stuCourse+"</td>"
	                  + "<td>"+strStuArmy+"</td>"
	                  + "<td>"+obj.stuAdmissionDate+"</td>"
	                  + "<td>"+strGraduationDate+"</td>"
	                  + "<td>"+obj.stuRegisterState+"</td>"
	                  + "<td>"+obj.stuStudentState+"</td>"
	                  + "<td>"+obj.stuGrade+"</td>"
	                  + "<td>"+obj.stuGraduationExam+"</td>"
	                  + "<td>"+obj.stuEarlyGraduation+"</td>"
	                  + "<td>"+obj.stuSemester+"</td>"
	                  + "</tr>";
				});
				//$("#result").text(txt);

				$("#stuHumanInfoTbody").html(txt);
				$("#stuRegisterInfoTbody").html(txt2);
				$("#stuHumanInfoTable").show();				
				$("#stuRegisterInfoTable").show();
				$("#stuUpdateBtn").show();
				
			}
		});
	});
});
</script>

</head>
<h1>학생정보조회</h1>
<body>
	<p>
	<input type="text" name="stuId" id="stuId" placeholder="찾을 id를 입력하세요">
	<button type="button" id="searchById">검색</button>

<table border="1" height="12px" id="stuRegisterInfoTable">
	<thead>
			<tr>
				<th>주전공</th>
				<th>부전공</th>
				<th>복수전공</th>
				<th>과정구분</th>
				<th>병영구분</th>
				<th>입학일자</th>
				<th>졸업일자</th>
				<th>학적구분</th>
				<th>학생구분</th>
				<th>학년</th>
				<th>졸업시험 패스여부</th>
				<th>조기졸업 대상여부</th>
				<th>학기</th>
			</tr>	
		</thead>
		<tbody id="stuRegisterInfoTbody">
		</tbody>
</table><p>
<table border="1" height="12px" id="stuHumanInfoTable">
		<thead>
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>영문성명</th>
				<th>주민번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>핸드폰번호</th>
				<th>국적</th>
				<th>현주소</th>
				<th>본적지</th>
				<th>사진주소</th>
			</tr>
		</thead>
		<tbody id="stuHumanInfoTbody">
		</tbody>
</table>
<form action="/project_mugs/student/moveUpdateForm.do" method="post">
<input type="hidden" id="usersId" name="usersId">
<input type="hidden" id="usersPassword" name="usersPassword">
<input type="hidden" id="usersName" name="usersName">
<input type="hidden" id="usersEngName" name="usersEngName">
<input type="hidden" id="usersRRN" name="usersRRN">
<input type="hidden" id="usersEmail" name="usersEmail">
<input type="hidden" id="usersPhoneNum" name="usersPhoneNum">
<input type="hidden" id="usersCellNum" name="usersCellNum">
<input type="hidden" id="usersNational" name="usersNational">
<input type="hidden" id="usersCurrentAddr" name="usersCurrentAddr">
<input type="hidden" id="usersBornAddr" name="usersBornAddr">
<input type="hidden" id="usersPhoto" name="usersPhoto">
<input type="hidden" id="usersEnable" name="usersEnable">
<input type="hidden" id="usersNoticeList" name="usersNoticeList">
<input type="submit" id="stuUpdateBtn" value="수정 페이지로">
</form>

</html>