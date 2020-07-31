<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/layout/header.do" />
<jsp:include page="/layout/header2.do" />
<jsp:include page="/WEB-INF/jsp/layout/include-header.jsp" />
</head>
<style>
div#btnlist{
	margin-left: 400px;
	
	
}
.board_view{
margin-left: 50px; 
}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e) {//수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
			

		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/sample/openBoardList.do");
			comSubmit.submit();
		}

		function fn_openBoardUpdate() {
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/sample/openBoardUpdate.do");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		

	</script>
<body>

	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.WRITER2 }</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS}</td>
			</tr>
		</tbody>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="btnlist">
	<a href="#this" class="btn" id="list">목록으로</a>
	<c:if test ="${id eq map.WRITER2 or  joininfo2.tier eq 999}">
		<a href="#this" class="btn" id="update">수정하기</a>
	</c:if>
</div>
	
</body>
</html>

