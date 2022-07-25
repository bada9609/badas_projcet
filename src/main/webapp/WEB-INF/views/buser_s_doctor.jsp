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
			<h2 class="section-heading-title">신경외과</h2>
			<br>
		</div>

		<div class="part-detail-info-content">
			<div class="editor-wrap">
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a href="buser_s">진료과 안내</a></li>
						<li class="nav-item"><a href="buser_s_doctor">의료진</a></li>
						<li class="nav-item"><a href="#">건강FAQ</a></li>
						<li class="nav-item"><a href="appoint">진료예약</a></li>
					</ul>
				</nav>

				<div class="list_wrap">
					<ul>
						<li class="item_d item1">
							<div class="image">사진</div>
							<div class="cont">
								<strong>신기해 교수</strong>
								<p>[진료분야] 척수/척수종양 및 척추외상, 요통</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item2">
							<div class="image">사진</div>
							<div class="cont">
								<strong>김부각 교수</strong>
								<p>[진료분야] 수두증, 지방종척수수막류</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item3">
							<div class="image">사진</div>
							<div class="cont">
								<strong>오스카 교수</strong>
								<p>[진료분야] 뇌동맥류, 뇌동정맥기형, 뇌하수체 종양</p>
								<a href="#">상세소개</a>
							</div>
						</li>

						<li class="item_d item4">
							<div class="image">사진</div>
							<div class="cont">
								<strong>승이준 교수</strong>
								<p>[진료분야] 목디스크, 허리디스크, 척추협착증</p>
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