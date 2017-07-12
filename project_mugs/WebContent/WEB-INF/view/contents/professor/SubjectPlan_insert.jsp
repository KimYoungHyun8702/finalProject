<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
강의계획서등록
<form action="/project_mugs/professor/registerSubjectPlan.do" method="post">
<sec:csrfInput/>
<!-- 후에 시퀀스적용.. -->
교과목개요(sp)<input id="planSummary" name="planSummary" value=""><br>
채점방식(sp)<input id="planMarkingMethod" name="planMarkingMethod" value=""><br>
학습목표(sp)<input id="planLessonGoal" name="planLessonGoal" value=""><br>
주차별강의내용(sp)<input id="planWeekContent" name="planWeekContent" value=""><br>
교재(sp)<input id="planBookinfo" name="planBookinfo" value=""><br>
참고문헌(sp)<input id="planBibliography" name="planBibliography" value=""><br>
연도(sp)<input id="planYear" name="planYear" value="" readonly="readonly"><br>
학기(sp)<input id="planSemester" name="planSemester" value="" readonly="readonly"><br>
비고(sp)<input id="planNote" name="planNote" value=""><br>
교수ID(p)<input id="proId" name="proId" value="" readonly="readonly"><br>
과목번호(s)<input id="subjectId" name="subjectId" value="" readonly="readonly"><br>
<button type="submit">등록</button>
</form>
<!-- 아래부터는 그냥 보여주는거... -->
과목명(s)<input id="subjectName" value="" readonly="readonly"><br>
이수구분(s)<input id="subjectType" value="" readonly="readonly"><br>
학년(s)<input id="subjectGrade" value="" readonly="readonly"><br>
학점(s)<input id="subjectCredit" value="" readonly="readonly"><br>
강의시간(s)<input id="subjectTime" value="" readonly="readonly"><br>
교수실ID(p)<input id="proRoomOfficeId" value="" readonly="readonly"><br>
이름(u)<input id="usersName" value="" readonly="readonly"><br>
영문성명(u)<input id="usersEngName" value="" readonly="readonly"><br>
이메일(u)<input id="usersEmail" value="" readonly="readonly"><br>
핸드폰번호(u)<input id="usersCellNum" value="" readonly="readonly"><br>

</body>
</html>