<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
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
   font-family:굴림체;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

var select1 = "<select class='selectBtn1'><option>F</option><option>A+</option><option>A</option><option>B+</option><option>B</option><option>C+</option><option>C</option><option>D+</option><option>D</option></select>";
var select2 = "<input class='selectInput' name='' value='0.0' size='4' readonly='readonly'>";
var select3 = "<select class='selectBtn1'><option>F</option><option>B+</option><option>B</option><option>C+</option><option>C</option><option>D+</option><option>D</option></select>";
var select4 = "<input class='selectInput' name='' value='0.0' size='4' readonly='readonly'>";

$(document).ready(function(){
   $("#table").hide();
   $("#table2").hide();
   $("#table3").hide();
   searchSubjectList();
});

var hash = {
   "A+" : "4.5",
   "A" : "4.0",
   "B+" : "3.5",
   "B" : "3.0",
   "C+" : "2.5",
   "C" : "2.0",
   "D+" : "1.5",
   "D" : "1.0",
   "F" : "0.0"      
}

var cnt = {
      "A+" : "0",
      "A" : "0",
      "B+" : "0"
}

$(document).on("change", ".selectBtn1", function(){
   var selectedVal = $(this).find("option:selected").val();
   $(this).parent().next().children().val(hash[selectedVal]);
   
   
});
   function searchSubjectList(){//담당과목
      $.ajax({
         "url":"/project_mugs/professor/searchSubjectList.do",
         "type":"POST",
         "data":{${_csrf.parameterName}:'${_csrf.token}'},
         "dataType":"json",
         "success":function(list){
            var txt = "";// undefined값
            $.each(list, function(){ 
               txt += "<tr><td style='text-align:center'>" + this.proSubjectYear + "</td><td style='text-align:center'>" + this.proSubjectSemester + "</td><td style='text-align:center'>" + this.proId + "</td><td style='text-align:center'>" + this.subject.subjectId
               + "</td><td style='text-align:center'>" + this.subject.subjectName + "</td><td style='text-align:center'>" + this.subject.subjectTime + "</td><td style='text-align:center'>" + this.subject.subjectType
               + "</td><td style='text-align:center'>" + this.subject.subjectGrade + "</td><td style='text-align:center'>" + this.subject.subjectCredit + "</td><td style='text-align:center'>" + this.subject.subjectCapacity 
               + "</td><td style='text-align:center'>" + "<button id=" + "Btn>" + "학생리스트 보기 </button>" + "</td></tr>"
            });
            $("#tbody").html(txt);
            $("#table").show();
         },
         "error":function(){
            alert("에러발생");            
         }
      });//ajax
   }//메소드
 
   $(document).on("click", "#Btn", function(){//학생목록
	      
	      var courseYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
	      var courseSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
	      var subjectId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
	      var Capacity = $(this).parent().prev().text();
	      var Acquire = $(this).parent().prev().prev().text();
	      anotherNum(Capacity);
	      $.ajax({
	         "url":"/project_mugs/professor/searchCourseByThreeId.do",
	         "type":"POST",
	         "data":{"courseYear":courseYear,"courseSemester":courseSemester,"subjectId":subjectId,${_csrf.parameterName}:'${_csrf.token}'},
	         "dataType":"json",
	         "success":function(list){
	            stuNum(list);//리스트 숫자
	            TotalNum();
	            var txt = "";// undefined값
	            if(list.length!=0){
	            $.each(list, function(){ // style="display: none" 적용해서  + "</td><td>" 등등 삽입해두기!!
	               if(this.count=="1"){
	               txt += "<tr><td style='text-align:center'>" + courseYear +"</td><td style='text-align:center'>" + courseSemester +"</td><td style='text-align:center'>" + Acquire + "</td><td style='text-align:center' id='change1'>" + select1  
	                  +"</td><td style='text-align:center'>" + select2 +"</td><td style='text-align:center' id='change2'>" + 'N' + "</td><td style='text-align:center'>" + subjectId + "</td><td style='text-align:center'>" + this.student.usersId + "</td><td style='text-align:center'>" + this.student.usersName 
	                  + "</td><td style='text-align:center'>" + "<button class=" + "Btn2>" + "성적주기 </button>" + "</td><td style='text-align:center'>" + "<button class=" + "Btn3 style='display: none'>" + "성적수정 </button>" + "</td></tr>"                                                      
	               }else{
	               txt += "<tr><td>" + courseYear +"</td><td>" + courseSemester +"</td><td>" + Acquire + "</td><td id='change1'>" + select3 
	                  +"</td><td>" + select4 +"</td><td id='change2'>" + 'Y' + "</td><td>" + subjectId + "</td><td>" + this.student.usersId + "</td><td>" + this.student.usersName 
	                  + "</td><td>" + "<button class=" + "Btn2>" + "성적주기 </button>" + "</td><td >" + "<button class=" + "Btn3 style='display: none'>" + "성적수정 </button>" + "</td></tr>"               
	               }
	            });//each
	         $("#tbody3").html(txt);
	         $("#table2").show();
	         $("#table3").show();
	            }else{
	               alert("등록된 학생 목록이 없습니다.");
	               $("#table2").hide();
	               $("#table3").hide();
	            }
	         },//success
	         "error":function(){      
	            alert("등록된 학생 목록이 없습니다");
	         }//error
	      });//ajax
	   });//click

   function stuNum(list){
      var t = list.length;
      $.ajax({         
         "success":function(){
            $("#total1").text(t);      
         }
      });//ajax
   }   
   
   function anotherNum(num){
      var t = num
      $.ajax({         
         "success":function(){
            $("#total2").text(t);      
         }
      });//ajax
      
   }   
   
   function TotalNum(){
      $.ajax({         
         "success":function(){
            var x = $("#total1").text();      
            var y = $("#total2").text();   
            
            /* alert(x); */
            var aa = x*0.2;
            var bb = x*0.2;
            var cc = x*0.3;
            
            var a = aa.toFixed(0);
            var b = bb.toFixed(0);
            var c = cc.toFixed(0);
            /* alert(aa);
            alert(a); */
            $("#total3").text(a);
            $("#total4").text(b);
            $("#total5").text(c);
            $("#total6").text(x-a-b-c);
         }
      });
   }
   
   $(document).on("click", ".Btn2", function(){      
      var $this = $(this);
      var creditYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
      var creditSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
      var creditAcquire = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
      var creditGrade = $(this).parent().prev().prev().prev().prev().prev().prev().children().val();
      var creditScore = $(this).parent().prev().prev().prev().prev().prev().children().val();
      var creditRecource = $(this).parent().prev().prev().prev().prev().text();
      var subjectId = $(this).parent().prev().prev().prev().text();
      var stuId = $(this).parent().prev().prev().text();

      $.ajax({
         "url":"/project_mugs/professor/registerCredit.do",
         "type":"POST",
         "data":{"creditYear":creditYear,"creditSemester":creditSemester,
                "creditAcquire":creditAcquire,"creditGrade":creditGrade,"creditScore":creditScore,
                "creditRecource":creditRecource,"subjectId":subjectId,"stuId":stuId,
                ${_csrf.parameterName}:'${_csrf.token}'},
         "dataType":"json",
         "success":function(){
            alert("성공");
         },//success
         "error":function(){      
            alert("이미 등록되었습니다.");
            $this.parent().next().children().css("display", "inline");
         }//error
      });//ajax

   
   });//click 
   
   $(document).on("click", ".Btn3", function(){      
      var $this = $(this);
      var creditYear = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
      var creditSemester = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
      var creditAcquire = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
      var creditGrade = $(this).parent().prev().prev().prev().prev().prev().prev().prev().children().val();
      var creditScore = $(this).parent().prev().prev().prev().prev().prev().prev().children().val();
      var creditRecource = $(this).parent().prev().prev().prev().prev().prev().text();
      var subjectId = $(this).parent().prev().prev().prev().prev().text();
      var stuId = $(this).parent().prev().prev().prev().text();
      
      $.ajax({
         "url":"/project_mugs/professor/renewCredit.do",
         "type":"POST",
         "data":{"creditYear":creditYear,"creditSemester":creditSemester,
                "creditAcquire":creditAcquire,"creditGrade":creditGrade,"creditScore":creditScore,
                "creditRecource":creditRecource,"subjectId":subjectId,"stuId":stuId,
                ${_csrf.parameterName}:'${_csrf.token}'},
         
         "success":function(){
            alert("성공");
         },//success
         "error":function(){      
            alert("실패");            
         }//error
      });//ajax
   });//click 
   
   
</script>
</head>
<body>


<h3>성적주기</h3>
<hr style="border: solid px black;">


<c:choose>
<c:when test="${check=='접근허용'}">
<table id="table" border="2" style="border-color: black">
   <thead>
      <tr style="width:100px">
         <th style="width:70px"><input type="text" class="form-control" placeholder="연도" disabled></th>
         <th><input type="text" class="form-control" placeholder="학기" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="교수번호" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="과목번호" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="과목명" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="강의시간" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="이수구분" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="학년" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="학점" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="정원" disabled></th>
         
         <td style="display: none">연도</td>
         <td style="display: none">학기</td>
         <td style="display: none">과목번호</td>
         <td style="display: none">과목명</td>
         <td style="display: none">이수구분</td>
         <td style="display: none">학년</td>
         <td style="display: none">학점</td>
         <td style="display: none">강의시간</td>
         <td style="display: none">교수ID</td>
         <td style="display: none">교수명</td>
         <td style="display: none">영문이름</td>
         <td style="display: none">핸드폰</td>
         <td style="display: none">이메일</td>
         
         <th style="width:125px"><input type="text" class="form-control" placeholder="학생리스트" disabled></th>
      </tr>
   </thead>
   <tbody id="tbody"></tbody>         
</table><br>


<hr style="border: solid px black;">

   <table id="table2" border="2" style="border-color: black">

<!--    <thead>
      <tr>
         <th><input type="text" class="form-control" placeholder="총학생수" disabled></th>
         <th><input type="text" class="form-control" placeholder="정원" disabled></th>
         <th><input type="text" class="form-control" placeholder="A가능수" disabled></th>
         <th><input type="text" class="form-control" placeholder="B가능수" disabled></th>
         <th><input type="text" class="form-control" placeholder="C가능수" disabled></th>
         <th><input type="text" class="form-control" placeholder="D가능수" disabled></th>
      </tr>
      
      <tr>
         <td id="total1"></td> 
         <td id="total2"></td> 
         <td id="total3"></td> 
         <td id="total4"></td> 
         <td id="total5"></td> 
         <td id="total6"></td> 
      </tr>
   </thead> -->
   <tbody id="tbody2"></tbody>         
</table><br>


   <table id="table3" border="2" style="border-color: black">
   <thead>
      <tr>
         <th style="width:90px"><input type="text" class="form-control" placeholder="연도" disabled></th>
         <th><input type="text" class="form-control" placeholder="학기" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="취득학점" disabled></th>
         <th style="width:40px"><input type="text" class="form-control" placeholder="등급" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="학점" disabled></th>
         <th style="width:15px"><input type="text" class="form-control" placeholder="재수강" disabled></th>
         <th style="width:140px"><input type="text" class="form-control" placeholder="과목ID" disabled></th>
         <th style="width:100px"><input type="text" class="form-control" placeholder="학번" disabled></th>
         <th style="width:100px"><input type="text" class="form-control" placeholder="성명" disabled></th>
         <th style="width:110px"><input type="text" class="form-control" placeholder="성적등록" disabled></th>
         <th style="width:120px"><input type="text" class="form-control" placeholder="성적수정" disabled></th>
      </tr>
   </thead>
   <tbody id="tbody3"></tbody>   
</table>
</c:when>
      <c:otherwise>
         <script>alert("${check}");</script>
   </c:otherwise>
</c:choose>
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
</html>