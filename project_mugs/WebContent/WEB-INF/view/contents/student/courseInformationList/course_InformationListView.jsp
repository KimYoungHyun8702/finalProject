<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
    <link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet"> 
<style type="text/css">
.table{
	width:100%;
}
th, input {
	text-align:center;
}
h3{
	font-family:굴림체;
}
table{
	width:100%;
	
}
td{
	padding: 5px;
	border: 1px solid black;
}

#product_info_layer{
	width:700px;
	border: 1px solid gray;
	padding:5px;
	display: none;/*최초 로딩시에는 안보이도록 처리*/
}

</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


</script>


<title>MUGS</title>

</head>
<body>

    <h3>수강목록 조회</h3><br>


	<table border="2" style="border-color: black">
	<thead id="thead">
	
		 <tr class="filters">
                        <th width="50px"><input type="text" class="form-control" placeholder="과목ID" disabled></th>
                        <th width="100px"><input type="text" class="form-control" placeholder="과목명" disabled></th>
                        <th width="80px"><input type="text" class="form-control" placeholder="이수구분" disabled></th>
                        <th width="50px"><input type="text" class="form-control" placeholder="학점" disabled></th>
						<th width="100px"><input type="text" class="form-control" placeholder="담당교수" disabled></th>
						<th width="150px"><input type="text" class="form-control" placeholder="강의시간" disabled></th>
						<th width="80px"><input type="text" class="form-control" placeholder="강의실" disabled></th>
         </tr>
	</thead>
	<tbody id="tbody">
			<c:forEach items="${requestScope.myCourseListResult}" var="courseList">
				<tr>

					<td align="center">${courseList.subjectId}</td>
					<td align="center">${courseList.subject.subjectName}</td>
					<td align="center">${courseList.subject.subjectType}</td>
					<td align="center">${courseList.subject.subjectCredit}</td>
					<td align="center">${courseList.professor.usersName}</td>
					<td align="center">${courseList.subject.subjectTime}</td>
					<td align="center">${courseList.building.buildingName}/${courseList.room.roomName }</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
<%-- <body>
<h2>수강정보목록조회하는 jsp</h2>
여기다가 현재 수강하고 있는 과목 목록 뿌려주면댐
	<table>
	<thead id="thead">
		<tr>
			<td>과목id</td>
			<td>과목명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>담당교수</td>
			<td>강의시간</td>
			<td>강의실</td>
		</tr>
	</thead>
	<tbody id="tbody">
			<c:forEach items="${requestScope.myCourseListResult}" var="courseList">
				<tr>
					<td>${courseList.subjectId}</td>
					<td>${courseList.subject.subjectName}</td>
					<td>${courseList.subject.subjectType}</td>
					<td>${courseList.subject.subjectCredit}</td>
					<td>${courseList.professor.usersName}</td>
					<td>${courseList.subject.subjectTime}</td>
					<td>${courseList.subject.lectureId}</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
<button onclick="location.href='${initParam.rootPath}/'">이전페이지로</button>

</body> --%>
</html>