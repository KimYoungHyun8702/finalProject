<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- Spring Security 커스텀 태그 --%>
<!DOCTYPE html>
<html>
  <head>
	<style>
		a {
			color:black;
		}
		
		td {
			height:17px;
		}
		.side {
	font-family:돋움체;
 	background:url('https://raw.githubusercontent.com/BlackrockDigital/startbootstrap-landing-page/6e8727895ac632cd3d8a62db2742f208b9083198/img/intro-bg.jpg'); 
	background-size: 100% auto;
	width:100%;
	
}
	</style>
	  <meta charset="utf-8">
	  <meta name="description" content="">
    <meta name="author" content="">
    <script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
    <link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet"> 
<!--  <link href="https://bootswatch.com/yeti/bootstrap.css" rel="stylesheet">  --> 
<!--  <link href="https://bootswatch.com/spacelab/bootstrap.css" rel="stylesheet"> -->
<!-- <link href="https://bootswatch.com/readable/bootstrap.css" rel="stylesheet"> -->
<!-- <link href="https://bootswatch.com/united/bootstrap.css" rel="stylesheet"> -->

    <script type="text/javascript">
    
    function popupOpen(url){
    	alert("saw")
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; 
			window.open(url,"",popOption);
		}
    
   function logout(){
      document.getElementById("logoutForm").submit();
   }
   
    var  studentState = "${studentState}";
   
   if(studentState == '휴학' || studentState == '군휴학') {
      alert(studentState + "학생은 설문응답을 할 수 없습니다.");
   } else {
      var alarm = "${alarm}";
      if(alarm != "") {
         alert(alarm);
      }
   } 
   
	var  stuRegister = "${stuRegister}";
	
	if(stuRegister == '휴학' || stuRegister == '군휴학') {
		alert(stuRegister + "학생은 수강신청을 할 수 없습니다.");
	} else {
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
	} 
	
	var  stuRegisterTimeTable = "${stuRegisterTimeTable}";
	
	if(stuRegisterTimeTable == '휴학' || stuRegisterTimeTable == '군휴학') {
		alert(stuRegisterTimeTable + "학생은 시간표를 볼수 없습니다.");
	} else {
		var message = "${message}";
		if(message != "") {
			alert(message);
		}
	}
</script>

	
  </head>
<body>

<%--
	sec:authorize access="Spring Security EL" : EL 표현식의 인증/권한 상태의 사용자에게만 보여질 태그의 content로 넣는다.
												=> 권한에 따라 나타나는 메뉴 다르게 설정
 --%>

<ul class="nav nav-stacked">
<%--인증 안된(로그인 안한) 사용자 메뉴  (!isAuthenticated()) : 인증되면 안보여야 하는 메뉴 --%>
<sec:authorize access="!isAuthenticated()">	
	<li class="side-menu"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
	<li class="side-menu"><a href="javascript:popupOpen('${initParam.rootPath }/idFind.do');">아이디 찾기</a></li>
	<li class="side-menu"><a href="javascript:popupOpen('${initParam.rootPath }/pwFind.do');">비밀번호 찾기</a></li>
</sec:authorize>

<%--인증된(로그인한) 사용자 메뉴  (isAuthenticated()) : 인증 안 된 상태에서 안보여야 하는 메뉴 --%>
<br><sec:authorize access="isAuthenticated()">
   <li class="side-menu"><center><a href="javascript:logout()">로그아웃</a></li><br></center>
</sec:authorize>


<%--학생 메뉴--%>
<sec:authorize access="hasRole('ROLE_STU')">
<div class="container">
    <div class="row">
        <div class="col-sm-2 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                             <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                            </span>나의 수강정보</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr style="height:20px">
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/student/getCollegeList.do">기준학점조회</a></center>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/student/getMyTimeTable.do">나의시간표조회</a></center>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td>
                                        <center><span class="glyphicon glyphicon-file text-info"></span><a href="${initParam.rootPath }/student/getMyCourseListByJoin.do">수강목록조회</a></center>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td>
                                        <center><span class="glyphicon glyphicon-comment text-success"></span><a href="${initParam.rootPath }/student/compareEvaluationPeriod.do">설문응답평가</a></center>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td>
                                        <center><span class="glyphicon glyphicon-comment text-success"></span><a href="#">과목평가그래프</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
					
					<div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-folder-close">
                            </span>신청마당</a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                         <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/student/subjectTypeList.do">수강신청</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/student/getLeaveReturnApplicationListByStuId.do">휴복학신청및내역조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         <center><span class="glyphicon glyphicon-file text-info"></span><a href="${initParam.rootPath }/student/getCreditGiveUpListByStuId.do">학점포기신청및내역조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-file text-info"></span><a href="${initParam.rootPath }/student/getEvaluationGraphSubjectTypeList.do">평가 그래프</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
					
					 <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-folder-close">
                            </span>성적조회</a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/student/gradeInquiry.do" class="side-menu">전체성적조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/student/currentGradeInquiry.do" class="side-menu">당학기성적조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-file text-info"></span><a href="${initParam.rootPath }/student/academicProbation.do" class="side-menu">학고내역조회</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
					
					<div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne4"><span class="glyphicon glyphicon-folder-close">
                            </span>학생정보</a>
                        </h4>
                    </div>
                    <div id="collapseOne4" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/student/getStudentInfoById.do" class="side-menu">내정보조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/student/getAllTimeTable.do" class="side-menu">전체강의시간표조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-file text-info"></span><a href="${initParam.rootPath }/student/graduationInfo.do" class="side-menu">졸업여부조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-comment text-success"></span><a href="${initParam.rootPath }/student/compareEvaluationPeriod.do">졸업여부조회</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        	<sec:authorize access="isAuthenticated()">
								 <a href="javascript:logout()"><span class="glyphicon glyphicon-folder-close">
                            	 </span>로그아웃</a>
                            </sec:authorize>
                        </h4>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
</sec:authorize>

<%--교수 메뉴--%>
<sec:authorize access="hasRole('ROLE_PROFESSOR')">

<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                            </span>교수개인정보조회</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/professor/professorInfo.do" class="side-menu">교수개인정보조회</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                     <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-folder-close">
                            </span>강의계획서</a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/SubjectPlan.do" class="side-menu">강의계획서</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                     <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-folder-close">
                            </span>성적주기</a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/professor/addStudentGrade.do" class="side-menu">성적주기</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="javascript:logout()"><span class="glyphicon glyphicon-folder-close">
                            </span>로그아웃</a>
                        </h4>
                    </div>
                 </div>
            </div>
       </div>
    </div>
</div>
                    
</sec:authorize>

<%--졸업자 메뉴 --%>
<sec:authorize access="hasRole('ROLE_GRADUATION')">
<a href="${initParam.rootPath }/student/getCollegeList.do">기준학점조회</a><br>
<a href="${initParam.rootPath }/student/gradeInquiry.do">성적 조회 -딘강</a><br>
<a href="${initParam.rootPath }/student/academicProbation.do">학사경고내역 조회-딘강</a>
</sec:authorize>

<%--관리자 메뉴--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                            </span>학생관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/select_student.do" class="side-menu">학생조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/admin/selectMajorForInsertController.do" class="side-menu">학생등록</a></center>
                                    </td>
                                </tr>           
                            </table>
                        </div>
                    </div>
					
					<div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-folder-close">
                            </span>교수관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/select_professor.do" class="side-menu">교수조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/admin/selectForInsertProfessorController.do" class="side-menu">교수등록</a></center>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
					
					 <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-folder-close">
                            </span>과목관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/admin/selectSubjectTypeController.do" class="side-menu">과목조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/admin/selectForInsertSubjectController.do" class="side-menu">과목등록</a></center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
					
					<div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne4"><span class="glyphicon glyphicon-folder-close">
                            </span>학과관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne4" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/admin/selectCollegeListForSelectController.do" class="side-menu">학과조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/admin/selectCollegeListForinsertController.do" class="side-menu">학과등록</a></center>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
					
					 <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne5"><span class="glyphicon glyphicon-folder-close">
                            </span>단과대학관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne5" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/admin/selectCollegeListController.do" class="side-menu">단과대학조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/insert_college.do" class="side-menu">단과대학등록</a></center>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
					
					 <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne6"><span class="glyphicon glyphicon-folder-close">
                            </span>건물관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne6" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/admin/selectBuildingListController.do" class="side-menu">건물조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/insert_building.do" class="side-menu">건물등록</a></center>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
					
					 <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne7"><span class="glyphicon glyphicon-folder-close">
                            </span>공지사항관련</a>
                        </h4>
                    </div>
                    <div id="collapseOne7" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-pencil text-primary"></span><a href="${initParam.rootPath }/admin/selectNoticeController.do" class="side-menu">공지사항조회</a></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><span class="glyphicon glyphicon-flash text-success"></span><a href="${initParam.rootPath }/insert_notice.do" class="side-menu">공지사항등록</a></center>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="javascript:logout()"><span class="glyphicon glyphicon-folder-close">
                            </span>로그아웃</a>
                        </h4>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
<a href="${initParam.rootPath }/admin/selectCreditGiveUpListController.do">학점 포기 신청 현황 조회</a><br>
<a href="${initParam.rootPath }/admin/selectLeaveReturnApplicationJoinController.do">휴.복학 신청 현황 조회</a><br>
<a href="${initParam.rootPath }/admin/selectForExpelController.do">학사 경고 현황 조회</a><br>
</sec:authorize>

</ul>


<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">

    <sec:csrfInput/>
</form>

</body>
</html>