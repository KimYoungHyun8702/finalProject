<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width:100%;
	
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
h3{
	font-family:굴림체;
}
</style>
<script type="text/javascript">
	function College_delete(collegeId){
		if(confirm("삭제하시겠습니까?")){
			location.href="${initParam.rootPath }/admin/deleteCollegeController.do?collegeId="+collegeId
		}else{
			return false;
		}
	};
</script>
</head>
<body>
<h3>단과대학 조회</h3>
<br>
	<table border="2">
		<thead>
			<tr>
				<th align="center"><input type="text" class="form-control" placeholder="단과대학ID" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="단과대학이름" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="수정" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="삭제" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
				<tr>
					<td align="center" >${list.collegeId }</td>
					<td align="center" >${list.collegeName }</td>
					<td align="center"><button id="update" onclick="location.href='${initParam.rootPath }/update_college.do?collegeId=${list.collegeId }&collegeName=${list.collegeName }'">수정</button></td>
					<td align="center"><button id="delete" onclick="College_delete(${list.collegeId})">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>