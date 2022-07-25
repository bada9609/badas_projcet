<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->

<link href="resources/css/login.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<%
 if(session.getAttribute("d_id") != null) {
	 %>
	 <script type="text/javascript">
	 alert("다른 사용자가 이미 로그인 중입니다!");
	 window.location.href = "dmain";
	 </script>
	 <%
	 }
%>
</head>
<body>
	<!-- 상단 필수항목 -->
	<%@ include file="dmain_top.jsp"%>
<div class="inner-wrap2">
	<div class="wrapper">
		<form class="form-signin" action="dlogin" method="post">
			<h2 class="form-signin-heading">로그인</h2>
			<input type="text" class="form-control" name="d_id"
				placeholder="아이디 입력" required="" autofocus="" /> <input
				type="password" class="form-control" name="d_pw"
				placeholder="비밀번호 입력" required="" /> <br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
			&nbsp;&nbsp;&nbsp;
		</form>
	</div>
</div>
	<!-- 하단 필수항목 -->
	<%@ include file="dmain_bottom.jsp"%>

	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>