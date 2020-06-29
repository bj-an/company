<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/2.0/css/font-awesome.css"
	rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="css">
*{
  box-sizing: border-box;
}
body{
  height:100%;
  background-color: #444;
}
h1{
  font-size:1em;
  text-align:center;
  color: #eee;
  letter-spacing:1px;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.5);
}
.nav-container{
  width:300px;
  margin-top:10px;
  box-shadow: 0 2px 2px 2px black;
  transition: all 0.3s linear;
  margin-right:750px;
}
.nav{
  list-style-type:none;
  margin:0;
  padding:0;
  margin-right:750px;
  
}
li{
  height:50px; 
  position:relative;
  background: linear-gradient(#292929, #242424);
  margin-right:750px;
}
a {
  border-top: 1px solid rgba(255,255,255,0.1);
  border-bottom: 1px solid black;
  text-decoration:none;
  display:block;
  height:100%;
  width:100%;
  line-height:50px;
  color:#bbb;
  text-transform: uppercase;
  font-weight: bold;
  padding-left:25%;
  border-left:5px solid transparent;
  letter-spacing:1px;
  transition: all 0.3s linear;
margin-right:750px;
}
.active a{
  color: #B93632;
  border-left:5px solid #B93632;
  background-color: #1B1B1B;
  outline:0;
}
li:not(.active):hover a{
  color: #eee;
  border-left: 5px solid #FCFCFC;
  background-color: #1B1B1B;
}
span[class ^= "icon"]{
  position:absolute;
  left:20px;
  font-size: 1.5em;
  transition: all 0.3s linear;
}

@media only screen and (max-width : 860px){
  
  .text{
    display:none;
  }
  
  .nav-container , a{
    width: 70px;
      margin-right:750px;
  }
   
  a:hover{
    width:200px; 
    z-index:1;
    border-top: 1px solid rgba(255,255,255,0.1);
    border-bottom: 1px solid black;
    box-shadow: 0 0 1px 1px black;
  }
  
  a:hover  .text {
    display:block;
    padding-left:30%;
  }
}
@media only screen and (max-width : 480px){
  .nav-container, a{ width:50px;}
  span[class ^= "icon"]{ left:8px;}
}


</script>
<script type="text/javascript">



$('li').click(function(){
  
  $(this).addClass('active')
       .siblings()
       .removeClass('active');
    
});
</script>
<body>
<c:if test="${msg == 'logout'}">
<a href="/login/main.do"><button type="button" class="btn btn-primary" >로그인</button></a>
</c:if>
<c:if test="${msg == 'success'}">

<b>${id}</b> 님 환영합니다!
<a href="/login/logout.do"><button type="button" class="btn btn-warning" >로그아웃</button></a>
	<a href="#this"><button type="button" class="btn" id="write">새
			글</button></a>
	<a href="/sample/adminBoard.do"><button type="button"
			class="btn">관리자</button></a>
</c:if>
<table class="table table-bordered">

		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				
				<th scope="col">게시판명</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(listss) > 0}">
					<c:forEach items="${listss }" var="rowss">
						<tr>
<%-- 							<td>${rowss.BGNO}</td> --%>
							<td>${rowss.BONAME}</td>
					
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
