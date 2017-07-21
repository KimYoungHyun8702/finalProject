<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>   
<h3>졸업여부 조회</h3><br>
<table border="2" style="border-color: black" height="12px">   
   <thead>
      <!-- <tr> -->
         <!-- <th><input colspan="2" align="center" type='text' class='form-control' placeholder='구분' disabled></th> -->
         <th><input colspan="2" align="center" type='text' class='form-control' placeholder='구분' disabled></th>
         <th><input align="center" type='text' class='form-control' placeholder='이수구분' disabled></th>
         <th><input align="center" type='text' class='form-control' placeholder='기준학점' disabled></th>
         <th><input align="center" type='text' class='form-control' placeholder='이수학점' disabled></th>
         <th><input align="center" type='text' class='form-control' placeholder='필요학점' disabled></th>
         <th><input rowspan="5" align="center" type='text' class='form-control' placeholder='졸업시험패스여부' disabled></th>
         <th><input rowspan="5" align="center" type='text' class='form-control' placeholder='졸업가능여부' disabled></th>
         
         
         <!-- <td colspan="2" align="center">구분</td>
         <td>기준학점</td>
         <td>이수학점</td>
         <td>필요학점</td>
         <td rowsapn="5">졸업시험<br>패스여부</td>
         <td rowsapn="5">졸업가능<br>여부</td>
      <tr> -->
   </thead>
   <tbody align="center">
      <tr class="filters">
         <td rowspan="2">교양</td> 
         <td>필수교양</td>
         <td>${requestScope.map.gradCredit.gradVitalEduCredit}</td>
         <td>${requestScope.map.eduVitAc}</td>
         <td>${requestScope.map.eduVitAcNeed}</td>
         <td rowspan="4">${(requestScope.map.gradExamPass=='y')?'통과':'재시험'}</td>
         <td rowspan="4">${requestScope.map.gradPass}</td>       
      </tr>
      <tr>
         <td>선택교양</td>
         <td>${requestScope.map.gradCredit.gradSelectEduCredit}</td>
         <td>${requestScope.map.eduSelAc}</td>
         <td>${requestScope.map.eduSelAcNeed}</td> 
      </tr>
      <tr>
         <td rowspan="2">전공</td>
         <td>필수전공</td>
         <td>${requestScope.map.gradCredit.gradVitalMajorCredit}</td>
         <td>${requestScope.map.mjrVitAc}</td>
         <td>${requestScope.map.mjrVitAcNeed}</td>
      </tr>
      <tr>
         <td>선택전공</td>
         <td>${requestScope.map.gradCredit.gradSelectMajorCredit}</td>
         <td>${requestScope.map.mjrSelAc}</td>         
         <td>${requestScope.map.mjrSelAcNeed}</td>
      </tr>
   </tbody>
</table>
<br>
    <center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>
</html>