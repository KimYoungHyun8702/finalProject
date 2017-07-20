<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   padding: 0px;
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
   font-family:돋움체;
}
#tbody>tr{
   height:10px;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      selectProbation();
   });
   
   function selectProbation(){
      $.ajax({
         url:"/project_mugs/student/academicProbationInquiry.do",
         type:"GET",
         dataType:"json",
         data:{${_csrf.parameterName}:'${_csrf.token}'},
         success:function(list){
            var txt="";
            var count=0;
            $("#thead").html("<th><input type='text' class='form-control' placeholder='년도' disabled></th><th><input type='text' class='form-control' placeholder='학기' disabled></th><th><input type='text' class='form-control' placeholder='평점평균' disabled></th><th><input type='text' class='form-control' placeholder='학사경고횟수' disabled></th>");
            $.each(list, function(){
               count++;
                   txt += "<tr><td style='text-align:center'>"+this.probationYear+"</td><td style='text-align:center'>"+this.probationSemester+"</td><td style='text-align:center'>"
                      +this.probationCreditAverage+"</td><td style='text-align:center'>"+count+"</tr>";
                      
            })
            $("#tbody").html(txt);
         },
         error:function(){
            alert("오류발생!!");
         }
      });
   }
</script>
</head>
<body>
<h3>학사경고 내역</h3>
<hr style="border: solid px black">
         <table border="2" style="border-color: black">
            <thead id="thead"></thead>
               <tr class="filters"></tr>
            <tbody id="tbody"></tbody>
         </table>
<h2 id="warning"></h2>   
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>

</html>