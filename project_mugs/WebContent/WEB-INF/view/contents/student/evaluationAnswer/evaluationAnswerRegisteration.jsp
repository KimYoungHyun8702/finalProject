<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table{
	width:700px;
	border-collapse: collapse;
}
td{
	padding: 5px;
	text-align:center;
}
th, input{
	text-align:center;
}
h3{
	font-family:돋움체;
}
</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#back").on("click", function(){
		alert("아직 응답하지 않은 설문항목이 있습니다. 메인페이지로 이동 후, 설문에 다시 응하여 주시기 바랍니다.");
		return false;
	});
});

$(document).ready(function(){

	$("#submit").on("click", function(){
		if(!($('.tp').is(":checked"))) {
			alert("남은 설문항목에 응답하여 주십시오.");
			return false;
		}
		if(!($('.ep').is(":checked"))) {
			alert("남은 설문항목에 응답하여 주십시오.");
			return false;
		}
		if(!($('.rp').is(":checked"))) {
			alert("남은 설문항목에 응답하여 주십시오.");
			return false;
		}
		if(!($('.pp').is(":checked"))) {
			alert("남은 설문항목에 응답하여 주십시오.");
			return false;
		}
		if(!($('.qp').is(":checked"))) {
			alert("남은 설문항목에 응답하여 주십시오.");
			return false;
		}
	});
});
</script>
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>

<form action="${initParam.rootPath }/student/addEvaluationAnswerValue.do">
 <h3>설문응답평가 및 등록</h3>
    <hr style="border: solid px black;">

    <div class="panel panel-primary filterable">

	<table class="table">
	<thead id="thead">
		<tr class="filters">
			 <th width="70px"><input type="text" class="form-control" placeholder="설문&평가 번호" disabled></th>
			 <th width="150px"><input type="text" class="form-control" placeholder="설문&평가 내용" disabled></th>
			 <th width="100px"><input type="text" class="form-control" placeholder="평가점수" disabled></th>
		</tr>
	</thead>
		<input type="hidden" value="<%=request.getParameter("nowYear")%>" name="nowYear">
		<input type="hidden" value="<%=request.getParameter("nowSemester")%>" name="nowSemester">
		<input type="hidden" value="<%=request.getParameter("loginId")%>" name="loginId">
		<input type="hidden" value="<%=request.getParameter("subjectId")%>" name="subjectId">
		<input type="hidden" value="<%=request.getParameter("proId")%>" name="proId"> <!--  값들 담음. --> 
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>평가.과제 질문</td>
				<td>
					<label>1<input type="radio" name="evaluationTaskPoint" value="1" class="tp"></label>
					<label>2<input type="radio" name="evaluationTaskPoint" value="2" class="tp"></label>
					<label>3<input type="radio" name="evaluationTaskPoint" value="3" class="tp"></label>
					<label>4<input type="radio" name="evaluationTaskPoint" value="4" class="tp"></label>
					<label>5<input type="radio" name="evaluationTaskPoint" value="5" class="tp"></label>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>평가.시험 질문</td>
				<td>
					<label>1<input type="radio" name="evaluationExamPoint" value="1" class="ep"></label>
					<label>2<input type="radio" name="evaluationExamPoint" value="2" class="ep"></label>
					<label>3<input type="radio" name="evaluationExamPoint" value="3" class="ep"></label>
					<label>4<input type="radio" name="evaluationExamPoint" value="4" class="ep"></label>
					<label>5<input type="radio" name="evaluationExamPoint" value="5" class="ep"></label>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>평가.수업준비도 질문</td>
				<td>
					<label>1<input type="radio" name="evaluationReadyPoint" value="1" class="rp"></label>
					<label>2<input type="radio" name="evaluationReadyPoint" value="2" class="rp"></label>
					<label>3<input type="radio" name="evaluationReadyPoint" value="3" class="rp"></label>
					<label>4<input type="radio" name="evaluationReadyPoint" value="4" class="rp"></label>
					<label>5<input type="radio" name="evaluationReadyPoint" value="5" class="rp"></label>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>평가.수업열정도 질문</td>
				<td>
					<label>1<input type="radio" name="evaluationPassionPoint" value="1" class="pp"></label>
					<label>2<input type="radio" name="evaluationPassionPoint" value="2" class="pp"></label>
					<label>3<input type="radio" name="evaluationPassionPoint" value="3" class="pp"></label>
					<label>4<input type="radio" name="evaluationPassionPoint" value="4" class="pp"></label>
					<label>5<input type="radio" name="evaluationPassionPoint" value="5" class="pp"></label>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>평가.질의 질문</td>
				<td>
					<label>1<input type="radio" name="evaluationQuestionPoint" value="1" class="qp"></label>
					<label>2<input type="radio" name="evaluationQuestionPoint" value="2" class="qp"></label>
					<label>3<input type="radio" name="evaluationQuestionPoint" value="3" class="qp"></label>
					<label>4<input type="radio" name="evaluationQuestionPoint" value="4" class="qp"></label>
					<label>5<input type="radio" name="evaluationQuestionPoint" value="5" class="qp"></label>
				</td>
			</tr>
		</tbody>
		
</table>
</div>
<center><input type="submit" value="제출" id="submit"/><br><br></center>
<center><button onclick="location.href='${initParam.rootPath }/'" id="back" type="button" class="btn btn-primary">메인페이지로</button></center>
<sec:csrfInput/><%-- csrf 토큰 --%>	
</form>
</body>
</html>