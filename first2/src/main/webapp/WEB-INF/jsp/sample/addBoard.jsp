<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/adminHeader.do" />
<jsp:include page="/WEB-INF/jsp/layout/include-header.jsp" />

<style>
.form-control2{
width:10%;
}
.form-control3{
width:30%;
}

</style>
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
<jsp:include page="/layout/adminBody.do" />

 <form id="frm" name="frm" method="post">
 
<div class="form-group">
  <label for="bocord" >게시판 코드:</label>
  <input type="text" class="form-control2" name="BGNO" id="BGNO" color="gray"  >
</div>
<div class="form-group">
  <label for="newboardname">게시판 명:</label>
  <input type="text" class="form-control3" name="BONAME" id="BONAME">
   </div>
 
 	<a href="#this" class="btn" id="insert" name="insert">추가하기</a>
 
  </form>

</body>
</html>