<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width:700px;
	
}
th {
	bgcolor:peru;
}
td{
	padding: 5px;
	border: 1px solid black;
	text-align:center;
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
h3{
	font-family:돋움체;
}
</style>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function major_update(majorId){
		location.href="${initParam.rootPath }/admin/selectMajorByMajorIdForUpdateController.do?majorId="+majorId
	};
	function major_delete(majorId){
		if(confirm("삭제하시겠습니까?")){
			location.href="${initParam.rootPath}/admin/deleteMajorController.do?majorId="+majorId
		}else{
			return false;
		}
	}
	function graduation_credit_insert(majorId, majorName){
		location.href="${initParam.rootPath }/insert_graduation_credit.do?majorId="+majorId+"&majorName="+majorName		
	};
	function graduation_credit_update(majorId){
		if($("#graduation").text() == ''){
			alert("먼저 등록해주세요");
			return false;
		}else{
		location.href="${initParam.rootPath }/admin/selectForUpdateByIdController.do?majorId="+majorId
		}
	};
	function standard_insert(majorId, majorName){
		location.href="${initParam.rootPath }/insert_standard.do?majorId="+majorId+"&majorName="+majorName		
	};
	function standard_update(majorId){
		if($("#standard").text() == ''){
			alert("먼저 등록해주세요");
			return false;
		}else{
		location.href="${initParam.rootPath }/admin/selectForUpdateStandardController.do?majorId="+majorId
		}
	};
</script>

</head>
<body>
	<h2>학과 세부 정보 조회</h2>
	<hr>
<c:if test="${sessionScope.grainsertMessage != null}">
	<script type="text/javascript">
		alert("등록되었습니다");
	</script>
	<% session.removeAttribute("grainsertMessage"); %>
</c:if>
<c:if test="${sessionScope.graupdateMessage != null}">
	<script type="text/javascript">
		alert("수정되었습니다");
	</script>
	<% session.removeAttribute("graupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.gradeleteMessage != null}">
	<script type="text/javascript">
		alert("삭제되었습니다");
	</script>
	<% session.removeAttribute("gradeleteMessage"); %>
</c:if>
<c:if test="${sessionScope.majorinsertMessage != null}">
	<script type="text/javascript">
		alert("등록되었습니다");
	</script>
	<% session.removeAttribute("majorinsertMessage"); %>
</c:if>
<c:if test="${sessionScope.majorupdateMessage != null}">
	<script type="text/javascript">
		alert("수정되었습니다");
	</script>
	<% session.removeAttribute("majorupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.stainsertMessage != null}">
	<script type="text/javascript">
		alert("등록되었습니다");
	</script>
	<% session.removeAttribute("stainsertMessage"); %>
</c:if>
<c:if test="${sessionScope.staupdateMessage != null}">
	<script type="text/javascript">
		alert("수정되었습니다");
	</script>
	<% session.removeAttribute("staupdateMessage"); %>
</c:if>
<c:if test="${sessionScope.stadeleteMessage != null}">
	<script type="text/javascript">
		alert("삭제되었습니다");
	</script>
	<% session.removeAttribute("stadeleteMessage"); %>
</c:if>
	<table border="1">
		<thead>
			<tr>
				<th align="center" ><input type="text" class="form-control" placeholder="학과ID" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="학과이름" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="적용연도" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="교양필수 졸업학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="교양선택 필수학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="전공필수 졸업학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="졸업선택 필수학점" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty requestScope.graduationcredit }">
					<tr>
						<td id="majorId" align="center">${requestScope.major.majorId }</td>
						<td align="center">${requestScope.major.majorName }</td>
						<td id="graduation"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.graduationcredit }" var="list">
						<tr>
							<td id="majorId" align="center">${list.majorId }</td>
							<td align="center">${list.majorName }</td>
							<td align="center" id="graduation">${list.graduationCreditYear }</td>
							<td align="center">${list.gradVitalEduCredit }</td>
							<td align="center">${list.gradSelectEduCredit }</td>
							<td align="center">${list.gradVitalMajorCredit }</td>
							<td align="center">${list.gradSelectMajorCredit }</td>
						<tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<thead>
			<tr>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="학과ID" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="학과이름" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="적용연도" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="수강 최소학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="수강 최대학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="수강 장학금 최소학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="수강 유예자 최소학점" disabled></th>
				<th style="width:10px" align="center" ><input type="text" class="form-control" placeholder="수강 유예자 최대학점" disabled></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty requestScope.standard }">
					<tr>
						<td align="center">${requestScope.major.majorId }</td>
						<td align="center">${requestScope.major.majorName }</td>
						<td id="standard"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.standard }" var="list">
						<tr>
							<td align="center">${list.majorId }</td>
							<td align="center">${list.majorName }</td>
							<td align="center" id="standard">${list.standardYear }</td>
							<td align="center">${list.standardMinCredit }</td>
							<td align="center">${list.standardMaxCredit }</td>
							<td align="center">${list.standardMinScholarship }</td>
							<td align="center">${list.standardDelayMinCredit }</td>
							<td align="center">${list.standardDelayMaxCredit }</td>
						<tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<button onclick="major_update('${requestScope.major.majorId }')">학과 수정</button>
	<button onclick="major_delete('${requestScope.major.majorId }')">학과 제거</button>
	<button onclick="graduation_credit_insert('${requestScope.major.majorId }','${requestScope.major.majorName }')">졸업 기준 학점 등록</button>
	<button onclick="graduation_credit_update('${requestScope.major.majorId }')">졸업 기준 학점 수정 및 제거</button>
	<button onclick="standard_insert('${requestScope.major.majorId }','${requestScope.major.majorName }')">수강 기준 학점 등록</button>
	<button onclick="standard_update('${requestScope.major.majorId }')">수강 기준 학점 수정 및 제거</button>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>