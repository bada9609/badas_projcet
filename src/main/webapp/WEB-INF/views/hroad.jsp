<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/hroad.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">


</head>
<body>
<%@ include file="main_top.jsp" %>
   
<H1 align="center">길찾기</H1>

<div class="road1" style="text-align:center;">
		<img src="./resources/images/road1.png" alt="" usemap="#map"/>
			<map name="map">
			<area href="https://map.naver.com/v5/directions/-/14140717.61280403,4508886.673033226,KIC%EC%BA%A0%ED%8D%BC%EC%8A%A4,37812238,PLACE_POI/-/transit?c=14140250.6798170,4508886.5337430,15,0,0,0,dh"  
			shape="rect" coords="59,242,245,277" target="_blank" alt="빠른길찾기" />
			</map>
		</div>	

	<H1 align="center">교통관련</H1>
<div style="width:30; height:30px; float:left; margin:30px;" class="accordion" >
<input type="radio" name="accordion" id="answer01">
	<label for="answer01">지하철<em></em></label>
	<div><p>2호선(강남),신분당선(강남),9호선(신논현)</p></div>
	<input type="radio" name="accordion" id="answer02">
	<label for="answer02">버스<em></em></label>
	<div><p>23-284(강남역,강남역사거리방면),23-574(신논현역,구교보타워사거리),23-285(신논현역,구교보타워사거리)</p></div>
	<input type="radio" name="accordion" id="answer03">
	<label for="answer03">기차/공항<em></em></label>
	<div><p>서울역 지하철 4호선 → 사당역2호선 → 강남역12번출구,김포공항 지하철 공항선 → 홍대입구 2호선→ 강남역12번출구  </p></div>
	<input type="radio" name="accordion" id="answer04">
	<label for="answer04">고속버스<em></em></label>
	<div><p>고속터미널 지하철 3호선 → 교대역2호선 → 강남역12번출구</p></div>
</div>

	

<h1><br><br><br><br><br></h1>
<%@ include file="main_bottom.jsp" %>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>