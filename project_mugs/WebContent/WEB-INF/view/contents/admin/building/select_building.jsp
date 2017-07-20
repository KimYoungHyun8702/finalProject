<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   font-size: 15px;
}
select{
   width:150px;
   height: 30px;
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
   font-family:돋움체;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.buideleteMessage != null}">
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<% session.removeAttribute("buideleteMessage"); %>
</c:if>
	<h2>건물 조회</h2>
	<br>
	<table border="1">
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="건물 ID" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="건물 이름" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="건물 전화번호" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
				<tr>
					<td>${list.buildingId }</td>
					<td><a href="${initParam.rootPath }/admin/selectBuildingByIdController.do?buildingId=${list.buildingId}">${list.buildingName }</a></td>
					<td>${list.buildingPhoneNum }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>