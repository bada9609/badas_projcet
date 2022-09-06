<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>

<link href="/resource/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/style_type2.css" rel="stylesheet">
</head>

<body>
	<%@ include file="/WEB-INF/views/main_top.jsp"%>
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <c:forEach var="datas" items="${datas}" >
                	<input type="hidden" id="test1" value="${datas.product_mainfilename}">
                    <div class="carousel-inner border">
                        <div class="carousel-item active" id="image1" data-path="${datas.product_mainfilepath}" data-uuid="${datas.product_mainfileuuid}" data-filename="${datas.product_mainfilename}">
                            <img class="w-100 h-100" alt="Image" id=image_value1>
                        </div>
                        <div class="carousel-item" id="image2" data-path="${datas.product_subfilepath}" data-uuid="${datas.product_subfileuuid}" data-filename="${datas.product_subfilename}">
                            <img class="w-100 h-100" alt="Image" id=image_value2>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </c:forEach>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
            	<c:forEach var="datas" items="${datas}" >
                <h3 class="font-weight-semi-bold">${datas.product_name}</h3>
                </c:forEach>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <c:forEach var="datas" items="${datas}" >
                <h3 class="font-weight-semi-bold mb-4"><fmt:formatNumber value="${datas.product_price}" pattern="#,### 원" /></h3>
                <p class="mb-4"><pre>${datas.product_subtext}</pre></p>
               	</c:forEach>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <c:forEach var="datas" items="${datas}" >
                        	<c:set var="size_Arr" value="${fn:split(datas.product_size, ',')}" />
                        	</c:forEach>
                        		<c:forEach var="size" items="${size_Arr}">  
                        			<div class="custom-control custom-radio custom-control-inline">
                        				<input type="radio" class="custom-control-input" value="${size}" id="${size}" name="size" onclick='getSize(event)'> 
                        				<label class="custom-control-label" for="${size}">${size}</label>
                            		</div>
                            	</c:forEach>
                </div>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                    <c:forEach var="datas" items="${datas}" >
                        	<c:set var="color_Arr" value="${fn:split(datas.product_color, ',')}" />
                     </c:forEach>
                        		<c:forEach var="color" items="${color_Arr}"> 
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" value="${color}" id="${color}" name="color" onclick='getColor(event)'>
                            <label class="custom-control-label" for="${color}">${color}</label>
                        </div>
                     </c:forEach>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" id="minus" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input id="quantity_value" type="text" class="form-control bg-secondary text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus" id="plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <div>
                    	<form action="/order/productorder" method="post" id="orderproduct" name="orderproduct">
                    		<input type="hidden" id="size_value"  name="size_value">
                    		<input type="hidden" id="color_value" name="color_value">
                    		<input type="hidden" id="product_quantity" name="product_quantity">
                    		<c:forEach var="datas" items="${datas}" >
                				<input type="hidden" id="product_id" name="product_id" value="${datas.product_id}">
                			</c:forEach>
                		</form>                  	
                    </div>
                    <button class="btn btn-primary px-3" id="orderCall" ><i class="fa fa-shopping-cart mr-1"></i>주문하기</button>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                </div>
                
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                    	<c:forEach var="datas" items="${datas}">
                        <h4 class="mb-3">상품 설명</h4>
                        <p><pre>${datas.product_maintext}</pre></p>
                    	</c:forEach>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
                                <div class="media mb-4">
                                    <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                    <div class="media-body">
                                        <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                        <div class="text-primary mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                <div class="d-flex my-3">
                                    <p class="mb-0 mr-2">Your Rating * :</p>
                                    <div class="text-primary">
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                </div>
                                <form>
                                    <div class="form-group">
                                        <label for="message">Your Review *</label>
                                        <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Your Name *</label>
                                        <input type="text" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Your Email *</label>
                                        <input type="email" class="form-control" id="email">
                                    </div>
                                    <div class="form-group mb-0">
                                        <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



<br>
<br>
<br>
<%@ include file="/WEB-INF/views/main_bottom.jsp"%>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/resources/lib/easing/easing.min.js"></script>
<script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="/resources/js/main_type2.js"></script>
    
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
<script>
$(document).ready(function(){
	var price = $("#product_price").val();
	var quantity =  $("#quantity_value").val();
	$("#product_quantity").val(quantity);
	$("#total_price").val(price*quantity);
	
	
	$("#minus").on("click", function() {
		var price = $("#product_price").val();
		var quantity =  $("#quantity_value").val();
		$("#product_quantity").val(quantity);
		$("#total_price").val(price*quantity);
	});
	
	$("#plus").on("click", function() {
		var price = $("#product_price").val();
		var quantity =  $("#quantity_value").val();
		$("#product_quantity").val(quantity);
		$("#total_price").val(price*quantity);
	});
	
	$("#image1").each(function(i, obj){
		
		const bobj = $(obj);
		
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		$("#image_value1").attr('src', '/display?fileName=' + fileCallPath);
		
	});
	
	$("#image2").each(function(i, obj){
		
		const bobj2 = $(obj);
		
		const uploadPath2 = bobj2.data("path");
		const uuid2 = bobj2.data("uuid");
		const fileName2 = bobj2.data("filename");
		
		const fileCallPath2 = encodeURIComponent(uploadPath2 + "/s_" + uuid2 + "_" + fileName2);
		
		$("#image_value2").attr('src', '/display?fileName=' + fileCallPath2);
		
	});
});
function getSize(event) {
	  var size = $('input[name=size]:checked').val();
	  $("#size_value").val(size);
	}
function getColor(event) {
	  var color = $('input[name=color]:checked').val();
	  $("#color_value").val(color);
	}
	
$("#orderCall").on("click", function() {
	console.log("작동확인");
	var code1 = $("#quantity_value").val();
	var code2 = $("#size_value").val();
	var code3 = $("#color_value").val();
		
	if (code1 == null){
		swal("경고","주문 수량을 확인해 주세요","warning");
		return;
	}
	
	if (code2 == ""){
		swal("경고","사이즈를 선택해 주세요","warning");
		return;
	}
	
	if (code3 == "") {
		swal("경고","컬러를 선택해 주세요.","warning");
		return;
	}
	
	//빈칸 없을 때 제출.
	$("#orderproduct").submit();
});

</script>
</body>
</html>