<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="https://netdna.bootstrapcdn.com/font-awesome/2.0/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
});	

	function goBoard(rowss) {
		alert(rowss);
		alert("why?");
		$("input[name='goBoard']").val(rowss);
		document.goBoard.action = "/layout/goBoardpage.do";
		document.goBoard.submit();
		
		
// 		$.ajax({
//         	type : 'POST',
//             data : { "board_code" : rowss },
//             url : "/layout/goBoardpage.do",
//             success : function(data) {
//             }  
// 		});
		
	}

	
</script>

<style>
table, th, td {
	border: 1px solid black;
}

table {
	margin-top :15px;
	width: 100px;
	float: left;
/* 	margin-left : 50px; */
}
.vl {
  float: left;
  border-left: 3px solid red;
  height: 30px;
  margin-left: 25px;
}
</style>
<form id="goBoard" name="goBoard">
	<table>
		<thead>
			<tr>

				<th scope="col">게시판명</th>
		</thead>
		<tbody>
			<c:choose>
			<c:when test="${fn:length(listss) > 0}">
			<c:forEach items="${listss}" var="rowss">
				<tr>
<%-- 					<td>${rowss.BGNO}</td> --%>
					
					<td><a href="#" onclick="goBoard('${rowss.BGNO}')" name="goBoard">${rowss.BONAME}</a></td>

				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
		<tr>
		<c:if test="${joininfo2.tier eq 999}">
		<th><a href="/sample/adminBoard.do"><font color="purple">게시판 추가</font></a></th>
		</c:if>
		</tr>
	</table>
	</form>

<
	
<div id="vi"></div>
