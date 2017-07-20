<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>MUGS</title>
</head>
<body>
<h3>단과대학 수정</h3>
<br>
	<form action="${initParam.rootPath }/admin/updateCollegeController.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
		<table border="2">
			<thead>
				<tr>
					<th align="center"><input type="text" class="form-control" placeholder="단과대학 이름" disabled></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><input type="text" name="collegeName" value="${param.collegeName }" style="border: 0; width: 500px"/></td>
				</tr>
			</tbody>
		</table><br>
			<input type="hidden" name="collegeId" value="${param.collegeId }"/>
			<center><input type="submit" value="수정"></center>
			<sec:csrfInput/>
	</form><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>