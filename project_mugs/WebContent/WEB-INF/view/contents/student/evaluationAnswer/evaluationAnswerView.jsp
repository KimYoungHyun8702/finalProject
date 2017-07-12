<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td{
	border: 1px solid black;
}
table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
}
</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>

<title>Insert title here</title>
<style type="text/css">
table, td{
	border: 1px solid black;
}
table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
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
<h2>설문응답조회하는 jsp</h2>



<table>
	<thead id="thead">
		<tr>
			<td>과목ID</td>
			<td>과목명</td>
			<td>담당교수</td>
			<td>설문응답여부</td>
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
</table>
<button onclick="location.href='${initParam.rootPath}/'">이전페이지로</button>
</body>
</html>