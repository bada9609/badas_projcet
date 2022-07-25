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
		<hr>

		<div class="section-heading">
			<h2 class="section-heading-title">내과</h2>
			<br>
		</div>

		<div class="part-detail-info-content">
			<div class="editor-wrap">
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a href="buser_i">진료과 안내</a></li>
						<li class="nav-item"><a href="buser_i_doctor">의료진</a></li>
						<li class="nav-item"><a href="#">건강FAQ</a></li>
						<li class="nav-item"><a href="appoint">진료예약</a></li>
					</ul>
				</nav>

				<div class="list_wrap">
					<ul>
						<li class="item_d item1">
							<div class="image">사진</div>
							<div class="cont">
								<strong>백일이 교수</strong>
								<p>[진료분야] 간암, 간경화, 급성간염</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item2">
							<div class="image">사진</div>
							<div class="cont">
								<strong>강삼사 교수</strong>
								<p>[진료분야] 위암, 위장질환, 치료내시경</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item3">
							<div class="image">사진</div>
							<div class="cont">
								<strong>백일이 교수</strong>
								<p>[진료분야] 간암, 간경화, 급성간염</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item4">
							<div class="image">사진</div>
							<div class="cont">
								<strong>손사오 교수</strong>
								<p>[진료분야] 담낭암, 담도폐쇄, 췌장암</p>
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