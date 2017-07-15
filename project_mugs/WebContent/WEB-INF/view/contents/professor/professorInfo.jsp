<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta>
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var x = "";
$(document).ready(function(){
	searchByJoin();
});
	function searchByJoin(){
		$.ajax({
			"url":"/project_mugs/professor/searchByJoin.do",
			"type":"POST",
			"data":{${_csrf.parameterName}:'${_csrf.token}'},
			"dataType":"json",
			"success":function(obj){
				$("#usersId").val(obj.usersId);
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
				
				$("#proUniversity").val(obj.proUniversity);
				$("#proGradSchool").val(obj.proGradSchool);
				$("#proOfficePhoneNum").val(obj.proOfficePhoneNum);
				$("#proLaboratoryPhoneNum").val(obj.proLaboratoryPhoneNum);
				var x = obj;
			},
			"error":function(){
				alert("에러발생");
			}
		});//ajax
	} 

$(document).on("click", "#updateBtn", function(){
	$.ajax({
	"success":function(){
		openchild();
	},
	"error":function(txt){	
		alert('에러발생');
		}
	});//ajax
});//document(click);  //집에서 처리

</script>

</head>
<body>
교수개인정보~~~<br>

<div>
	<c:choose>
		<c:when test="${requestScope.reFormDateStu.stuInfo.usersPhoto!=null}">
			<img src ="${initParam.rootPath}/resource/up_image/${requestScope.reFormDateStu.stuInfo.usersPhoto}" width="100px" height="100px">							
		</c:when> 
		<c:otherwise>
			사진 미등록   
		</c:otherwise>
	</c:choose>	
</div>


아이디<input type="text" id="usersId" name="usersId" value="" readonly="readonly"><br>
비밀번호<input type="text" id="usersPassword" name="usersPassword" value="" readonly="readonly"><br>
성명<input type="text" id="usersName" name="usersName" value="" readonly="readonly"><br>
영문성명<input type="text" id="usersEngName" name="usersEngName" value="" readonly="readonly"><br>
주민번호<input type="text" id="usersRRN" name="usersRRN" value="" readonly="readonly"><br>
국적<input type="text" id="usersNational" name="usersNational" value="" readonly="readonly"><br>
이메일<input type="text" id="usersEmail" name="usersEmail" value="" readonly="readonly"><br>
전화번호<input type="text" id="usersPhoneNum" name="usersPhoneNum" value="" readonly="readonly"><br>
핸드폰번호<input type="text" id="usersCellNum" name="usersCellNum" value="" readonly="readonly"><br>
현주소<input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value="" readonly="readonly"><br>
본적지<input type="text" id="usersBornAddr" name="usersBornAddr" value="" readonly="readonly"><br>
<input type="text" id="usersEnable" name="usersEnable" value="" style="display: none;">
사진주소<input type="text" id="usersPhoto" name="usersPhoto" value="" readonly="readonly"><br>

<button type="submit" id="updateBtn">수정</button>


<div id="professorRegiste">
졸업대학<input type="text" id="proUniversity" name="proUniversity" value="" readonly="readonly"><br>
졸업대학원<input type="text" id="proGradSchool" name="proGradSchool" value="" readonly="readonly"><br>
교수실전화번호<input type="text" id="proOfficePhoneNum" name="proOfficePhoneNum" value="" readonly="readonly"><br>
연구실전화번호<input type="text" id="proLaboratoryPhoneNum" name="proLaboratoryPhoneNum" value="" readonly="readonly"><br>

</div>
</body>
<script type="text/javascript">
	var openWin;
	
	function openchild(obj){
		// window.name = "부모창 이름"; planId
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");          
        openWin = window.open("/project_mugs/professorInfoUpdate.do", "강의계획서수정", "width=500, height=400 resizable=no");
        setTimeout(function(){
        	openWin.document.getElementById("usersId").value = document.getElementById("usersId").value;
        	openWin.document.getElementById("usersPassword").value = document.getElementById("usersPassword").value;
        	openWin.document.getElementById("usersName").value = document.getElementById("usersName").value;
        	openWin.document.getElementById("usersEngName").value = document.getElementById("usersEngName").value;
        	openWin.document.getElementById("usersRRN").value = document.getElementById("usersRRN").value;
        	openWin.document.getElementById("usersEmail").value = document.getElementById("usersEmail").value;
        	openWin.document.getElementById("usersPhoneNum").value = document.getElementById("usersPhoneNum").value;
        	openWin.document.getElementById("usersCellNum").value = document.getElementById("usersCellNum").value;
        	openWin.document.getElementById("usersNational").value = document.getElementById("usersNational").value;
        	openWin.document.getElementById("usersCurrentAddr").value = document.getElementById("usersCurrentAddr").value;
        	openWin.document.getElementById("usersBornAddr").value = document.getElementById("usersBornAddr").value;
        	openWin.document.getElementById("usersEnable").value = document.getElementById("usersEnable").value;
        	openWin.document.getElementById("usersPhoto").value = document.getElementById("usersPhoto").value;
        	openWin.document.getElementById("proUniversity").innerText = document.getElementById("proUniversity").value;
        	openWin.document.getElementById("proGradSchool").innerText = document.getElementById("proGradSchool").value;
        	openWin.document.getElementById("proOfficePhoneNum").innerText = document.getElementById("proOfficePhoneNum").value;
        	openWin.document.getElementById("proLaboratoryPhoneNum").innerText = document.getElementById("proLaboratoryPhoneNum").value;       	
        }, 1000);                
	}
</script>
</html>

