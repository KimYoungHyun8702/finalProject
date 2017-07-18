<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>
강의계획서
<!-- <form action="/project_mugs/professor/reNewSubjectPlan.do" method="post">
후에 시퀀스적용..
강의계획서ID(sp)<input id="planId" name="planId" value="" readonly="readonly"><br>
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
<button type="submit" id="insertBtn">등록</button>
</form>
과목명(s)<input id="subjectName" value="" readonly="readonly"><br>
이수구분(s)<input id="subjectType" value="" readonly="readonly"><br>
학년(s)<input id="subjectGrade" value="" readonly="readonly"><br>
학점(s)<input id="subjectCredit" value="" readonly="readonly"><br>
강의시간(s)<input id="subjectTime" value="" readonly="readonly"><br>
교수ID(p)<input id="proId" value="" readonly="readonly"><br>
교수실ID(p)<input id="proRoomOfficeId" value="" readonly="readonly"><br>
이름(u)<input id="usersName" value="" readonly="readonly"><br>
영문성명(u)<input id="usersEngName" value="" readonly="readonly"><br>
이메일(u)<input id="usersEmail" value="" readonly="readonly"><br>
핸드폰번호(u)<input id="usersCellNum" value="" readonly="readonly"><br>
국적(u)<input id="usersNational" value="" readonly="readonly"><br>
아래부터는 그냥 보여주는거... -->

<!-- 강의계획서번호(sp) --><input id="planId" value="" readonly="readonly"style="display: none;">
<!-- 교수ID(p) --><input id="proId" value="" readonly="readonly" style="display: none;">
<!-- 교수실ID(p) --><input id="proRoomOfficeId" value="" readonly="readonly" style="display: none;">
<!-- 영문성명(u) --><input id="usersEngName" value="" readonly="readonly" style="display: none;">
<!-- 이메일(u) --><input id="usersEmail" value="" readonly="readonly" style="display: none;">
<!-- 국적(u) --><input id="usersNational" value="" readonly="readonly" style="display: none;">
<style type=text/css>
<!--
body {font-size:9pt; font-family:굴림;}
td {font-size:9pt; font-family:굴림;}
a:link { font-size:9pt; text-decoration:none; color:darkblue }
a:visited { text-decoration:none; color:darkblue }
a:hover {text-decoration:underline; color:red;}
a.bb:hover {color:red;}
//-->
</style>
</head>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="657">
<tr>
<td height="401" width="657">
<table height="150" width="659" border="0" cellspacing="0" cellpadding="2">
<tr bgcolor="#A6AC6C" height="25">
<td align=center width="655" bgcolor="#909041">
<!-- 과목이름 -->
<b><font color="red"><input id="subjectName1" value="" readonly="readonly" size="40"></font></b>
</td>
</tr>
<tr valign="top">
<td height="549" width="655">
<!-- 고정입력 부분 -->
<table width="665" cellspacing="1" cellpadding="0" bordercolordark="white" bordercolorlight="black" style="border-collapse:collapse;" height="689">
                            <tr valign="middle">
        <td width="88" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 과목명/ 코드 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">과목명/코드</span></font></p>
        </td>
        
        <td width="272" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC">
        <p><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
       	<!-- 과목 이름 -->
        <input id="subjectName" value="" readonly="readonly"> </span></font><font face="굴림"><span style="font-family:굴림; font-size:9pt;">&nbsp;/</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 과목 ID -->      	
        <input id="subjectId" name="subjectId" value="" readonly="readonly"><br></span></font></p>
        </td>
        
        <td width="93" height="25" valign="middle" bgcolor="#EAE8E8" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;">
        <!-- 연도/학년/학기 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">연도/학년/학기</span></font></p>
        </td>
        
        <td width="202" height="25" valign="middle" bgcolor="#FAECEC" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;">
        <p><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font color="blue">
        <!-- 연도 -->
        <input id="planYear" value="" readonly="readonly" size="10"></font>년<font face="굴림" color="blue"><span style="font-size:9pt;"><br>
        <!-- 학년 -->
        <input id="subjectGrade" value="" readonly="readonly" size="5"></span></font>/학년<font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학기 -->
        <input id="planSemester" value="" readonly="readonly" size="5"></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 강의시간 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">강의시간</span></font></p>
        </td>
        
        <td width="272" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" align="left">
        <p>&nbsp;<font color="blue">
        <!-- 강의시간 -->
        <input id="subjectTime" value="" readonly="readonly"></font></p>
	    </td>
	    
        <td width="93" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 이수구분/학점 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">이수구분/학점</span></font></p>
        </td>
        
        <td width="202" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD">
        <p> <font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font color="blue">
        <!-- 이수구분 -->
        <input id="subjectType" value="" readonly="readonly"></font> / <font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학점 -->
        <input id="subjectCredit" value="" readonly="readonly"></span></font> 학점</p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 담당교수 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">담당교수</span></font></p>
        </td>
        
        <td width="272" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" height="25">
        <p><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교수이름 -->
        <input id="usersName" value="" readonly="readonly"></span></font></p>
        </td>
        
        <td width="93" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8" height="25">
        <!-- 교수 전화번호 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">전화번호</span></font></p>
        </td>
        
        <td width="202" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" height="25">
        <p><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교수 전화번호 -->
        <input id="usersCellNum" value="" readonly="readonly"></span></font></p>
        </td>
        </tr>
        <!-- 수정입력 부분 -->
		<sec:csrfInput/>	     
        <tr valign="middle">
        <td width="88" valign="middle" height="62" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 교과목 개요 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">교과목 개요</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="62" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교과목 개요 -->
        <input id="planSummary" name="planSummary" size="90"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="62" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 학습목표 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">학습목표</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="62" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학습목표 -->
        <input id="planLessonGoal" name="planLessonGoal" value="" size="90"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="342" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 주차별 강의내용 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">주차별<br>강의내용</span></font></p>
        </td>
        
        <td width="561" valign="top" height="342" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 주차별 강의내용 -->
        <textarea rows="10" cols="90" id="planWeekContent" name="planWeekContent"></textarea>
        <!-- <input id="planWeekContent" value="" readonly="readonly" size="90"> -->
        </span></font></p>
        </td>
        </tr>
        
    	<tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 교재 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">교재
        </span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교재 -->
        <input id="planBookinfo" name="planBookinfo" value="" size="90"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 참고문헌 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">참고문헌
        </span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 참고문헌 -->
        <input id="planBibliography" name="planBibliography" value="" size="90"><br></span></font></p>
        </td>
        </tr>
        
   	 	<tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 채점방식 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">채점방식</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 채점방식 -->
        <input id="planMarkingMethod" name="planMarkingMethod" value="" size="90"></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 비고 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">비고</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" colspan="3">
        <p><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 비고 -->
        <input id="planNote" name="planNote" value="" size="90"><br></span></font></p>
        </td>
        </tr>           
</table>

</td>
</tr>
</table> 
</td>
</tr>
<tr bgcolor="#6B6BCD" height="1" align="center">
<td width="657" align="center">
<button type="submit" id="updateBtn">수정</button>


<input type="text" id="planId2" name="planId2" value="" readonly="readonly" style="display: none;">
<button type="submit" id="deleteBtn">삭제</button>

</td>
</tr>
</table>
<br>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).on("click", "#updateBtn", function(){
	var planId = document.getElementById("planId").value
	var planSummary = document.getElementById("planSummary").value
	var planMarkingMethod = document.getElementById("planMarkingMethod").value
	var planLessonGoal = document.getElementById("planLessonGoal").value
	var planWeekContent = document.getElementById("planWeekContent").value
	var planBookinfo = document.getElementById("planBookinfo").value
	var planBibliography = document.getElementById("planBibliography").value
	var planYear = document.getElementById("planYear").value
	var planSemester = document.getElementById("planSemester").value
	var planNote = document.getElementById("planNote").value
	var proId = document.getElementById("proId").value
	var subjectId = document.getElementById("subjectId").value

	$.ajax({
		"url":"/project_mugs/professor/reNewSubjectPlan.do",
		"type":"POST",
		"data":{"planId":planId,"planSummary":planSummary,"planMarkingMethod":planMarkingMethod,"planLessonGoal":planLessonGoal,"planWeekContent":planWeekContent,"planBookinfo":planBookinfo,"planBibliography":planBibliography,"planYear":planYear,"planSemester":planSemester,"planNote":planNote,"proId":proId,"subjectId":subjectId,${_csrf.parameterName}:'${_csrf.token}'},
		"success":function(){
			alert("수정완료");
		},//success
		"error":function(){		
			alert("수정실패");
		}//error
	});//ajax
});//click

$(document).on("click", "#deleteBtn", function(){
	var planId2 = document.getElementById("planId2").value

	$.ajax({
		"url":"/project_mugs/professor/removeSubjectPlan.do",
		"type":"POST",
		"data":{"planId2":planId2,${_csrf.parameterName}:'${_csrf.token}'},
		"success":function(){
			alert("삭제완료");
		},//success
		"error":function(){		
			alert("삭제실패");
		}//error
	});//ajax
});//click

</script>
</html>