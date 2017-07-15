<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style type="text/css">
.container {
	width:75%;
}

</style>
<c:if test="${not empty param.errorMessage}">
	<div class="well text-danger">
		${param.errorMessage }
	</div>
</c:if>
    <div class="container">
        <div class="form-group">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <form class="form-signin" action="${initParam.rootPath}/login.do" method="post">
            <sec:csrfInput/><%-- ★ csrf 토큰 생성 --%>
              <div class="form-group">
               <label for="id">ID</label>
                <input type="text" id="id" name="userId" class="form-control" placeholder="ID" required autofocus>
            </div>
            <div class="form-group">
            <label for="password">패스워드</label>
            <input type="password" id="password" name="userPassword" class="form-control" placeholder="Password" required>
               </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">로그인</button>
              <sec:csrfInput/><%-- csrf 토큰 --%>	
               </form><!-- /form -->
      </div><!-- /card-container -->
    </div><!-- /container -->





















