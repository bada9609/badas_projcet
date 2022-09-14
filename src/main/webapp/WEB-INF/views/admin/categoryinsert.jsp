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
                                        <form action="insertcategory" method="post" id="insertcategory" name="insertcategory">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                	<label for="inputFirstName">
                                                	대분류 카테고리
                                                	</label>
                                                	<select class="dataTable-selector" id="category_type" name="category_type">
                                                		<option value = "hidden">==선택하세요==</option>
   														<c:forEach var="pl" items="${producttypelist }">  
   														<option value="${pl.mp_code }">${pl.mp_name }</option>                           
   														</c:forEach>
                                                    </select>                                                                            
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="category_name" name="category_name" placeholder="카테고리명을 입력해주세요." required oninput ="checkCategory()">
                                                <label for="inputEmail">카테고리 명</label>
                                            </div>
                                            <div>
                                            	<label class ="cetgory_ok" id="cetgory_ok">사용 가능한 카테고리입니다.</label>
                                            	<label class ="cetgory_already" id="cetgory_already">사용이 불가능한 카테고리입니다.</label>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                        	<input type="button" name="categorysubmit" value="등록하기" id="categorysubmit">
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
//카테고리명 중복방지
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
	                     } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                    	 $("#cetgory_already").css("display","inline-block");
	                         $("#cetgory_ok").css("display", "none");
	                         $("#category_name").val('');
	                     }
	                  },
	                  error:function(){
	                      alert("에러입니다");
	                  }      
	           });
			};
			
			//입력 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
			$("#categorysubmit").on("click", function() {
				console.log("작동확인");
				var code = $("#category_type option:selected").val();
				var name = $("#category_name").val();
				var nameregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]{2,11}$/;
				
				if ((code == "hidden")){
					swal("경고","대분류를 선택해주세요.","warning");
					return;
				}

				var nameregex = nameregex.exec(name);
				if (nameregex == null) {
					swal("경고","카테고리명을 다시 확인해주세요.","warning");
					return;
				}
					
				//빈칸 없을 때 제출.
				swal("등록 완료","성공적으로 카테고리 등록을 완료하였습니다.","success");
				$("#insertcategory").submit();
				
			});
</script>
</body>
</html>
