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

<link href="/resources/css/mainimage.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">

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
	 <!-- Checkout Start -->
	<form action="/order/ordercall" method="post" id="ordernow" name="ordernow">
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">배송 주소 입력</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>주문자명</label>
                            <input name="order_customer_id" id="order_customer_id" type="hidden" value="${datas.member_id}">
                            <input name="order_customer_name" id="order_customer_name" class="form-control" type="text" value="${datas.member_name}" disabled="disabled">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>수령인명</label>
                            <input name="order_dr_name" id="order_dr_name" class="form-control" type="text" placeholder="수령인명">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input name="order_customer_email" id="order_customer_email" name="order_customer_email" class="form-control" type="text" value="${datas.member_email}" disabled="disabled">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>휴대폰 번호</label>
                            <input name="order_customer_tell" id="order_customer_tell" class="form-control" type="text" value="${datas.member_number}" disabled="disabled">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>우편번호</label>
                            <input name="order_customer_addr" id="order_customer_addr" class="form-control" type="text" value="${datas.member_addr}" disabled="disabled">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>주소</label>
                            <input name="order_customer_addr2" id="order_customer_addr2" class="form-control" type="text" value="${datas.member_addr2}" disabled="disabled">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>상세 주소</label>
                            <input name="order_customer_addr_detail" id="order_customer_addr_detail" class="form-control" type="text" placeholder="상세주소를 입력해 주세요" >
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">주문 내역</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">주문 상품</h5>
                        <div class="d-flex justify-content-between">
                        	<input id="product_id" name="product_id" type="hidden" value="${datas.product_id }">
                        	<input id="product_name" name="product_name" type="hidden" value="${datas.product_name }">
                            <p>${datas.product_name}</p>
                            <p><fmt:formatNumber value="${datas.total_price }" pattern="#,### 원" /></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>&nbsp; - 주문 수량</p>
                            <p id="product_quantity"><fmt:formatNumber value="${datas.product_quantity }" pattern="#,### 개" /></p>
                        	<input type="hidden" name="product_quantity" value="${datas.product_quantity }"> 
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>&nbsp; - 선택 사이즈</p>
                            <p id="product_size">${datas.size_value}</p>
                            <input type="hidden" name="product_size" value="${datas.size_value}"> 
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>&nbsp; - 선택 컬러</p>
                            <p id="product_color">${datas.color_value}</p> 
                            <input type="hidden" name="product_color" value="${datas.color_value}">
                        </div>
                        
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">상품가격</h6>
                            <h6 class="font-weight-medium"><fmt:formatNumber value="${datas.total_price }" pattern="#,### 원" /></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">배송비</h6>
                            <h6 class="font-weight-medium">2,500 원</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><fmt:formatNumber value="${datas.total_price+2500}" pattern="#,### 원" /></h5>
                            <input type="hidden" id="order_total_pay" name="order_total_pay" value="${datas.total_price+2500}">
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">결제수단</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal" value="paypal" onclick='getPayment(event)'>
                                <label class="custom-control-label" for="paypal">신용카드결제</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directbanktransfer" value="directbanktransfer" onclick='getPayment(event)'>
                                <label class="custom-control-label" for="directbanktransfer">무통장 입금</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer" value="banktransfer" onclick='getPayment(event)'>
                                <label class="custom-control-label" for="banktransfer">실시간 계좌이체</label>
                            </div>
                        </div>
                        <input type="hidden" id="payment_type" name="payment_type">
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" id="orderGo">주문하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- Checkout End -->
	
	
	
	<%@ include file="/WEB-INF/views/main_bottom.jsp"%>
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
function getPayment(event) {
	  var payment = $('input[name=payment]:checked').val();
	  $("#payment_type").val(payment);
	}


$("#orderGo").on("click", function(){
	console.log("작동확인");
	var code1 = $("#order_customer_addr_detail").val();
	var code2 = $("#payment_type").val();
	var name = $("#order_dr_name").val();
	var nameregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]{2,11}$/;
	
	var nameregex = nameregex.exec(name);
	if (nameregex == null){
		swal("경고","수령인명을 다시 확인해주세요.","warning");
		return false;
	}
	
	if (code1 == ""){
		swal("경고","상세 주소를 입력해 주세요","warning");
		return false;
	}
	
	if (code2 == ""){
		swal("경고","결제 방식을 선택해 주세요","warning");
		return false;
	}
	
	$("#order_customer_name").attr("disabled",false);
	$("#order_customer_email").attr("disabled",false);
	$("#order_customer_tell").attr("disabled",false);
	$("#order_customer_addr").attr("disabled",false);
	$("#order_customer_addr2").attr("disabled",false);

	//빈칸 없을 때 제출.
	$("#ordernow").submit();
});

</script>
</body>
</html>