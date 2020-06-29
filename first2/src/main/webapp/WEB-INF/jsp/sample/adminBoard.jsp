<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/layout/header.do" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 게시판 관리자</h2>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/layout/body.jsp" />
<div class="container">
  
        
  <table class="table">
    <thead>
      <tr>
        <th>NO.</th>
        <th>게시판 코드</th>
        <th>게시판 명</th>
        <th>등록자</th>
        <th>등록일</th>
      </tr>
    </thead>
<tbody>
			<c:choose>
				<c:when test="${fn:length(lists) > 0}">
					<c:forEach items="${lists }" var="rows">
						<tr>
				 			<td>${rows.NO}</td>
							<td>${rows.BGNO }</td>
							<td class="title"><a href="#this" name="title">${rows.BONAME }</a>
							<td>${rows.WRITER2 }</td>
							<td>${rows.CREA_DTM }</td>
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
</div>

</body>

<a href="/sample/addBoard.do"><button type="button" class="btn btn-primary">게시판 추가</button></a>
<a href="/sample/openBoardList.do"><button>돌아가기</button></a>

</html>