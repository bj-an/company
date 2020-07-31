<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
div#managebutton{
float: right;
}
.table-bordered {
float:right;
width: 91%;
}
</style>
<title>권한관리</title>
<jsp:include page="/layout/adminHeader.do" />
</head>
<body>
 <h2> 권 한 관 리</h2>
<jsp:include page="/layout/adminBody.do" />

  <div id="managebutton">&nbsp;&nbsp;&nbsp;<a href="/manage/updatemanagingpage.do"><button type="button" class="btn-success">권한부여</button></a></div>
    <table class="table-bordered">
    <thead>
      <tr>
        
        <th>사용자 ID</th>
        <th>사용자 명</th>
        <th>등록일</th>
        <th>수정일</th>
        <th>관리권한</th>       
      </tr>
      <tbody>
			<c:choose>
				<c:when test="${fn:length(listinfo) > 0}">
					<c:forEach items="${listinfo}" var="code">
						<tr>
							<td>${code.ID}</td>
							<td>${code.NAME}</td>
							<td>${code.RDATE}</td>
							<td>${code.UPDATEDATE}</td>
							<c:if test = "${code.TIER eq 1 }">
							<td>일반사용자</td>
							</c:if>
							<c:if test = "${code.TIER eq 99 }">
							<td><font color = "blue" >중간 관리자</font></td>
							</c:if> 
							<c:if test = "${code.TIER eq 999 }">
							<td><font color = "red" >극강마스터</font></td>
							</c:if>
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