<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>학사종합정보시스템_MUGS</title>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-theme.min.css">
<link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet">



<style type="text/css">
.whole {
	height: 100%;
	margin-top: 20px;
}
.side, .content{
	
	overflow-x: auto;
	overflow-y: auto;
}

.content {
	height:750px;
}
@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}
</style>

<script type="text/javascript">


</script>
</head>
<body>


<div class="container">
	<div class="page-header text-center">
		<h1>학사종합정보시스템 - MUGS</h1>
	</div>
	<%--메인 body --%>
	<div class="row">
		<%-- 메뉴 --%>
		<div class="col-md-3 side">
			<tiles:insertAttribute name="menu"/>
		</div>
		<!-- 내용 -->
		<div class="col-md-9 content">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>

</div>

<%-- <div class="container">
	<div class="page-header text-center">
		<h1>대학종합정보시스템 - MUGS</h1>
	</div>
	메인 body
	<div class="row whole">
		메뉴
		<nav class="col-sm-3 side">
			<tiles:insertAttribute name="menu"/>
		</nav>
		<!-- 내용 -->
		<section class="col-sm-9 content">
			<tiles:insertAttribute name="content"/>
		</section>
	</div>

</div> --%>
</body>
</html>