<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="https://image.ibb.co/fOur3b/favicon.png" />
<meta name="theme-color" content="#1885ed">
<title>오호병원</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/menu.css" rel="stylesheet">


<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
 

<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<!-- 하이퍼링크 밑줄 지우기 -->
<style type="text/css"> 
a { text-decoration:none } 
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function gologut(){
	swal("로그아웃성공","","success");
}
</script>
</head>

<body>
	<header class="header">
	<div>
		<div class="container header__container">
					<a href="main">
			<div class="header__logo">
				<img class="header__img" src="./resources/images/logo.png"
					style="width: 15%">
				<h1 class="header__title">
					<span class="header__light">오호병원</span>
				</h1>
			</div>
					</a>

			<ul class="nav">
				<li class="button-dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle"> 병원안내 <span>▼</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="hinfo"> 병원소개 </a></li>
						<li><a href="hyear"> 연혁 </a></li>
						<li><a href="hmap"> 조직도 </a></li>
						<li><a href="hroad"> 오시는길 </a></li>
					</ul></li>
				<li class="button-dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle"> 이용안내 <span>▼</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="tinfo"> 진료안내 </a></li>
						<li><a href="tfloor"> 층별안내 </a></li>
						<li><a href="tpay"> 결제안내 </a></li>

					</ul></li>
				<li class="button-dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle"> 진료과 <span>▼</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="buser_n"> 이비인후과 </a></li>
						<li><a href="buser_i"> 내과 </a></li>
						<li><a href="buser_c"> 소아과 </a></li>
						<li><a href="buser_s"> 신경외과 </a></li>
						<li><a href="buser_u"> 특성화센터 </a></li>
						<li><a href="buser_co"> 협진센터 </a></li>
					</ul></li>
				<li class="button-dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle"> 고객서비스 <span>▼</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="tpboard?page=1"> 홈닥터 </a></li>
						<li><a href="appoint"> 진료예약 </a></li>
						<li><a href="appoint_list"> 진료예약 내역 </a></li>

					</ul></li>
				<li class="button-dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle"> 마이페이지 <span>▼</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="pedit"> 정보수정 </a></li>

					</ul>
				</li>
				<% if(session.getAttribute("p_id") == null) {%>
				<li class="header__el header__el--blue"><a href="login" class="btn btn--white">로그인 →</a></li>
				<%}else{ %>
				<li class="header__el header__el--blue"><a href="logout" class="btn btn--white" id="gologut"  
					onclick="gologut()">로그아웃</a></li>
				<%} %>
				
			</ul>


			<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		</div>
		</div>
	</header>
	
	
	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
	
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>