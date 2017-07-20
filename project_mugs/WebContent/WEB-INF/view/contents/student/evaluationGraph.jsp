<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/jquery.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.canvasAxisTickRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.rootPath }/resource/jqplot/jquery.jqplot.css"/>
<!-- 축의 데이터의 Label Option을 설정 -->  
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.canvasAxisLabelRenderer.js"></script>  
<!-- Legend(Line에대한 간단한 범례)의 Option을 설정 -->  
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.enhancedLegendRenderer.js"></script>  
<!-- 축의 데이터를 순서에 상관없이 자동정렬을 설정 -->  
<script type="text/javascript" src="${initParam.rootPath }/resource/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#subjectTypeList").change(function() {
      var txt = "<option>선택하세요.</option>"
      $("#subjectThead").empty();
      $("#subjectTbody").empty();
      $("#majorList").html(txt);
      $("#collegeList").html(txt);
      $("#chart").hide();
      var index = $("#subjectTypeList option").index($("#subjectTypeList option:selected"));
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraphCollegeList.do",
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
               $("#chart").hide();
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
               var subjectThead = "<th><input style='width:60px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='그래프' disabled></th>";$.each(map.professorSubjectList, function(){
                  subjectTbody += "<tr><td>" + this.subject.subjectGrade +
                           "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
                           "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
                           "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
                           "</td><td>" + this.building.buildingName + "/" + this.room.roomName + "</td><td>" + majorIdTxt + "</td>" + 
                           "<td>" + "<button id=" + "evaluationGraphSee>" + "평가그래프 보기</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
                           "<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
               });
               $("#subjectThead").html(subjectThead);
               $("#subjectTbody").html(subjectTbody);
            }
         },
      });
   });
   
   $("#collegeList").change(function() {
      var index = $("#collegeList option").index($("#collegeList option:selected"));
      var txt = "<option>선택하세요.</option>"
      $("#majorList").html(txt);
      $("#subjectThead").empty();
      $("#subjectTbody").empty();
      $("#chart").hide();
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraphMajorListByCollegeId.do",
         "type":"post",
         "data":{"collegeId":$("#collegeList").val(), ${_csrf.parameterName}:'${_csrf.token}'},
         "dataType":"json",
         "beforeSend":function() {
            if(index == 0) {
               alert("단과대학을 선택하세요.");
               $("#majorList").html(txt);
               $("#subjectThead").empty();
               $("#subjectTbody").empty();
               $("#chart").hide();
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
   
   $(document).on("change", "#collegeList", function() {
      var index = $("#collegeList option").index($("#collegeList option:selected"));
      var txt = "<option>선택하세요.</option>"
      $("#majorList").html(txt);
      $("#subjectThead").empty();
      $("#subjectTbody").empty();
      $("#chart").hide();
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraphMajorListByCollegeId.do",
         "type":"post",
         "data":{"collegeId":$("#collegeList").val(), ${_csrf.parameterName}:'${_csrf.token}'},
         "dataType":"json",
         "beforeSend":function() {
            if(index == 0) {
               alert("단과대학을 선택하세요.");
               $("#majorList").html(txt);
               $("#subjectThead").empty();
               $("#subjectTbody").empty();
               $("#chart").hide();
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
   
   $("#majorList").change(function() {
      var index = $("#majorList option").index($("#majorList option:selected"));
      var txt = "<option>선택하세요.</option>"
      $("#subjectThead").empty();
      $("#subjectTbody").empty();
      $("#chart").hide();
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraphSubjectListByJoin.do",
         "type":"post",
         "dataType":"json",
         "data":({majorId:$("#majorList").val(), subjectType:$("#subjectTypeList").val(), ${_csrf.parameterName}:'${_csrf.token}'}),
         "beforeSend":function() {
            if(index == 0) {
               alert("학과를 선택하세요.");
               $("#majorList").html(txt);
               $("#subjectThead").empty();
               $("#subjectTbody").empty();
               $("#chart").hide();
               return false;
            }
         },
         "success":function(map) {
            var subjectTbody = "";
            var subjectThead = "<th><input style='width:60px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='그래프' disabled></th>";$.each(map.professorSubjectList, function(){
               subjectTbody += "<tr><td>" + this.subject.subjectGrade +
                        "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
                        "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
                        "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
                        "</td><td>" + this.building.buildingName + "/" + this.room.roomName + "</td><td>" + this.subject.major.majorName + "</td>" +
                        "<td>" + "<button id=" + "evaluationGraphSee>" + "평가그래프 보기</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
                        "<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
            });
            $("#subjectThead").html(subjectThead);
            $("#subjectTbody").html(subjectTbody);
         },
      });
   });
   
   $(document).on("change", "#majorList", function() {
      var index = $("#majorList option").index($("#majorList option:selected"));
      $("#subjectThead").empty();
      $("#subjectTbody").empty();
      $("#chart").hide();
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraphSubjectListByJoin.do",
         "type":"post",
         "dataType":"json",
         "data":({majorId:$("#majorList").val(), subjectType:$("#subjectTypeList").val(), ${_csrf.parameterName}:'${_csrf.token}'}),
         "beforeSend":function() {
            if(index == 0) {
               alert("학과를 선택하세요.");
               $("#subjectThead").empty();
               $("#subjectTbody").empty();
               $("#chart").hide();
               return false;
            }
         },
         "success":function(map) {
            var subjectTbody = "";
            var subjectThead = "<th><input style='width:60px' type='text' class='form-control' placeholder='학년' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='이수구분' disabled></th><th><input style='width:70px' type='text' class='form-control' placeholder='분반' disabled></th><th><input style='width:130px' type='text' class='form-control' placeholder='과목명' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='담당교수' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='정원' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='신청인원' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='여석' disabled></th><th><input style='width:60px' type='text' class='form-control' placeholder='학점' disabled></th><th><input style='width:120px' type='text' class='form-control' placeholder='강의시간' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='강의실' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='학과' disabled></th><th><input style='width:90px' type='text' class='form-control' placeholder='그래프' disabled></th>";$.each(map.professorSubjectList, function(){
               subjectTbody += "<tr><td>" + this.subject.subjectGrade +
                        "</td><td>" + this.subject.subjectType + "</td><td>" + this.subject.subjectClass + "</td><td>" + this.subject.subjectName + 
                        "</td><td>" + this.professor.usersName + "</td><td>" + this.subject.subjectCapacity + "</td><td>" + this.subject.subjectRequest + 
                        "</td><td>" + this.subject.remainNum + "</td><td>" + this.subject.subjectCredit + "</td><td>" + this.subject.subjectTime + 
                        "</td><td>" + this.building.buildingName + "/" + this.room.roomName + "</td><td>" + this.subject.major.majorName + "</td>" +
                        "<td>" + "<button id=" + "evaluationGraphSee>" + "평가그래프 보기</button>" + "<input type='hidden' value=" + this.subjectId + ">" + 
                        "<input type='hidden' value=" + this.proId + ">" + "</td></tr>";
            });
            $("#subjectThead").html(subjectThead);
            $("#subjectTbody").html(subjectTbody);
         },
      });
   });
   
   $(document).on("click", "#evaluationGraphSee", function() {
      $.ajax({
         "url":"/project_mugs/student/getEvaluationGraph.do",
         "type":"post",
         "data":({proId:$(this).next().next().val(), subjectId:$(this).next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
         "dataType":"json",
         "beforeSend":function() {
            
         },
         "success":function(map) {
            if(map.msg) {
               alert(map.msg);
               $("#chart").hide();
            } else {
               var readyAvg = parseFloat(map.readyAvg);
               var passionAvg = parseFloat(map.passionAvg);
               var questionAvg = parseFloat(map.questionAvg);
               var taskAvg = parseFloat(map.taskAvg);
               var examAvg = parseFloat(map.examAvg);
               var line = [['수업준비도', readyAvg], ['수업열정도', passionAvg], ['질의응답', questionAvg], ['과제', taskAvg], ['시험', examAvg]];
               jQuery("#chart").jqplot([line], {
			          title:"수업 평가그래프",
			       	 seriesColors:['#FFCCE5', '#00749F', '#73C774', '#C7754C', '#17BDB8']
			        ,seriesDefaults:{
			            renderer:jQuery.jqplot.BarRenderer
			            , rendererOptions:{
			                varyBarColor:true ,
			                barWidth : 35                    // 막대그래프의 넓이를 지정
		                    , barPadding : -15                // 막대그래프의 여백을 지정
		                    , highlightMouseOver : false    // 막대그래프의 클릭여부를 지정 (기본값 : true)
			            }
			        },
			    	series:[
			        {
			            pointLabels:{
			                show:true,
			                labels:[readyAvg, passionAvg, questionAvg, taskAvg, examAvg],
			            },
			        }
			    	],
			        axes:{
			            xaxis:{
			                  renderer:jQuery.jqplot.CategoryAxisRenderer
			            },
			        	yaxis:{  
			        		numberTicks : 7,
			        		min:0,
			        		max:6,
			        		tickOptions:{
			        			formatString : '%.1f'
			             	}
			        	}
			        }
			    });
                $("#chart").show();
            }
         },
      });
   });
});
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
   text-align:center;
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
   font-family:돋움체;
}
</style>
</head>
<body>
<h2>평가 그래프</h2><br>

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
<center><table border="2" style="border-color: black">
   <thead id="subjectThead"></thead>
   <tbody id="subjectTbody"></tbody>
</table></center>
<hr>
<center><div id="chart" style="width:100%;height:400px;"></div></center>
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
</html>