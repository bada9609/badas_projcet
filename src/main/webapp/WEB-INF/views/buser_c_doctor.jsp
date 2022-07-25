<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/buser.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
</head>
<body>
	<%@ include file="main_top.jsp"%>
	<div class="inner-wrap">

		<div class="section-heading">
			<h2 class="section-heading-title">소아과</h2>
			<br>
		</div>

		<div class="part-detail-info-content">
			<div class="editor-wrap">
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a href="buser_c">진료과 안내</a></li>
						<li class="nav-item"><a href="buser_c_doctor">의료진</a></li>
						<li class="nav-item"><a href="#">건강FAQ</a></li>
						<li class="nav-item"><a href="appoint">진료예약</a></li>
					</ul>
				</nav>

				<div class="list_wrap">
					<ul>
						<li class="item_d item1">
							<div class="image">사진</div>
							<div class="cont">
								<strong>장일이 교수</strong>
								<p>[진료분야] 고위험신생아, 감염 및 각종질환, 미숙아</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item2">
							<div class="image">사진</div>
							<div class="cont">
								<strong>허삼사 교수</strong>
								<p>[진료분야] 청소년.성인선청성심장병(GUCH),소아 심부전</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item3">
							<div class="image">사진</div>
							<div class="cont">
								<strong>유오일 교수</strong>
								<p>[진료분야] 면역 결핍증, 결핵, 여행자 의학</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item4">
							<div class="image">사진</div>
							<div class="cont">
								<strong>베르바토프 교수</strong>
								<p>[진료분야] 소아비만, 크론병, 아토피</p>
								<a href="#">상세소개</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<%@ include file="main_bottom.jsp"%>
		<script type="text/javascript" src="resources/js/main.js"></script>
		<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>