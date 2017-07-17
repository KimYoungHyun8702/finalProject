<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2>과목 등록</h2>
   <hr>
   <form id="insertForm" action="${initParam.rootPath }/admin/insertSubjectController.do" method="post" onsubmit="return check()">
    <table id="selectSubject" border="1">
      <thead>
         <tr>
            <td align="center">과목 이름</td>
            <td align="center">강의 시간</td>
            <td align="center">이수 구분</td>
            <td align="center">학점</td>
            <td align="center">정원</td>
            <td align="center">학년</td>
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
            <td align="center"><input type="number" name="subjectCredit" max="3" min="1" id="subjectCredit"/></td>
            <td align="center"><input type="number" name="subjectCapacity" id="subjectCapacity"/></td>
            <td align="center"><input type="number" name="subjectGrade" max="4" min="1" id="subjectGrade"/></td>
         </tr>
      </tbody>
      
      <thead>
         <tr>
            <td align="center">분반</td>
            <td align="center">폐강 여부</td>
            <td align="center">학기</td>
            <td align="center">학과</td>
            <td align="center">강의실</td>
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
   </table>
            <input type="hidden" name="subjectRequest" value="0"/>
            <input id="submit" type="submit" value="등록">
         <sec:csrfInput/>
   </form>
   <button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>