<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#subjectTypeList").change(function() {
		var txt = "<option>선택하세요.</option>"
		$("#subjectThead").empty();
		$("#subjectTbody").empty();
		$("#majorList").html(txt);
		$("#collegeList").html(txt);
		var index = $("#subjectTypeList option").index($("#subjectTypeList option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getCollegeListAjax.do",
			"type":"post",
			"dataType":"json",
			"data":{'subjectType':$("#subjectTypeList option:selected").text(), '${_csrf.parameterName}':'${_csrf.token}'},
			"beforeSend":function(){
				if(index == 0) {
					alert("이수구분을 선택하세요.");
					$("#collegeList").html(txt);
					$("#majorList").html(txt);
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(map) {
				if(map.collegeList) {
					if($("#collegeLabel").length) {
						var txt = "<option>선택하세요.</option>";
						$.each(map.collegeList, function(){
							txt += "<option value=" + this.collegeId + ">" + this.collegeName + "</option>";
						});
						$("#collegeList").html(txt);
					} else {
						var txt = " <label id=" + "collegeLabel>단과대학 : " + "<select id=" + "collegeList>" + "<option>선택하세요.</option>";
						var nextTxt = " <label id=" + "majorLabel>학과 : " + "<select id=" + "majorList>" + "<option>선택하세요.</option></select></label>";
						$.each(map.collegeList, function(){
							txt += "<option value=" + this.collegeId + ">" + this.collegeName + "</option>";
						});
						txt += "</select></label>";
						$("#subjectType").after(txt);
						$("#collegeLabel").after(nextTxt);
					}
				} else {
					$("#collegeList").remove();
					$("#majorList").remove();
					$("#collegeLabel").remove();
					$("#majorLabel").remove();
					var majorIdTxt = "";
					var subjectTbody = "";
					var subjectThead = "<tr><th><input style='width:55px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='재수강여부' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청버튼' disabled></th></tr>";
					$.each(map.professorSubjectList, function(){
						subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
                        	"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
                        	"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
                        	"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
                        	"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + "</td><td style='text-align:center'>" + this.subject.recourse +
                        	"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                        	"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
					
					
					
					
					});
					$("#subjectThead").html(subjectThead);
					$("#subjectTbody").html(subjectTbody);
				}
			},
		});
	});
	
	$(document).on("change", "#collegeList", function() {
		var index = $("#collegeList option").index($("#collegeList option:selected"));
		var txt = "<option>선택하세요.</option>"
		$("#majorList").html(txt);
		$("#subjectThead").empty();
		$("#subjectTbody").empty();
		$.ajax({
			"url":"/project_mugs/student/getMajorListByCollegeId.do",
			"type":"post",
			"data":{'collegeId':$("#collegeList").val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"beforeSend":function() {
				if(index == 0) {
					alert("단과대학을 선택하세요.");
					$("#majorList").html(txt);
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(list) {
				var txt = "<option>선택하세요.</option>";
				$.each(list, function(){
					txt += "<option value=" + this.majorId + ">" + this.majorName + "</option>";
				});
				$("#majorList").html(txt);
			},
		});
	});
	
	$(document).on("change", "#majorList", function() {
		var index = $("#majorList option").index($("#majorList option:selected"));
		$.ajax({
			"url":"/project_mugs/student/getSubjectListByJoin.do",
			"type":"post",
			"dataType":"json",
			"data":{'majorId':$("#majorList").val(), 'semester':$("#semester").val(), 'nowYear':$("#nowYear").val(), 'subjectType':$("#subjectTypeList").val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"beforeSend":function() {
				if(index == 0) {
					alert("학과를 선택하세요.");
					$("#subjectThead").empty();
					$("#subjectTbody").empty();
					return false;
				}
			},
			"success":function(map) {
				var subjectTbody = "";
				var subjectThead = "<tr><th><input style='width:55px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='재수강여부' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청버튼' disabled></th></tr>";
				$.each(map.professorSubjectList, function(){
					subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
                    	"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
                    	"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
                    	"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
                    	"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + "</td><td style='text-align:center'>" + this.subject.recourse +
                    	"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                    	"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
				});
				$("#subjectThead").html(subjectThead);
				$("#subjectTbody").html(subjectTbody);
			},
		});
	});
	
	$(document).on("click", "#enrolment", function() {
		var tbodySize = $("#tbodyMySubject tr").length;
		var majorIdVal;
		if(!$("#majorList").val()) {
			majorIdVal = "";
		} else {
			majorIdVal = $("#majorList").val()
		}
		$.ajax({
			"url":"/project_mugs/student/addCourseMySubject.do",
			"type":"post",
			"data":{'semester':$("#semester").val(), 'nowYear':$("#nowYear").val(), 
				'majorId':majorIdVal, proId:$(this).next().next().val(), 
				'subjectType':$("#subjectTypeList").val(), 'subjectId':$(this).next().val(), 
				'recourse':$(this).parent().prev().text(), 'stuRegister':$("#stuRegister").val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"beforeSend":function() {
				
			},
			"success":function(map) {
				if(map.msg) {
					alert(map.msg);
				} else {
					alert("수강신청 완료")
					var subjectThead = "<tr><th><input style='width:55px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='재수강여부' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청버튼' disabled></th></tr>";
					var subjectTbody = "";
					var majorIdTxt = "";
					$.each(map.professorSubjectList, function() {
						if(this.subject.major) {
							subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
	                    		"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
	                    		"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
	                    		"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
	                    		"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + "</td><td style='text-align:center'>" + this.subject.recourse +
	                    		"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                    		"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
						} else {
							subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
	                    		"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
	                    		"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
	                    		"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
	                    		"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + "</td><td style='text-align:center'>" + this.subject.recourse +
	                    		"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                    		"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
						}
						
					});
					
					var theadMySubject = "<tr><th><input style='width:90px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:115px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:80px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:85px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='취소버튼' disabled></th></tr>";
					var tbodyMySubject = "";
					$.each(map.courseSubjectList, function() {
						if(this.subject.major) {
							tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
                        		"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
                        		"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + 
                        		"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                        		"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
                        		"</td></tr>";
						} else {
							tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
	                        	"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
	                        	"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + 
	                        	"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                        	"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
	                        	"</td></tr>";
						}
						
					});
					$("#subjectThead").html(subjectThead);
					$("#subjectTbody").html(subjectTbody);
					$("#theadMySubject").html(theadMySubject);
					$("#tbodyMySubject").html(tbodyMySubject);
				}
			},
		});
	});
	
	$(document).on("click", "#cancelCourse", function() {
		if(confirm("정말 취소하시겠습니까?") == true) {			
			var subjectTbodySize = $("#subjectTbody tr").length;
			var majorIdVal;
			if($("#majorList").val() == '선택하세요.') {
				majorIdVal = "";
			} else if ($("#majorList").length == 0) {
				majorIdVal = "";
			} else {
				majorIdVal = $("#majorList").val();
			}
			$.ajax({
				"url":"/project_mugs/student/removeMySubject.do",
				"type":"post",
				"dataType":"json",
				"data":{'majorId':majorIdVal, 'semester':$("#semester").val(), 'nowYear':$("#nowYear").val(), 
					'proId':$(this).next().next().val(), 'subjectId':$(this).next().val(), 'subjectType':$("#subjectTypeList").val(), '${_csrf.parameterName}':'${_csrf.token}'},
				"beforeSend":function() {
					
				},
				"success":function(map) {
					alert("수강취소 완료");
					if(subjectTbodySize != 0) {
						var subjectThead = "<tr><th><input style='width:55px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:55px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:110px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='재수강여부' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청버튼' disabled></th></tr>";
						var subjectTbody = "";
						var majorIdTxt = "";
						$.each(map.professorSubjectList, function() {
							if(this.subject.major) {
								subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
	                    			"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
	                    			"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
	                    			"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
	                    			"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + "</td><td style='text-align:center'>" + this.subject.recourse +
	                    			"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                    			"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
							} else {
								subjectTbody += "<tr><td style='text-align:center'>" + this.subject.subjectGrade +
	                    			"</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass + "</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" +
	                    			"</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCapacity + "</td><td style='text-align:center'>" + this.subject.subjectRequest + 
	                    			"</td><td style='text-align:center'>" + this.subject.remainNum + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectTime + 
	                    			"</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + "</td><td style='text-align:center'>" + this.subject.recourse +
	                    			"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "enrolment>" + "수강신청</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                    			"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "</td></tr>";
							}
							
						});
						var theadMySubject = "<tr><th><input style='width:90px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:115px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:80px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:85px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='취소버튼' disabled></th></tr>";
						var tbodyMySubject = "";
						$.each(map.courseSubjectList, function() {
							if(this.subject.major) {
								tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
                        			"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
                        			"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + 
                        			"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                        			"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
                        			"</td></tr>";
							} else {
								tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
	                        		"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
	                        		"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + 
	                        		"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
	                        		"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
	                        		"</td></tr>";
							}
							
						});
						$("#subjectThead").html(subjectThead);
						$("#subjectTbody").html(subjectTbody);
						$("#theadMySubject").html(theadMySubject);
						$("#tbodyMySubject").html(tbodyMySubject);
					} else {
						var theadMySubject = "<tr><th><input style='width:90px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:115px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:80px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:85px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:140px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:100px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='취소버튼' disabled></th></tr>";
						var tbodyMySubject = "";
						var majorIdTxt = "";
						$.each(map.courseSubjectList, function() {
							if(this.subject.major) {
								tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
                    				"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
                    				"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + this.subject.major.majorName + 
                    				"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                    				"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
                    				"</td></tr>";
							} else {
								tbodyMySubject += "<tr><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectType + "</td><td style='text-align:center'>" + this.subject.subjectClass +
                        			"</td><td style='text-align:center'>" + "<a style='color:black; text-align:center' href='javascript:subjectPlanOpen(\""+ this.subjectId+"\", \""+this.proId+"\", \"" + $("#semester").val() + "\", \"" + $("#nowYear").val() + "\");'>" + this.subject.subjectName + "</a>" + "</td><td style='text-align:center'>" + this.professor.usersName + "</td><td style='text-align:center'>" + this.subject.subjectCredit + 
                        			"</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.building.buildingName + "/" + this.room.roomName + "</td><td style='text-align:center'>" + majorIdTxt + 
                        			"</td><td style='text-align:center'>" + "<button style='text-align:center' id=" + "cancelCourse>" + "수강취소</button>" + "<input style='text-align:center' type='hidden' value=" + this.subjectId + ">" + 
                        			"<input style='text-align:center' type='hidden' value=" + this.proId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.majorId + ">" + "<input style='text-align:center' type='hidden' value=" + this.subject.subjectType + ">" + 
                        			"</td></tr>";
							}
							
						});
						$("#theadMySubject").html(theadMySubject);
						$("#tbodyMySubject").html(tbodyMySubject);
					}
				}
			});
		} else {
			return;
		}
	});
	
	$(document).on("click", "#completed", function() {
		var tbodyMySubjectSize = $("#tbodyMySubject tr").length;
		var myCourseCreditSum = 0;
		var stuRegister = $("#stuRegister").val();	// 재적상태
		var standardMinCredit = $("#standardMinCredit").val();	// 재학생 최저 인정가능 학점
		var standardMinScholarship = $("#standardMinScholarship").val();	// 장학금 최저 인정가능 학점
		var standardDelayMinCredit = $("#standardDelayMinCredit").val();	// 졸업유예자 최저 인정가능 학점
				
		for(var i = 0; i < tbodyMySubjectSize; i++) {
			myCourseCreditSum += $("#tbodyMySubject tr").eq(i).children().eq(5).text()*1;
		}
		
		if(stuRegister == "재학") {
			if(myCourseCreditSum < standardMinCredit) {
				if(confirm("신청학점이 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }/index.do";
				} else {
					return;
				}
			}
			
			if(myCourseCreditSum > standardMinCredit && myCourseCreditSum < standardMinScholarship) {
				if(confirm("신청학점이 장학금 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }/index.do";
				} else {
					return;
				}
			} else {
				location.href="${initParam.rootPath }/index.do";
			}
		} else {
			if(myCourseCreditSum < standardDelayMinCredit) {
				if(confirm("신청학점이 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }/index.do";
				} else {
					return;
				}
			}
			
			if(myCourseCreditSum > standardDelayMinCredit && myCourseCreditSum < standardMinScholarship) {
				if(confirm("신청학점이 장학금 최저 인정가능학점이 되지 않습니다, 그래도 수강신청을 완료하시겠습니까?") == true) {
					location.href="${initParam.rootPath }/index.do";
				} else {
					return;
				}
			} else {
				location.href="${initParam.rootPath }/index.do";
			}
		}
	});
});

function subjectPlanOpen(planSubjectId, planProId, semester, nowYear) {
	$.ajax({
		"url":"/project_mugs/professor/searchSubjectPlanByFourId.do",
		"type":"post",
		"dataType":"json",
		"data":{'planYear':nowYear, 'planSemester':semester, 'subjectId':planSubjectId, 'proId':planProId, '${_csrf.parameterName}':'${_csrf.token}'},
		"success":function(obj){
			alert('성공')
			openchild(obj);
		},
		"error":function(txt){	
			alert('등록된 강의계획서가 없습니다');
		}
	});
}

var openWin;

function openchild(obj){
	// window.name = "부모창 이름"; planId
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");          
    openWin = window.open("/project_mugs/SubjectPlan_success.do", "강의계획서조회", "width=700, height=1000 resizable=no");
    
    setTimeout(function(){
    	openWin.document.getElementById("planId").value = obj.planId;
    	openWin.document.getElementById("planId2").value = obj.planId;
    	openWin.document.getElementById("planYear").value = obj.planYear;
    	openWin.document.getElementById("planSemester").value = obj.planSemester;
    	openWin.document.getElementById("planSummary").value = obj.planSummary;
    	openWin.document.getElementById("planLessonGoal").value = obj.planLessonGoal;
    	openWin.document.getElementById("planWeekContent").value = obj.planWeekContent;
    	openWin.document.getElementById("planMarkingMethod").value = obj.planMarkingMethod;
    	openWin.document.getElementById("planBookinfo").value = obj.planBookinfo;
    	openWin.document.getElementById("planBibliography").value = obj.planBibliography;
    	openWin.document.getElementById("planNote").value = obj.planNote;
    	openWin.document.getElementById("subjectId").value = obj.subject.subjectId;
    	openWin.document.getElementById("subjectName").value = obj.subject.subjectName;
    	openWin.document.getElementById("subjectName1").value = obj.subject.subjectName;
    	openWin.document.getElementById("subjectType").value = obj.subject.subjectType;
    	openWin.document.getElementById("subjectGrade").value = obj.subject.subjectGrade;
    	openWin.document.getElementById("subjectCredit").value = obj.subject.subjectCredit;
    	openWin.document.getElementById("subjectTime").value = obj.subject.subjectTime;
    	openWin.document.getElementById("proId").value = obj.professor.proId;
    	openWin.document.getElementById("proRoomOfficeId").value = obj.professor.proRoomOfficeId;
    	openWin.document.getElementById("usersName").value = obj.professor.usersName;
    	openWin.document.getElementById("usersEngName").value = obj.professor.usersEngName;
    	openWin.document.getElementById("usersEmail").value = obj.professor.usersEmail;
    	openWin.document.getElementById("usersCellNum").value = obj.professor.usersCellNum;
    	openWin.document.getElementById("usersNational").value = obj.professor.usersNational;
    }, 2000);
}
</script>

<style type="text/css">
input{
   text-align:center;
}

#thead {
   width:100px;
}
table{
   width:100%;
   
}
td{
   padding: 5px;
   border: 1px solid black;
}
select{
   width:120px;
   height: 35px;
   padding: 5px;
}
#product_info_layer{
   width:700px;
   border: 1px solid gray;
   padding:5px;
   display: none;/*최초 로딩시에는 안보이도록 처리*/
}
#tbody{
   cursor: pointer;
}
h3{
   font-family:굴림체;
}
</style>
</head>
<body>
<h3>수강신청</h3><br>
<h2>
	<input type="hidden" id="stuRegister" value="${stuRegister }">
	<input type="hidden" id="semester" value="${semester }">
	<input type="hidden" id="nowYear" value="${nowYear }">
	<input type="hidden" id="standardMinCredit" value="${standard.standardMinCredit }">
	<input type="hidden" id="standardMaxCredit" value="${standard.standardMaxCredit }">
	<input type="hidden" id="standardMinScholarship" value="${standard.standardMinScholarship }">
	<input type="hidden" id="standardDelayMinCredit" value="${standard.standardDelayMinCredit }">
	<input type="hidden" id="standardDelayMaxCredit" value="${standard.standardDelayMaxCredit }">
	<ul><li><h4>${nowYear }년도 ${semester } 수강신청</h4></li></ul>
</h2>

<label id="subjectType">이수구분 :
	<select name="subjectTypeList" id="subjectTypeList" >
		<option>선택하세요.</option>
			<c:forEach items="${requestScope.subjectTypeList }" var="subjectType">
				<option>${subjectType }</option>
			</c:forEach>
	</select>
</label>

<label id="collegeLabel">단과대학 : 
	<select id="collegeList">
		<option>선택하세요.</option>
	</select>
</label>

<label id="majorLabel">학과 :
	<select id="majorList">
		<option>선택하세요.</option>
	</select>
</label>
<br>
<table border="2" style="border-color:black">
	<thead id="subjectThead"></thead>
	<tbody id="subjectTbody"></tbody>
</table><br>


<div id="course_info_layer">
	<ul><li><h4>나의 수강신청 내역</h4></li></ul>
		<button id="completed">수강신청완료</button><br>
		<br><table border="2" style="border-color: black">
			<thead id="theadMySubject">
				<tr>
					<th><input style='width:95px' type='text' class='form-control' placeholder='학년' disabled></th>
               		<th><input style='width:120px' type='text' class='form-control' placeholder='이수구분' disabled></th>
               		<th><input style='width:95px' type='text' class='form-control' placeholder='분반' disabled></th>
	                <th><input style='width:150px' type='text' class='form-control' placeholder='강목명' disabled></th>
	                <th><input style='width:120px' type='text' class='form-control' placeholder='담당교수' disabled></th>
	                <th><input style='width:85px' type='text' class='form-control' placeholder='학점' disabled></th>
	                <th><input style='width:140px' type='text' class='form-control' placeholder='강의시간' disabled></th>
	                <th><input style='width:140px' type='text' class='form-control' placeholder='강의실' disabled></th>
	                <th><input style='width:90px' type='text' class='form-control' placeholder='학과' disabled></th>
	                <th><input style='width:100px' type='text' class='form-control' placeholder='취소버튼' disabled></th>
				</tr>
			</thead>
			<tbody id="tbodyMySubject">
				<c:forEach items="${requestScope.myCourseList }" var="course">
					<tr>
						<td align="center">${course.subject.subjectGrade }</td>
	                  	<td align="center">${course.subject.subjectType }</td>
	                  	<td align="center">${course.subject.subjectClass }</td>
	                  	<td align="center"><a style='color:black' href="javascript:subjectPlanOpen('${course.subjectId }', '${course.proId }', '${semester }', '${nowYear }');">${course.subject.subjectName }</a></td>
	                  	<td align="center">${course.professor.usersName }</td>
	                  	<td align="center">${course.subject.subjectCredit }</td>
	                  	<td align="center">${course.subject.subjectTime }</td>
	                  	<td align="center">${course.building.buildingName }/${course.room.roomName }</td>
	                  	<td align="center">${course.subject.major.majorName }</td>
	                  	<td align="center"><button id="cancelCourse">수강취소</button>
	                  	<input type="hidden" value="${course.subjectId }">
	                  	<input type="hidden" value="${course.proId }">
	                  	<input type="hidden" value="${course.subject.majorId }">
	                    <input type="hidden" value="${course.subject.subjectType }">
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>