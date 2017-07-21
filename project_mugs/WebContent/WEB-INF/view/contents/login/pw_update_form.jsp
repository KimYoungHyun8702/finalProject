<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<c:if test="${not empty message}">
	<script>
		alert("비밀번호 변경 완료");
		close();
	</script>
</c:if>
<c:if test="${not empty error}">
	<script>
		alert("${error}");
	</script>
</c:if>
<%-- <form action="${initParam.rootPath}/admin/pwChange.do" method="post">
		<input name="id" type="hidden" value="${user.usersId }">
		<center>새로운비밀번호 : <input type="text" name="pw" class="form-control"><br></center>
		비밀번호 재입력 : <input type="text" name="chkPw" class="form-control"><br>
	<sec:csrfInput/>
	<button type="submit">확인</button>
</form> --%>


<meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="${initParam.rootPath }/resource/bootstrap/css/finder/bootstrappp.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${initParam.rootPath }/resource/bootstrap/css/finder/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${initParam.rootPath }/resource/bootstrap/css/finder/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${initParam.rootPath }/resource/bootstrap/css/finder/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style="background:#ffb937">
                        <h3 class="panel-title" style="text-align:center">mugs_비밀번호 변경</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${initParam.rootPath}/admin/pwChange.do" method="post">
                        	<input name="id" type="hidden" value="${user.usersId }">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="새로운 비밀번호" type="password" name="pw" class="form-control" autofocus><br>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호 재입력" type="password" name="chkPw" class="form-control">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <center><button type="submit" style="background:#ffb937">확인</button></center>
                                <!-- <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a> -->
                            </fieldset>
                            <sec:csrfInput/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${initParam.rootPath }/resource/bootstrap/js/finder/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${initParam.rootPath }/resource/bootstrap/js/finder/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${initParam.rootPath }/resource/bootstrap/js/finder/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${initParam.rootPath }/resource/bootstrap/js/finder/sb-admin-2.js"></script>

</body>

</html>
