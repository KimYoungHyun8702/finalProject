<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table{
	width:110%;
}
td{
	height:80px;
	text-align:center;
	border: 1px solid black;
}
th{
	height:60px;
	text-align:center;
	font-family:돋움체;
}
#tbody tr {
	font-size:15px; font-family:돋움체;
	line-height:15px;
}
h3{
	font-family:돋움체;
}
</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		var text="";
	   
			<c:forEach items="${requestScope.myTimeTableResult}" var="result">
				<c:choose>			
					<c:when test="${result.subject.gyoShi1 == '1'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(0).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}"+"<br>"+"${result.professor.usersName}"+"<br>"+"${result.subject.lectureId}"+"<br>"+"${result.building.buildingName}"+"<br>"+"${result.room.roomName}");
								$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}"+"<br>"+"${result.professor.usersName}"+"<br>"+"${result.subject.lectureId}"+"<br>"+"${result.building.buildingName}"+"<br>"+"${result.room.roomName}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
									
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
											
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
									
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
										
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
											
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
											
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
											alert("454545");
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>									
									</c:when>
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(0).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(1).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>		
									</c:when>					
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(0).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(1).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(0).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(1).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<a href=''>링크요</a>${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(0).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(1).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${result.subject.gyoShi1 == '3'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(2).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(3).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(2).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(3).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(2).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(3).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(2).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(3).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>									
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(2).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(3).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(2).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(3).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(2).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(3).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(2).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(3).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(2).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(3).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(2).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(3).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>						
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>				
					<c:when test="${result.subject.gyoShi1 == '5'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(4).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(5).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(4).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(5).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(4).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(5).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(4).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(5).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(4).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(5).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(4).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(5).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(4).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(5).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(4).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(5).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(4).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(5).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(4).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(5).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${result.subject.gyoShi1 == '7'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(6).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(7).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(6).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(7).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(6).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(7).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(6).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(7).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(6).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(7).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(6).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(7).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(6).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(7).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(6).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(7).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(6).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(7).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(6).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(7).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${result.subject.gyoShi1 == '9'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(8).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(9).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(8).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(9).children().eq(1).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(8).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(9).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(8).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(9).children().eq(2).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(8).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(9).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(8).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(9).children().eq(3).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(8).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(9).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(8).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(9).children().eq(4).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2 == '수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>						
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(8).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(9).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(8).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								$("#tbody tr").eq(9).children().eq(5).text("${result.subject.subjectName}${result.professor.usersName}${result.subject.lectureId}");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
			</c:forEach>
});					

</script>
</head>
<body>

 <div class="container">
    
        <h3>나의 시간표</h3>
        <hr style="border: solid px black">
        <div id="no-more-tables">
	           <table class="col-lg-7 table-bordered table-striped table-condensed cf">
                <tbody>
            	<thead class="cf">
        			<tr>
        				<th width="90px">교시/요일</th>
        				<th width="110px">월</th>
            			<th width="110px">화</th>
        				<th width="110px">수</th>
                		<th width="110px">목</th>
        				<th width="110px">금</th>
        			</tr>
        		</thead>
				<tbody id="tbody">
					<tr>
        				<td width="80px">1교시<br>9:00~9:50</td>
                        <td width="100px"></td>
                        <td width="100px"></td>
                        <td width="100px"></td>
                        <td width="100px"></td>
                        <td width="100px"></td>
                    
        			</tr>
        			<tr>
            			<td>2교시<br>10:00~10:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
        			<tr>
            			<td>3교시<br>11:00~11:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
        			<tr>
            			<td>4교시<br>12:00~12:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
        			<tr>
            			<td>5교시<br>01:00~01:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
					<tr>
            			<td>6교시<br>02:00~02:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
					<tr>
            			<td>7교시<br>03:00~03:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
					<tr>
            			<td>8교시<br>04:00~04:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
					<tr>
            			<td>9교시<br>05:00~05:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>
					<tr>
            			<td>10교시<br>06:00~06:50</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
        			</tr>

        		</tbody>
        	</table>
        </div>
	</div>
   
	 <!--  <table width="700" border="0" cellpadding="1" cellspacing="1" bgcolor="#c5e2cc">
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">요일/교시</td>
          <td width="107" class="schedule">월</td>
          <td width="107" class="schedule">화</td>
          <td width="107" class="schedule">수</td>
          <td width="107" class="schedule">목</td>
          <td width="107" class="schedule">금</td>
          <td width="107" class="schedule">토</td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">1</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">2</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">3</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">4</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">5</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">6</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">7</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">8</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">9</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>
  
        <tr bgcolor="#f3fdf8" height="40">
          <td width="52" align="center" bgcolor="#daf3e0">10</td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="107" class="schedule"></td>
          <td width="84" bgcolor="#dff1db" class="schedule"></td>
        </tr>  
      </table> -->
</body>
</html>