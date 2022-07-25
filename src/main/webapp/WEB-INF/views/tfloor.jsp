<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/buser.css" rel="stylesheet">
<link href="resources/css/tfloortab.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/menu.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
<style>

.tcontainer {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 10px;
	padding: 0;
	background-color: white;
	list-style-type: none;
}

ul.ttabs {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: white;
	list-style-type: none;
}

ul.ttabs li {
	background: none;
	color: #222;

	padding: 10px 15px;
	cursor: pointer;
}

ul.ttabs li.current {
	background: #ededed;
	color: #222;
}

.ttab-content {
	display: none;
	
	padding: 15px;
}

.ttab-content.current {
	display: inherit;
}
.size {
  width: 500px;
  height: 280px;
  object-fit: fill;
}

.size2 {
  width: 500px;
  height: 280px;
  object-fit: fill;
}
</style>


</head>
<body>
	<%@ include file="main_top.jsp"%>

<div class="inner-wrap2">

	<div class="inner-wrap">
		<div class="part-detail-info-content">
			<div class="tcontainer">
			</div>
				<ul class="ttabs">
					<li class="ttab-link current" data-tab="tab-1">B1·2</li>
					<li class="ttab-link" data-tab="tab-2">1F</li>
					<li class="ttab-link" data-tab="tab-3">2F</li>
					<li class="ttab-link" data-tab="tab-4">3F</li>
					<li class="ttab-link" data-tab="tab-5">4F</li>
				</ul>

				<div id="tab-1" class="ttab-content current">
					<table>
						<tr>
							<th style="text-align: left; margin-left:20px;">지2층 주차장</th>
							<th style="text-align: left; margin-left:20px;">지1층 주차장</th>
						</tr>
						<tr>
							<td><img src="./resources/images/parking2.jpg" class=size2></td>
							<td><img src="./resources/images/parking.jpg" class=size2></td>
						</tr>
						<tr>
						<td><br><br></td>
						</tr>
						<tr>
							<td> 주차장 경비실 (02)001-0001</td>
						</tr>
					</table>
				</div>
				<div id="tab-2" class="ttab-content">
					<table>
						<tr>
							<th style="text-align: left; margin-left:20px;">접수창구</th>
							<th style="text-align: left; margin-left:20px;">카페 등 편의시설</th>
						</tr>
						<tr>
							<td><img src="./resources/images/infodesk.jpeg" class=size2></td>
							<td><img src="./resources/images/cafe.jpg" class=size2></td>
							</tr>
							<tr>
						<td><br><br></td>
						</tr>
						<tr>
							<td> 원무과 (02)001-0002</td>
							<td> 사내카페 (02)002-0001</td>
						</tr>
					</table>
				</div>
				<div id="tab-3" class="ttab-content">
					<table>
						<tr>
							<th style="text-align: left; margin-left:20px;">소아과</th>
							<th style="text-align: left; margin-left:20px;">내과</th>
						</tr>
						<tr>
							<td><img src="./resources/images/pediatrician.jpg"
								class=size2></td>
							<td><img src="./resources/images/naegwa.jpg" class=size2>
							</td>
						</tr>
						<tr>
						<td><br><br></td>
						</tr>
						<tr>
							<td> 소아과 종합창구 (02)001-0003</td>
							<td> 내과 종합창구 (02)001-0004</td>
						</tr>
					</table>
				</div>
				<div id="tab-4" class="ttab-content">
					<table>
						<tr>
							<th style="text-align: left; margin-left:20px;">이비인후과</th>
							<th style="text-align: left; margin-left:20px;">신경외과</th>
						</tr>
						<tr>
							<td><img src="./resources/images/ear.jpg" class=size2></td>
							<td><img src="./resources/images/nerve.jpg" class=size2>
							</td>
						</tr>
						<tr>
						<td><br><br></td>
						</tr>
						<tr>
							<td> 이비인후과 종합창구 (02)001-0003</td>
							<td> 신경외과 종합창구 (02)001-0004</td>
						</tr>
					</table>
				</div>
				<div id="tab-5" class="ttab-content">
					<table>
						<tr>
							<th style="text-align: left; margin-left:20px;">휴게실</th>
							<th style="text-align: left; margin-left:20px;">입원실</th>
						</tr>
						<tr>
							<td><img src="./resources/images/rest.jpg" class=size2></td>
							<td><img src="./resources/images/ibwon.jpg" class=size2>
							</td>
						</tr>
						<tr>
						<td><br><br></td>
						</tr>
						<tr>
							<td> 경리실 (02)001-0005</td>
							<td> 입원병동 관리처 (02)001-0006</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<script>
			$(document).ready(function() {

				$('ul.ttabs li').click(function() {
					var tab_id = $(this).attr('data-tab');

					$('ul.ttabs li').removeClass('current');
					$('.ttab-content').removeClass('current');

					$(this).addClass('current');
					$("#" + tab_id).addClass('current');
				})

			})
		</script>
</div>
		<%@ include file="main_bottom.jsp"%>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>