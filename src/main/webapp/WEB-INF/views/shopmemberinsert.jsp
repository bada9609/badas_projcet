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
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
</style>
</head>
<body>
   <!-- 상단 필수항목 -->
   <%@ include file="main_top.jsp"%>
   <br><br><br>
   <!-- 회원가입 부분 -->

   <br>
   <form action="insertShopMember" method="POST" id="shopsignform" class="quick-reservation">
      <div id="wrapper" class="container">
         <header class="quick-reservation__header">
         <h2 class="title">회원 가입 정보 입력</h2>
         <span></span> <span></span>
      </header>
         
         <div class="quick-reservation__form" style="text-align: center">
         <section class="form__content" style="text-align: left; margin-left: 35%">
         <label for="id">아이디</label> 
         <input type="text" id="member_id" name="member_id" style="margin-left: 30px; margin-right: 5px;" required oninput = "checkId()">
		 <br>
		 <span class="id_ok" id="id_ok">
		 	<label>사용 가능한 아이디입니다.</label>
		 </span>
		 <span class="id_already" id="id_already">
		 	<label>누군가 이 아이디를 사용하고 있어요.</label>
		 </span>
		 <div class="id regex"></div><br>
         
         
         <label for="pw">비밀번호</label> 
         <input type="text" id="member_pw" name="member_pw" placeholder="PASSWORD" style="margin-left: 18px;">
         <div class="pw regex"></div><br>

         <label for="p_name">이름</label> 
         <input type="text" id="member_name" name="member_name" placeholder="Name" style="margin-left: 42px;">
         <div class="name regex"></div><br>

         <label for="p_birth">생년월일</label> 
         <input type="text" id="member_birth" name="member_birth" placeholder="ex) 19990101" style="margin-left: 18px;">
         <div class="birth regex"></div><br>

         <label for="p_email">이메일 주소</label> 
         <input type="text" id="member_email" name="member_email" placeholder="E-mail" style="margin-left: 3px;">
         <div class="email regex"></div><br>

         <label for="p_tel">휴대폰 번호</label> 
         <input type="text" id="member_number" name="member_number" placeholder="ex)010-0000-0000" style="margin-left: 3px;">
         <div class="phone regex"></div><br>
         
         <label>주소 1: </label> 
  		 <input style="margin-left: 43px; class="address_input_1" name="member_addr" id="member_addr" readonly="readonly" type="text"><br>
		 <label>주소 2: </label>
		 <input style="margin-left: 43px; class="address_input_2" name="member_addr2" id="member_addr2" readonly="readonly" type="text">
		 <br>
		 <div class="address_button" onclick="execution_daum_address()">
		 	<label>주소찾기</label>
		 </div>

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

	//전화번호 - 추가
	$("#member_number").keydown(function(event) {
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
	$("#member_birth").keydown(function(event) {
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
        function checkId(){
            var member_id = $("#member_id").val();
		 $.ajax({
	           type:"POST",
	           url:"idCheck",
	           data:{member_id:member_id},
	           success:function(data){  // 계산된 cnt 값 받아오기 
	                  if(data != 1){ //cnt 값이 1이 아니라면 사용가능 아이디    
	                	  	 $("#id_ok").css("display","inline-block"); 
	                      	 $("#id_already").css("display", "none");
	                     } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                    	 $("#id_already").css("display","inline-block");
	                         $("#id_ok").css("display", "none");
	                         swal("경고","누군가 이 아이디를 사용하고 있어요.","warning");
	                         $('#member_id').val('');
	                     }
	                  },
	                  error:function(){
	                      alert("에러입니다");
	                  }      
	           });
			};
		/* 다음 주소 연동 */
		function execution_daum_address(){
			new daum.Postcode({
			oncomplete: function(data) {
				//팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
				
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
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
            	$("[name=member_addr]").val(data.zonecode);
            	$("[name=member_addr2]").val(addr);
			} 
		    }).open();
		}
			
			
		$(function() {
			//비밀번호 유효성검사
			$("#member_pw").on("input", function() {
				var regex = /^[A-Za-z\d]{3,12}$/;
				var result = regex.exec($("#member_pw").val())

				if (result != null) {
					$(".pw.regex").html("");
				} else {
					$(".pw.regex").html("<label>영어대소문자,숫자 3-11자리</label>");
				}
			});

			//이름 유효성검사
			$("#member_name").on("input", function() {
				var regex = /[가-힣]{2,}/;
				var result = regex.exec($("#member_name").val());

				if (result != null) {
					$(".name.regex").html("");
				} else {
					$(".name.regex").html("<label>한글만 입력 가능합니다.</label>");
				}

			})

			//전화번호 유효성검사
			$("#member_number").on("input", function() {
				var regex = /^01\d-\d{3,4}-\d{4}$/;
				var result = regex.exec($("#member_number").val());

				if (result != null) {
					$(".phone.regex").html("");
				} else {
					$(".phone.regex").html("<label>올바른 번호가 아닙니다.</label>");
				}

			})

			//email유효성 검사
			$("#member_email").on("input", function() {
				var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
				var result = regex.exec($("#member_email").val());

				if (result != null) {
					$(".email.regex").html("");
				} else {
					$(".email.regex").html("<label>올바른 이메일이 아닙니다.</label>");
				}
			})
			//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
			$("#signupbtn").on("click", function() {
				var id = $("#member_id").val();
				var pw = $("#member_pw").val();
				var name = $("#member_name").val();
				var phone = $("#member_number").val();
				var email = $("#member_email").val();
				var idregex = /^[a-z][a-z\d]{4,11}$/;
				var nameregex = /[가-힣]{2,}/;
				var phoneregex = /^01\d\d{3,4}\d{4}$/;
				var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

				var idregex = idregex.exec(id);
				if (idregex == null) {
					swal("경고","아이디양식을 다시 확인해주세요.","warning");
					return;
				}
				
				var nameregex = nameregex.exec(name);
				if (nameregex == null) {
					swal("경고","이름양식을 다시 확인해주세요.","warning");
					return;
				}

				var emailregex = emailregex.exec(email);
				if (emailregex == null) {
					swal("경고","이메일양식을 다시 확인해주세요.","warning");
					return;
				}
				
				if($("#member_birth").val()==""){
					swal("경고","생년월일을 다시 확인해주세요.","warning");  
					return ;
				}
				
				if($("#member_addr").val()==""){
					swal("경고","주소를 입력해주세요.","warning");  
					return ;
				}
				
				//빈칸 없을 때 제출.
				swal("축하드립니다","가입에 성공하셨습니다~","success");
				$("#shopsignform").submit();
				
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