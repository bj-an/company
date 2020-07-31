<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<jsp:include page="/WEB-INF/jsp/layout/include-header.jsp" />
<meta charset="UTF-8">
<title>코드관리</title>

<script type="text/javascript">
    	function detailbtn(val) {
    		var maincode =  val;
            
            
            var postData = {'maincode' : maincode };
            
            $.ajax({
            	type : 'POST',
                data : postData,
                url : "/manage/selectdetailcode.do",
                //dataType : "json",
                //dataType: "text",
                success : function(data) {
				var vText = "";
               	for(var i=0; i< data.length; i++){
               		vText += "<tr><td>" + data[i].NOOO+ "</td><td>" 
				 		+ data[i].MAINCODE+ "</td><td>" 
				 		+ data[i].DETAILCODE + "</td><td>"
				 		+ data[i].DETAILCODENAME + "</td><td>"
				 		+ data[i].ISUSE + "</td><td>"
				 		+ data[i].WRITER + "</td><td>"
				 		+ data[i].OKDATEDATE + "</td></tr>"
				 }
				 var tb =
					 "<table class=\"table-bordered\">"
					 +"<thead class=\"thead-dark\">       "
					 +"	<tr>                           "
					 +"	  <th scope=\"col\">NO</th>      "
					 +"	  <th scope=\"col\">메인코드</th>  "
					 +"	  <th scope=\"col\">상세코드</th>  "
					 +"	  <th scope=\"col\">메인코드 명</th>"
					 +"	  <th scope=\"col\">사용유무</th>  "
					 +"	  <th scope=\"col\">등록자</th>    "
					 +"	  <th scope=\"col\">등록일</th>    "
					 +"	</tr>                          "
					 +"  </thead>                       "
					 +"                                 "
					 +"<tbody>                      "
					 + vText
					 +"</tbody>"
         			 +"</table>"
         			 
					 ;
         			$("#detailcodetable").html(tb);
			
                },
                error : function(error) {
                    
                    alert("error : " + error);
                }
            });
    	}
    	
// $(document).ready(function() {
//     	$("a[name='updateCode']").on("click", function(e) { 
//     		e.preventDefault();
//     		fn_updatecode($(this));
//     	});
    // });
    		
    	
//     	function fn_updatecode(obj) {
//     		var comSubmit = new ComSubmit(); 
//     		comSubmit.setUrl("/manage/updatemaincode.do");
//     		comSubmit.addParam("MAINCODE", obj.parent().find("#MAINCODE").val());
//     		comSubmit.submit();

    	
//     	}
    		
function fnUpdate(code) {
	$("input[name='updtCode']").val(code);
	document.updateCode.action = "/manage/updatemaincode.do";
	document.updateCode.submit();
}


$(function(){
	var prop_id=$(":text").prop("id");
	var prop_class = $(":text").prop("class");
	var prop_readonly = $(":text").prop("readonly");
	var prop_disabled = $(":text").prop("disabled");
	
	var attr_id = $(":text").attr("id");
    var attr_class = $(":text").attr("class");
    var attr_readonly = $(":text").attr("readonly");
    var attr_disabled = $(":text").attr("disabled");
     
    alert("id값 prop : " + prop_id + " , attr : " +  attr_id);
    alert("class값 prop : " + prop_class + " , attr : " +  attr_class);
    alert("readonly값 prop : " + prop_readonly + " , attr : " +  attr_readonly);
    alert("disabled값 prop : " + prop_disabled + " , attr : " +  attr_disabled);


})


</script>
<style>
div#regist{
float: right;

}
.table-bordered {
float:right;
width: 91%;
margin-bottom : 20px;

}

</style>
</head>
<body>

<jsp:include page="/layout/adminHeader.do" />
<input type="text" id ="text_field" class="text_class" readonly="readonly" disabled="disabled"/>
	<h2>공 통 코 드</h2>
<jsp:include page="/layout/adminBody.do" />
	
	<a href="/manage/addcodepage.do"><div id="regist"><button class="btn-success">등록</button></div></a>
	<br>
<form name="updateCode">
<input type="hidden" name="updtCode"/>
	<table class="table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col">NO</th>
				<th scope="col">메인코드</th>
				<th scope="col">메인코드 명</th>
				<th scope="col">사용유무</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${fn:length(listt) > 0}">
					<c:forEach items="${listt}" var="code">
						<tr>
							<td>${code.NOOO}</td>
							<td class="title"><a href="#" onclick="detailbtn('${code.MAINCODE}');"><font color="skyblue"><b>${code.MAINCODE}</b></font></a></td>
						<td><a href="#" onclick="fnUpdate('${code.MAINCODE}')"><font color="skyblue"><b>${code.MAINCODENAME}</b></font></a>
							<td>${code.ISUSE}</td>
							<td>${code.WRITER}</td>
							<td>${code.OKDATEDATE}</td>
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
						</form>		


	<div id="detailcodetable"></div>
</body>

</html>