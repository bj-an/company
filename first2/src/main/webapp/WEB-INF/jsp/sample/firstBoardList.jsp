<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/layout/header.do" />
<jsp:include page="/WEB-INF/jsp/layout/body.jsp" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<h2>일반 게시판1</h2>

	<table class="table table-bordered">

		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">NO.</th>
				<th scope="col">제목</th>
				<th scope="col">등록자</th>
				<th scope="col">조회수</th>
				<th scope="col">등록일</th>
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