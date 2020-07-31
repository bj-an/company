<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/layout/adminHeader.do" />

<h2>권한 수정</h2>

<jsp:include page="/layout/adminBody.do" />
<form action="/manage/updatemanaging.do" method="POST">

	<div>
	<b>아이디 : </b><select id="id" name="id" >
						<c:choose>
							<c:when test="${fn:length(listinfo) > 0  }">
								<c:forEach items="${listinfo }" var ="code">
						<option>${code.ID}</option>
								</c:forEach>
							</c:when>
						</c:choose> 
	
				</select><br><br><br>
	<b>권한수정항목 : </b> <select name="tier" id="tier">

						<option value="1">일반사용자</option>
						<option value="99">중간관리자</option>
						<option value="999">킹갓마스터</option>
					
				</select><br><br><br><br><br>

	</div>

					<input type="submit" value="수정하기" class="button"> 
					<a href='#' onclick='history.back(); return false;'><button>취소</button></a>
</form>			
			
</body>
</html>