<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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



<script type="text/javascript">
	$(document).ready(function() {
		$("#insert").on("click", function(e){ //추가하기 버튼
			e.preventDefault();
			fn_insertBoard();
		});
	});



	function fn_insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("/sample/adddBoard.do");
		comSubmit.submit();
	}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 게시판 추가</h2>

 <form id="frm" name="frm" method="post">
<div class="form-group">
  <label for="bocord" >게시판 코드:</label>
  <input type="text" class="form-control" name="BGNO" id="BGNO" readonly>
</div>
<div class="form-group">
  <label for="newboardname">게시판 명:</label>
  <input type="text" class="form-control" name="BONAME" id="BONAME">
   </div>
 
 	<a href="#this" class="btn" id="insert" name="insert">추가하기</a>
 
  </form>

</body>
</html>