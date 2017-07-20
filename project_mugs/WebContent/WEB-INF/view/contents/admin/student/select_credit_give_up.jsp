<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input{
   text-align:center;
   font-size: 15px;
}
table{
   width:100%;
}
td{
   border: 1px solid black;
   font-size: 15px;
}
select{
   width:150px;
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
.form-controler {
   color:black;
}
h3{
   font-family:굴림체;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function approval(creditGiveUpId){
	if(confirm("승인하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/approveCreditGiveUpController.do?creditGiveUpId="+creditGiveUpId
	}else{
		return false;
	}
}
function refuse(creditGiveUpId){
	if(confirm("거절하시겠습니까?")){
		location.href="${initParam.rootPath }/admin/refuseCreditGiveUpController.do?creditGiveUpId="+creditGiveUpId
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h3>학점 포기 신청 현황</h3>
<c:if test="${sessionScope.cguApproveMessage != null}">
		<script type="text/javascript">
			alert("승인되었습니다");
		</script>
		<% session.removeAttribute("cguApproveMessage"); %>
</c:if>
<c:if test="${sessionScope.cguRefuseMessage != null}">
		<script type="text/javascript">
			alert("거절되었습니다");
		</script>
		<% session.removeAttribute("cguRefuseMessage"); %>
</c:if>
<br>
	<table border="1">
		<thead>
			<tr>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="신청 번호" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학과" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 학번" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="학생 이름" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="과목 이름" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="신청 학기" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="신청 날짜" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="신청 상태" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="승인" disabled></th>
				<th align="center"><input type="text" style="height: 40px" class="form-control" placeholder="거절" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="list">
			<tr>
				<td align="center">${list.CGUId }</td>
				<td align="center">${list.majorName }</td>
				<td align="center">${list.usersId }</td>
				<td align="center">${list.usersName }</td>
				<td align="center">${list.subjectName }</td>
				<td align="center">${list.CGUSemester }</td>
				<td align="center"><fmt:formatDate value="${list.CGUStartDate}" pattern="yyyy-MM-dd"/></td>
				<td align="center">${list.CGUState }</td>
				<td align="center"><button onclick="approval('${list.CGUId }')">승인</button></td>
				<td align="center"><button onclick="refuse('${list.CGUId }')">거절</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<center><button onclick="location.href='${initParam.rootPath}/index.do'" type="button" style="color:white; background-color:#ffb937; border:0px; border-radius:10px;height:40px;">메인화면으로 가기</button></center>
</body>