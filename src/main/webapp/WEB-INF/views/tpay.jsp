<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/buser.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">

</head>


<body>
	<%@ include file="main_top.jsp"%>
	<div class="inner-wrap2">
	<div class="inner-wrap">
		
		<div class="part-detail-info-content">
			<div class="editor-wrap">
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a onclick="window.open('tpay_tel','window_name','width=500,height=350,location=no,status=no,scrollbars=yes');">부서별 문의번호 확인</a></li>
					</ul>
				</nav>
				<h1 class="editor-tit">진료비 수납</h1>
				<ul>
					<li>외래 진찰비 또는 검사비는 시행 당일 수납하셔야 하며, 가까운 외래원무팀 수납창구 또는
						계좌이체(1006-580-000000, 우리은행, 오호병원개이득)를 통해 수납하실 수 있습니다.<br>
					</li>
					<li>진료비 수납과 관련하여 불편사항 및 자세한 내용은 외래원무팀으로 문의하시면 신속하게처리해드리겠습니다.<br></li>
				</ul>
				<br>
				<h1 class="editor-tit">진료비 후불서비스[하이패스(Hi-PASS)]</h1>
				<ul>
					<li>이용안내 진료비 후불신청을 하신 후 신용카드를 등록해 놓으시면 진료비를 여러 번 수납할 필요없이 진료 및
						검사를 할 수 있는 편리한 제도입니다.<br>
					</li>
					<li>후불서비스 신청자는 진료 및 검사가 모두 종료된 후 귀가 전에 가까운 수납창구를 방문하여 일괄결제를
						하시기 바라며, 수납창구를 방문하지 않고 귀가하셨을 경우 등록된 신용카드로 결재한 후 문자로 안내해 드립니다. <br>
					</li>
					<li>등록된 신용카드는 세브란스병원에서 발생된 진료비 결제목적 외에 다른 용도로는 사용하지 않습니다. <br></li>
					<br>
				</ul>

				<h1 class="editor-tit">진료비 환불안내</h1>
				<ul>
					<li>진찰비 및 검사비는 시행 당일 수납하셔야 하며,부득이하게 미리 납부(선납)하신 후 미실시한
						진료비(검사비)가 있는 경우 수납창구 또는 외래원무팀 사무실에 확인하여 환불 받으시기 바랍니다.<br>
					</li>

				</ul>

			</div>
		</div>
	</div>
</div>
	<%@ include file="main_bottom.jsp"%>
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>