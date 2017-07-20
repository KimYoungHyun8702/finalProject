<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${not empty message}">
		<script>alert("${message}");</script>
</c:if>

<%-- <form action="${initParam.rootPath}/admin/idFind.do" method="post">
		이름 : <input type="text" id="name" name="name" class="form-control"><br>
		주민등록번호 :<input type="number" id="rrn1" name="rrn1" class="form-control">-<input type="number" id="rrn2" name="rrn2" class="form-control"><br>
	<sec:csrfInput/>
	<button type="submit">확인</button>
</form> --%>


<div class="container">
            <div id="passwordreset" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">아이디 찾기</div>
                    </div>                     
                    <div class="panel-body">
                        <form id="signupform" class="form-horizontal" role="form" action="${initParam.rootPath}/admin/idFind.do" method="post">
                            <div class="form-group">
                                <label for="email" class=" control-label col-sm-3">이름</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="name" placeholder="create your new password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class=" control-label col-sm-3">주민등록번호</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="rrn1" placeholder="confirm your new password">-<input type="number" class="form-control" name="rrn2" placeholder="confirm your new password">
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Button -->                                 
                                <div class="  col-sm-offset-3 col-sm-9">
                                    <button id="btn-signup" type="button" class="btn btn-success">확인</button>
                                </div>
                            </div>     
                            <sec:csrfInput/>                        
                        </form>
                    </div>
                </div>
            </div>             
        </div>