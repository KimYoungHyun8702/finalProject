<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input{
	text-align:center;
}
table{
	width:900px;
	
}
th {
	bgcolor:peru;
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}
select{
	width:150px;
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
	font-family:돋움체;
}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function update_subject(subjectId){
	location.href="${initParam.rootPath }/admin/selectSubjectInfoBySubjectIdForUpdateController.do?subjectId="+subjectId
};
function update_minor_subject(subjectId){
	location.href="${initParam.rootPath }/admin/selectSubjectInfoBySubjectIdForMinorUpdateController.do?subjectId="+subjectId
};
function delete_subject(subjectId){
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/deleteSubjectBySubjectIdController.do?subjectId="+subjectId
	}else{
		return false;
	}
};
$(document).ready(function(){	
	$("#college").hide();
	$("#major").hide();
	$("#subject").hide();
	$("#time").hide();
	$("#majorButton").hide();
	$("#minorButton").hide();
	$("#selectSubject").hide();
	$("#subjectType").on("change",function(){
		$("#selectSubject").hide();
		if($("#subjectType").val() == "선택전공" || $("#subjectType").val() == "필수전공"){
			$("#college").show();
			$("#major").show();
			$("#subject").show();
			$("#time").hide();
			$("#minorButton").hide();
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectCollegeIdBySubjectTypeController.do",
			"data":"subjectType="+$("#subjectType").val(),
			"success":function(result){
				$("#college").empty().append("<option>단과대학 선택</option>");
				$.each(result,function(){
					$("#college").append($("<option value="+this.college.collegeId+">").append(this.college.collegeName));
				})
			}
		});//end of ajax
	}else if($("#subjectType").val() == "선택교양" || $("#subjectType").val() == "필수교양"){
			$("#selectSubject").hide();
			$("#time").show();
			$("#college").hide();
			$("#major").hide();
			$("#subject").hide();
			$("#majorButton").hide();
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectCollegeIdBySubjectTypeMinorController.do",
			"data":"subjectType="+$("#subjectType").val(),
			"success":function(result){
				$("#time").empty().append("<option>시간표 선택</option>");
				$.each(result,function(){
					$("#minorButton").show();
					$("#time").append($("<option>").append(this.subjectTime));
				})
			}
		});//end of ajax 
	}else{
		alert("이수구분을 선택하세요");
		$("#selectSubject").hide();
		$("#college").hide();
		$("#major").hide();
		$("#subject").hide();
		$("#time").hide();
		$("#majorButton").hide();
		$("#minorButton").hide();
		$("#college").empty().append("<option>단과대학 선택</option>");
		$("#major").empty().append("<option>학과 선택</option>");
		$("#subject").empty().append("<option>과목 선택</option>");
		$("#time").empty().append("<option>시간표 선택</option>");
	};
	})//end of subjectType
	$("#college").on("change",function(){
		$("#selectSubject").hide();
		if($("#college").val() == "단과대학 선택"){
			$("#majorButton").hide();
			alert("단과대학을 선택하세요");
			$("#major").empty().append("<option>학과 선택</option>");
			$("#subject").empty().append("<option>과목 선택</option>");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectMajorIdByCollegeIdController.do", 
			"data":({collegeId:$("#college").val(),subjectType:$("#subjectType").val()}),
			"success":function(result){
				$("#major").show();
				$("#major").empty().append("<option>학과 선택</option>");
				$.each(result,function(){
					$("#major").append($("<option value="+this.major.majorId+">").append(this.major.majorName));
				})
			}
		})//end of ajax
		};
	});//end of college
	$("#major").on("change",function(){
		$("#selectSubject").hide();
		if($("#major").val() == "학과 선택"){
			$("#majorButton").hide();
			alert("학과를 선택하세요");
			$("#subject").empty().append("<option>과목 선택</option>");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectSubjectByMajorIdController.do", 
			"data":({majorId:$("#major").val(),collegeId:$("#college").val(),subjectType:$("#subjectType").val()}),
			"success":function(result){
				$("#subject").show();
				$("#majorButton").show();
				$("#subject").empty().append("<option>과목 선택</option>");
				$.each(result,function(){
					$("#subject").append($("<option value="+this.subjectId+">").append(this.subjectName));
				})
			}
		})//end of ajax
		};
	});//end of major
	 $("#minorButton").on("click",function(){
		if($("#time").val() == '시간표 선택'){
			alert("시간표를 선택해주세요");
		}else{
			$.ajax({
				"url":"${initParam.rootPath }/admin/selectSubjectInfoBySubjectTimeController.do", 
				"data":({subjectTime:$("#time").val(),subjectType:$("#subjectType").val()}),
				"success":function(result){
					var txt = "";
					$.each(result,function(){
					txt += "<tr><td align='center'>"+this.subjectId+"</td><td align='center'>"+this.subjectName+"</td><td align='center'>"+this.subjectTime+"</td><td align='center'>"+this.subjectType+"</td><td align='center'>"+this.subjectCredit+"</td><td align='center'>"
							+this.subjectCapacity+"</td><td align='center'>"+this.subjectRequest+"</td><td align='center'>"+this.subjectGrade+"</td><td align='center'>"+this.subjectClass+"</td><td align='center'>"+this.subjectCloseClass+"</td><td align='center'>"+this.subjectSemester+"</td><td align='center'>"
							+"</td><td align='center'>"+(this.building == null?"":this.building.buildingName)+"</td><td align='center'>"+(this.room == null?"":this.room.roomName)+"</td><td align='center'><button onclick='update_minor_subject("+this.subjectId+")'>수정</button></td><td align='center'><button onclick='delete_subject("+this.subjectId+")'>삭제</button></td></tr>"
					})
					$("#tbody").html(txt);
					$("#selectSubject").show();			
				}
			})//end of ajax
		}
	})//end of time 
	$("#majorButton").on("click",function(){
		if($("#subject").val() == "과목 선택"){
			alert("과목을 선택하세요");
		}else{
		$.ajax({
			"url":"${initParam.rootPath }/admin/selectSubjectInfoBySubjectNameController.do",
			"data":"subjectId="+$("#subject").val(),
			"success":function(result){
					var txt = "";
						txt += "<tr><td align='center'>"+result.subjectId+"</td><td align='center'>"+result.subjectName+"</td><td align='center'>"+result.subjectTime+"</td><td align='center'>"+result.subjectType+"</td><td align='center'>"+result.subjectCredit+"</td><td align='center'>"
								+result.subjectCapacity+"</td><td align='center'>"+result.subjectRequest+"</td><td align='center'>"+result.subjectGrade+"</td><td align='center'>"+result.subjectClass+"</td><td align='center'>"+result.subjectCloseClass+"</td><td align='center'>"+result.subjectSemester+"</td><td align='center'>"
								+(result.major == null?"":result.major.majorName)+"</td><td align='center'>"+(result.building == null?"":result.building.buildingName)+"</td><td align='center'>"+(result.room == null?"":result.room.roomName)+"</td><td align='center'><button onclick='update_subject("+result.subjectId+")'>수정</button></td><td align='center'><button onclick='delete_subject("+result.subjectId+")'>삭제</button></td></tr>"
					$("#tbody").html(txt);
					$("#selectSubject").show();
			}
		})//end of ajax
		}
	});//end of majorButton
	
});
</script>
</head>
<body>
	<h2>과목 조회</h2>
	<c:if test="${sessionScope.subinsertMessage != null}">
		<script type="text/javascript">
			alert("등록되었습니다");
		</script>
		<% session.removeAttribute("subinsertMessage"); %>
</c:if>
<c:if test="${sessionScope.subupdateMessage != null}">
		<script type="text/javascript">
			alert("수정되었습니다");
		</script>
		<% session.removeAttribute("subupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.subdeleteMessage != null}">
		<script type="text/javascript">
			alert("삭제되었습니다");
		</script>
		<% session.removeAttribute("subdeleteMessage"); %>
</c:if>
	<hr>
	<select name="subjectType" id="subjectType">
		이수구분 선택:<option>이수 구분 선택</option>
		<c:forEach var="list" items="${requestScope.list }">
			<option value=${list }>${list }</option>
		</c:forEach>
	</select>
	
	<select id="college">
	<option>단과 대학 선택</option>
	</select>
	
	<select id="major">
	<option>학과 선택</option>
	</select>
	
	<select id="subject">
	<option>과목 선택</option>
	</select>
	
	<select id="time">
	<option>시간표 선택</option>
	</select>
	
	
	<button id="majorButton">조회</button>
	<button id="minorButton">조회</button><br><br>
	
	<table id="selectSubject" border="1">
		<thead>
			<tr class="filters">
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="과목ID" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="과목이름" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="강의시간" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="이수구분" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학점" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="정원" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="신청인원" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학년" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="분반" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="폐강여부" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학기" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="학과" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="강의동" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="강의실" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="수정" disabled></th>
				<th align="center" bgcolor="peru"><input type="text" class="form-control" placeholder="삭제" disabled" disabled></th>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<br>	
	<center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인 화면으로 가기</button></center>
</body>