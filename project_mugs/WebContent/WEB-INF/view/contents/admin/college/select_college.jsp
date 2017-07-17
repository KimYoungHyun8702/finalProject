<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2>단과대학 조회</h2>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<td align="center">단과대학 ID</td>
				<td align="center">단과대학 이름</td>
				<td align="center">수정</td>
				<td align="center">삭제</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
				<tr>
					<td>${list.collegeId }</td>
					<td>${list.collegeName }</td>
					<td><button id="update" onclick="location.href='${initParam.rootPath }/update_college.do?collegeId=${list.collegeId }&collegeName=${list.collegeName }'">수정</button></td>
					<td><button id="delete" onclick="College_delete(${list.collegeId})">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>