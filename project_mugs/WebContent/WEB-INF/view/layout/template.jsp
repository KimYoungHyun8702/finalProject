<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-theme.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.whole {
	height: 600px;
	margin-top: 20px;
}
.side, .content{
	height:100%;
	padding: 10px;
}
.side{
	background-color: #E0FFFF;
}

@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var periodResult = "${evaluationPeriodResult}";
	if(periodResult != "" ) {
		if(periodResult == '1학기' || periodResult == '2학기') {
		alert(periodResult + "11");
		//window.location.href="<c:url value='${initParam.rootPath }/student/selectEvaluationAnswerValueList.do'/>";
			window.location.href = '${initParam.rootPath }/student/selectEvaluationAnswerValueList.do';
		}
		else {
			alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.");
			return false;
		}
	}
})
/* 아이디가 evaluation에게 이벤트
받은 학사일정명이 1학기중간고사 1학기기말고사 2학기중간고사 2학기기말고사가 아니면
alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.")띄워지게끔 구현. 
일단 인덱스로 돌아와서 기간이 아니면 알러트창 띄우고 
기간이면 설문응답하는 리스트 뽑아오는 컨트롤러로이동하게끔 구현*/
/* $(document).ready(function(){
	$("#evaluation").on("click", function(){
		window.location.href="<c:url value='${initParam.rootPath }/student/compareEvaluationPeriod.do'/>";
		var param = "${evaluationPeriodResult}";
		if(param == '1학기 중간고사 설문응답기간' || '1학기 기말고사 설문응답기간' || '2학기 중간고사 설문응답기간' || '2학기 기말고사 설문응답기간') {
			//"${initParam.rootPath }/student/selectEvaluationAnswerValueList.do"로 이동
			window.location.href="<c:url value='${initParam.rootPath }/student/selectEvaluationAnswerValueList.do'/>";
		};
		alert("지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.");
		return false;
	});
}); */

</script>
</head>
<body>

<div class="container">
	<div class="page-header text-center">
		<h1>대학종합정보시스템 - MUGS</h1>
	</div>
	<%--메인 body --%>
	<div class="row whole">
		<%-- 메뉴 --%>
		<nav class="col-sm-3 side">
			<tiles:insertAttribute name="menu"/>
		</nav>
		<!-- 내용 -->
		<section class="col-sm-9 content">
			<tiles:insertAttribute name="content"/>
		</section>
	</div>

</div>
</body>
</html>