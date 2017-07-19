<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0"/>
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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var tbodySize = $("#tbody tr").length;
	
	if(tbodySize == 0) {
		var txt = "<tr><td colspan='4' style='text-align:center'>휴복학 신청내역이 없습니다.</td></tr>"
		$("#tbody").html(txt);
	}
	
	$(document).on("click", "#leaveBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addLeaveReturnApplication.do",
			"data":{'LRApplicationType':$(this).val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"type":"post",
			"success":function(map) {
				alert(map.msg);
				
				if(map.leaveReturnApplicationlist) {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						if(leaveReturnApplicationlist.LRApplicationStartDate == '대기') {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" +
							"<input type='hidden' value=" + this.LRApplicationId + ">" + "</td></tr>";
						} else {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
						}
					});
				$("#tbody").html(tbodyTxt);	
				}	
			},
		});
	});
	
	$(document).on("click", "#returnBtn", function() {
		$.ajax({
			"url":"/project_mugs/student/addLeaveReturnApplication.do",
			"data":{'LRApplicationType':$(this).val(), '${_csrf.parameterName}':'${_csrf.token}'},
			"dataType":"json",
			"type":"post",
			"success":function(map) {
				alert(map.msg);
				
				if(map.leaveReturnApplicationlist) {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						if(leaveReturnApplicationlist.LRApplicationStartDate == '대기') {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td>" + "<button id=" + "cancelBtn>" + "신청취소</button>" +
							"<input type='hidden' value=" + this.LRApplicationId + ">" + "</td></tr>";
						} else {
							tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
							"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
						}
					});
				$("#tbody").html(tbodyTxt);	
				}	
			},
		});
	});
	
	$(document).on("click", "#cancelBtn", function() {
		$.ajax({
			"uri":"",
			"type":"post",
			"dataType":"json",
			"data":({LRApplicationId:$(this).next().val(), ${_csrf.parameterName}:'${_csrf.token}'}),
			"success":function(map) {
				if(map.leaveReturnApplicationlist) {
					var txt = "<tr><td colspan='4' style='text-align:center'>휴복학 신청내역이 없습니다.</td></tr>"
					$("#tbody").html(txt);
				} else {
					var tbodyTxt = "";
					$.each(map.leaveReturnApplicationlist, function() {
						tbodyTxt += "<tr><td>" + this.LRApplicationType +  "</td><td>" + this.LRApplicationState +
						"</td><td>" + this.LRApplicationStartDate + "</td><td></td></tr>";
					});
					$("#tbody").html(tbodyTxt);	
				}
			},
		});
	});
});
</script>
</head>
<body>
<h3>휴/복학신청</h3>
<hr style="border: solid px black">
<table border="2" style="border-color: black">
	<thead>
		<tr id="thead">
			<th ><input style="width:280px" type="text"  placeholder="신청구분" disabled></th>
			<th ><input style="width:280px" type="text"  placeholder="결재상태" disabled></th>
			<th ><input style="width:280px" type="text"  placeholder="신청일자" disabled></th>
			<th ><input style="width:280px" type="text"  placeholder="취소버튼" disabled></th>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach items="${requestScope.leaveReturnApplicationList }" var="leaveReturnApplication">
			<c:choose>
				<c:when test="${leaveReturnApplication.LRApplicationState eq '대기' }">
					<tr>
						<td>${leaveReturnApplication.LRApplicationType }</td>
						<td>${leaveReturnApplication.LRApplicationState }</td>
						<td>${leaveReturnApplication.LRApplicationStartDate }</td>
						<td><button id="cancelBtn">신청취소</button>
						<input type="hidden" value="${leaveReturnApplication.LRApplicationId }">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${leaveReturnApplication.LRApplicationType }</td>
						<td>${leaveReturnApplication.LRApplicationState }</td>
						<td>${leaveReturnApplication.LRApplicationStartDate }</td>
						<td></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>
<br>
<center><p style="color:red">* 휴복학 신청이 되지 않으시면 과사로 연락해주세요.</p></center>
<center><button id="leaveBtn" value="휴학" type="button">휴학신청</button>&nbsp;&nbsp;<button id="returnBtn" value="복학" type="button" >복학신청</button></center>
<br>
    <center><button onclick="location.href='${initParam.rootPath }/index.do'" type="button" class="btn btn-primary">메인페이지로 가기</button></center>
</body>
</html>