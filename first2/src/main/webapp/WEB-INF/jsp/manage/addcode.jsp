<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
div#codeid{

margin-left: 100px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	$("#cntMainCode").on("click", function(e){ //추가하기 버튼
		if("${cntCode}" == '1'){
			alert('중복된 메인코드입니다.');
			
		}
	});
});
</script>

<title>코드 등록</title>
</head>
<body>
<jsp:include page="/layout/adminHeader.do" />

<h2>코드 등록</h2>

<jsp:include page="/layout/adminBody.do" />
<form id ="/manage/addcode.do" action="/manage/addcode.do" method="GET">

	<div id = "codeid">
	<b>메인코드 : </b><input type ="text" id = "maincode" name="maincode" value="">
					<br><br>
					
	<b>메인코드명 : </b><input type ="text" id = "maincodename" name="maincodename" value=""><br><br>
	<b>사용유무 : </b> <select style="width: 100px; margin-right: 10px" name="isuse" id="isuse" >
		
						<option value="Y">Y</option>
						<option value="N">N</option>
					
				</select><br><br><br><br><br>

	

					<input type="submit" onclick ="cntMainCode"value="등록" name="join" id="cntMainCode"class="button"> 
					<a href='#' onclick='history.back(); return false;'><button>취소</button></a>
					</div>
</form>			
	
	
	
		
</body>
</html>