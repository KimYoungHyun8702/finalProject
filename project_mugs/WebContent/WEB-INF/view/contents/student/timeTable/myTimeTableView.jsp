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
function popupOpen(subjectName, buildingName, roomName) {
	var popOption = "width=470, height=470, resizable=no, scrollbars=no, status=no;";
	window.open("getMapByBuildingName.do?subjectName="+subjectName+"&buildingName="+buildingName+"&roomName="+roomName,"map", popOption);
}

$(document).ready(function(){
		var text="";
			<c:forEach items="${requestScope.myTimeTableResult}" var="result">
				<c:choose>			
					<c:when test="${result.subject.gyoShi1 == '1'}">
						<c:choose>
							<c:when test="${result.subject.yoYil1 == '월'}">
								$("#tbody tr").eq(0).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(1).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>									
									</c:when>
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>		
									</c:when>								
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						
							<c:when test="${result.subject.yoYil1 == '화'}">
								$("#tbody tr").eq(0).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(2).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>		
									</c:when>					
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
						
							<c:when test="${result.subject.yoYil1 == '수'}">
								$("#tbody tr").eq(0).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(3).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '목'}">
								$("#tbody tr").eq(0).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(4).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								<c:choose>
									<c:when test="${result.subject.gyoShi2=='1'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(0).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(0).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(2).css("background-color","cyan");
												$("#tbody tr").eq(0).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(0).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil=='목'}">
												$("#tbody tr").eq(0).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(0).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(1).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>									
										</c:choose>
									</c:when>
									<c:when test="${result.subject.gyoShi2=='3'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(2).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(2).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(2).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(2).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(2).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(3).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>									
									</c:when>
												
									<c:when test="${result.subject.gyoShi2=='5'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(4).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(4).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(4).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(4).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(4).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(5).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>		
									</c:when>							
									<c:when test="${result.subject.gyoShi2=='7'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(6).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(6).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(6).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(6).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(6).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(7).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
									<c:when test="${result.subject.gyoShi2=='9'}">
										<c:choose>
											<c:when test="${result.subject.yoYil2=='월'}">
												$("#tbody tr").eq(8).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(1).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='화'}">
												$("#tbody tr").eq(8).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(2).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='수'}">
												$("#tbody tr").eq(8).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(3).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='목'}">
												$("#tbody tr").eq(8).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(4).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
											<c:when test="${result.subject.yoYil2=='금'}">
												$("#tbody tr").eq(8).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(9).children().eq(5).css("background-color", "cyan");
												$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
												$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
											</c:when>
										</c:choose>	
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${result.subject.yoYil1 == '금'}">
								$("#tbody tr").eq(0).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(1).children().eq(5).css("background-color", "pink");
								$("#tbody tr").eq(0).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(1).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(2).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(3).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(2).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(3).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(2).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(3).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(2).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(3).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(2).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(3).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(4).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(5).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(4).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(5).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(4).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(5).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(4).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(5).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(4).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(5).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(6).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(7).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(6).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(7).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(6).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(7).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(6).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(7).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(6).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(7).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(8).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(9).children().eq(1).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(8).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(9).children().eq(2).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(8).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(9).children().eq(3).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(8).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(9).children().eq(4).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
								$("#tbody tr").eq(8).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
								$("#tbody tr").eq(9).children().eq(5).html("${result.subject.subjectName}<br>${result.professor.usersName}<br><a href='javascript:popupOpen(\"${result.subject.subjectName}\", \"${result.building.buildingName}\", \"${result.room.roomName}\");'>${result.building.buildingName}&nbsp;${result.room.roomName}</a>");
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
<h2>나의시간표가 조회 될 jsp, 전체페이지에서 왼쪽 옆에 여러 카테고리들이 있을 텐데 '수강정보'라는 카테고리가 있고 그 안에 '나의 시간표'탭을 클릭했을 때 보여질 jsp.</h2>

  <table>
	<thead id="thead">
		<tr>
			<td>교시/요일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
		</tr>
	</thead>
	<tbody id="tbody">
	
		<tr>
			<td>1교시</td>
			<td>
			
			</td>
			<td>
				
			</td>
			<td>
		
			</td>
			<td>
				
			</td>
			<td>
			</td>
			
		</tr>
	 
		<tr>
			<td>2교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		
		</tr>
		<tr>
			<td>3교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>

		</tr>
		<tr>
			<td>4교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		
		</tr>
		<tr>
			<td>5교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		
		</tr>
		<tr>
			<td>6교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
	
		</tr>
		<tr>
			<td>7교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>

		</tr>
		<tr>
			<td>8교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
	
		</tr>
		<tr>
			<td>9교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
	
		</tr>
		<tr>
			<td>10교시</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
	
		</tr>
	</tbody>
  </table> 
</body>
</html>