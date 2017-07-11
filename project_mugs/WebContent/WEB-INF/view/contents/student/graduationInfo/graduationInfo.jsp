<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//$("#table").hide(); 
			$("#submitBtn").on("click",function(){
				$.ajax({
					type:"POST",
					url:"${initParam.rootPath}/student/graduationInfo.do",
					data:{"majorId":$("#majorId").val(),
						  "year":$("#year").val(),
						  "usersId":$("#usersId").val(),
						  "semester":$("#semester").val()},
					dataType:"JSON",
					success:function(jsonData){
						$("#eduVit+td").text(jsonData.gradCredit.gradVitalEduCredit);
						$("#eduSel+td").text(jsonData.gradCredit.gradSelectEduCredit);
						$("#mjrVit+td").text(jsonData.gradCredit.gradVitalMajorCredit);
						$("#mjrSel+td").text(jsonData.gradCredit.gradSelectMajorCredit);
						var gradExam = (jsonData.gradExamPass=='n')?'재시험':'통과';
						$("#gradExam").text(gradExam);
						var eduVitAc = 0; //교양필수 이수학점
						var eduSelAc = 0; //교양선택 이수학점
						var mjrVitAc = 0; //전공필수 이수학점
						var mjrSelAc = 0; //전공선택 이수학점
						
							$.each(jsonData.credits, function(idx){								
									if(this.subject.subjectType=='교양필수'){
									   	eduVitAc += this.creditAcquire;
									}						
									if(this.subject.subjectType=='교양선택'){
										eduSelAc += this.creditAcquire;
									}
									if(this.subject.subjectType=='전공필수'){
										mjrVitAc += this.creditAcquire;
									}
									if(this.subject.subjectType=='전공선택'){
										mjrSelAc += this.creditAcquire;
									} 							
							})//end of each
							$("#eduSelAc").text(eduSelAc);
							$("#eduVitAc").text(eduVitAc);
							$("#mjrSelAc").text(mjrSelAc);
							$("#mjrVitAc").text(mjrVitAc);
							
							var eduVitCre = jsonData.gradCredit.gradVitalEduCredit;
							var eduSelCre = jsonData.gradCredit.gradSelectEduCredit;
							var mjrVitCre = jsonData.gradCredit.gradVitalMajorCredit;
							var mjrSelCre = jsonData.gradCredit.gradSelectMajorCredit;
							
							$("#eduVitNeed").text(eduVitCre-eduVitAc);
							$("#eduSelNeed").text(eduSelCre-eduSelAc);
							$("#mjrVitNeed").text(mjrVitCre-mjrVitAc);
							$("#mjrSelNeed").text(mjrSelCre-mjrSelAc);
							
								//필요학점이 0보다 작으면 0으로 바꾼다.
								if($("#eduVitNeed").text()<0){
									$("#eduVitNeed").text(0);
								};
								if($("#eduSelNeed").text()<0){
									$("#eduSelNeed").text(0);
								};
								if($("#mjrVitNeed").text()<0){
									$("#mjrVitNeed").text(0);
								}; 
								if($("#mjrSelNeed").text()<0){
									$("#mjrSelNeed").text(0);
								};
								
								//모든 조건 비교
								if($("#eduVitNeed").text()==0 &&
								   $("#eduSelNeed").text()==0 &&
								   $("#mjrVitNeed").text()==0 &&
								   $("#mjrSelNeed").text()==0 &&
								   $("#gradExam").text()=='y'
								){
								   $("#gradPass").text('Y');
								}else{
								   $("#gradPass").text('N');
								}
					}//end of success 
				})//end of ajax
			})//end of onclick
		});//end of document
	 

</script>
<body>
	
	<%-- 이수학점
	<c:forEach var="i" items="${requestScope.map.credits}">		
	${i.creditAcquire}
	</c:forEach>
	
	졸업기준학점
	${requestScope.map.gradCredit.gradVitalEduCredit}
	${requestScope.map.gradCredit.gradSelectEduCredit}
	${requestScope.map.gradCredit.gradVitalMajorCredit}
	${requestScope.map.gradCredit.gradSelectMajorCredit}
	
	졸업학점충족여부
	${requestScope.map.gradExamPass} --%>   
	
<table id="table" border="1" height="12px">	
	<thead id="thead">
		<tr>
			<td colspan="2" align="center">구분</td> 
			<td>기준학점</td>
			<td>이수학점</td>
			<td>필요학점</td>
			<td rowsapn="5">졸업시험<br>패스여부</td>
			<td rowsapn="5">졸업가능<br>여부</td>
		<tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="2">교양</td> 
			<td id="eduVit">교양필수</td>
			<td></td><!-- 기준학점 -->
			<td id="eduVitAc"></td><!-- 이수학점 -->
			<td id="eduVitNeed"></td>
			<td rowspan="4" id="gradExam"></td>
			<td rowspan="4" id="gradPass"></td> 		
		</tr>
		<tr>
			<td id="eduSel">교양선택</td>
			<td></td>
			<td id="eduSelAc"></td>
			<td id="eduSelNeed"></td> 
		</tr>
		<tr>
			<td rowspan="2">전공</td>
			<td id="mjrVit">전공필수</td>
			<td></td>
			<td id="mjrVitAc"></td>
			<td id="mjrVitNeed"></td>
		</tr>
		<tr>
			<td id="mjrSel">전공선택</td>
			<td></td>
			<td id="mjrSelAc"></td>			
			<td id="mjrSelNeed"></td>
		</tr>
	</tbody>
	<%-- 	
		시큐리티 추가 후
		value에 로그인된 학생의 id로 학점에 조인 후
		학생 id, 연도, 학기정보를 넣어줘야 한다.
															  
	--%>
	<input type="button" id="submitBtn" value="조회">
	<input type="hidden" id="year" value="2015"> 
	<input type="hidden" id="majorId" value="1">
	<input type="hidden" id="usersId" value="4">
	<input type="hidden" id="semester" value="1">
</table>
</body>
</html>