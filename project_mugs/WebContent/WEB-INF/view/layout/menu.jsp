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
</sec:authorize>


<%--인증된(로그인한) 사용자 메뉴  (isAuthenticated()) : 인증 안 된 상태에서 안보여야 하는 메뉴 --%>
<sec:authorize access="isAuthenticated()">
	<li><a href="javascript:logout()">로그아웃</a></li>
</sec:authorize>

<%--학생 메뉴--%>
<sec:authorize access="hasRole('ROLE_STUDENT')">
<a href="${initParam.rootPath }/student/getCollegeList.do">기준학점조회</a><br>
<a href="${initParam.rootPath }/student/getMyTimeTable.do">나의 시간표 조회</a><br>
<a href="${initParam.rootPath }/student/getMyCourseListByJoin.do">수강신청내역조회 클릭기기</a><br>
<a href="${initParam.rootPath }/student/getEvaluationValueList.do">설문응답평가조회</a><br>
<a href="${initParam.rootPath }/student/subjectType.do">수강신청</a><br>
<a href="${initParam.rootPath }/student/gradeInquiry.do">성적 조회 -딘강</a><br>
<a href="${initParam.rootPath }/student/currentGradeInquiry.do">당학기 성적조회 -딘강</a><br>
<a href="${initParam.rootPath }/student/academicProbation.do">학사경고내역 조회-딘강</a>
</sec:authorize>

<%--교수 메뉴--%>
<sec:authorize access="hasRole('ROLE_PROFESSOR')">
<a href="${initParam.rootPath }/professorInfo.do">교수 개인 정보</a><br>
<a href="${initParam.rootPath }/guidanceStudent.do">지도학생</a><br>
<a href="${initParam.rootPath }/SubjectPlan.do">강의계획서</a><br>
</sec:authorize>

<%--관리자 메뉴--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="${initParam.rootPath }/admin/selectStudentController.do">학생 조회</a><br>
<a href="insertStudent.do">학생 등록</a><br>
<a href="selectProfessor.do">교수 조회</a><br>
<a href="insertProfessor.do">교수 등록</a><br>
<a href="${initParam.rootPath }/admin/selectSubjectTypeController.do">과목 조회</a><br>
<a href="${initParam.rootPath }/admin/selectForInsertSubjectController.do">과목 등록</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListForSelectController.do">학과 조회</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListForinsertController.do">학과 등록</a><br>
<a href="${initParam.rootPath }/admin/selectCollegeListController.do">단과대학 조회</a><br>
<a href="${initParam.rootPath }/insert_college.do">단과대학 등록</a><br>
<a href="${initParam.rootPath }/admin/selectBuildingListController.do">건물 조회</a><br>
<a href="${initParam.rootPath }/insert_building.do">강의동 등록</a><br>
</sec:authorize>

</ul>

<script type="text/javascript">
	function logout(){
		document.getElementById("logoutForm").submit();
	}
</script>
<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">
    <sec:csrfInput/>
</form>