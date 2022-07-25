<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css 필수항목 -->
<link href="resources/css/appoint.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<!-- 상단 필수항목 -->
<%@ include file="amain_top.jsp"%>
<br><br><br>
<!-- 관리자 환자 수정하기 부분 -->

<br>   
<form action="aupdate" class="quick-reservation" method="post">
<div id="wrapper" class="container">
<header class="quick-reservation__header">
      <h2 class="title">회원 정보 수정</h2>
      <span></span> <span></span>
</header>

<div class="quick-reservation__form" style="text-align: center">
<section class="form__content" style="text-align: left; margin-left: 35%">
<label for="p_name1">번호</label> ${pdto.p_number }<br>
   <input type="hidden" name="p_number" value="${pdto.p_number }"><div></div><br>
   
<label for="p_name1">아이디</label> 
   <input type ="text" name="p_id" value="${pdto.p_id }"><div></div><br>
   
<label for="p_name1">비밀번호</label> 
   <input type ="text" name="p_pw" value="${pdto.p_pw }"><div></div><br>
   
<label for="p_name1">이름</label> 
   <input type ="text" name="p_name" value="${pdto.p_name }"><div></div><br>
   
<label for="p_name1">성별</label> ${pdto.p_gen }<br>
   <input type ="hidden" name="p_gen" value="${pdto.p_gen }"><div></div><br>
   
<label for="p_name1">이메일</label> 
   <input type ="text" name="p_email" value="${pdto.p_email }"><div></div><br>
   
<label for="p_name1">주소</label>
   <input style="width: 60%;" type ="text" name="p_addr" value="${pdto.p_addr }"><div></div><br>

<label for="p_name1">키</label>
   <input type ="text" name="p_height" value="${pdto.p_height }"><div></div><br>

<label for="p_name1">몸무게</label>
   <input type ="text" name="p_weight" value="${pdto.p_weight }"><div></div><br>

<label for="p_name1">폰번호</label>
   <input type ="text" name="p_tel" id="p_tel" value="${pdto.p_tel }"><div></div><br>

<label for="p_name1">생년월일</label> ${pdto.p_birth }
   <input type ="hidden" name="p_birth" value="${pdto.p_birth }"><div></div><br>

<label for="p_name1">기타</label>
   <input type ="text" name="p_etc" value="${pdto.p_etc }"><div></div><br>
<br>
   <div id="signup">
      <input type="submit" name="signup" value="수정완료" id="signupbtn">
   </div>


</div>
</section>
</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	//전화번호 - 추가
	$(document).ready(function() {  
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
	});
	</script>

   <!-- 하단 필수항목 -->
   <br><br><br>
   <%@ include file="amain_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>