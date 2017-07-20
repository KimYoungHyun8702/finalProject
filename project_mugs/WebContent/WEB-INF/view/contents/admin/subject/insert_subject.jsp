<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input{
	text-align:center;
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
	width:150px;
	height: 30px;
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
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function check(){
   if($("#subjectName").val() == "" || $("#subjectName").val().trim() == 0 ){
      alert("과목 이름을 입력하세요");
      return false;
   }else if($("#subjectTime").val() == "" || $("#subjectTime").val().trim() == 0 ){
      alert("강의시간을 입력하세요")
      return false;
   }else if($("#subjectType").val() == "이수구분"){
      alert("이수 구분을 입력하세요")
      return false;
   }else if($("#subjectCredit").val() == "" || $("#subjectCredit").val().trim() == 0){
      alert("학점을 입력하세요")
      return false;
   }else if($("#subjectCapacity").val() == "" || $("#subjectCapacity").val().trim() == 0){
      alert("정원을 입력하세요")
      return false;
   }else if($("#subjectGrade").val() == "" || $("#subjectGrade").val().trim() == 0){
      alert("학년을 입력하세요")
      return false;
   }else if($("#subjectClass").val() == "" || $("#subjectClass").val().trim() == 0){
      alert("분반을 입력하세요")
      return false;
   }else if($("#subjectCloseClass").val() == "" || $("#subjectClass").val().trim() == 0 ){
      alert("폐강 여부를 입력하세요")
      return false;
   }else if($("#subjectSemester").val() == "" || $("#subjectSemester").val().trim() == 0){
      alert("학기를 입력하세요")
      return false;
   }else if($("#collegeId").val() == "단과대학 선택"){
      alert("단과대학을 선택하세요")
      return false;
   }else if($("#majorId").val() == "학과 선택"){
      alert("학과를 선택하세요")
      return false;
   }else if($("#buildingId").val() == "강의동 선택"){
      alert("강의동을 선택하세요")
      return false;
   }else if($("#lectureId").val() == "강의실 선택"){
      alert("강의실을 선택하세요")
      return false;
   }else{
      return confirm("등록하시겠습니까 ?")
   }
};
$(document).ready(function(){
   $("#subjectType").on("change",function(){
      if($("#subjectType").val() == "선택교양" || $("#subjectType").val() == "필수교양"){
         $("#collegeId").empty().append("<option value=0>교양</option>");
         $("#majorId").empty().append("<option value=0>교양</option>");
      }else if($("#subjectType").val() == "선택전공" || $("#subjectType").val() == "필수전공"){
         $.ajax({
            "url":"${initParam.rootPath }/admin/selectForInsertSubjectByTypeController.do",
            "success":function(result){
               $("#collegeId").empty().append("<option>단과대학 선택</option>");
               $("#majorId").empty().append("<option>학과 선택</option>");
               $.each(result,function(){
                  $("#collegeId").append($("<option value="+this.collegeId+">").append(this.collegeName));
               })
            }
         })//end of ajax
      }//end of if
   })//end of subjectType
   $("#collegeId").on("change",function(){
      if($("#collegeId").val() == "단과대학 선택"){
         $("#majorId").empty().append("<option>학과 선택</option>");
      }else if($("#collegeId").val() == "교양"){
         $("#majorId").empty().append("<option value=0>교양</option>");
      }else{
      $.ajax({
         "url":"${initParam.rootPath }/admin/selectMajorByCollegeIdController.do",
         "data":"collegeId="+$("#collegeId").val(),
         "success":function(result){
            $("#majorId").empty().append("<option>학과 선택</option>");
            $.each(result,function(){
               $("#majorId").append($("<option value="+this.majorId+">").append(this.majorName));
            })
         }
      });//end of ajax
      }//end of else
   })//end of collegeId
   $("#buildingId").on("change",function(){
      if($("#subjectTime").val() == ""){
         alert("시간을 입력하세요");
         return false;
      }else if($("#subjectSemester").val() == ""){
         alert("학기를 입력하세요");
         return false;
      }else if($("#buildingId").val() == "강의동 선택"){
         $("#lectureId").empty().append("<option>강의실 선택</option>");
         return false;
      }else if($("#buildingId").val() == "없음"){
         $("#lectureId").empty().append("<option value='0'>없음</option>");
         return false;
      }else{
         $.ajax({
            "url":"${initParam.rootPath }/admin/selectForOverlapController.do",
            "data":({subjectTime:$("#subjectTime").val(),subjectSemester:$("#subjectSemester").val(),buildingId:$("#buildingId").val()}),
            "success":function(result){
               $("#lectureId").empty().append("<option>강의실 선택</option>");
               $.each(result,function(){
                  $("#lectureId").append($("<option value="+this.roomId+">").append(this.roomName));
               })
            }
         });//end of ajax
      }//end of else
   })//end of buildingId
})//end of document
</script>
</head>
<body>
<br>
<h3>과목 등록</h3>
   <hr>
   <form id="insertForm" action="${initParam.rootPath }/admin/insertSubjectController.do" method="post" onsubmit="return check()">
   <center><table id="selectSubject" border="2" style="border-color: black">
      <thead>
         <tr>
         	<th><input type='text' class='form-control' placeholder='과목명' disabled></th>
         	<th><input type='text' class='form-control' placeholder='강의시간' disabled></th>
         	<th><input type='text' class='form-control' placeholder='이수구분' disabled></th>
         	<th><input type='text' class='form-control' placeholder='학점' disabled></th>
         	<th><input type='text' class='form-control' placeholder='정원' disabled></th>
         	<th><input type='text' class='form-control' placeholder='학년' disabled></th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td align="center"><input type="text" name="subjectName" id="subjectName"/></td>
            <td align="center"><input type="text" name="subjectTime" id="subjectTime"/></td>
            <td align="center"><select name="subjectType" id="subjectType">
                     <option>이수구분</option>
                     <option>선택전공</option>
                     <option>필수전공</option>
                     <option>선택교양</option>
                     <option>필수교양</option>
               </select></td>
            <td align="center"><input style="width:60px" type="number" name="subjectCredit" max="3" min="1" id="subjectCredit"/></td>
            <td align="center"><input type="number" name="subjectCapacity" id="subjectCapacity"/></td>
            <td align="center"><input style="width:60px" type="number" name="subjectGrade" max="4" min="1" id="subjectGrade"/></td>
         </tr>
      </tbody>
      
      <thead>
         <tr>
         	<th><input type='text' class='form-control' placeholder='분반' disabled></th>
         	<th><input type='text' class='form-control' placeholder='폐강여부' disabled></th>
         	<th><input type='text' class='form-control' placeholder='학기' disabled></th>
         	<th><input type='text' class='form-control' placeholder='학과' disabled></th>
         	<th><input type='text' class='form-control' placeholder='강의실' disabled></th>
         </tr>
      </thead>
      <tbody id="tbody">
         <tr>
            <td align="center"><input type="text" name="subjectClass" id="subjectClass"/></td>
            <td align="center"><input type="text" name="subjectCloseClass" id="subjectCloseClass"/></td>
            <td align="center"><input type="text" name="subjectSemester" id="subjectSemester"/></td>
            <td align="center"><select name="collegeId" id="collegeId">
                     <option>단과대학 선택</option>
                     <c:forEach var="list" items="${requestScope.college }">
                        <option value=${list.collegeId }>${list.collegeName }</option>
                     </c:forEach>
               </select> <select name="majorId" id="majorId">
                     <option>학과 선택</option>
               </select></td>
            <td align="center"> <select name="buildingId" id="buildingId">
                     <option>강의동 선택</option>
                     <option>없음</option>
                     <c:forEach var="list" items="${requestScope.building }">
                        <option value=${list.buildingId }>${list.buildingName }</option>
                     </c:forEach>
               </select> <select name="lectureId" id="lectureId">
                     <option>강의실 선택</option>
               </select></td>
         </tr>
      </tbody>
   </table></center><br>
            <input type="hidden" name="subjectRequest" value="0"/>
            <center><input id="submit" type="submit" value="등록"></center>
         <sec:csrfInput/>
   </form><br>
   <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" class="btn btn-primary">메인화면으로 가기</button></center>
</body>