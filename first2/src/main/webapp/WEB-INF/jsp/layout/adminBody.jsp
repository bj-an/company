<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.table2{
float : left;
border-left: thick solid #ff0000;
}
.btn-primary{
float : right;
}

.vl {
  float: left;
  border-left: 3px solid red;
  height: 500px;
  margin-left: 25px;
}

</style>


<table class="table2">
<thead class="thead-dark"> 
    <tr>
          	<th scope="row"><b>메 뉴</b></th>
      </tr>
      <tr>
      	<th scope="col"><a href="/sample/adminBoard.do">게시판관리</a></th>
      </tr>
      <hr>
      <tr>
      <th scope="col"><a href="/manage/commonscodepage.do">공통코드</a></th>
      </tr>
      <tr>
      	<th scope="col"><a href="/manage/managingpage.do">권한관리</a></th>
      </tr>
  </thead>
  </table>
  <div class="vl"></div>

  
        