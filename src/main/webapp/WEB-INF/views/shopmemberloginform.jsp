<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">
<%
 if(session.getAttribute("member_id") != null) {
    %>
    <script type="text/javascript">
    alert("이미 로그인 중입니다!");
    window.location.href = "main";
    </script>
    <%
    }
%>
</head>
<body>
   <!-- 상단 필수항목 -->
   <%@ include file="main_top.jsp"%>
<div class="inner-wrap3">
   <div class="wrapper">
      <form class="form-signin" action="shopmemberlogin" method="post">
         <h2 class="form-signin-heading">로그인</h2>
         <input type="text" class="form-control" name="member_id" id="member_pw" placeholder="아이디 입력" required="" autofocus="" /> 
         <input type="password" class="form-control" name="member_pw" id="member_pw" placeholder="비밀번호 입력" required="" /> <br>
         <button class="btn btn-lg btn-primary btn-block" type="submit">
         	로그인</button>
         	
         &nbsp;&nbsp;&nbsp; 
         
         <a href="insertsm"> <input
            class="btn btn-lg btn-primary btn-block" type="button" value="회원가입"
            style="background-color: white; color: black;">
         </a>
      </form>
   </div>
</div>
   <!-- 하단 필수항목 -->
   <%@ include file="main_bottom.jsp"%>

   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>