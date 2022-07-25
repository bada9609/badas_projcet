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
<%@ include file="main_top.jsp"%>
<br><br><br>
<!-- 관리자 환자 수정하기 부분 -->

<br>   
<form action="update" class="quick-reservation" method="post">
<div id="wrapper" class="container">
<header class="quick-reservation__header">
      <h2 class="title">회원 정보 수정</h2>
      <span></span> <span></span>
</header>

<div class="quick-reservation__form" style="text-align: center">
<section class="form__content" style="text-align: left; margin-left: 35%">
   <input type="hidden" name="p_number" value="${p_dto.p_number }">
   
<label for="p_name1">아이디</label> 
   <input type ="text" name="p_id" value="${p_dto.p_id }" style="margin-left: 30px;"><div></div><br>
   
<label for="p_name1">비밀번호</label> 
   <input type ="text" name="p_pw" value="${p_dto.p_pw }" style="margin-left: 18px;"><div></div><br>
   
<label for="p_name1">이름</label> 
   <input type ="text" name="p_name" value="${p_dto.p_name }" style="margin-left: 42px;"><div></div><br>
   
<label for="p_name1">성별</label>
   <input type ="text" name="p_gen" value="${p_dto.p_gen }" style="margin-left: 43px;" readonly><div></div><br>
   
<label for="p_name1">이메일</label> 
   <input type="text" name="p_email" value="${p_dto.p_email }" style="margin-left: 33px;"><div></div><br>
   
<label for="p_name1">주소</label>
   <input type ="text" name="p_addr" value="${p_dto.p_addr }" style="margin-left: 43px;"><div></div><br>

<label for="p_name1">키</label>
   <input type ="text" name="p_height" value="${p_dto.p_height }" style="margin-left: 60px;"><div></div><br>

<label for="p_name1">몸무게</label>
   <input type ="text" name="p_weight" value="${p_dto.p_weight }" style="margin-left: 37px;"><div></div><br>

<label for="p_name1">폰번호</label>
   <input type ="text" name="p_tel" value="${p_dto.p_tel }" style="margin-left: 33px;"><div></div><br>

<label for="p_name1">생년월일</label>
   <input type ="text" name="p_birth" value="${p_dto.p_birth }" style="margin-left: 18px;" readonly><div></div><br>

<label for="p_name1">기타</label><br>
   <input type ="text" name="p_etc" value="${p_dto.p_etc }" style="width: 280px;"><div></div><br>
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
   <%@ include file="main_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>