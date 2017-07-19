<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>login form</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/_style.css">
	<script src="${initParam.rootPath }/resource/bootstrap/js/index.js"></script>
  
      <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      * {
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  background: wheat;
  font: 100%/1 "Helvetica Neue", Arial, sans-serif;
}

<!-- 로그인 폼 안에 색깔 -->
.login {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -10rem 0 0 -10rem;
  width: 20rem;
  height: 20rem;
  padding: 20px;
  background:white;
  border-radius: 5px;
  overflow: hidden;
}
.login:hover > .login-header, .login.focused > .login-header {
  width: 2rem;
}
.login:hover > .login-header > .text, .login.focused > .login-header > .text {
  font-size: 1rem;
  transform: rotate(-90deg);
}
.login.loading > .login-header {
  width: 20rem;
}
.login.loading > .login-header > .text {
  display: none;
}
.login.loading > .login-header > .loader {
  display: block;
}

<!-- 로그인 폼 색깔 -->
.login-header {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  width: 20rem;
  height: 20rem;
  background:orange;
  transition: width 0.5s ease-in-out;
}
.login-header > .text {
  display: block;
  width: 100%;
  height: 100%;
  font-size: 5rem;
  text-align: center;
  line-height: 20rem;
  color: #fff;
  transition: all 0.5s ease-in-out;
}
.login-header > .loader {
  display: none;
  position: absolute;
  left: 5rem;
  top: 5rem;
  width: 10rem;
  height: 10rem;
  border: 2px solid #fff;
  border-radius: 50%;
  animation: loading 2s linear infinite;
}
.login-header > .loader:after {
  content: "";
  position: absolute;
  left: 4.5rem;
  top: -0.5rem;
  width: 1rem;
  height: 1rem;
  background: #fff;
  border-radius: 50%;
  border-right: 2px solid black;
}
.login-header > .loader:before {
  content: "";
  position: absolute;
  left: 4rem;
  top: -0.5rem;
  width: 0;
  height: 0;
  border-right: 1rem solid #fff;
  border-top: 0.5rem solid transparent;
  border-bottom: 0.5rem solid transparent;
}

@keyframes loading {
  50% {
    opacity: 0.5;
  }
  100% {
    transform: rotate(360deg);
  }
}
.login-form {
  margin: 0 0 0 2rem;
  padding: 0.5rem;
  
}

.login-input {
  display: block;
  width: 100%;
  font-size: 2rem;
  padding: 0.5rem 1rem;
  box-shadow: none;
  border-color: #ccc;
  border-width: 0 0 2px 0;
  
}
.login-input + .login-input {
  margin: 10px 0 0;
}
.login-input:focus {
  outline: none;
  border-bottom-color: orange;
}

.login-btn {
  position: absolute;
  right: 1rem;
  bottom: 1rem;
  width: 5rem;
  height: 5rem;
  border: none;
  background: orange;
  border-radius: 50%;
  font-size: 0;
  border: 0.6rem solid transparent;
  transition: all 0.3s ease-in-out;
}
.login-btn:after {
  content: "";
  position: absolute;
  left: 1rem;
  top: 0.8rem;
  width: 0;
  height: 0;
  border-left: 2.4rem solid #fff;
  border-top: 1.2rem solid transparent;
  border-bottom: 1.2rem solid transparent;
  transition: border 0.3s ease-in-out 0s;
  
}
.login-btn:hover, .login-btn:focus, .login-btn:active {
  background: #fff;
  border-color: orange;
  outline: none;
  
}
.login-btn:hover:after, .login-btn:focus:after, .login-btn:active:after {
  border-left-color: orange;
}





.whole {
	height: 100%;
	font-family:돋움체;
	width:100%;
}
.content{
	
	overflow-x: auto;
	overflow-y: auto;
	font-family:돋움체;	
	height:500px;
	width:100%;
	
}
.side {
	font-family:돋움체;
}

@media screen and (max-width: 750px){ /*화면이 웹 스크린이고 width가 750px 이하가 되면*/
	.side, .whole {
		height: auto;
	}
}
.page-header text-center{
	background:url('resource/up_image/mug.png'); 
	background-size: 100%;
}

</style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
<div class="container-fluid">
<div class="login">
  <header class="login-header"><span class="text">LOGIN</span><span class="loader"></span></header>
  <form class="login-form" action="${initParam.rootPath}/login.do" method="post">
    <input class="login-input" id="id" name="userId" type="text" placeholder="ID"/>
    <input class="login-input"id="password" name="userPassword" type="password" placeholder="Password"/>
    <button class="login-btn" type="submit">login</button>
    <sec:authorize access="!isAuthenticated()">  
    
    </sec:authorize>
    <sec:csrfInput/>
  </form>
</div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>
  
</body>
</html>
