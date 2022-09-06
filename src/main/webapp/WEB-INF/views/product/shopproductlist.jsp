<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<!-- css 적용 (main, menu) -->
<link href="/resources/css/mainimage.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
<!-- font awesome style -->
<link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css" />
<!-- Custom styles for this template -->
<link href="/resources/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/resources/css/responsive.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/main_top.jsp"%>
	<section class="food_section layout_padding">
		<div class="container">
			
			<ul class="filters_menu" id="filters_menu">
			</ul>
			<div class="filters-content">
				<div class="row grid">
				<c:forEach items="${list}" var="list">
					<div class="col-sm-6 col-lg-4 all pizza">
						<div class="box">
							<div>
								<input type="hidden" id="mp_code" name="mp_code" value = "${list.product_type}">
								<div class="img-box" data-path="${list.main_image_filepath}" data-uuid="${list.main_image_uuid}" data-filename="${list.main_image_filename}">
									<img>
								</div>
								<div class="detail-box">
									<h5><a href="/product/productdetail?product_id=${list.product_id}">${list.product_name}</a></h5>
									<p></p>
									<div class="options">
										<h6><fmt:formatNumber value="${list.product_price}" pattern="#,### 원" /></h6>
										<a href="/product/productdetail?"> <svg version="1.1" id="Capa_1"
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
												viewBox="0 0 456.029 456.029"
												style="enable-background: new 0 0 456.029 456.029;"
												xml:space="preserve">
                        <g>
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                        </g>
                        <g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                      </svg>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>	
			</div>	
		</div>
	</section>
		<div class="pages">
			<ul class="paginations modals">
				<c:if test="${pageMaker.prev}">
					<li>
						<a href='/product/shopproductlist?page=${pageMaker.startPage-1 }&product_type=${list.product_type}' class="arrow left">!!!</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum" varStatus="status">
					<li>
						<a href='/product/shopproductlist?page=${pageNum }&product_type=${list[status.last].product_type}' class="num"><i class="fa">${pageNum }</i></a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li>
						<a href='/product/shopproductlist?page=${pageMaker.startPage+1 }&product_type=${list.product_type}' class="arrow right">!!!</a>
					</li>
				</c:if>
			</ul>
	    </div>
	<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/main_bottom.jsp"%>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- bootstrap js -->
<script src="/resources/js/bootstrap.js"></script>
<!-- owl slider -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<!-- isotope js -->
<script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
<!-- nice select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<!-- custom js -->
<script src="/resources/js/custom.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
<script>
$(document).ready(function(){
	
	// 중분류 리스트 호출
	   $.ajax({
	         type:"get",
	         url:"category",
	         data:{"mp_code":$("#mp_code").val()},
	         dataType:"json",
	         success:function(typelist){
	        	 var list =  typelist.datas;
	             	var str ="<li class='active'>" + "<a href='/product/shopproductlist?product_type=" + $('#mp_code').val() + "'>" + "All" + "</a>" + "</li>";
	            		$(list).each(function(idx, objArr){
	               		str += "<li>" + "<a href='/product/shopproduct?product_type=" + $('#mp_code').val() + "&product_category=" + objArr.category_name + "'>" + objArr.category_name + "</a>" + "</li>";
	            		});
	            $("#filters_menu").append(str);
	         },
	         error:function(){
	            console.log("섬띵 롱..");
	         }
		});
	
	
	$(".img-box").each(function(i, obj){
		
		const bobj = $(obj);
		
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		
	});
});




</script>
</body>
</html>