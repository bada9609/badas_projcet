<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="amain_side.jsp" %>
<div id="layoutSidenav_content">
	<main>
	<div class="container-fluid px-4">
	<h1 class="mt-4">카테고리 관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
		<li class="breadcrumb-item active">Tables</li>
	</ol>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>
				등록된 카테고리
		</div>
	<div class="card-body">
	<table class="dataTable-table">
		<thead>
			<tr>
				<th>카테고리명</th>
                <th>대분류 카테고리</th>
                <th>등록일시</th>
                <th>사용여부</th>
                <th>카테고리 수정</th>
            </tr>
		</thead>
		<tbody>
		<c:forEach var="cd" items="${categorydata }">
			<tr>
				<td>${cd.category_name }</td>
				<c:set var="tname" value="${cd.category_type }" />
				<td>
					<c:if test="${tname eq '1'}">
						CLOTHINGS
					</c:if>
					<c:if test="${tname eq '2'}">
						FOOTWEAR
					</c:if>
					<c:if test="${tname eq '3'}">
						ACCESSORIES
					</c:if>
					<c:if test="${tname eq '4'}">
						WOMEN
					</c:if>
				</td>
				<td>${cd.category_regdate }</td>
				<td>${cd.category_useYN }</td>
				<td><a href="/admin/categoryedit?category_id=${cd.category_id }">수정</a></td>			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="d-grid">
	<a class="btn btn-primary btn-block" href="/admin/categoryinsert">신규 카테고리 등록</a>
	</div>
	</div>
	</div>
	</div>
	</main>
	
	<footer class="py-4 bg-light mt-auto">
	<div class="container-fluid px-4">
		<div class="d-flex align-items-center justify-content-between small">
		<div class="text-muted">Copyright &copy; Your Website 2022</div>
        </div>
	</div>
	</footer>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>