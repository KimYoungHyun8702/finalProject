<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
      <script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
    <link href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.min.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/creative.css" rel="stylesheet"> 
    <link href="${initParam.rootPath }/resource/bootstrap/css/_bootstrap.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/simple-sidebar.css" rel="stylesheet">
    <link href="${initParam.rootPath }/resource/bootstrap/css/style.css" rel="stylesheet"> 
 
 
<style type="text/css">

input{
	text-align:center;
}
table{
	width:100%;
	
}
th {
	bgcolor:peru;
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
.form-controler {
	color:black;
}
h3{
	font-family:굴림체;
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
<br>

   <table border="2" style="border-color: black">
   <thead id="thead">
      <tr>
          <th width="70px"><input type="text" class="form-control" placeholder="설문&평가 번호" disabled></th>
          <th width="150px"><input type="text" class="form-control" placeholder="설문&평가 내용" disabled></th>
          <th width="100px"><input type="text" class="form-control" placeholder="평가점수" disabled></th>
      </tr>
   </thead>
      <input type="hidden" value="<%=request.getParameter("nowYear")%>" name="nowYear">
      <input type="hidden" value="<%=request.getParameter("nowSemester")%>" name="nowSemester">
      <input type="hidden" value="<%=request.getParameter("subjectId")%>" name="subjectId">
      <input type="hidden" value="<%=request.getParameter("proId")%>" name="proId"> <!--  값들 담음. --> 
      <tbody id="tbody">
         <tr style="text-align:center">
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
         <tr style="text-align:center">
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
         <tr style="text-align:center">
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
         <tr style="text-align:center">
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
         <tr style="text-align:center">
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
      
</table><br>
<center><input type="submit" value="제출" id="submit"/></center><br>
<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
<sec:csrfInput/><%-- csrf 토큰 --%>   
</form>
</body>
</html>