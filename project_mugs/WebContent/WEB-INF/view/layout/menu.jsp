<%@ page contentType="text/html;charset=UTF-8" %>

<%-- Spring Security 커스텀 태그 --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%--
	sec:authorize access="Spring Security EL" : EL 표현식의 인증/권한 상태의 사용자에게만 보여질 태그의 content로 넣는다.
												=> 권한에 따라 나타나는 메뉴 다르게 설정
 --%>
<ul class="nav nav-stacked">
<%--인증 안된(로그인 안한) 사용자 메뉴  (!isAuthenticated()) : 인증되면 안보여야 하는 메뉴 --%>
<sec:authorize access="!isAuthenticated()">	
	<li><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
	<li><a href="javascript:popupOpen('${initParam.rootPath }/idFind.do');">아이디 찾기</a></li>
	<li><a href="javascript:popupOpen('${initParam.rootPath }/pwFind.do');">비밀번호 찾기</a></li>
</sec:authorize>

<%--인증된(로그인한) 사용자 메뉴  (isAuthenticated()) : 인증 안 된 상태에서 안보여야 하는 메뉴 --%>
<sec:authorize access="isAuthenticated()">
	<li><a href="javascript:logout()">로그아웃</a></li>
</sec:authorize>

<%--학생 메뉴--%>
<sec:authorize access="hasRole('ROLE_STU')">
<a href="${initParam.rootPath }/student/getCollegeList.do">기준학점조회</a><br>
<a href="${initParam.rootPath }/student/getMyTimeTable.do">나의 시간표 조회</a><br>
<a href="${initParam.rootPath }/student/getMyCourseListByJoin.do">수강신청내역조회 클릭기기</a><br>
<a href="${initParam.rootPath }/student/compareEvaluationPeriod.do">설문응답평가조회-기간설정까지해준것</a><br>
<a href="${initParam.rootPath }/student/subjectTypeList.do">수강신청</a><br>
<a href="${initParam.rootPath }/student/getLeaveReturnApplicationListByStuId.do">휴복학신청 및 조회</a><br>
<a href="${initParam.rootPath }/student/getCreditGiveUpListByStuId.do">학점포기신청 및 조회</a><br>
<a href="#">과목평가그래프</a><br>
<a href="${initParam.rootPath }/student/gradeInquiry.do">성적 조회 -딘강</a><br>
<a href="${initParam.rootPath }/student/currentGradeInquiry.do">당학기 성적조회 -딘강</a><br>
<a href="${initParam.rootPath }/student/academicProbation.do">학사경고내역 조회-딘강</a><br>
<a href="${initParam.rootPath }/student/getStudentInfoById.do">학생정보페이지로 이동</a><br>
<a href="${initParam.rootPath }/student/getAllTimeTable.do">강의시간표 조회</a><br>
<a href="${initParam.rootPath }/student/graduationInfo.do">졸업정보 조회</a><br>
<a href="${initParam.rootPath }/student/mapByBuildingId.do">지도-딘강</a><br>
</sec:authorize>

<%--교수 메뉴--%>
<sec:authorize access="hasRole('ROLE_PROFESSOR')">
<a href="${initParam.rootPath }/professorInfo.do">교수 개인 정보</a><br>
<a href="${initParam.rootPath }/guidanceStudent.do">지도학생</a><br>
<a href="${initParam.rootPath }/SubjectPlan.do">강의계획서</a><br>
<a href="${initParam.rootPath }/addStudentGrade.do">성적주기</a><br>
</sec:authorize>

<%--관리자 메뉴--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="${initParam.rootPath }/select_student.do">학생 조회</a><br>
<a href="${initParam.rootPath }/admin/selectMajorForInsertController.do">학생 등록</a><br>
<a href="${initParam.rootPath }/select_professor.do">교수 조회</a><br>
<a href="${initParam.rootPath }/admin/selectForInsertProfessorController.do">교수 등록</a><br>
<a href="${initParam.rootPath }/admin/selectSubjectTypeController.do">과목 조회</a><br>
<a href="${initParam.rootPath }/admin/selectForInsertSubjectController.do">과목 등록</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListForSelectController.do">학과 조회</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListForinsertController.do">학과 등록</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListController.do">단과대학 조회</a><br>
<a href="${initParam.rootPath }/insert_college.do">단과대학 등록</a><br>
<a href="${initParam.rootPath }/admin/selectBuildingListController.do">건물 조회</a><br>
<a href="${initParam.rootPath }/insert_building.do">강의동 등록</a><br>
<a href="${initParam.rootPath }/admin/selectNoticeController.do">공지사항 조회</a><br>
<a href="${initParam.rootPath }/insert_notice.do">공지사항 등록</a><br>
</sec:authorize>

</ul>

<script type="text/javascript">
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
<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">
    <sec:csrfInput/>
</form>