<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function check(){
	if($("#oldUserPassword").val() == ""){
	    alert("기존 비밀번호를 입력하세요");
	    return false;
	}else if($("#oldUserPassword").val().trim() == 0 || $("#usersPassword").val().trim() == 0){
	 	alert("이 란에 공백은 허용되지 않습니다.")  	
		return false;
 	}else if($("#usersPassword").val() == ""){
	    alert("이메일을 입력하세요")
	    return false;
	}else{
		return confirm('변경하시겠습니까?');
 	}
};
console.log('${param.errorMessage}');
</script> 
<body>
<h3>비밀번호 수정</h3>
<br><br><br><br><br><br><br>
<form action="${initParam.rootPath}/student/updatePassword.do" method="post" onsubmit="return check();">
<center>기존 비밀번호를 입력하세요 <input type="password" name="oldUserPassword" id="oldUserPassword"></center>
	<c:choose>
		<c:when test="${not empty param.errorMessage}">	
				<font color="red">${param.errorMessage}</font>
		</c:when>
		<c:otherwise>
				<br> 
		</c:otherwise>
	</c:choose>
<br>
<center>변경할 비밀번호를 입력하세요 <input type="password" name="usersPassword" id="usersPassword"></center><br>
<center><input type="submit" value="변경"></center>
<sec:csrfInput/>
</form>
</body>
</html>