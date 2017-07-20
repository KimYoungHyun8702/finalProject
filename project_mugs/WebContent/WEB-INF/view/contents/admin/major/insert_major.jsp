<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUGS</title>
<style type="text/css">
input{
	text-align:center;
}
table{
	width: 100%;
}
th {
	bgcolor:peru;
}
td{
	padding: 5px;
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
.form-controler {
	color:black;
}
h3{
	font-family:굴림체;
}
option {
	height:25px;
}

</style>
</head>
<body>
	<h3>학과 등록</h3>
	<br>
	<form id="insertForm" action="${initParam.rootPath }/admin/insertMajorController.do" method="post" onsubmit="return confirm('등록하시겠습니까?')">
		<table border="2">
			<thead>
				<tr>
					<th align="center"><input type="text" class="form-control" placeholder="단과 대학" disabled></th>
					<th align="center"><input type="text" class="form-control" placeholder="학과 이름" disabled></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><select name="collegeId" id="collegeId">
							<option>단과대학 선택</option>
							<c:forEach var="list" items="${requestScope.list }">
								<option value=${list.collegeId }>${list.collegeName }</option>
							</c:forEach>
						</select></td>
					<td align="center"><input type="text" name="majorName" style="border: 0; width: 500px"/></td>
				</tr>
			</tbody>
		</table><br>
			<center><input type="submit" value="등록"></center>
			<sec:csrfInput/>
	</form><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>