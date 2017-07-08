<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#wholeTimeThead").hide(); 
$("#first_category").on("change", function(){
	var idx = this.selectedIndex;	
	$.ajax({
		type:"POST",
		url:"${initParam.rootPath}/student/getMajorLists.do",
		data:{"collegeId":$("#first_category").val()},
		dataType:"JSON",
		beforeSend:function(){
			if(idx==0){
				$("#second_category").empty().append("<option>학과</option>");
				$("#third_category").empty().append("<option>이수구분</option>");
				$("#wholeTimeThead").hide();
				$("#wholeTimeTbody").empty();				
				return false;
			}
		},
		"success":function(jsonData){
			$("#third_category").empty().append("<option>이수구분</option>");
			$("#wholeTimeThead").hide();
			$("#wholeTimeTbody").empty();			
			//학과 추가
			var str = "<option>학과</option>";
			$.each(jsonData, function(){
				str = str+"<option value='"+this.majorId+"'>"+this.majorName+"</option>";
			});			
			$("#second_category").html(str);
			}//success
		});//ajax
	});//onchange
	
	// 학과선택시 이수구분 조회
	$("#second_category").on("change", function(){
		$.ajax({
			type:"POST",
			url:"${initParam.rootPath}/student/getSubjectTypeList.do",
			data:{"majorId":$("#second_category").val()},
			dataType:"JSON",
			beforeSend:function(){
				if($("#second_category option").index($("#second_category option:selected"))==0){
					alert("학과를 선택하세요");
					$("#third_category").empty().append("<option>이수구분</option>");
					$("#wholeTimeThead").hide();
					$("#wholeTimeTbody").empty();
					return false;
				}
			},
			success:function(jsonData){
				$("#wholeTimeThead").hide();
				$("#wholeTimeTbody").empty();
				//이수구분 추가
				var str = "<option>이수구분</option>";
				$.each(jsonData, function(){					
					var subType;
						subType = this;
					str = str +"<option value='"+subType+"'>"+subType+"</option>";
				});
				
				$("#third_category").html(str);
			},
			error:function(){
				alert("조회할 데이터가 없습니다");
			}
		});//ajax
	});//on change
	
	
	$("#third_category").on("change", function(){
		$.ajax({
			type:"POST", 
			url:"${initParam.rootPath}/student/getSubjectBySubjectType.do",
			data:{"majorId":$("#second_category").val(),"subjectType":$("#third_category").val()},
			dataType:"JSON",
			beforeSend:function(){
				if($("#third_category option").index($("#third_category option:selected"))==0){
					alert("이수구분 선택하세요");
					$("#wholeTimeThead").hide();
					$("#wholeTimeTbody").empty();
				}
			},
			success:function(jsonData){

				//tbody 구성
				var trs = "";				
					for(var i = 0; i<jsonData[0].length;i++){
					trs = trs+"<tr><td>"+jsonData[0][i].subjectType
					 +"</td><td>"+jsonData[0][i].subjectId
					 +"</td><td>"+jsonData[0][i].subjectName
					 +"</td><td>"+jsonData[0][i].subjectCredit
					 +"</td><td>"+jsonData[0][i].subjectGrade
					 +"</td><td>"+jsonData[0][i].subjectClass
					 +"</td><td>"+jsonData[0][i].subjectCapacity
					 +"</td><td>"+jsonData[0][i].subjectTime
					 +"</td><td>"+jsonData[2][i] 
					 +" </td><td>"+jsonData[1][i]+"</td></tr>";
					}//end of for				
			    $("#wholeTimeTbody").html(trs);
			    $("#wholeTimeThead").show();
								
			},

		});//end of .ajax
	});//on.change
	
});//document

</script>
</head>
<body>

<%--
	단과 대학 조회 select 
 --%>

<select name="collegeName" id="first_category" >
<option>단과대학</option>
	<c:forEach var="i" items="${requestScope.list}">
		<option value="${i.collegeId}">${i.collegeName}</option>
	</c:forEach>
</select>
<%-- -------------------------------------------- 
	학과 select 
------------------------------------------------- --%>

<select id="second_category">
	<option>학과</option>
</select>

<%-- -------------------------------------------- 
	이수구분
------------------------------------------------- --%>

<select id="third_category">
	<option>이수구분</option>
</select>

<%--
	과목조회 Table
 --%>
<table id="wholeTimeTable" border="1" height="12px"> 
	<thead id="wholeTimeThead">
		<tr>
			<th>이수구분</th>
			<th>과목코드</th>
			<th>과목명</th>
			<th>학점</th>
			<th>학년제한</th>
			<th>분반여부</th>
			<th>제한인원</th>
			<th>요일/교시</th>
			<th>강의실</th>	
			<th>교수명</th>
		</tr>
	</thead>
	<tbody id="wholeTimeTbody">
	
	</tbody>

</table>
</body>
</html>