<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project_mugs/resource/jquery/jquery.js"></script>
<script type="text/javascript">
	function major_update(){
		location.href="${initParam.rootPath }/admin/selectMajorByMajorIdForUpdateController.do?majorId="+$("td#majorId").text()
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
			<c:forEach items="${requestScope.list }" var="major">
				<c:choose>
					<c:when test="${major.graduationCreditList == null}">
						<tr>
							<td id="majorId">${major.majorId }</td>
							<td>${major.majorName }</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${major.graduationCreditList}" var="list">
							<tr>
								<td id="majorId">${major.majorId }</td>
								<td>${major.majorName }</td>
								<td>${list.graduationCreditYear }</td>
								<td>${list.gradVitalEduCredit }</td>
								<td>${list.gradSelectEduCredit }</td>
								<td>${list.gradVitalMajorCredit }</td>
								<td>${list.gradSelectMajorCredit }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	<button onclick="major_update()">학과 수정</button>
	<button onclick="major_delete()">학과 제거</button>
	<button onclick="graduation_credit_insert()">기준 학점 등록</button>
	<button onclick="graduation_credit_update()">기준 학점 수정 및 제거</button>
	<button onclick="location.href='${initParam.rootPath }/'">메인 화면으로 가기</button>
</body>