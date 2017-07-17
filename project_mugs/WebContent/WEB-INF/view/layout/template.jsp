<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 합쳐지고 최소화된 최신 CSS -->
 
    <!-- 부가적인 테마 -->
 
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<title>학사종합정보시스템_MUGS</title>
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
.whole {
	height: 100%;
	font-family:돋움체;
	width:100%;
}
.content{
	
	overflow-x: auto;
	overflow-y: auto;
	font-family:돋움체;	
	height:800px;
	width:100%;
	
}
.side {
	font-family:돋움체;
}
div>.page-header{
	background:url('https://raw.githubusercontent.com/BlackrockDigital/startbootstrap-landing-page/6e8727895ac632cd3d8a62db2742f208b9083198/img/intro-bg.jpg'); 
	background-size: 100% auto;
	color:white;

}
@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}
.page-header text-center{
	background-image:url('https://cdn.pixabay.com/photo/2016/05/18/11/25/library-1400312_960_720.jpg');
}

</style>

</head>
<body>


<div class="container-fluid">
	<div class="page-header text-center">
		<h1 style="font-family:돋움체; color="black">학사종합정보시스템 - MUGS</h1>
	</div>
  <%--메인 body --%>
   <div class="row whole">
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
	
	