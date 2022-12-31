<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mainimage.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/main_top.jsp"%>
<div id="layoutSidenav_content">
<main>
	<div class="container-fluid px-4">
	<h1 class="mt-4">주문내역</h1>
	<ol class="breadcrumb mb-4">

	</ol>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>
				상품 주문 내용
		</div>
	<div class="card-body">
		<div class="dataTable-container">
			<table class="dataTable-table">
				<thead>
					<tr>
						<th>주문일자</th>
                		<th>주문 상품</th>
                		<th>주문 수량</th>
                		<th>결제 금액</th>
                		<th>결제 수단</th>
                		<th>주문 상태</th>
                		<th>구매 결정</th>
            		</tr>
				</thead>
				<tbody>
				
				<c:forEach var="list" items="${list}">
					<c:if test="${not empty list}">
					<tr>
						<td>${list.order_regdate }</td>
						<td>${list.product_name }</td>
						<td><fmt:formatNumber value="${list.product_quantity }" pattern="#,###개" /></td>
						<td><fmt:formatNumber value="${list.order_total_pay }" pattern="#,###원" /></td>
						<c:set var="pay" value="${list.payment_type }"/>	
							<td>
								<c:if test="${pay eq 'paypal'}">
									신용카드
								</c:if>
								<c:if test="${pay eq 'banktransfer'}">
									계좌이체
								</c:if>
								<c:if test="${pay eq 'directbanktransfer'}">
									무통장입금
								</c:if>
							</td>
						<c:set var="tname" value="${list.order_state }" />
							<td>
								<c:if test="${tname eq '1'}">
								결제 완료
								</c:if>
								<c:if test="${tname eq '2'}">
								배송중
								</c:if>
								<c:if test="${tname eq '3'}">
								구매확정
								</c:if>
							</td>
						<c:set var="tcheck" value="${list.order_state }" />
							<td>
								<c:if test="${tname eq '2'}">
									<a href="/mypage/orderconfirm?order_id=${list.order_id}">구매결정</a>
								</c:if>
							</td>
					</tr>
				</c:if>
				<c:if test="${empty list}">
					<tr>
						<td colspan='7'><h2><p style="text-align:center;">주문 기록이 없습니다.</p></h2></td>
					</tr>
				</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<c:if test="${listcheck != 'empty'}">
	<div class="dataTable-bottom">
		<nav class="dataTable-pagination">
			<ul class="dataTable-pagination-list">
			<c:if test="${pageMaker.prev}">
				<li class="pager">
					<a href="/mypage/myorder?page=${pageMaker.startPage-1 }">◁</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum" varStatus="status">
				<li class="${pageMaker.cri.page == pageNum ? "active":""}">
					<a href='/mypage/myorder?page=${pageNum}' class="num"><i class="fa">${pageNum }</i></a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="pager">
					<a href="/mypage/myorder?page=${pageMaker.startPage+1 }" data-page="2">▷</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	</c:if>
	<c:if test="${listcheck == 'empty'}">
	</c:if>
	</div>
	</div>
</main>
</div>
<%@ include file="/WEB-INF/views/main_bottom.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>