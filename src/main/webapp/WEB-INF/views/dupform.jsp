<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/css/appoint.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<!-- 상단 필수항목 -->
<%@ include file="amain_top.jsp"%>
<br><br><br>
<!-- 관리자 의사 수정하기 부분 -->

<br>
<form action="adupdate" class="quick-reservation" method="post">
<div id="wrapper" class="container">
   <header class="quick-reservation__header">
      <h2 class="title">의사 정보 수정</h2>
      <span></span> <span></span>
   </header>
      
      <div class="quick-reservation__form" style="text-align: center">
      <section class="form__content" style="text-align: left; margin-left: 35%">
      <label for="d_number">의사번호</label> ${ddto.d_number }
         <input type="hidden" name="d_number" value="${ddto.d_number }"><div></div><br>
         
      <label for="id">의사아이디</label>
         <input type="text" name="d_id" value="${ddto.d_id }" readonly><div></div><br>
         
      <label for="id">의사비밀번호</label>
         <input type="text" name="d_pw" value="${ddto.d_pw }"><div></div><br>
         
      <label for="id">의사명</label>
         <input type="text" name="d_name" value="${ddto.d_name }"><div></div><br>
            
      <label for="id">진료과</label>
         <input type="text" name="d_class" value="${ddto.d_class }"><div></div><br>
         
      <label for="id">이메일</label>
         <input type="text" name="d_email" value="${ddto.d_email }"><div></div><br>
         
      <label for="id">기타</label>
         <input type="text" name="d_etc" value="${ddto.d_etc }"><div></div><br>
   <br>
   <div id="signup">
      <input type="submit" name="signup" value="수정완료" id="signupbtn">
   </div>
   
</div>
</section>
</div>
</form>
   
<!-- 하단 필수항목 -->
<br><br><br>
<%@ include file="amain_bottom.jsp"%>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>