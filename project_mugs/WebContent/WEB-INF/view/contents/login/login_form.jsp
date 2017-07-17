<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
    <link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
       <link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet"> 
<title>학사종합정보시스템_MUGS</title>
<style type="text/css">
/* .container {
   width:100%;
}
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
 */
.container {
    padding-right: 0px;
    padding-left: 0px;
    margin-right: auto;
    margin-left: auto;
    width:100%;
    text-align:center;
}
.whole {
	height: 100%;
	margin-top: 20px;
	font-family:돋움체;
	width:100%;
}
.login2background{
	font-family:돋움체;	

	text-align:center;
	background:url('https://raw.githubusercontent.com/BlackrockDigital/startbootstrap-landing-page/6e8727895ac632cd3d8a62db2742f208b9083198/img/intro-bg.jpg'); 
	background-size: 100% auto;

}
/* .side {
	font-family:돋움체;
	background:url('https://raw.githubusercontent.com/BlackrockDigital/startbootstrap-landing-page/6e8727895ac632cd3d8a62db2742f208b9083198/img/intro-bg.jpg'); 
	background-size: 100% auto;
} */
div>.page-header{
	/* background-color:yellow; */
	background-size:100% auto;
	color:white;
}
@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}

</style>
</head>
<body>
<c:if test="${not empty param.errorMessage}">
   <div class="well text-danger">
      ${param.errorMessage }
   </div>
</c:if>
<body class="login2background">
        <div class="container">  
        <div class="page-header text-center">
      <h1>학사종합정보시스템 - MUGS</h1>
      </div>
     	<form class="form-signin" action="${initParam.rootPath}/login.do" method="post">
            <div class="col-lg-6 col-md-6 col-sm-8 loginbox">
                <div class="center-block row">
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                        <img src="https://s4.postimg.org/64q1bgunx/logo_3.png" alt="Logo" class="logo"> 
                    </div><
                
                                 
                </div>
                <div class="center-block row loginbox_content">                        
                    <div class="input-group input-group-sm" >
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                        <label for="id">ID</label>
                        <input type="text" id="id" name="userId" class="form-control" placeholder="ID" required autofocus>
                    </div>
                    <br>
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                        <label for="password">패스워드</label>
                        <input type="password" id="password" name="userPassword" class="form-control" placeholder="Password" required>
                    </div>              
                </div><br>
                <div class="row ">  
                   <div><p style="color:red">* 아이디는 학번, 초기 비밀번호는 주민등록번호 뒷 7자리입니다.<br>* 변경을 원하시는 분은 개인정보페이지에서 변경하여 주시기 바랍니다.</p></div>                      
                    <div class="col-lg-8 col-md-8  col-sm-8 col-xs-7 forgotpassword "> 
                        <a href="#"  > Forgot Username / Password?</a>                        
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-5 ">                        
                        <center><button class="btn btn-default submit-btn" type="submit">로그인<span class="glyphicon glyphicon-log-in"></span></button></center>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-4 "></div>
      <sec:csrfInput/><%-- csrf 토큰 --%>   
      </form>
        </div>
    </body>
    </html>



<%-- <%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
    <link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
       <link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet"> 
<title>학사종합정보시스템_MUGS</title>
<style type="text/css">
.container {
	width:100%;
}

</style>
</head>
<body>
<c:if test="${not empty param.errorMessage}">
	<div class="well text-danger">
		${param.errorMessage }
	</div>
</c:if>
<body class="login2background">
        <div class="container">  
        <form class="form-signin" action="${initParam.rootPath}/login.do" method="post">
            <div class="col-lg-6 col-md-6 col-sm-8  loginbox">
                <div class=" row">
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                        <img src="https://s4.postimg.org/64q1bgunx/logo_3.png" alt="Logo" class="logo"> 
                    </div>
                
                                 
                </div>
                <div class=" row loginbox_content ">                        
                    <div class="input-group input-group-sm" >
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                        <label for="id">ID</label>
                        <input type="text" id="id" name="userId" class="form-control" placeholder="ID" required autofocus>'
                    </div>
                    <br>
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                        <label for="password">패스워드</label>
                        <input type="password" id="password" name="userPassword" class="form-control" placeholder="Password" required>
                    </div>              
                </div><br>
                <div class="row ">  
                	<div><p style="color:red">아이디는 학번, 초기 비밀번호는 주민등록번호 뒷 7자리입니다.<br>변경을 원하시는 분은 개인정보페이지에서 변경하여 주시기 바랍니다.</p></div>                      
                    <div class="col-lg-8 col-md-8  col-sm-8 col-xs-7 forgotpassword "> 
                        <a href="#"  > Forgot Username / Password?</a>                        
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-5 ">                        
                        <button class="btn btn-default submit-btn" type="submit">로그인<span class="glyphicon glyphicon-log-in"></span></button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-4 "></div>
		<sec:csrfInput/>csrf 토큰   
		</form>
        </div>
    </body>
















 --%>