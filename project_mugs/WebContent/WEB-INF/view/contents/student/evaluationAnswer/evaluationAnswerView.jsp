<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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


input{
	text-align:center;
}
table{
	width:100%;
	
}
td{
	padding: 5px;
	border: 1px solid black;
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


<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".submit").on("click", function(){
		if($(this).val() == 'Y') {
			alert($(this).val());
			alert("이미 해당 과목의 설문에 응답하셨습니다.");
			return false;
		}
	});//end of submit
	
	$(init);

	function init() {
	    // 윈도우 단위에서 키가 눌리면
	    $(window).keyup(function (e) {
	        // 발생한 이벤트에서 키 코드 추출, BackSpace 키의 코드는 8
	        if (e.keyCode == 8) {
	            // 다른 함수 호출
	            anotherFn();
	            // 기존 키의 기능은 무력화
	            return false;
	        }
	    });
	}

	function anotherFn() {
	    // 경고창 출력
	    alert('You pressed the backspace key by your keyboard!');
	}
});//end of ready

</script>
</head>
<body>
 <h3>설문응답평가 조회</h3>


	<table border="2" style="border-color: black">
	<thead id="thead">
		<tr class="filters">
			<th width="70px"><input type="text" class="form-control" placeholder="과목ID" disabled></th>
			<th><input type="text" class="form-control" placeholder="과목명" disabled></th>
			<th><input type="text" class="form-control" placeholder="담당교수" disabled></th>
			<th><input type="text" class="form-control" placeholder="설문응답여부" disabled></th>
		</tr>
	</thead>
	<tbody id="tbody">
	  <c:forEach items="${requestScope.evaluationAnswerValueListResult}" var="evaluationList">
			<tr>
				<td>${evaluationList.subjectId}</td>
				<td>${evaluationList.subject.subjectName}</td>
				<td>${evaluationList.professor.usersName}</td>
				<td>
					<form action="${initParam.rootPath }/evaluationAnswerRegisteration.do"> <!-- 설문응답하는 jsp로 이동 -->
						<input type="hidden" value="${evaluationList.course.courseYear}" name="nowYear">
						<input type="hidden" value="${evaluationList.course.courseSemester}" name="nowSemester">
						<input type="hidden" value="${evaluationList.course.stuId}" name="loginId">
						<input type="hidden" value="${evaluationList.course.subjectId}" name="subjectId">
						<input type="hidden" value="${evaluationList.professor.proId}" name="proId">
		
						<input type="submit" value="${evaluationList.evaluationAnswerState}" class="submit"/>
					<sec:csrfInput/><%-- csrf 토큰 --%>	
					</form>
				</td>
				<%-- <td><button onclick="location.href='${initParam.rootPath }/evaluationAnswerRegisteration.do'">${evaluationList.evaluationAnswerState}</button></td> --%>
			</tr>
		</c:forEach>  
	</tbody>
</table><br>
<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
</html>