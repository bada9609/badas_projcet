<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="resources/css/tpboard.css" rel="stylesheet">
<script language="JavaScript">
<!--
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 
//-->  
</script>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/hinfo.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">


</head>

<style>
ul{
   list-style:none;
   }
   
   li{
   list-style:none;
  
   }
</style>

<body>
<%@ include file="main_top.jsp" %>


			<h2 align="center">병원개요</h2>
		<div class="banner">
			<ul>
				
				<li><img src="./resources/images/amain1.jpg" width="400" height="260px"></li>
				<li><img src="./resources/images/main2.jpg" width="400" height="260px"></li>
				<li><img src="http://www.snuh.org/upload/about/history/20120316106.jpg" width="400" height="360px"></li>
				<li><img src="http://www.snuh.org/upload/about/history/M1433321152421_1.jpg" width="400" height="260px"></li>
			</ul>
		</div>
	<br><br><br><br>
		<div style="text-align : center;" class="obj">

				<li>오호병원의 어제 오늘 그리고 미래<br></li>
				<li>오호병원은 국민의 건강과 생명을 지키고, 우리나라 의학발전을 선도해 왔습니다.<br>

	
		<h2 align="center">설립목적</h2>
		
		<ul style="display: table; margin: auto; padding:0;">
			<li><img src="http://www.snuh.org/asset/img/about/img_mission.png" width="600" height="300px"></li>
			<br><br><br>
			<li>오호병원은 교육법에 의한 의학, 간호학 및 약학 등에 관한 교육,</li> 
			<li>연구와 진료를 통하여 의학발전을 도모하고 국민보건향상에 기여함을 목적으로 한다.</li>
		</ul>
	</div> 
	
		<div style="text-align : center;" class="obj1">
		<h2 align="center">기능</h2>
		<ul style="display: table; margin: auto; padding:0;">
			<li><img src="./resources/images/hinfo.png" width="600" height="300px"></li>
		
		
		</ul>
	</div> 
			<br><br><br>
	

<%@ include file="main_bottom.jsp" %>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>