<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<table border="1" height="12px">	
	<thead>
		<tr>
			<td colspan="2" align="center">구분</td> 
			<td>기준학점</td>
			<td>이수학점</td>
			<td>필요학점</td>
			<td rowsapn="5">졸업시험<br>패스여부</td>
			<td rowsapn="5">졸업가능<br>여부</td>
		<tr>
	</thead>
	<tbody align="center">
		<tr>
			<td rowspan="2">교양</td> 
			<td>교양필수</td>
			<td>${requestScope.map.gradCredit.gradVitalEduCredit}</td>
			<td>${requestScope.map.eduVitAc}</td>
			<td>${requestScope.map.eduVitAcNeed}</td>
			<td rowspan="4">${(requestScope.map.gradExamPass=='y')?'통과':'재시험'}</td>
			<td rowspan="4">${requestScope.map.gradPass}</td> 		
		</tr>
		<tr>
			<td>교양선택</td>
			<td>${requestScope.map.gradCredit.gradSelectEduCredit}</td>
			<td>${requestScope.map.eduSelAc}</td>
			<td>${requestScope.map.eduSelAcNeed}</td> 
		</tr>
		<tr>
			<td rowspan="2">전공</td>
			<td>전공필수</td>
			<td>${requestScope.map.gradCredit.gradVitalMajorCredit}</td>
			<td>${requestScope.map.mjrVitAc}</td>
			<td>${requestScope.map.mjrVitAcNeed}</td>
		</tr>
		<tr>
			<td>전공선택</td>
			<td>${requestScope.map.gradCredit.gradSelectMajorCredit}</td>
			<td>${requestScope.map.mjrSelAc}</td>			
			<td>${requestScope.map.mjrSelAcNeed}</td>
		</tr>
	</tbody>
</table>

</body>
</html>