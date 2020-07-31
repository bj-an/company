<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>

<style>
.table2{
float : left;
}
div#addboard{
float : right;
}
.table-bordered{
float : right;
width:91%;
max-width: 100%;
margin-bottom:20px;
}
</style>

<title>관리자 메뉴</title>
<jsp:include page="/layout/adminHeader.do" />
</head>
<body>


<h2> 게시판 관리</h2>
<jsp:include page="/layout/adminBody.do" />

<a href="/sample/addBoard.do"><div id="addboard"><button type="button" class="btn-success">게시판 추가</button></div></a>


<br>

        
  <table class="table-bordered">
    <thead>
      <tr>
        <th>NO.</th>
        <th>게시판 코드</th>
        <th>게시판 명</th>
        <th>등록자</th>
        <th>사용여부</th>
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
							<td>${rows.ISUSE }</td>
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


</body>

</html>