<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png" />
<meta name="theme-color" content="#1885ed">
<title>andrea cho shop</title>
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">

<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
 
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

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
		<div class="containers header__container">
					<a href="/main">
			<div class="header__logo">
				<img class="header__img" src="/resources/images/top_logo.png" style="width: 35%">
			</div>
					</a>
			<ul class="navs">
				<li class="button-dropdowns"><a href="javascript:void(0)"
					class="dropdowns-toggle"> SHOP <span>▼</span>
				</a>
					<ul class="dropdowns-menu" id = "datashowroom">
					</ul>
				</li>
				
			<li class="button-dropdown"><a href="/mypage/mypage"
					class="dropdowns-toggle"> 마이페이지 <span>▶</span>
				</a>
				</li>
				
				<% if(session.getAttribute("member_id") == null) {%>
				<li class="header__el header__el--blue"><a href="/shopmemberlogin" class="btn btn--white">로그인 →</a></li>
				<%}else{ %>
				<li class="header__el header__el--blue"><a href="/shopmemberlogout" class="btn btn--white" id="gologut"  
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
	
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
<script>

$(document).ready(function(){
	$.ajax({
        type:"get",
        url:"/maintype",
        dataType:"json",
        success:function(maintype){
       	 var list = maintype.datas;
            	var str = "";
           	$(list).each(function(idx, objArr){
           		str += "<li>" + "<a href='/product/shopproductlist?product_type=" + objArr.mp_code + "'>" + objArr.mp_name + "</a>"  + "</li>";
           	 });
           $("#datashowroom").append(str);
        },
        error:function(){
           console.log("데이터 쪽 문제?");
        }
	});
});
</script>
</body>
</html>