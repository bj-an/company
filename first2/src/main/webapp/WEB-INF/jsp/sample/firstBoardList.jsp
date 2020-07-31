<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/header2.do" />
<jsp:include page="/WEB-INF/jsp/layout/include-header.jsp" />

<title>일반게시판</title>
<style>
.table{
    width: 85%;
    max-width: 100%;
    margin-bottom: 20px;

    float: right;
    
}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").on("click", function(e) { //새 글 버튼
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

	});
	function fn_openBoardWrite() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/sample/openBoardWrite.do");
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("/sample/openBoardDetail.do");
		comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
		comSubmit.submit();

	
	}

	
</script>
</head>
	<body>


<jsp:include page="/layout/header.do" />


	<table class="table table-bordered">

	
		<thead>
			<tr>
				<th>NO.</th>
				<th>제목</th>
				<th>등록자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.IDX }</td>
							<td class="title"><a href="#this" name="title">${row.TITLE }</a>
								<input type="hidden" id="IDX" value="${row.IDX }"></td>
							<td>${row.WRITER2 }</td>
							<td>${row.HIT_CNT }</td>
							<td>${row.CREA_DTM }</td>
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
	</table>



</body>
</html>