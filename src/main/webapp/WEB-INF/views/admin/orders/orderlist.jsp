<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Andrea cho shop admin</title>
<link rel="/resources/css/admin/stylesheet" href="styles.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/admin/amain_side.jsp" %>
<div id="layoutSidenav_content">
	<main>
	<div class="container-fluid px-4">
	<h1 class="mt-4">주문 관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/admin/orders/orderlist">주문 목록</a></li>
		<li class="breadcrumb-item active">목록</li>
	</ol>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>
				등록된 주문
		</div>
	<div class="card-body">
	<table class="dataTable-table" style="word-break: break-all">
		<thead>
			<tr>
				<th>주문일</th>
                <th>주문자</th>
                <th>상품명</th>
                <th>사이즈</th>
                <th>수량</th>
                <th>색상</th>
                <th>결제금액</th>
                <th>우편번호</th>
         		<th>배송주소</th>
         		<th>결제방식</th>
         		<th>진행상태</th>
            </tr>
		</thead>
		<tbody>
		<c:forEach var="list" items="${list }">
			<tr>
				<td width="110">${list.order_regdate }</td>
				<td width="70">${list.order_customer_name }</td>
				<td width="160">${list.product_name }</td>
				<td width="65">${list.product_size }</td>
				<td width="50">${list.product_quantity }</td>
				<td width="100">${list.product_color }</td>
				<td width="130"><fmt:formatNumber value="${list.order_total_pay }" pattern="#,###원" /></td></td>
				<td width="90">${list.order_customer_addr }</td>
				<td width="240">${list.order_customer_addr2 }<br>${list.order_customer_addr_detail }</td>
				<c:set var="pay" value="${list.payment_type }"/>	
					<td width="100">
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
					<td width="110">
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
				<td>
					<c:if test="${list.order_state == '1' || list.order_state == '2'}">
						<a href="/admin/orders/orderedit?order_id=${list.order_id }">수정</a>
					</c:if>
				</td>			
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	<div class="dataTable-bottom">
		<nav class="dataTable-pagination">
			<ul class="dataTable-pagination-list">
			<c:if test="${pageMaker.prev}">
				<li class="pager">
					<a href="/admin/orders/orderlist?page=${pageMaker.startPage-1 }">◁</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum" varStatus="status">
				<li class="${pageMaker.cri.page == pageNum ? "active":""}">
					<a href='/admin/orders/orderlist?page=${pageNum}' class="num"><i class="fa">${pageNum }</i></a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="pager">
					<a href="/admin/orders/orderlist?page=${pageMaker.startPage+1 }">▷</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	</main>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>