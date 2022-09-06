<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- css 필수항목 -->
<link href="resources/css/appoint.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
input, select{
	 border: none;
	 background: transparent;
	 height: 30px
}
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
</head>
<body>
   <br>
   <form action="insertAdmin" method="POST" id="adminsignform" class="quick-reservation">
      <div id="wrapper" class="container">
         <header class="quick-reservation__header">
         <h2 class="title">회원 가입 정보 입력</h2>
         <span></span> <span></span>
      </header>
         <div class="quick-reservation__form" style="text-align: center">
<section class="form__content" style="text-align: left; margin-left: 35%">
         <label for="id">아이디</label> 
         <input type="text" id="admin_id" name="admin_id" style="margin-left: 30px; margin-right: 5px;" required oninput = "checkId()">
		 <br>
		 <span class="id_ok" id="id_ok">
		 	<label>사용 가능한 아이디입니다.</label>
		 </span>
		 <span class="id_already" id="id_already">
		 	<label>누군가 이 아이디를 사용하고 있어요.</label>
		 </span>
		 <div class="id regex"></div><br>
		 
         <label for="pw">비밀번호</label> 
         <input type="text" id="admin_pw" name="admin_pw" placeholder="PASSWORD" style="margin-left: 18px;">
         <div class="pw regex"></div><br>
		
         <label for="admin_email">이메일 주소</label> 
         <input type="text" id="admin_email" name="admin_email" placeholder="E-mail" style="margin-left: 3px;">
         <div class="email regex"></div><br>
         
         <div class="mail_check_wrap">
         	<div class="mail_check_input_box" id="mail_check_input_box_false" name="mail_check_input_box_false">
         		<input type="text" id="mail_check_input" name="mail_check_input" class="mail_check_input">
  		 	</div>
  		 	<div class="mail_check_button" id="mail_check_button">
  		 		<label>인증번호 발송</label>
  		 	</div>
  		 	<div class="clearfix"></div>
  		 	<span id="mail_check_input_box_warn"></span>
  		 </div>
         <input type="text" id="checkemailvalue" hidden="hidden" value="no">
         <br><br><br>
         <div id="signup">
            <input type="button" name="signup" value="회원가입" id="signupbtn">      
         </div>
      </div>
</section>
   </div>
   </form>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

var code = "";

//아이디 중복방지
        function checkId(){
            var admin_id = $("#admin_id").val();
		 $.ajax({
	           type:"POST",
	           url:"adminidCheck",
	           data:{admin_id:admin_id},
	           success:function(data){  // 계산된 cnt 값 받아오기 
	                  if(data != 1){ //cnt 값이 1이 아니라면 사용가능 아이디    
	                	  	 $("#id_ok").css("display","inline-block"); 
	                      	 $("#id_already").css("display", "none");
	                     } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                    	 $("#id_already").css("display","inline-block");
	                         $("#id_ok").css("display", "none");
	                         swal("경고","누군가 이 아이디를 사용하고 있어요.","warning");
	                         $('#admin_id').val('');
	                     }
	                  },
	                  error:function(){
	                      alert("에러입니다");
	                  }      
	           });
			};
			
		/*인증번호 이메일 전송*/
		$(".mail_check_button").click(function(){
			var email = $("#admin_email").val();		// 입력한 이메일
		    var cehckBox = $("#mail_check_input");      // 인증번호 입력란
		    var boxWrap = $("#mail_check_input_box");   // 인증번호 입력란 박스
			
			$.ajax({
				type:"GET",
				url:"mailCheck?email=" + email,
				success:function(data){
					console.log("seconde data : "+data);
					code = data;
				}
						
			});
		});
		
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function(){
			
		    var inputCode = $("#mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과  
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");  
		        $("#checkemailvalue").val("yes");
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    } 
		    
		});
					
		$(function() {
			//비밀번호 유효성검사
			$("#admin_pw").on("input", function() {
				var regex = /^[A-Za-z\d]{3,12}$/;
				var result = regex.exec($("#member_pw").val())

				if (result != null) {
					$(".pw.regex").html("");
				} else {
					$(".pw.regex").html("<label>영어대소문자,숫자 3-11자리</label>");
				}
			});

			
			//email유효성 검사
			$("#admin_email").on("input", function() {
				var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
				var result = regex.exec($("#admin_email").val());

				if (result != null) {
					$(".email.regex").html("");
				} else {
					$(".email.regex").html("<label>올바른 이메일이 아닙니다.</label>");
				}
			})
			//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
			$("#signupbtn").on("click", function() {
				console.log("작동확인");
				var id = $("#admin_id").val();
				var pw = $("#admin_pw").val();
				var email = $("#checkemailvalue").val();
				var idregex = /^[a-z][a-z\d]{4,11}$/;
				var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

				var idregex = idregex.exec(id);
				if (idregex == null) {
					swal("경고","아이디양식을 다시 확인해주세요.","warning");
					return;
				}
				
				
				if (email == "no"){
					swal("경고","이메일 인증을 진행해주세요.","warning");
					return;
				}
				
				
				//빈칸 없을 때 제출.
				swal("축하드립니다","가입에 성공하셨습니다~","success");
				$("#adminsignform").submit();
				
			})
		})
</script>

   <!-- 하단 필수항목 -->
   <br><br><br>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>