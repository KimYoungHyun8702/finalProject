<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#selectMajor").hide();
	$("#collegeId").on("change",function(){
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectMajorByCollegeIdController.do",
			"data":"collegeId="+$("#collegeId").val(),
			"success":function(result){
				var txt="";
				$.each(result,function(){
					txt = txt+"<tr><td>"+this.majorId+"</td><td><a href='${initParam.rootPath }/admin/selectMajorGraduationCreditByMajorIdController.do?majorId="+this.majorId+"'>"+this.majorName+"</a></td></tr>"
				});
				$("#tbody").html(txt);
				$("#selectMajor").show();
			}
		})//end of ajax
	})//end of first_category
});//end of document
</script>
</head>
<body>
	<h2>학과 조회</h2>
	<c:if test="${sessionScope.majordeleteMessage != null}">
	<script type="text/javascript">
		alert("삭제되었습니다");
	</script>
	<% session.removeAttribute("majordeleteMessage"); %>
</c:if>
	<hr>
	<select name="collegeId" id="collegeId">
		<option>단과대학 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list.collegeId }>${list.collegeName }</option>
		</c:forEach>
	</select>
	
	<table id="selectMajor" border="1">
		<thead>
			<tr>
				<td align="center">학과 ID</td>
				<td align="center">학과 이름</td>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<button onclick="location.href='${initParam.rootPath }/'">메인화면으로 가기</button>
</body>