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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin/styles.css" />
</style>
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/admin/amain_side.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">주문 상태수정</h3></div>
                                    <div class="card-body">
                                        <form action="/admin/orders/orderUpdate" method="post" id="orderupdate" name="orderupdate">
                                        	<input type="hidden" name="order_id" id="order_id" value="${list.order_id }">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                	<label for="inputFirstName">
                                                	주문 상태 변경
                                                	</label>
                                                	<select class="dataTable-selector" id="order_state" name="order_state">
   														<option value="1">결제 완료</option>
   														<option value="2">배송중</option>
   														<option value="3" disabled="disabled">구매확정</option>                          
                                                    </select>                                                                            
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                        	<input type="button" name="order_state_submit" value="수정하기" id="order_state_submit">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- 하단 영역 -->
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
<!-- 중복 검사 및 입력 js -->

// 대분류 카테고리 자동 선택
		$(document).ready(function(){
			$("#category_type").val('${category_data.category_type}');
		});
			
			$("#order_state_submit").on("click", function() {
				console.log("작동확인");
				var code = $("#order_state option:selected").val();
					
				if (code == null){
					swal("경고","주문상태를 선택해주세요.","warning");
					return;
				}
				
				//빈칸 없을 때 제출.
				swal("수정 완료","성공적으로 카테고리 수정을 완료하였습니다.","success");
				$("#orderupdate").submit();
				
			});
</script>
</body>
</html>
