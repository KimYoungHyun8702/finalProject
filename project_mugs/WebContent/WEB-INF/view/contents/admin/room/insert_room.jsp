<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#buildingId").val() == '강의동 선택'){
		alert("강의동을 선택해주세요");
		return false;
	}else if($("#roomName").val() == '' || $("#roomName").val().trim() == 0	){
		alert("강의실 이름을 입력하세요");
		return false
	}else{
		return confirm("등록하시겠습니까 ?");
	}
}
</script>
</head>
<body>
<h2>강의실 등록</h2>
<br>
<form action="${initParam.rootPath }/admin/insertRoomController.do" method="post" onsubmit="return check()">
	<table border="2">
		<thead>
			<tr>
				<th align="center"><input type="text" class="form-control" placeholder="강의동 선택" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="강의실 이름" disabled></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center"><select name="buildingId" id="buildingId" >
										<option>강의동 선택</option>
										<c:forEach var="list" items="${requestScope.list }">
										<option value=${list.buildingId }>
										${list.buildingName }
										</option> 
										</c:forEach>
										</select></td>				
				<td align="center"><input type="text" name="roomName" id="roomName" style="border: 0"/></td>
			</tr>
		</tbody>
	</table><br>
<center><input type="submit" value="등록"></center>
<sec:csrfInput/>
</form>
<br>
<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>

</body>