<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
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
</style>
</head>
<body>
   <!-- 상단 필수항목 -->
   <%@ include file="main_top.jsp"%>
   <br><br><br>
   <!-- 회원가입 부분 -->

   <br>
   <form action="patientinsert" method="POST" id="signform" class="quick-reservation">
      <div id="wrapper" class="container">
         <header class="quick-reservation__header">
         <h2 class="title">회원 가입 정보 입력</h2>
         <span></span> <span></span>
      </header>
         
         <div class="quick-reservation__form" style="text-align: center">
         <section class="form__content" style="text-align: left; margin-left: 35%">
         <label for="id">아이디</label> 
         <input type="text" id="p_id" name="p_id" placeholder="ID" style="margin-left: 30px; margin-right: 5px;">
         <input type="button" id="btnId" value="중복확인" style="width: 80px;">
         <div class="id regex"></div><br>
         



         <label for="pw">비밀번호</label> 
         <input type="text" id="p_pw" name="p_pw" placeholder="PASSWORD" style="margin-left: 18px;">
         <div class="pw regex"></div><br>



         <label for="p_name">이름</label> 
         <input type="text" id="p_name" name="p_name" placeholder="Name" style="margin-left: 42px;">
         <div class="name regex"></div><br>


         <label for="p_birth">생년월일</label> 
         <input type="text" id="p_birth" name="p_birth" placeholder="ex) 19990101" style="margin-left: 18px;">
         <div class="birth regex"></div><br>


         <label for="p_email">이메일 주소</label> 
         <input type="text" id="p_email" name="p_email" placeholder="E-mail" style="margin-left: 3px;">
         <div class="email regex"></div><br>

         <label for="p_tel">휴대폰 번호</label> 
         <input type="text" id="p_tel" name="p_tel" placeholder="ex)010-0000-0000" style="margin-left: 3px;">
         <div class="phone regex"></div><br>


         <label for="p_gen">성별 </label> 
         <select id="p_gen" name="p_gen" style="margin-left: 43px;">
            <option name="p_gen1" value="남자">남</option>
            <option name="p_gen2" value="여자">여</option>
         </select> <br> 
         
         <label>주소: </label> 
         <input style="margin-left: 43px;"placeholder="시,구,동까지 입력 " name="p_addr" id="p_addr" type="text"><div></div><br>

          <label for="p_height">키 입력</label> 
          <input type="text" id="p_height" name="p_height" style="margin-left: 30px;">cm <div></div><br>
            
         <label for="p_weight">몸무게 입력</label> 
         <input type="text" id="p_weight" name="p_weight" style="margin-left: 7px;">kg <div></div><br> 
            
            <label> 비고사항: </label><br>
            <input type="text" id="p_etc" name="p_etc" style="width: 350px; height: 250px;">
         <br><br><br>
         <div id="signup">
            <input type="button" name="signup" value="회원가입" id="signupbtn" disabled="disabled">      
         </div>
      </div>
   </section>
   </div>
   </form>


   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//전화번호 - 추가
	$("#p_tel").keydown(function(event) {
	    var key = event.charCode || event.keyCode || 0;
	    $text = $(this);
	    if (key !== 8 && key !== 9) {
	        if ($text.val().length === 3) {
	            $text.val($text.val() + "-");
	        }
	        if ($text.val().length === 8) {
	            $text.val($text.val() + "-");
	        }
	    }
	    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
	});
	//생년월일
	$("#p_birth").keydown(function(event) {
	    var key = event.charCode || event.keyCode || 0;
	    $text = $(this);
	    if (key !== 8) {
	        if ($text.val().length === 4) {
	            $text.val($text.val() + "-");
	        }
	        if ($text.val().length === 7) {
	            $text.val($text.val() + "-");
	        }
	    }
	    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
	});


	//아이디 중복방지
		$('#btnId').click(function(){
		 $.ajax({
	           type:"POST",
	           url:"idcheck",
	           data:{
	                  "p_id":$('#p_id').val()
	           },
	           success:function(data){  
	                  if($.trim(data)=="y"){
	                     if($('#p_id').val()!='y'){ 
	                    	 swal("사용가능","사용가능한 아이디입니다!","success");
	                    	 $(".id.regex").html(null);
	                    	 $("#signupbtn").removeAttr("disabled");
	                     }
	                    }else{
	                     if($('#p_id').val()!="n"){
	                    	 swal("사용불가","이미 사용중인 아이디입니다! 변경해주세요!","error");
	                        $(".id.regex").html("아이디를 변경하세요");
	    					$(".id.regex").css("color", "red");
	    					$("#signupbtn").attr("disabled", "disabled");
	    					return;
	                         
	                     }
	                  }
	               }          
	          }) ;
	        });

		
		$(function() {
			
			//비밀번호 유효성검사
			$("#p_pw").on("input", function() {
				var regex = /^[A-Za-z\d]{3,12}$/;
				var result = regex.exec($("#p_pw").val())

				if (result != null) {
					$(".pw.regex").html("");
				} else {
					$(".pw.regex").html("영어대소문자,숫자 3-11자리");
					$(".pw.regex").css("color", "red");
				}
			});

			//이름 유효성검사
			$("#p_name").on("input", function() {
				var regex = /[가-힣]{2,}/;
				var result = regex.exec($("#p_name").val());

				if (result != null) {
					$(".name.regex").html("");
				} else {
					$(".name.regex").html("한글만 입력 가능합니다.");
				}

			})

			//전화번호 유효성검사
			$("#p_tel").on("input", function() {
				var regex = /^01\d-\d{3,4}-\d{4}$/;
				var result = regex.exec($("#p_tel").val());

				if (result != null) {
					$(".phone.regex").html("");
				} else {
					$(".phone.regex").html("올바른 번호가 아닙니다");
				}

			})

			//email유효성 검사
			$("#p_email").on("input", function() {
				var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
				var result = regex.exec($("#p_email").val());

				if (result != null) {
					$(".email.regex").html("");
				} else {
					$(".email.regex").html("올바른 이메일이 아닙니다");
				}
			})
			//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
			$("#signupbtn").on("click", function() {
				var id = $("#p_id").val();
				var pw = $("#p_pw").val();
				var name = $("#p_name").val();
				var phone = $("#p_tel").val();
				var email = $("#p_email").val();
				var idregex = /^[a-z][a-z\d]{4,11}$/;
				var nameregex = /[가-힣]{2,}/;
				var phoneregex = /^01\d\d{3,4}\d{4}$/;
				var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

				var idregex = idregex.exec(id);
				if (idregex == null) {
					swal("경고","아이디양식을 다시 확인해주세요","warning");
					return;
				}
				
				var nameregex = nameregex.exec(name);
				if (nameregex == null) {
					swal("경고","이름양식을 다시 확인해주세요","warning");
					return;
				}

				var emailregex = emailregex.exec(email);
				if (emailregex == null) {
					swal("경고","이메일양식을 다시 확인해주세요","warning");
					return;
				}
				
				if($("#p_birth").val()==""){
					swal("경고","생년월일을 다시 확인해주세요","warning");  
					return ;
				}
				
				if($("#p_height").val()==""){
					swal("경고","신장을 다시 확인해주세요","warning");  
					return ;
				}
				if($("#p_weight").val()==""){
					swal("경고","몸무게 입력을 다시 확인해주세요","warning");  
					return ;
				}
					

				//빈칸 없을 때 제출.
				swal("축하드립니다","가입에 성공하셨습니다~","success");
				$("#signform").submit();
				

			})
		})
</script>

   <!-- 하단 필수항목 -->
   <br><br><br>
   <%@ include file="main_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>