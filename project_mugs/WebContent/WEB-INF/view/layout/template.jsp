<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>학사종합정보시스템_MUGS</title>
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>

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
	font-family:굴림체;
	width:100%;
}
.content{
	
	overflow-x: auto;
	overflow-y: auto;
	font-family:굴림체;	
	height:1050px;
	width:100%;
	
}
.side {
	font-family:굴림체;
}
div>.page-header{

	background-size: 100% auto;
	color:black;
	background:url('/project_mugs/resource/up_image/mug.png'); 
	background-size: 100%;
	 padding-bottom: 80px;
    margin: 0px 0px 0px;
    border-bottom: 0.5px solid #eee;
    padding-top: 80px;
}
.page-header {
    padding-bottom: 80px;
    margin: 0px 0px 0px;
    border-bottom: 0.5px solid #eee;
    padding-top: 80px;
    background:url('/project_mugs/resource/up_image/mug.png'); 
	background-size: 100%;
}
@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}
.page-header text-center{
	
	background:url('/project_mugs/resource/up_image/mug.png'); 
	background-size: 100%;
	 padding-bottom: 80px;
    margin: 0px 0px 0px;
    border-bottom: 0.5px solid #eee;
    padding-top: 80px;
}

</style>

</head>
<body>


<div class="container-fluid">
	<div class="page-header text-center">
		<a href="${initParam.rootPath }/index.do"><div style="background:url('/project_mugs/resource/up_image/mug.png').url()"></div></a>
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
	
	