<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUGS</title>
<style>
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
   font-family:굴림체;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#ul1").hide();
   $("#ul2").hide();
	
	$.ajax({
      url:"/project_mugs/student/yearInquiry.do",
      type:"GET",
      dataType:"json",
      success :function(list){
         var txt="<option>연도</option><option>전체</option>";
         $.each(list, function(){
            txt += "<option value="+this+">"+this+"</option>";
         })
         $("#year").html(txt);
      }
   });
   
   
    $("#year").on("change", function(){
       $("#type").html("<option>이수구분</option><option>전체</option><option>필수전공</option><option>선택전공</option><option>필수교양</option><option>선택교양</option>");
       
       if ($("#year").val()=="전체") {
          $("#type").val("전체").prop("selected", true);
          $.ajax({
             url:"/project_mugs/student/allCreditInquiry.do",
             type:"GET",
             data:{${_csrf.parameterName}:'${_csrf.token}'},
             dataType:"json",
             success:function(list){
                $("#table").show();
                $("#table2").show();
                $("#ul1").show();
                $("#ul2").show();
                $("#semester").html("<option>학기</option>");
                var txt="";
                var txt2="";
                var allCredit= 0;
                var acquireCredit=0;
                var score =0;
                var count =list.length;
                $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                $.each(list, function(index){
                   if(this.creditGrade!='포기'){
                   allCredit+=this.subject.subjectCredit;
                   acquireCredit+=this.creditAcquire;
                   score+=this.creditScore;
                       txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                          +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                   }else{
                      count-=1;
                   }
                })
                
                if(isNaN(score/count)){
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                  
               }else{
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>";
               }
                $("#tbody").html(txt);
                $("#tbody2").html(txt2);
             },
             error:function(){
                alert("오류발생!!");
             }
          });
      }else if($("#year").val()=="연도"){
         $("#table").hide();
         $("#table2").hide();
         $("#ul1").hide();
         $("#ul2").hide();
         $("#semester").html("<option>학기</option>")
         $("#type").html("<option>이수구분</option>")
         
      }else{
      $.ajax({
         url:"/project_mugs/student/semesterInquiry.do",
         type:"POST",
         dataType:"json",
         data:{"year":$("#year").val(),${_csrf.parameterName}:'${_csrf.token}'},
         success:function(list){
            var txt="<option>전체</option>";
            $.each(list, function(){
               txt += "<option value="+this+">"+this+"</option>"
            })
            $("#semester").html(txt);
            $("#semester").val("전체").prop("selected", true);
         },
         error:function(){
            alert("오류발생!!");
         }
      });
      
      
      $.ajax({
            url:"/project_mugs/student/creditByYear.do",
            type:"GET",
            dataType:"json",
            data:{"year":$("#year").val(),${_csrf.parameterName}:'${_csrf.token}'},
            success:function(list){
               $("#type").val("전체").prop("selected", true);
               $("#table").show();
               $("#table2").show();
               $("#ul1").show();
               $("#ul2").show();
               var txt="";
               var txt2="";
                var allCredit= 0;
                var acquireCredit=0;
                var score =0;
                var count =list.length;
                
                $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
               $.each(list, function(){
                  if(this.creditGrade!='포기'){
                  allCredit+=this.subject.subjectCredit;
                  acquireCredit+=this.creditAcquire;
                   score+=this.creditScore;
                      txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                         +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                  }else{
                     count-=1;
                  }
                  })
               if(isNaN(score/count)){
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                  
               }else{
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
               }
               $("#tbody2").html(txt2);
               $("#tbody").html(txt);
               
            },
            error:function(){
               alert("오류발생!!");
            }
         });
      
      }
   });//end of year
   
   $("#semester").on("change", function(){
      if($("#semester").val()=="전체"){
         $.ajax({
            url:"/project_mugs/student/creditByYear.do",
            type:"GET",
            dataType:"json",
            data:{"year":$("#year").val(), ${_csrf.parameterName}:'${_csrf.token}'},
            success:function(list){
               
               $("#table").show();
               $("#table2").show();
               $("#ul1").show();
               $("#ul2").show();
               var txt="";
               var txt2="";
                var allCredit= 0;
                var acquireCredit=0;
                var score =0;
                var count =list.length;
                
                $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
               $.each(list, function(){
                  if(this.creditGrade!='포기'){
                  allCredit+=this.subject.subjectCredit;
                  acquireCredit+=this.creditAcquire;
                   score+=this.creditScore;
                      txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                         +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                  }else{
                     count-=1;
                  }
                  })
               if(isNaN(score/count)){
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                  
               }else{
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
               }
               $("#tbody2").html(txt2);
               $("#tbody").html(txt);
               
            },
            error:function(){
               alert("오류발생!!");
            }
         });
      }else{
      $.ajax({
         url:"/project_mugs/student/creditByYearSemester.do",
         type:"GET",
         dataType:"json",
         data:{"year":$("#year").val(),"semester":$("#semester").val(), ${_csrf.parameterName}:'${_csrf.token}'},
         success:function(list){
            $("#table").show();
            $("#type").val("이수구분").prop("selected", true);
            var txt="";
            var txt2="";
               var allCredit= 0;
               var acquireCredit=0;
               var score=0;
               var count =list.length;
               
               $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
               $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
            $.each(list, function(){
               if(this.creditGrade!='포기'){
               allCredit+=this.subject.subjectCredit;
               acquireCredit+=this.creditAcquire;
                  score+=this.creditScore;
                   txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                      +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
               }else{
                  count-=1;
               }
            })
            if(isNaN(score/count)){
               txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
               
            }else{
               txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
            }
               $("#tbody2").html(txt2);
            $("#tbody").html(txt);
         },
         error:function(){
            alert("오류발생!!");
         }
      });
      }
   });//end of year
   
   $("#type").on("change", function(){
      if($("#year").val()=="전체"){
         if($("#type").val()=="전체"){
            $.ajax({
                url:"/project_mugs/student/allCreditInquiry.do",
                type:"post",
                dataType:"json",
                data:{${_csrf.parameterName}:'${_csrf.token}'},
                success:function(list){
                   $("#table").show();
                   $("#table2").show();
                   $("#ul1").show();
                   $("#ul2").show();
                   var txt="";
                   var txt2="";
                   var allCredit= 0;
                   var acquireCredit=0;
                   var score =0;
                   var count =list.length;
                   $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                   $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                   $.each(list, function(index){
                      if(this.creditGrade!='포기'){
                      allCredit+=this.subject.subjectCredit;
                      acquireCredit+=this.creditAcquire;
                      score+=this.creditScore;
                          txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                             +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                      }else{
                         count-=1;
                      }
                      })
                   
                   if(isNaN(score/count)){
                     txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                     
                  }else{
                     txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>";
                  }
                   $("#tbody").html(txt);
                   $("#tbody2").html(txt2);
                },
                error:function(){
                   alert("오류발생!!");
                }
             });
            
         }else{
         $.ajax({
            url:"/project_mugs/student/creditByOneType.do",
            type:"post",
            dataType:"json",
            data:{"type":$("#type").val(), ${_csrf.parameterName}:'${_csrf.token}'},
            success:function(list){
                var txt="";
                var txt2="";
                var allCredit= 0;
                var acquireCredit=0;
                var score=0;
                var count =list.length;
                $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
               $.each(list, function(){
                  if(this.creditGrade!='포기'){
                  allCredit+=this.subject.subjectCredit;
                  acquireCredit+=this.creditAcquire;
                  score+=this.creditScore;
                      txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                         +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                  }else{
                     count-=1;
                  }
               })
               if(isNaN(score/count)){
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                  
               }else{
                  txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
               }
               $("#tbody2").html(txt2);
               $("#tbody").html(txt);
            },
            error:function(){
               alert("오류발생!!");
            }
         });
       }
      }else if($("#year").val()!="전체"){
         if($("#semester").val()=="전체"){
            if($("#type").val()=="전체"){
               $.ajax({
                  url:"/project_mugs/student/creditByYear.do",
                  type:"post",
                  dataType:"json",
                  data:{"year":$("#year").val(), ${_csrf.parameterName}:'${_csrf.token}'},
                  success:function(list){
                     
                     $("#table").show();
                     $("#table2").show();
                     $("#ul1").show();
                     $("#ul2").show();
                     var txt="";
                     var txt2="";
                      var allCredit= 0;
                      var acquireCredit=0;
                      var score =0;
                      var count =list.length;
                      
                      $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                      $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                     $.each(list, function(){
                        if(this.creditGrade!='포기'){
                        allCredit+=this.subject.subjectCredit;
                        acquireCredit+=this.creditAcquire;
                         score+=this.creditScore;
                            txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                               +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                        }else{
                           count-=1;
                        }
                        })
                     if(isNaN(score/count)){
                        txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                        
                     }else{
                        txt2+="<tr><td>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                     }
                     $("#tbody2").html(txt2);
                     $("#tbody").html(txt);
                     
                  },
                  error:function(){
                     alert("오류발생!!");
                  }
               });
            }else{
               $.ajax({
                  url:"/project_mugs/student/creditByYearType.do",
                  type:"post",
                  dataType:"json",
                  data:{"year":$("#year").val(), "type":$("#type").val(), ${_csrf.parameterName}:'${_csrf.token}'},
                  success:function(list){
                      var txt="";
                      var txt2="";
                        var allCredit= 0;
                        var acquireCredit=0;
                        var score=0;
                        var count =list.length;
                        $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                        $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                     $.each(list, function(){
                        if(this.creditGrade!='포기'){
                        allCredit+=this.subject.subjectCredit;
                        acquireCredit+=this.creditAcquire;
                        score+=this.creditScore;
                            txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                               +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                        }else{
                           count-=1;
                        }
                        })
                     if(isNaN(score/count)){
                        txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                        
                     }else{
                        txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                     }
                        $("#tbody2").html(txt2);
                     $("#tbody").html(txt);
                  },
                  error:function(){
                     alert("오류발생!!");
                  }
               });
            }
            
         }else if($("#semester").val()!="전체"){//seme
            if($("#type").val()=="전체"){
               $.ajax({
                  url:"/project_mugs/student/creditByYearSemester.do",
                  type:"post",
                  dataType:"json",
                  data:{"year":$("#year").val(),"semester":$("#semester").val(), ${_csrf.parameterName}:'${_csrf.token}'},
                  success:function(list){
                     $("#table").show();
                     $("#table2").show();
                     $("#ul1").show();
                     $("#ul2").show();
                     var txt="";
                     var txt2="";
                        var allCredit= 0;
                        var acquireCredit=0;
                        var score=0;
                        var count =list.length;
                        $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                        $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                     $.each(list, function(){
                        if(this.creditGrade!='포기'){
                        allCredit+=this.subject.subjectCredit;
                        acquireCredit+=this.creditAcquire;
                           score+=this.creditScore;
                            txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                               +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                        }else{
                           count-=1;
                        }
                        })
                     if(isNaN(score/count)){
                        txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                        
                     }else{
                        txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                     }
                        $("#tbody2").html(txt2);
                     $("#tbody").html(txt);
                  },
                  error:function(){
                     alert("오류발생!!");
                  }
               });
            }else{   
            $.ajax({
               url:"/project_mugs/student/creditByType.do",
               type:"post",
               dataType:"json",
               data:{"year":$("#year").val(),"semester":$("#semester").val(), "type":$("#type").val(), ${_csrf.parameterName}:'${_csrf.token}'},
               success:function(list){
                   var txt="";
                   var txt2="";
                     var allCredit= 0;
                     var acquireCredit=0;
                     var score=0;
                     var count =list.length;
                     $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='과목번호' disabled></th><th><input type='text' class='form-control' placeholder='과목명' disabled></th><th><input type='text' class='form-control' placeholder='분반' disabled></th><th><input type='text' class='form-control' placeholder='이수구분' disabled></th><th><input type='text' class='form-control' placeholder='학점' disabled></th><th><input type='text' class='form-control' placeholder='등급' disabled></th><th><input type='text' class='form-control' placeholder='평점' disabled></th><th><input type='text' class='form-control' placeholder='재수강여부' disabled></th>");
                     $("#thead2").html("<th><input type='text' class='form-control' placeholder='신청학점' disabled></th><th><input type='text' class='form-control' placeholder='취득학점' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th>");
                  $.each(list, function(){
                     if(this.creditGrade!='포기'){
                     allCredit+=this.subject.subjectCredit;
                     acquireCredit+=this.creditAcquire;
                     score+=this.creditScore;
                         txt += "<tr><td style='text-align:center'>"+this.creditYear+"</td><td style='text-align:center'>"+this.creditSemester+ "</td><td style='text-align:center'>"
                            +this.subjectId+"</td><td style='text-align:center'>"+this.subject.subjectName+"</td><td style='text-align:center'>"+this.subject.subjectClass+"</td><td style='text-align:center'>"+this.subject.subjectType+"</td><td style='text-align:center'>"+this.subject.subjectCredit+"</td><td style='text-align:center'>"+this.creditGrade+"</td><td style='text-align:center'>"+this.creditScore+"</td><td style='text-align:center'>"+this.creditRecource+"</td></tr>";
                     }else{
                        count-=1;
                     }
                     })
                  if(isNaN(score/count)){
                     txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td>0&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                     
                  }else{
                     txt2+="<tr><td style='text-align:center'>"+allCredit+"</td><td style='text-align:center'>"+acquireCredit+"</td><td style='text-align:center'>"+(score/count).toFixed(1)+"&nbsp;&nbsp;/&nbsp;&nbsp;4.5</td></tr>"
                  }
                     $("#tbody2").html(txt2);
                  $("#tbody").html(txt);
               },
               error:function(){
                  alert("오류발생!!");
               }
            });
            }
         }
         
      }
   });
   
})


</script>
</head>
<body>
<h3>전체 성적 조회</h3><br>
연도선택 : <select id="year">
</select>
학기선택 : 
<select id="semester">
<option>학기</option>
</select>
이수구분선택 : <select id="type">
<option>이수구분</option>
</select><br><br>
<ul id="ul1"><li><h4>과목 목록</h4></li></ul><br>
<table border="2" style="border-color: black" id="table" >
   <thead id="thead"></thead>
      <tr class="filters"></tr>
   <tbody id="tbody"></tbody>
</table><br>
<div>
<ul id="ul2"><li><h4>해당 과목 성적 조회</h4></li></ul><br>
<table class="table2" border="2" style="border-color: black" id="table2">
   <thead id="thead2"></thead>
      <tr class="filters"></tr>
   <tbody id="tbody2"></tbody>
</table>
</div>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>