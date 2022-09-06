<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<!-- css 적용 (main, menu) -->

<link href="resources/css/mainimage.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
</head>

<body>
	<%@ include file="main_top.jsp"%>

	<div class="col-md-12">
		<div class="site"> 
		    <%
				if (session.getAttribute("member_id") != null) {
			%>
			<h1 class="site__title"><%=session.getAttribute("member_id")%>님! Andrea Cho Shop에 오신 것을 환영합니다.
			</h1>
			<%
				} else {
			%>
			<h1 class="site__title">Andrea Cho Shop에 오신 것을 환영합니다.</h1>
			<%
				}
			%>
			<h2 class="site__subtitle">8/21~9/10 22SS Season off big sale</h2>
			
			<!-- 슬라이드 -->
			<!-- <div class="section">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03">
					
					<div class="slidewrap">
					<ul class="slidelist">
						슬라이드 영역
						<li class="slideitem"><a> <img
								src="./resources/images/main1.png" style="width:1200px;height:600px">
						</a></li>
						<li class="slideitem"><a>

								<div class="textbox">
									<h3>병원 출입 시스템 변경</h3>
									<p>환자를 포함하여 모든 내원객은 병원 출입을 위해 진료 바코드 또는 KI-PASS QR코드를 준비하셔야
										합니다</p>
									<p>-진료 바코드(진료카드,병원앱,알림톡 및 종이출력물 중 택1)</p>
									<p>-KI-PASS QR코드 (카카오톡,네이버 중 택1)</p>


								</div> <img src="./resources/images/main2.jpg" style="opacity: 0.6;
								width:1200px;height:600px">
						</a></li>
						<li class="slideitem"><a>

								<div class="textbox">
									<h3>환자안전 관리 강화 협조</h3>
									<p>발열 및 호흡기감염증상 등의 코로나19 의심 증상이 있는 경우,</p>
									<p>병원 방문 대신 질병관리본부 콜센터(1399) 및 관할 보건소로 연락하시기 바랍니다.</p>
								</div> <img src="./resources/images/main3.jpg" style="opacity: 0.6;
								width:1200px;height:600px">
						</a></li class="slideitem">


						좌,우 슬라이드 버튼
						<div class="slide-control">
							<div>
								<label for="slide03" class="left"></label> <label for="slide02"
									class="right"></label>
							</div>
							<div>
								<label for="slide01" class="left"></label> <label for="slide03"
									class="right"></label>
							</div>
							<div>
								<label for="slide02" class="left"></label> <label for="slide01"
									class="right"></label>
							</div>
						</div>


					</ul>

					페이징	
					<ul class="slide-pagelist">
						<li><label for="slide01"></label></li>
						<li><label for="slide02"></label></li>
						<li><label for="slide03"></label></li>
					</ul>
							
				</div>


			</div> -->
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<!-- 로그인 후 아이디 넘겨주기    -->
	<form action="tpboard" method="post">
		<input type="hidden" name="member_id"
			value="<%=session.getAttribute("member_id")%>">
	</form>


	<%@ include file="main_bottom.jsp"%>
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>


</body>
</html>