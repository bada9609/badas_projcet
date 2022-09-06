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
<style type="text/css">
.cetgory_ok{
color:#008000;
display: none;
}

.cetgory_already{
color:#6A82FB; 
display: none;
}
</style>
</head>
<body class="sb-nav-fixed">
<%@ include file="amain_side.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">카테고리 등록</h3></div>
                                    <div class="card-body">
                                        <form action="categoryupdate" method="post" id="categoryupdate" name="categoryupdate">
                                        	<input type="hidden" name="category_id" id="category_id" value="${category_data.category_id }">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                	<label for="inputFirstName">
                                                	대분류 카테고리
                                                	</label>
                                                	<select class="dataTable-selector" id="category_type" name="category_type">
   														<option value="1">CLOTHINGS</option>
   														<option value="2">FOOTWEAR</option>
   														<option value="3">ACCESSORIES</option>
   														<option value="4">WOMEN</option>                           
                                                    </select>                                                                            
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="category_name" name="category_name" required oninput ="checkCategory()" value="${category_data.category_name}"> 
                                                <label for="inputEmail">카테고리 명</label>
                                            </div>
                                            <div>
                                            	<label class ="cetgory_ok" id="cetgory_ok">사용 가능한 카테고리입니다.</label>
                                            	<label class ="cetgory_already" id="cetgory_already">중복된 카테고리입니다.</label>
                                            </div>
                                            <div>
                                            	<input type="radio" id="category_useYN" name="category_useYN" value ="Y" <c:if test="${category_data.category_useYN eq 'Y'}">checked</c:if>/> 사용
                                            	<input type="radio" id="category_useYN" name="category_useYN" value ="N" <c:if test="${category_data.category_useYN eq 'N'}">checked</c:if>/> 미사용
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                        	<input type="button" name="categoryupdatesubmit" value="수정하기" id="categoryupdatesubmit">
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
		
//아이디 중복방지
		var lastCount = 0;
		
        function checkCategory(){
            var category_name = $("#category_name").val();
            var category_type = $("#category_type option:selected").val();
		 $.ajax({
	           type:"POST",
	           url:"categoryCheck",
	           data:{category_name:category_name, category_type:category_type},
	           dataType : "json",
	           success:function(data){  // 계산된 cnt 값 받아오기 
	                  if(data != 1){ //cnt 값이 1이 아니라면 사용가능 아이디    
	                	  	 $("#cetgory_ok").css("display","inline-block"); 
	                      	 $("#cetgory_already").css("display", "none");
	                      	 lastCount = 1;
	                     } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                    	 $("#cetgory_already").css("display","inline-block");
	                         $("#cetgory_ok").css("display", "none");
	                         lastCount = 0;
	                     }
	                  },
	                  error:function(){
	                      alert("에러입니다");
	                  }      
	           });
			};
			
			//입력 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
			$("#categoryupdatesubmit").on("click", function() {
				console.log("작동확인");
				var code = $("#category_type option:selected").val();
				var name = $("#category_name").val();
				var useCheck = '${category_data.category_useYN}';
				var nowCheck = $('input[name=category_useYN]:checked').val();
				var resultCheck = 0;
				var nameregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]{2,11}$/;

				var nameregex = nameregex.exec(name);
				if (nameregex == null) {
					swal("경고","카테고리명을 다시 확인해주세요.","warning");
					return;
				}
					
				if (code == null){
					swal("경고","대분류를 선택해주세요.","warning");
					return;
				}
				
				if(useCheck != nowCheck){
					resultCheck = 1; 
				}else{
					resultCheck = 0;
				}
				
				if (lastCount == 0 && resultCheck == 0 ){
					swal("경고","기존 카테고리에 사용 중인 카테고리입니다.","warning");
					return;
				}
			
				//빈칸 없을 때 제출.
				swal("수정 완료","성공적으로 카테고리 수정을 완료하였습니다.","success");
				$("#categoryupdate").submit();
				
			});
</script>
</body>
</html>
