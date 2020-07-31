<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<script type="text/javascript">
	</script>		
<title>코드 수정</title>
</head>
<body>
<jsp:include page="/layout/adminHeader.do" />

<h2>코드 수정</h2>

<jsp:include page="/layout/adminBody.do" />
<form  action="/manage/updatemaincode.do" method="POST">

	<div>
	<b>메인코드 : </b><input type ="text" id = "maincode" name="maincode" value="${selectMainCode.MAINCODE}">
				
					
	<b>메인코드명 : </b><input type ="text" id = "maincodename" name="maincodename" value="${selectMainCode.MAINCODENAME}"><br><br>
	<b>사용유무 : </b> <select style="width: 100px; margin-right: 10px" name="isuse" id="isuse">
		
						<option value="Y">Y</option>
						<option value="N">N</option>
					
				</select><br><br><br><br><br>

	</div>

					<input type="submit" value="수정하기" name="join" id="join"class="button"> 
					<a href='#' onclick='history.back(); return false;'><button>취소</button></a>
</form>			
	
	

</body>
</html>