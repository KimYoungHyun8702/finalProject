<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function major_update(){
		location.href="${initParam.rootPath }/admin/selectMajorByMajorIdForUpdateController.do?majorId="+$("tbody td:eq(0)").text()
	};
	function major_delete(){
		if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.rootPath}/admin/deleteMajorController.do?majorId="+$("tbody td:eq(0)").text()
		}else{
			return false;
		}
	}
	function graduation_credit_insert(){
		location.href="${initParam.rootPath }/insert_graduation_credit.do?majorId="+$("tbody td:eq(0)").text()+"&majorName="+$("tbody td:eq(1)").text()		
	};
	function graduation_credit_update(){
		location.href="${initParam.rootPath }/admin/selectForUpdateByIdController.do?majorId="+$("tbody td:eq(0)").text()
	};
	function standard_insert(){
		location.href="${initParam.rootPath }/insert_standard.do?majorId="+$("tbody td:eq(0)").text()+"&majorName="+$("tbody td:eq(1)").text()		
	};
	function standard_update(){
		location.href="${initParam.rootPath }/admin/selectForUpdateStandardController.do?majorId="+$("tbody td:eq(0)").text()
	};
</script>

</head>
<body>
	<h2>학과 세부 정보 조회</h2>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<td align="center">학과 ID</td>
				<td align="center">학과 이름</td>
				<td align="center">적용 연도</td>
				<td align="center">교양필수 졸업학점</td>
				<td align="center">교양선택 졸업학점</td>
				<td align="center">전공필수 졸업학점</td>
				<td align="center">전공선택 졸업학점</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty requestScope.graduationcredit }">
					<tr>
						<td id="majorId" align="center">${requestScope.major.majorId }</td>
						<td align="center">${requestScope.major.majorName }</td>
						<td></td>
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
							<td align="center">${list.graduationCreditYear }</td>
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
				<td align="center">학과 ID</td>
				<td align="center">학과 이름</td>
				<td align="center">적용 연도</td>
				<td align="center">수강 최소 학점</td>
				<td align="center">수강 최대학점</td>
				<td align="center">수강 장학금 최소학점</td>
				<td align="center">수강 유예자 최소학점</td>
				<td align="center">수강 유예자 최대학점</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty requestScope.standard }">
					<tr>
						<td align="center">${requestScope.major.majorId }</td>
						<td align="center">${requestScope.major.majorName }</td>
						<td></td>
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
							<td align="center">${list.standardYear }</td>
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
	<button onclick="major_update()">학과 수정</button>
	<button onclick="major_delete()">학과 제거</button>
	<button onclick="graduation_credit_insert()">졸업 기준 학점 등록</button>
	<button onclick="graduation_credit_update()">졸업 기준 학점 수정 및 제거</button>
	<button onclick="standard_insert()">수강 기준 학점 등록</button>
	<button onclick="standard_update()">수강 기준 학점 수정 및 제거</button>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>