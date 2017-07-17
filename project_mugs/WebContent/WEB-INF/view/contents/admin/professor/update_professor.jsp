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
   if($("#usersId").val() == "" || $("#usersId").val().trim() == 0 ){
      alert("교수 번호를 입력하세요");
      return false;
   }else if($("#usersName").val() == "" || $("#usersName").val().trim() == 0 ){
      alert("이름을 입력하세요")
      return false;
   }else if($("#usersEngName").val() == "" || $("#usersEngName").val().trim() == 0){
      alert("영어 이름을 입력하세요")
      return false;
   }else if($("#usersRRN").val() == "" || $("#usersRRN").val().trim() == 0){
      alert("주민번호를 입력하세요")
      return false;
   }else if($("#usersEmail").val() == "" || $("#usersEmail").val().trim() == 0){
      alert("이메일을 입력하세요")
      return false;
   }else if($("#usersPhoneNum").val() == "" || $("#usersPhoneNum").val().trim() == 0){
      alert("집 전화번호를 입력하세요")
      return false;
   }else if($("#usersCellNum").val() == "" || $("#usersCellNum").val().trim() == 0){
      alert("핸드폰 번호를 입력하세요")
      return false;
   }else if($("#usersNational").val() == "국적" ){
      alert("국적를 입력하세요")
      return false;
   }else if($("#usersCurrentAddr").val() == "" || $("#usersCurrentAddr").val().trim() == 0){
      alert("현 거주지 주소를 입력하세요")
      return false;
   }else if($("#usersBornAddr").val() == "" || $("#usersBornAddr").val().trim() == 0){
      alert("본적지 주소를 입력하세요")
      return false;
   }else if($("#proUniversity").val() == "" || $("#proUniversity").val().trim() == 0){
      alert("졸업 대학을 입력하세요")
      return false;
   }else if($("#proGradSchool").val() == "" || $("#proGradSchool").val().trim() == 0){
      alert("졸업 대학원을 입력하세요")
      return false;
   }else if($("#majorId").val() == "학과 선택"){
      alert("학과를 선택하세요");
      return false;
   }else if($("#proRoomOfficeId").val() == "교수실 선택"){
      alert("교수실을 선택하세요");
      return false;
   }else if($("#proRoomLaboratoryId").val() == "연구실 선택"){
      alert("연구실을 선택하세요");
      return false;
   }else{
      return confirm("수정하시겠습니까 ?")
   }
};
$(document).ready(function(){
   $("#office").on("change",function(){
      if($("#office").val() == "강의동 선택"){
         $("#proRoomOfficeId").empty().append("<option>교수실 선택</option>");
      }else if($("#office").val() == "없음"){
         $("#proRoomOfficeId").empty().append("<option value='0'>없음</option>");
      }else{
         $.ajax({
            "url":"${initParam.rootPath }/admin/selectRoomForProfessorController.do",
            "data":"office="+$("#office").val(),
            "success":function(result){
               $("#proRoomOfficeId").empty().append("<option>교수실 선택</option>");
               $.each(result,function(){
                  $("#proRoomOfficeId").append($("<option value="+this.roomId+">").append(this.roomName));
               })
            }
         });//end of ajax
      }//end of else
   })//end of buildingId
   $("#buildingId").on("change",function(){
      if($("#buildingId").val() == "강의동 선택"){
         $("#proRoomLaboratoryId").empty().append("<option>연구실 선택</option>");
      }else if($("#buildingId").val() == "없음"){
         $("#proRoomLaboratoryId").empty().append("<option value='0'>없음</option>");
      }else{
         $.ajax({
            "url":"${initParam.rootPath }/admin/selectRoomByReferenceController.do",
            "data":"buildingId="+$("#buildingId").val(),
            "success":function(result){
               $("#proRoomLaboratoryId").empty().append("<option>연구실 선택</option>");
               $.each(result,function(){
                  $("#proRoomLaboratoryId").append($("<option value="+this.roomId+">").append(this.roomName));
               })
            }
         });//end of ajax
      }//end of else
   })//end of buildingId
})//end of document
</script>
</head>
<body>
<h2>교수 수정</h2>
   <hr>
   <form id="insertForm" action="${initParam.rootPath }/admin/updateProfessorController.do" method="post" onsubmit="return check()">
          <table id="infoProfessor" border="1">
         <thead>
            <tr>
               <td align="center">번호</td>
               <td align="center">이름</td>
               <td align="center">영문 이름</td>
               <td align="center">주민 번호</td>
               <td align="center">이메일</td>
               <td align="center">집 전화번호</td>
            </tr>
         </thead>
         <tbody id="infoTbody1">
            <tr>
               <td align="center"><input type="number" name="usersId" id="usersId" value="${requestScope.info.usersId }" readonly/></td>
               <td align="center"><input type="text" name="usersName" id="usersName" value="${requestScope.info.usersName }"/></td>
               <td align="center"><input type="text" name="usersEngName" id="usersEngName" value="${requestScope.info.usersEngName }"/></td>
               <td align="center"><input type="text" name="usersRRN" id="usersRRN" value="${requestScope.info.usersRRN }"/></td>
               <td align="center"><input type="email" name="usersEmail" id="usersEmail" value="${requestScope.info.usersEmail }"/></td>
               <td align="center"><input type="text" name="usersPhoneNum" id="usersPhoneNum" value="${requestScope.info.usersPhoneNum }"/></td>
            </tr>
         </tbody>

         <thead>
            <tr>
               <td align="center">핸드폰 번호</td>
               <td align="center">국적</td>
               <td align="center">현 거주지 주소</td>
               <td align="center">본적지 주소</td>
               <td align="center">졸업 대학</td>
               <td align="center">졸업 대학원</td>
            </tr>
         </thead>

         <tbody id="infoTbody2">
            <tr>
               <td align="center"><input type="number" name="usersCellNum" id="usersCellNum" value="${requestScope.info.usersCellNum }"/></td>
               <td align="center"><select name="usersNational"
                  id="usersNational">
                     <option>국적</option>
                     <c:choose>
                        <c:when test="${requestScope.info.usersNational == '한국' }">
                           <option selected>한국</option>
                        </c:when>
                        <c:otherwise>
                           <option>한국</option>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test="${requestScope.info.usersNational == '중국' }">
                           <option selected>중국</option>
                        </c:when>
                        <c:otherwise>
                           <option>중국</option>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test="${requestScope.info.usersNational == '일본' }">
                           <option selected>일본</option>
                        </c:when>
                        <c:otherwise>
                           <option>일본</option>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test="${requestScope.info.usersNational == '북한' }">
                           <option selected>북한</option>
                        </c:when>
                        <c:otherwise>
                           <option>북한</option>
                        </c:otherwise>
                     </c:choose>
               </select></td>
               <td align="center"><input type="text" name="usersCurrentAddr" id="usersCurrentAddr" value="${requestScope.info.usersCurrentAddr }"/></td>
               <td align="center"><input type="text" name="usersBornAddr" id="usersBornAddr" value="${requestScope.info.usersBornAddr }"/></td>
               <td align="center"><input type="text" name="proUniversity" id="proUniversity" value="${requestScope.info.proUniversity }"/></td>
               <td align="center"><input type="number" name="proGradSchool" id="proGradSchool" value="${requestScope.info.proGradSchool }"/></td>
            </tr>
         </tbody>

         <thead>
            <tr>
               <td align="center">교수실 전화 번호</td>
               <td align="center">연구실 전화 번호</td>
               <td align="center">소속 학과</td>
               <td align="center">교수실</td>
               <td align="center">연구실</td>
            </tr>
         </thead>
         <tbody id="infoTbody3">
            <tr>
               <td align="center"><input type="text" name="proOfficePhoneNum" id="proOfficePhoneNum" value="${requestScope.info.proOfficePhoneNum }"/></td>
               <td align="center"><input type="text" name="proLaboratoryPhoneNum" id="proLaboratoryPhoneNum" value="${requestScope.info.proLaboratoryPhoneNum }"/></td>
               <td align="center"><select name="majorId" id="majorId">
                     <option>학과 선택</option>
                     <c:choose>
                        <c:when test="${requestScope.proMajor == null }">
                           <option value="0" selected>없음</option>
                        </c:when>
                        <c:otherwise>
                           <option value="0">없음</option>
                        </c:otherwise>
                     </c:choose>
                     <c:forEach var="list" items="${requestScope.majorList }">
                        <c:choose>
                           <c:when
                              test="${requestScope.proMajor.majorId == list.majorId }">
                              <option value=${list.majorId } selected>${list.majorName }</option>
                           </c:when>
                           <c:otherwise>
                              <option value=${list.majorId }>${list.majorName }</option>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
               </select></td>
               <td align="center"><select name="proRoomOfficeId"
                  id="proRoomOfficeId">
                     <c:choose>
                        <c:when test="${requestScope.office == null }">
                           <option value="0" selected>없음</option>
                        </c:when>
                        <c:otherwise>
                           <option value="0" selected>없음</option>
                        </c:otherwise>
                     </c:choose>
                           <c:forEach items="${requestScope.officeList }" var="list">
                              <c:forEach items="${list.roomList }" var="list">
                                 <c:choose>
                                    <c:when
                                       test="${requestScope.office.proRoomOfficeId == list.roomId}">
                                       <option value="${list.roomId }" selected>${list.roomName }</option>
                                    </c:when>
                                    <c:otherwise>
                                       <option value="${list.roomId }">${list.roomName }</option>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </c:forEach>
               </select></td>
               <td align="center"><select name="proRoomLaboratoryId" id="proRoomLaboratoryId">
                     <c:choose>
                        <c:when test="${requestScope.laboratory == null }">
                           <option value="0" selected>없음</option>
                        </c:when>
                        <c:otherwise>
                           <option value="0">없음</option>
                        </c:otherwise>
                     </c:choose>
                           <c:forEach items="${requestScope.laboratoryList }" var="list">
                              <c:forEach items="${list.roomList }" var="list">
                                 <c:choose>
                                    <c:when
                                       test="${requestScope.laboratory.proRoomLaboratoryId == list.roomId}">
                                       <option value="${list.roomId }" selected>${list.roomName }</option>
                                    </c:when>
                                    <c:otherwise>
                                       <option value="${list.roomId }">${list.roomName }</option>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </c:forEach>
               </select></td>
            </tr>
         </tbody>
      </table>
         <input type="text" name="usersEnable" id="usersEnable" value="${requestScope.info.usersEnable }"/>
         <input type="hidden" name="usersPassword" value="${requestScope.info.usersPassword }"/>
         <input type="submit" value="수정">
         <sec:csrfInput/>
   </form>
   <button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>