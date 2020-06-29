<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<jsp:include page="/WEB-INF/jsp/layout/header2.jsp" />
 
<meta charset="UTF-8">
<title>로 그 인</title>
</head>
<body>
<h2><b>로그인</b></h2>
<br><br><br>
<a href="/sample/openBoardList.do"><label><b>[ 비로그인으로 둘러보기 ]</b></label></a>

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


