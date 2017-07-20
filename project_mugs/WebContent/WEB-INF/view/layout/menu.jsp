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
         height:18px;
      }
   .side {
   font-family:굴림체;
    background:white;
    background-size: 100% auto;
    width:100%;
   }
   .page-header {
    padding-bottom: 80px;
    margin: 0px 0px 0px;
    border-bottom: 0.5px solid #eee;
    padding-top: 80px;
    background:url('/project_mugs/resource/up_image/mug.png'); 
	background-size: 100%;
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
.page-header text-center{
	
	background:url('/project_mugs/resource/up_image/mug.png'); 
	background-size: 100%;
	 padding-bottom: 80px;
    margin: 0px 0px 0px;
    border-bottom: 0.5px solid #eee;
    padding-top: 80px;
}
a.line:hover {
   text-decoration: underline; 
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
<%--    <li class="side-menu"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
   <li class="side-menu"><a href="javascript:popupOpen('${initParam.rootPath }/idFind.do');">아이디 찾기</a></li>
   <li class="side-menu"><a href="javascript:popupOpen('${initParam.rootPath }/pwFind.do');">비밀번호 찾기</a></li> --%>
   <%-- <li class="side-menu"><a href="javascript:popupOpen('${initParam.rootPath }/pwFind.do');">비밀번호 찾기</a></li>
 > --%>
   
   
</sec:authorize>

<%--인증된(로그인한) 사용자 메뉴  (isAuthenticated()) : 인증 안 된 상태에서 안보여야 하는 메뉴 --%>
<%-- <br><sec:authorize access="isAuthenticated()">
   <li class="side-menu"><center><a href="javascript:logout()">로그아웃</a></li><br></center>
</sec:authorize> --%>
<br>


<%--학생 메뉴--%>
<sec:authorize access="hasRole('ROLE_STU')">
<div class="container">
    <div class="row">
        <div class="col-sm-2 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                             <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <span class="glyphicon glyphicon-plus"></span><font color="white">나의 수강정보</font></a>
                        </h4>
                    </div>
                    
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr style="height:50px">
                                    <td style="background-color: white">
                                        <span style="text-align:left;" class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getCollegeList.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">기준학점 조회</font></a>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td style="background-color: white">
                                        <span style="text-align:left;" class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px; text-align:left" href="${initParam.rootPath }/student/getMyTimeTable.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">나의시간표 조회</font></a>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td style="background-color: white">
                                        <span style="text-align:left;" class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getMyCourseListByJoin.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">수강목록 조회</font></a>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td style="background-color: white">
                                        <span style="text-align:left;" class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/compareEvaluationPeriod.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">설문응답 평가</font></a>
                                    </td>
                                </tr>
                                <tr style="height:20px">
                                    <td style="background-color: white">
                                        <span style="text-align:left;" class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getEvaluationGraphSubjectTypeList.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">과목평가 그래프</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
               
               		<div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">신청마당</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td style="background-color: white">
                                         <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/subjectTypeList.do"><font color="#ea7f0d">수강신청</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                         <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getLeaveReturnApplicationListByStuId.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">휴복학신청 및 내역조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                         <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getCreditGiveUpListByStuId.do"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학점 포기신청 및 내역조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
               
               		 <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">성적조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td style="background-color: white">
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/gradeInquiry.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">전체성적 조회</font></a>
                                     </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/currentGradeInquiry.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">당학기 성적 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/academicProbation.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학사경고내역 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
               
              		<div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne4"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">학생정보</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne4" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td style="background-color: white">
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getStudentInfoById.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">내 정보 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getAllTimeTable.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">전체 강의시간표 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white">
                                       <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/graduationInfo.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">졸업여부 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                           <sec:authorize access="isAuthenticated()">
                         <a href="javascript:logout()"><span class="glyphicon glyphicon-plus">
                                </span><font color="white">로그아웃</font></a>
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
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">교수개인정보조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/professor/professorInfo.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">교수 개인정보 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                     <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">강의계획서</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/SubjectPlan.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">강의계획서</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                     <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">성적주기</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/professor/addStudentGrade.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">성적주기</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a href="javascript:logout()"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">로그아웃</font></a>
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
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne10"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">기준학점 조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne10" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/getCollegeList.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">기준학점 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne11"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">성적 조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne11" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/gradeInquiry.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">성적 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne12"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">학사경고내역 조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne12" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/student/academicProbation.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학사경고내역 조회</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a href="javascript:logout()"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">로그아웃</font></a>
                        </h4>
                    </div>
                 </div>
            </div>
       </div>
    </div>
</div>
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
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">학생관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/select_student.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학생 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectMajorForInsertController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학생 등록</font></a>
                                    </td>
                                </tr>           
                            </table>
                        </div>
                    </div>
               
               <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne2"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">교수관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/select_professor.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">교수 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectForInsertProfessorController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">교수 등록</font></a>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
               
                <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne3"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">과목관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectSubjectTypeController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">과목 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectForInsertSubjectController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">과목 등록</font></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
               
               <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne4"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">학과관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne4" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectCollegeListForSelectController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학과 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectCollegeListForinsertController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학과 등록</font></a>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
               
                <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne5"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">단과대학관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne5" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectCollegeListController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">단과대학 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/insert_college.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">단과대학 등록</font></a>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
               
                <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne6"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">건물관련</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne6" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectBuildingListController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">건물 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/insert_building.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">건물 등록</font></a>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
               
                <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne7"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">공지사항관련</font></a>
                        </h4>
                    </div>
                    
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne8"><span class="glyphicon glyphicon-plus">
                            </span><font color:"white">현황조회</font></a>
                        </h4>
                    </div>
                    <div id="collapseOne8" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectCreditGiveUpListController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학점포기신청 현황 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectLeaveReturnApplicationJoinController.do"" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">휴복학신청 현황 조회</font></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-minus text-primary"></span><a class="line" style="font-size:15px" href="${initParam.rootPath }/admin/selectForExpelController.do" class="side-menu"><font color="#ea7f0d" onmouseover="this.style.color='blue'" onmouseout="this.style.color='#ea7f0d'">학사경고 현황 조회</font></a>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                    </div>
                    <div style="background:#ffb937" class="panel-heading">
                        <h4 class="panel-title">
                            <a href="javascript:logout()"><span class="glyphicon glyphicon-plus">
                            </span><font color="white">로그아웃</font></a>
                        </h4>
                    </div>
                </div>
         </div>
      </div>
   </div>
</div>

</sec:authorize>

</ul>


<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">

    <sec:csrfInput/>
</form>

</body>
</html>