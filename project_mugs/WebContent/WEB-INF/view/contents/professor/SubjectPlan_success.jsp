<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>
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
<td align=center width="655" bgcolor="#909041" height="50">
<!-- 과목이름 -->
<b><font color="white" size="5"><input id="subjectName1" value="" readonly="readonly" size="40" style="text-align: center; background-color: #909041; border: 0px" ></font></b>
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
        
        <td width="272" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" align="center">
        <p align="center"><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
          <!-- 과목코드 -->
        <input id="subjectId" name="subjectId" value="" readonly="readonly" style="text-align: right; background-color: #FAECEC; border: 0px" size="5"></span></font><font face="굴림"><span style="font-family:굴림; font-size:9pt;">&nbsp;/</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 과목명 -->         
        <input id="subjectName" value="" readonly="readonly" style="text-align: right; background-color: #FAECEC; border: 0px" size="10"><br></span></font></p>
        </td>
        
        <td width="93" height="25" valign="middle" bgcolor="#EAE8E8" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;">
        <!-- 연도/학년/학기 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">연도/학년/학기</span></font></p>
        </td>
        
        <td width="202" height="25" valign="middle" bgcolor="#FAECEC" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" align="center">
        <p align="center"><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font color="blue">
        <!-- 연도 -->
        <input id="planYear" value="" readonly="readonly" size="2" style="text-align: right; background-color: #FAECEC; border: 0px"></font>년/<font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학년 -->
        <input id="subjectGrade" value="" readonly="readonly" size="1" style="text-align: right; background-color: #FAECEC; border: 0px"></span></font>학년/<font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학기 -->
        <input id="planSemester" value="" readonly="readonly" size="1" style="text-align: right; background-color: #FAECEC; border: 0px"></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 강의시간 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">강의시간</span></font></p>
        </td>
        
        <td width="272" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" align="center">
        <p>&nbsp;<font color="blue">
        <!-- 강의시간 -->
        <input id="subjectTime" value="" readonly="readonly" size="20" style="text-align: center; background-color: #F9F9DD; border: 0px"></font></p>
       </td>
       
        <td width="93" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8" align="center">
        <!-- 이수구분/학점 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">이수구분/학점</span></font></p>
        </td>
        
        <td width="202" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD">
        <p align="center"> <font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font color="blue">
        <!-- 이수구분 -->
        <input id="subjectType" value="" readonly="readonly" size="5" style="text-align: right; background-color: #F9F9DD; border: 0px"></font> / <font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학점 -->
        <input id="subjectCredit" value="" readonly="readonly" size="1" style="text-align: right;; background-color: #F9F9DD; border: 0px"></span></font> 학점</p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="25" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 담당교수 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">담당교수</span></font></p>
        </td>
        
        <td width="272" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" height="25">
        <p align="center"><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교수이름 -->
        <input id="usersName" value="" readonly="readonly" size="10" style="text-align: center; background-color: #FAECEC; border: 0px"></span></font></p>
        </td>
        
        <td width="93" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8" height="25">
        <!-- 교수 전화번호 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">전화번호</span></font></p>
        </td>
        
        <td width="202" valign="middle" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" height="25">
        <p align="center"><font face="굴림"><span style="font-size:9pt;">&nbsp;</span></font><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교수 전화번호 -->
        <input id="usersCellNum" value="" readonly="readonly" size="20" style="text-align: center; background-color: #FAECEC; border: 0px"></span></font></p>
        </td>
        </tr>
      <form>        
        <!-- 수정입력 부분 -->
        <tr valign="middle">
        <td width="88" valign="middle" height="62" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 교과목 개요 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">교과목 개요</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="62" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교과목 개요 -->
        <input id="planSummary" value="" readonly="readonly" size="50" style="text-align: center; background-color: #F9F9DD; border: 0px"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="62" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 학습목표 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">학습목표</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="62" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 학습목표 -->
        <input id="planLessonGoal" value="" readonly="readonly" size="50" style="text-align: center; background-color: #F9F9DD; border: 0px"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="342" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 주차별 강의내용 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">주차별<br>강의내용</span></font></p>
        </td>
        
        <td width="561" valign="top" height="342" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 주차별 강의내용 -->
        <textarea rows="20" cols="80" id="planWeekContent" name="planWeekContent" readonly="readonly" style="text-align: justify; background-color: #FAECEC; border: 0px"></textarea>
        
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
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 교재 -->
        <input id="planBookinfo" value="" readonly="readonly" size="50" style="text-align: center; background-color: #F9F9DD; border: 0px"><br></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 참고문헌 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">참고문헌
        </span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 참고문헌 -->
        <input id="planBibliography" value="" readonly="readonly" size="50" style="text-align: center; background-color: #F9F9DD; border: 0px"><br></span></font></p>
        </td>
        </tr>
        
          <tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 채점방식 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">채점방식</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#F9F9DD" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 채점방식 -->
        <input id="planMarkingMethod" value="" readonly="readonly" size="50" style="text-align: center; background-color: #F9F9DD; border: 0px"></span></font></p>
        </td>
        </tr>
        
        <tr valign="middle">
        <td width="88" valign="middle" height="50" style="border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#EAE8E8">
        <!-- 비고 -->
        <p align="center"><font face="굴림체" color="#333333"><span style="font-size:9pt;">비고</span></font></p>
        </td>
        
        <td width="561" valign="middle" height="50" style="margin:0; padding:5px; border-width:1; border-color:rgb(166,172,108); border-style:solid;" bgcolor="#FAECEC" colspan="3">
        <p align="center"><font face="굴림" color="blue"><span style="font-size:9pt;">
        <!-- 비고 -->
        <input id="planNote" value="" readonly="readonly" size="50" style="text-align:center; background-color: #FAECEC; border: 0px"><br></span></font></p>
        </td>
        </tr>     
        </form>
</table>

<!-- <button type="submit" onclick="123">수정</button>
$("#id").submit -->


</td>
</tr>
</table> 
</td>
</tr>
<tr bgcolor="#6B6BCD" height="1" align="center">
<td width="657" align="center">
<input type="text" id="planId2" name="planId2" value="" readonly="readonly" style="display: none;">
</td>
</tr>
</table>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="644">
<tr align="center">
<td align="center">


</td>
</tr>
</table> 

</body>
</html>