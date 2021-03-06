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
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
	if($("#buildingName").val() == "" || $("#buildingName").val().trim() == 0  ){
		alert("건물 이름을 입력하세요");
		return false;
	}else if($("#buildingImg").val() == "" || $("#buildingImg").val().trim() == 0 ){
		alert("건물 사진을 입력하세요");
		return false;
	}else if($("#buildingX").val() == "" || $("#buildingX").val().trim() == 0 ){
		alert("건물 X좌표 입력하세요");
		return false;
	}else if($("#buildingY").val() == "" || $("#buildingY").val().trim() == 0 ){
		alert("건물 Y좌표를 입력하세요");
		return false;
	}else if($("#buildingPhoneNum").val() == "" || $("#buildingPhoneNum").val().trim() == 0 ){
		alert("건물 전화번호를 입력하세요");
		return false;
	}else if($("#buildingAddr").val() == "" || $("#buildingAddr").val().trim() == 0 ){
		alert("건물 주소를 입력하세요");
		return false;
	}else{
		return confirm("등록하시겠습니까?")
	}
}
</script>
</head>
<body>
<h3>건물 등록</h3>
<br>
	<form action="${initParam.rootPath }/admin/insertBuildingController.do" method="post" onsubmit="return check()">
			<table border="2">
				<thead>
					<tr>
						<th align="center"><input type="text" class="form-control" placeholder="건물이름" disabled></th>
						<th align="center"><input type="text" class="form-control" placeholder=건물사진 disabled></th>
						<th align="center"><input type="text" class="form-control" placeholder="건물X좌표" disabled></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center"><input type="text" style="border: 0" name="buildingName" id="buildingName"/></td>
						<td align="center"><input type="text" style="width: 500px;border: 0" name="buildingImg" id="buildingImg"/></td>
						<td align="center"><input type="text" style="width: 300px;border: 0" name="buildingX" id="buildingX"/></td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th align="center"><input type="text" class="form-control" placeholder="건물 Y좌표" disabled></th>
						<th align="center"><input type="text" class="form-control" placeholder="건물 주소" disabled></th>
						<th align="center"><input type="text" class="form-control" placeholder="건물 전화번호" disabled></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center"><input type="text" style="width: 300px;border: 0" name="buildingY" id="buildingY"/></td>
						<td align="center"><input type="text" style="width: 500px;border: 0" name="buildingAddr" id="buildingAddr"/></td>
						<td align="center"><input type="text" style="border: 0" name="buildingPhoneNum" id="buildingPhoneNum"/></td>
					</tr>
				</tbody>
			</table><br>
			<center><input type="submit" value="등록"></center>
			<br>
			<sec:csrfInput/>
	</form>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>