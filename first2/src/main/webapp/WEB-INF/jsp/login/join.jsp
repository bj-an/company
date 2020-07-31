<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/layout/header2.jsp" />
<link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css"
	rel="stylesheet" type="text/css">
	
	<script type='text/javascript'
		src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script>
	<script type='text/javascript'>
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pw").val();
				var pwd2 = $("#confirmpw").val();

				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");

					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});
		});

		var f = document.getElementById("joinForm");

		f.onsubmit = function() {
			var pwd1 = $("#pw").val();
			var pwd2 = $("#confirmpw").val();

			if (pwd1 != pwd2) {
				alert("비밀번호를 다시 확인해 주세요");
				return false;
			}
		}
		$('#selectEmail').change(function() { // 
			$("#selectEmail option:selected").each(function() { //each : select했을시 옵션의  

				if ($(this).val() == '1') {
					//직접입력일 경우 
					$("#email2").val(''); //값 초기화
					$("#email2").attr("disabled", false); //활성화  , disabled : true일시 값이 고정되며 수정이불가한 상태가됨

				} else { //직접입력이 아닐경우 

					$("#email2").val($(this).text()); //선택값 입력 
					$("#email2").attr("disabled", true); //비활성화
				}
			});
		});
		</script>
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr4").value = extraAddr;
                
                } else {
                    document.getElementById("addr4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
            }
        }).open();
    }
    
  //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    var idck = 0;
    $(function() {
        //idck 버튼을 클릭했을 때 
        $("#idck").click(function() {
            
            //userid 를 param.
            var userid =  $("#id").val(); 
            
            $.ajax({
                async: true,
                type : 'POST',
                data : userid,
                url : "/login/idcheck.do",
                dataType : "json",
                contentType: "application/json; charset=UTF-8",
                success : function(data) {
                    if (data.cnt > 0) {
                        
                        alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                        $("#userid").focus();
                    
                    } else {
                        alert("사용가능한 아이디입니다.");
                        $("#userpwd").focus();
                        //아이디가 중복하지 않으면  idck = 1 
                        idck = 1;
                        
                    }
                },
                error : function(error) {
                    
                    alert("error : " + error);
                }
            });
        });
        

    });

</script>
	
<script type="text/css">
#mc_embed_signup

  {

    background: #24323d !important;

    color: #707e87 !important;

    font-size: 1.2em !important;

    width:100% !important;

    margin: 10px auto !important;



  }

  #mc_embed_signup form

  {

    padding: 0!important;

  }

  #mc_embed_signup h2

  {

    color: #ffffff !important;

    background: none !important;

    text-align: center !important;

    padding: 50px 0 0 0 !important;

    font-weight: 700 !important;

    font-size: 1.3em !important;

    line-height: 70px !important;

  }

#mc_embed_signup .mc-field-group input
{
  width:100%!important;
}

	#mc_embed_signup input

  {

    background-color: #24323d !important;

    border:1px solid #707e87 !important;

    color: #b09a86 !important;

    font-weight: 300 !important;

    height:30px !important;
    
    border-radius: 0!important;

  }

  #mc_embed_signup .button

  {

    color: #ffffff !important;

    background: #1ab188 !important;

    width: 90% !important;

    margin: 30px auto!important;

    padding: 0 30px 0 30px!important;
    
    border: none !important;

    border-radius: 0!important;

    font-size: 1em !important;

    padding: 20px 0 50px 0!important;

    text-transform: uppercase !important;
    
    display: block !important;


  }

  #mc_embed_signup .mc-field-group

  {

    padding: 0 !important;

    width:90% !important;
    
    margin: 0 auto!important;

  }

  #mc_embed_signup .mc-field-group label

  {

    padding: 20px 20px 20px 0!important;

  }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Begin MailChimp Signup Form -->




	<div id="mc_embed_signup">

		<form id="joinForm" action="/login/joingo.do" method="post">

			<div id="mc_embed_signup_scroll">

				<h2>회원가입</h2>

				<div class="indicates-required">
					<span class="asterisk">*</span> indicates required
				</div>

				<div class="mc-field-group">

					<label for="id">ID <span class="asterisk">*</span>

					</label> <input type="text" value="" name="id" class="required text"
						id="id" placeholder="Insert ID" required>
				
					<button id="idck" name="idck">중복검사</button>
				</div>

				<div class="mc-field-group">

					<label for="pw">비밀번호 </label> <input type="password" value=""
						name="pw" class="" id="pw" placeholder="Insert password" required>

				</div>

				<div class="mc-field-group">

					<label for="confirmpw">비밀번호 확인 </label> <input type="password"
						value="" name="confirmpw" class="" id="confirmpw"
						placeholder="Insert password" required>
				</div>

				<div class="alert alert-success" id="alert-success">비밀번호가
					일치합니다.</div>

				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
					않습니다.</div>





				<div class="mc-field-group">

					<label for="name">이름</label> <input type="text" value=""
						name="name" class="" id="name" placeholder="Insert Name" required>

				</div>

				<div class="mc-field-group">

					<label for="phonenum">휴대폰 번호</label> <input type="number" value=""
						name="phonenum"  id="phonenum" placeholder="010xxxxxxxx"
						required>

				</div>


				<div style="height: 100px">

					<label for="email">이메일</label><br> <input type="text" value=""
						name="email" class="" id="email" placeholder="Insert Email"
						size="50" style="width: 400px" autocomplete="off" required>
					<span>@</span>
					 <input type="text" name="email2" id="email2"
						style="width: 400px;" value="naver.com"> <select
						style="width: 100px; margin-right: 10px" name="selectEmail"
						id="selectEmail">

						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="worldsoft.co.kr">worldsoft.co.kr</option>
						<option value="1">직접입력</option>
					</select>
				</div>
				


				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="addr1" id="addr1" type="text"
						readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="sample6_execDaumPostcode()">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="addr3"
						id="addr3" type="text" />
				</div>
					<div class="form-group">
					<input class="form-control" placeholder="참고항목" name="addr4"
						id="addr4" type="text" />
				</div>


				<input type="submit" value="가입하기" name="join" id="join"
					class="button"> <a href="/login/main.do"><input
					value="취소" name="cancel" id="cancel" class="button"></a>

			</div>

		</form>

	</div>


</body>
</html>