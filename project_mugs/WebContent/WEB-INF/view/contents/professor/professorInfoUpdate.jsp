<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>

<form action="/project_mugs/professor/updateProfile.do" method="post">
아이디<input type="text" id="usersId" name="usersId" value="" readonly="readonly"><br>
비밀번호<input type="text" id="usersPassword" name="usersPassword" value="" readonly="readonly"><br>
성명<input type="text" id="usersName" name="usersName" value=""><br>
영문성명<input type="text" id="usersEngName" name="usersEngName" value=""><br>
주민번호<input type="text" id="usersRRN" name="usersRRN" value=""><br>
이메일<input type="text" id="usersEmail" name="usersEmail" value=""><br>
전화번호<input type="text" id="usersPhoneNum" name="usersPhoneNum" value=""><br>
핸드폰번호<input type="text" id="usersCellNum" name="usersCellNum" value=""><br>
국적<input type="text" id="usersNational" name="usersNational" value=""><br>
현주소<input type="text" id="usersCurrentAddr" name="usersCurrentAddr" value=""><br>
본적지<input type="text" id="usersBornAddr" name="usersBornAddr" value=""><br>
뭐더라..<input type="text" id="usersEnable" name="usersEnable" value=""><br>
사진주소<input type="text" id="usersPhoto" name="usersPhoto" value=""><br>

<button type="submit" id="updateBtn">수정</button>
</form>

<div id="professorRegiste">
졸업대학<input type="text" id="proUniversity" name="proUniversity" value="" readonly="readonly"><br>
졸업대학원<input type="text" id="proGradSchool" name="proGradSchool" value="" readonly="readonly"><br>
교수실전화번호<input type="text" id="proOfficePhoneNum" name="proOfficePhoneNum" value="" readonly="readonly"><br>
</div>

</body>
</html>