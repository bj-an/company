<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/2.0/css/font-awesome.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />

<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/jsp/layout/include-header.jsp" />
  
  

<b>${id}</b> 님 환영합니다! &nbsp;&nbsp;&nbsp;

	
	<a href="/login/joinupdatepage.do"><button type="button" class="btn">정보수정</button></a>
		
	<a href="/login/logout.do"><button type="button" class="btn btn-warning" >로그아웃</button></a>		
	<a href="/sample/openBoardList.do"><button type="button" class="btn btn-success" >일반메뉴</button></a>		
		
	
			<c:if test="${joininfo2.tier eq 999}">
	<a href="/sample/adminBoard.do"><button type="button"
			class="btn">관리자메뉴</button></a>
			</c:if>