<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/buser.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/buser_FAQ.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
</head>

<body>
	<%@ include file="main_top.jsp"%>
	<div class="inner-wrap">
		<hr>

		<div class="section-heading">
			<h2 class="section-heading-title">이비인후과</h2>
			<br>
		</div>

		<div class="part-detail-info-content">
			<div class="editor-wrap">
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a href="buser_n">진료과 안내</a></li>
						<li class="nav-item"><a href="buser_n_doctor">의료진</a></li>
						<li class="nav-item"><a href="buser_n_faq">건강FAQ</a></li>
						<li class="nav-item"><a href="appoint">진료예약</a></li>
					</ul>
				</nav>

				<div class="container">
					<table class="responsive-table">
						<caption>자주 겪는 질환</caption>
						<thead>
							<tr>
								<th scope="col">질환명</th>
								<th scope="col">발병시기</th>
								<th scope="col">원인</th>
								<th scope="col">진단/검사</th>
								<th scope="col">증상</th>
								<th scope="col">치료</th>
								<th scope="col">예방</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="7">Sources: <a
									href="http://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films"
									rel="external">Wikipedia</a> &amp; <a
									href="http://www.boxofficemojo.com/genres/chart/?id=animation.htm"
									rel="external">Box Office Mojo</a>. Data is current as of
									October 3, 2018.
								</td>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<th scope="row"><a
									href="http://www.samsunghospital.com/home/healthInfo/content/contenView.do?CONT_SRC_ID=09a4727a8000f1d6&CONT_SRC=CMS&CONT_ID=3330&CONT_CLS_CD=001020001002">꽃가루<br>알레르기
								</a></th>
								<td data-title="Released">3월~4월</td>
								<td data-title="Studio">날아다니는 꽃가루</td>
								<td data-title="Worldwide Gross" data-type="currency">피부반응
									검사</td>
								<td data-title="Domestic Gross" data-type="currency">결막염,피부염,비염</td>
								<td data-title="Foreign Gross" data-type="currency">항히스타민제,스테로이드제</td>
								<td data-title="Budget" data-type="currency">외출자제,꽃가루와 비접촉</td>
							</tr>
							<tr>
								<th scope="row"><a
									href="http://www.samsunghospital.com/home/healthInfo/content/contenView.do?CONT_SRC_ID=09a4727a8000f1ce&CONT_SRC=CMS&CONT_ID=3303&CONT_CLS_CD=001020001002">급성중이염</a></th>
								<td data-title="Released"></td>
								<td data-title="Studio">인플루엔자,<br>폐렴구균
								</td>
								<td data-title="Worldwide Gross" data-type="currency">귀내시경,청력검사</td>
								<td data-title="Domestic Gross" data-type="currency">귀의 통증과
									발열, 난청</td>
								<td data-title="Foreign Gross" data-type="currency">충분한 휴식,
									항생제</td>
								<td data-title="Budget" data-type="currency">예방적 백신 투여</td>
							</tr>
							<tr>
								<th scope="row"><a
									href="http://www.samsunghospital.com/home/healthInfo/content/contenView.do?CONT_SRC_ID=09a4727a8000f226&CONT_SRC=CMS&CONT_ID=1892&CONT_CLS_CD=001020001002">만성축농증</a></th>
								<td data-title="Released"></td>
								<td data-title="Studio">대기오염,유전요인</td>
								<td data-title="Worldwide Gross" data-type="currency">방사선
									촬영,CT촬영</td>
								<td data-title="Domestic Gross" data-type="currency">만성
									기침,두통</td>
								<td data-title="Foreign Gross" data-type="currency">약물치료,코내시경</td>
								<td data-title="Budget" data-type="currency">손발씻기, 코세척</td>
							</tr>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="main_bottom.jsp"%>
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>