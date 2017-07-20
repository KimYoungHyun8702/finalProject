<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input{
	text-align:center;
}
table{
	width:700px;
	
}
th {
	bgcolor:peru;
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
.form-controler {
	color:black;
}
h3{
	font-family:돋움체;
}
option {
	height:25px;
}

</style>
</head>
<body>
	<h2>학과 등록</h2>
	<br>
	
	<form id="insertForm" action="${initParam.rootPath }/admin/insertMajorController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
	단과대학선택: <select name="collegeId" id="collegeId">
		<option>단과대학 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list.collegeId }>${list.collegeName }</option>
		</c:forEach>
	</select>
			&nbsp; 학과 이름 : <input type="text" name="majorName"/>&nbsp;&nbsp;
			<input type="submit" value="등록">
			<sec:csrfInput/>
	</form>
</body>