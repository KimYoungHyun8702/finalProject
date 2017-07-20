<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width:100%;
	
}
th, tbody td{
	height:35px;
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
h3{
	font-family:돋움체;
}
</style>
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
	<h3>학과 조회</h3>
	<br>
	<c:if test="${sessionScope.majordeleteMessage != null}">
	<script type="text/javascript">
		alert("삭제되었습니다");
	</script>
	<% session.removeAttribute("majordeleteMessage"); %>
</c:if>
	<hr>
	단과대학선택:
	<select name="collegeId" id="collegeId">
		<option>단과대학 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list.collegeId }>${list.collegeName }</option>
		</c:forEach>
	</select><br><br>
	<br>
	<table id="selectMajor" border="1">
		<thead>
			<tr class="filters">
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="학과ID" disabled></th>
				<th align="center"><input type="text" class="form-control" placeholder="학과이름" disabled></th>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<br>
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>