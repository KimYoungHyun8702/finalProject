<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
   width:95px;
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
<script type="text/javascript">
$(document).ready(function(){
   $("#wholeTimeThead").hide();
   
   $("#zero_category").on("change",function(){
      var idx = this.selectedIndex;
      $.ajax({
      type : "get",
      url : "${initParam.rootPath}/student/getCollegeNameAndId.do",
      dataType :"json", 
      beforeSend:function(){
         if(idx==0){
            $("#first_category").empty().append("<option>단과대학</option>");
            $("#second_category").empty().append("<option>학과</option>");
            $("#third_category").empty().append("<option>이수구분</option>");
            $("#wholeTimeThead").hide();
            $("#wholeTimeTbody").empty();            
            return false;
         }
      },
      "success":function(jsonData){
         $("#second_category").empty().append("<option>학과</option>");
         $("#third_category").empty().append("<option>이수구분</option>");
         $("#wholeTimeThead").hide();
         $("#wholeTimeTbody").empty();
         
         //단과대학 추가
         var str = "<option>단과대학</option>";
         $.each(jsonData, function(){
            str = str+"<option value='"+this.collegeId+"'>"+this.collegeName+"</option>";
         });         
         $("#first_category").html(str);
         }//success
      })
   })//
   
   
   $("#first_category").on("change", function(){
      var idx = this.selectedIndex;
   $.ajax({
      type:"POST",
      url:"${initParam.rootPath}/student/getMajorLists.do",
      data:{"collegeId":$("#first_category").val(), ${_csrf.parameterName}:'${_csrf.token}'},
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
         }//success,
      });//ajax
   });//onchange
   
   
   // 학과선택시 학과id로 과목들 뽑아오기 이수구분 조회
   $("#second_category").on("change", function(){
      $.ajax({
         type:"POST",
         url:"${initParam.rootPath}/student/getSubjectTypeList.do",
         data:{"majorId":$("#second_category").val(), ${_csrf.parameterName}:'${_csrf.token}',"semester":$("#zero_category").val()},
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
            
            //학과별
            var trs = "";            
               for(var i = 0; i<jsonData[0][0].length;i++){
               trs = trs+"<tr><td>"+jsonData[0][0][i].subjectType
                +"</td><td>"+jsonData[0][0][i].subjectId
                +"</td><td>"+jsonData[0][0][i].subjectName
                +"</td><td>"+jsonData[0][0][i].subjectCredit
                +"</td><td>"+jsonData[0][0][i].subjectGrade
                +"</td><td>"+jsonData[0][0][i].subjectClass
                +"</td><td>"+jsonData[0][0][i].subjectCapacity
                +"</td><td>"+jsonData[0][0][i].subjectTime
                +"</td><td>"+jsonData[0][2][i] 
                +" </td><td>"+jsonData[0][1][i]+"</td></tr>";
               }//end of for          
             $("#wholeTimeTbody").html(trs); 
             if(trs!=""){
               $("#wholeTimeThead").show(); 
             }
             //이수구분 붙이기            
            $.each(jsonData[1], function(){
               $("#third_category").html("<option>이수구분</option>"+
                                   "<option value='"+jsonData[1][0]+"'>"+jsonData[1][0]+"</option>"+
                                   "<option value='"+jsonData[1][1]+"'>"+jsonData[1][1]+"</option>"+
                                   "<option value='"+jsonData[1][2]+"'>"+jsonData[1][2]+"</option>"+
                                   "<option value='"+jsonData[1][3]+"'>"+jsonData[1][3]+"</option>");                        
            });//end of each
            
            $("#wholeTimeTbody").html(trs);
            if(trs!=""){
            $("#wholeTimeThead").show();
            }
         },//end of success
         error:function(){
            alert("조회할 데이터가 없습니다");
         }
      });//ajax
   });//on change
   
   
   $("#third_category").on("change", function(){
      $.ajax({
         type:"POST", 
         url:"${initParam.rootPath}/student/getSubjectBySubjectType.do",
         data:{"majorId":$("#second_category").val(),"subjectType":$("#third_category").val(),"semester":$("#zero_category").val(), ${_csrf.parameterName}:'${_csrf.token}'},
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
                for(var i = 0; i<jsonData.subList.length;i++){
               trs = trs+"<tr><td>"+jsonData.subList[i].subjectType
                +"</td><td>"+jsonData.subList[i].subjectId
                +"</td><td>"+jsonData.subList[i].subjectName
                +"</td><td>"+jsonData.subList[i].subjectCredit
                +"</td><td>"+jsonData.subList[i].subjectGrade
                +"</td><td>"+jsonData.subList[i].subjectClass
                +"</td><td>"+jsonData.subList[i].subjectCapacity
                +"</td><td>"+jsonData.subList[i].subjectTime
                +"</td><td>"+jsonData.roomNameList[i] 
                +" </td><td>"+jsonData.proNameList[i]+"</td></tr>";
               }//end of for             
             $("#wholeTimeTbody").html(trs);
            if(trs!=""){
             $("#wholeTimeThead").show();
            }            
         },

      });//end of .ajax
   });//on.change
});//document

/* function showCollege(){
   $("#college").html("<c:forEach var='i' items='${requestScope.colAndSemMap.collegeList }'>"+
                  "<option value='${i.collegeId}'>${i.collegeName}</option>"+
                  "</c:forEach>");
} */


</script>
</head>
<body>
<h3>전체 강의시간표 조회</h3>
 <hr style="border: solid px black">
 학기선택: 
   <select name="semester" id="zero_category" >
      <option> 학기</option>
      <c:forEach var="i" items="${requestScope.semesterList}">
         <option value="${i}">${i}</option>
      </c:forEach>
   </select>&nbsp;
   <%--
   단과 대학 조회 select 
 --%>
   단과대학선택: 
   <select name="collegeName" id="first_category">
      <option id="college">단과대학</option>      
   </select>&nbsp;
   <%-- -------------------------------------------- 
   학과 select 
------------------------------------------------- --%>
   학과선택:
   <select id="second_category">
      <option>학과</option>
   </select>&nbsp;

   <%-- -------------------------------------------- 
   이수구분
------------------------------------------------- --%>
 이수구분선택: 
   <select id="third_category">
      <option>이수구분</option>
   </select><br><br>

   <%--
   과목조회 Table
 --%>
   <table id="wholeTimeTable" border="1" height="12px" >
      <thead id="wholeTimeThead">
         <tr class="filters">
            <th width='110px'><input type='text' class='form-control' placeholder='이수구분' disabled></th>
            <th width='120px'><input type='text' class='form-control' placeholder='과목코드' disabled></th>
            <th width='140px'><input type='text' class='form-control' placeholder='과목명' disabled></th>
            <th width='70px'><input type='text' class='form-control' placeholder='학점' disabled></th>
            <th width='70px'><input type='text' class='form-control' placeholder='학년' disabled></th>
            <th width='90px'><input type='text' class='form-control' placeholder='분반' disabled></th>
            <th width='110px'><input type='text' class='form-control' placeholder='제한인원' disabled></th>
            <th width='150px'><input type='text' class='form-control' placeholder='요일' disabled></th>
            <th width='110px'><input type='text' class='form-control' placeholder='강의실' disabled></th>
            <th width='100px'><input type='text' class='form-control' placeholder='교수명' disabled></th>
         </tr>
      </thead>
      <tbody id="wholeTimeTbody">

      </tbody>

   </table>
</body>
</html>