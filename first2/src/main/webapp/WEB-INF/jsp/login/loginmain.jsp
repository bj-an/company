<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
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
<meta charset="UTF-8">
<title>로 그 인</title>
</head>
<body>
<h2><b>로그인</b></h2>
<br><br><br>

<form class="form-horizontal" action="/login/login.do" Method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">User ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" name="id" placeholder="Enter User ID" required> 
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pw">Password:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Enter Password"required>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <a href="/login/join.do"><label><b>[ 회원가입 ]</b></label></a>
        <a href="/login/findidpage.do"><label><b>[ 아이디 찾기 ]</b></label></a>
           <a href="/login/findpwpage.do"><label><b>[ 비밀번호 찾기 ]</b></label></a>
      </div>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">로그인</button>
     
    </div>
  </div>
</form>
</body>
</html>


