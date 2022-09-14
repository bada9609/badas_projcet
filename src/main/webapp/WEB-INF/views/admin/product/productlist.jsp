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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/admin/amain_side.jsp" %>
<div id="layoutSidenav_content">
	<main>
	<div class="container-fluid px-4">
	<h1 class="mt-4">상품 관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/admin/product/productlist">제품 목록</a></li>
		<li class="breadcrumb-item active"><script src="/resources/js/admin/scripts.js"></script></li>
	</ol>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>
				등록된 상품
		</div>
	<div class="card-body">
	<table class="dataTable-table">
		<thead>
			<tr>
				<th>상품 이미지</th>
				<th>상품명</th>
                <th>대분류 카테고리</th>
                <th>중분류 카테고리</th>
                <th>판매 여부</th>
                <th>판매 가격</th>
                <th>상세보기</th>
            </tr>
		</thead>
		<tbody id=product_data_zone>
		</tbody>
	</table>
	<div class="d-grid">
	<a class="btn btn-primary btn-block" href="/admin/product/productinsert">신규 상품 등록</a>
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
<script>
	$(document).ready(function(){
		var uploadPath = "";
		var uuid = "";
		var fileName = "";
		   $.ajax({
		         type:"get",
		         url:"productmainlist",
		         dataType:"json",
		         success:function( productlist){
		        	 var list =  productlist.datas;
		             	var str = "<tr>"
		            	$(list).each(function(idx, objArr){
		            		var fileCallPath = encodeURIComponent(objArr.product_filepath + "/s_" + objArr.product_fileuuid + "_" + objArr.product_filename);
		            		if(objArr.product_filepath == null){
		            			str += "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
		            		}else{
		            			str += "<td>" + "<img width='50'; height='50'; src='/display?fileName=" + fileCallPath + "'>" + "</td>";
		            		}  
		            		str += "<td>" + objArr.product_name + "</td>";
		            		str += "<td>" + objArr.product_type + "</td>";
		            		str += "<td>" + objArr.product_category + "</td>";
		            		str += "<td>" + objArr.product_useYN + "</td>";
		            		str += "<td>" + objArr.product_price + "</td>";
		            		str += "<td>" + "<a href='/admin/product/productselect?product_id="+objArr.product_id + "'>" + "상세보기" + "</a>" + "</td>";
		            		str += "</tr>";
		            	 });
		            $("#product_data_zone").append(str);
		         },
		         error:function(){
		            console.log("문제");
		         }
			});
	});
</script>
</body>
</html>