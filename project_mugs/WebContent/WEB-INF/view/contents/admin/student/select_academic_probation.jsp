<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function expel(usersId){
	if(confirm("제적 처리 하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/expelProbationController.do?usersId="+usersId
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h2>학생 제적 현황</h2>
<c:if test="${sessionScope.expelMessage != null}">
		<script type="text/javascript">
			alert("제적 처리 되었습니다");
		</script>
		<% session.removeAttribute("expelMessage"); %>
</c:if>
<br>
	<table border="1">
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학과" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 학번" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 이름" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학사 경고 받은 학기" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="제적" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td align="center">${list.majorName }</td>
				<td align="center">${list.usersId }</td>
				<td align="center">${list.usersName }</td>
				<td align="center">
				<c:forEach items="${requestScope.year}" var="year">
				 	${year.probationYear} ${year.probationSemester }
				 </c:forEach>
				</td>
				<td align="center"><button onclick="expel('${list.usersId }')">제적 승인</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>