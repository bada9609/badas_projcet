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
<link rel="/resources/css/tooltip.css" href="styles.css"/>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.product_ok{
color:#008000;
display: none;
}

.product_already{
color:#6A82FB; 
display: none;
}
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">제품 등록</h3></div>
                                    <div class="card-body">
                                        <form action="insertproduct" method="post" id="insertproduct" name="insertproduct">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                	<label for="inputFirstName">
                                                	대분류 카테고리
                                                	</label>
                                                	<select class="dataTable-selector" id="product_type" name="product_type">
                                                		<option value="hidden">==선택하세요==</option>
   														<c:forEach var="pl" items="${product_type }">  
   															<option value="${pl.mp_code }">${pl.mp_name }</option>                           
   														</c:forEach>
                                                    </select>                                                                          
                                                </div>
                                                <div class="col-md-6">
                                                	<label for="inputFirstName">
                                                	중분류 카테고리
                                                	</label>
                                                	<select class="dataTable-selector" id="product_category" name="product_category">
                                                		<option value="hidden">==선택하세요==</option>
                                                	</select>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="product_name" name="product_name" placeholder="상품명을 입력해주세요." required oninput ="checkProduct()">
                                                <label for="inputEmail">상품명</label>
                                            </div>
                                            <div>
                                            	<label class ="product_ok" id="product_ok">사용 가능한 상품명입니다.</label>
                                            	<label class ="product_already" id="product_already">사용이 불가능한 상품명입니다.</label>
                                            </div>
                                            <div class="form-floating mb-3">
												<input class="form-control" id="product_price" name="product_price" type="text" placeholder="가격입력">
												<label for="inputEmail">상품가격</label>
											</div>
											<div class="form-floating mb-3">
												<input type="file" class="form-control" id="product_main_image" type="file" multiple placeholder="메인 이미지">
												<label for="inputEmail">메인 이미지</label>
											</div>
											<div id="mainimagedata"></div>
											<div class="form-floating mb-3">
												<input type="file" class="form-control" id="product_sub_image" placeholder="설명 이미지">
												<label for="inputEmail">설명 이미지</label>
											</div>
											<div id="subimagedata"></div>
												<input type="hidden" id="product_imageYN" name="product_imageYN"  value = "N">
											<div class="form-floating mb-3">
												<textarea id="product_maintext" name="product_maintext" class="form-control" style="width:100%; border:1; overflow:visible; text-overflow:ellipsis;" placeholder="설명 텍스트"></textarea>
												<label for="inputEmail">메인 설명 텍스트</label>
											</div>
											<div class="form-floating mb-3">
												<textarea id="product_subtext" name="product_subtext" class="form-control" style="width:100%; border:1; overflow:visible; text-overflow:ellipsis;" placeholder="설명 텍스트"></textarea>
												<label for="inputEmail">서브 설명 텍스트</label>
											</div>
											<div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="product_size" name="product_size" placeholder="상품 사이즈를 입력해주세요.">
                                                <span>사이즈 입력시 띄어쓰기 없이 ,를 기준으로 나눠 입력해주세요 EX)95,100,***</span>
                                                <label for="inputEmail">사이즈 입력</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="product_color" name="product_color" placeholder="상품 컬러를 입력해주세요.">
                                                <span>컬러 입력시 띄어쓰기 없이 ,를 기준으로 나눠 입력해주세요 EX)화이트,블랙,***</span>
                                                <label for="inputEmail">컬러 입력</label>
                                            </div>
										</form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                        	<input type="button" name="productsubmit" value="등록하기" id="productsubmit">
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

// 대분류 선택 후 다음 분류 선택시
$("#product_type").on("change", function(e){
	   $("#product_category").empty();
	   $.ajax({
	         type:"get",
	         url:"product_category",
	         data:{"mp_code":$("#product_type option:selected").val()},
	         dataType:"json",
	         success:function( producttypelist){
	        	 var list =  producttypelist.datas;
	             	var str ="<option name='select' value='hidden' selected disabled hidden>"+"==선택하세요=="+"</option>";
	            		$(list).each(function(idx, objArr){
	               		str += "<option value='"+objArr.category_name+"'>"+objArr.category_name+"</option>";
	            		});
	            $("#product_category").append(str);
	         },
	         error:function(){
	            $("#product_category").text("에러발생 "); 
	         }
		});
});


// 메인 이미지 호출 시
$("#product_main_image").on("change", function(e){
	let formData = new FormData();
	let fileInput = $("#product_main_image");
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	let mainuploadResult = $("#mainimagedata");
	let str = "";
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
		
	formData.append("product_main_image", fileObj);
		
	//메인 이미지 저장 후 데이터 값 다시 호출
	$.ajax({
		url: 'uploadAjaxAction',
		processData : false,
		contentType : false,
		async:false,
		data : formData,
		type : 'POST',
		//dataType : 'json',
		success:function(imagedata){
			var list = imagedata.data;
				$(list).each(function(idx, objArr){
					str += "<input type='hidden' id='main_image_filename' name='main_image_filename' value='"+ objArr.main_image_filename +"'>";
	 				str += "<input type='hidden' id='main_image_uuid' name='main_image_uuid' value='"+ objArr.main_image_uuid +"'>";
	 				str += "<input type='hidden' id='main_image_filepath' name='main_image_filepath' value='"+ objArr.main_image_filepath +"'>";
	 	    	});
			$("#product_imageYN").val("Y");
	 		mainuploadResult.append(str);
	 	},	
	    error:function(){
			alert("에러입니다");
		}    
		
	});	
	
});

//서브 이미지 호출 시
$("#product_sub_image").on("change", function(e){
	let formData = new FormData();
	let fileInput = $("#product_sub_image");
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	let mainuploadResult = $("#subimagedata");
	let str = "";
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
		
	formData.append("product_sub_image", fileObj);
		
	//메인 이미지 저장 후 데이터 값 다시 호출
	$.ajax({
		url: 'uploadAjaxActionsub',
		processData : false,
		contentType : false,
		async:false,
		data : formData,
		type : 'POST',
		//dataType : 'json',
		success:function(imagedata){
			var list = imagedata.data;
				$(list).each(function(idx, objArr){
					str += "<input type='hidden' id='sub_image_filename' name='sub_image_filename' value='"+ objArr.sub_image_filename +"'>";
	 				str += "<input type='hidden' id='sub_image_uuid' name='sub_image_uuid' value='"+ objArr.sub_image_uuid +"'>";
	 				str += "<input type='hidden' id='sub_image_filepath' name='sub_image_filepath' value='"+ objArr.sub_image_filepath +"'>";
	 	    	});
			$("#product_imageYN").val("Y");
	 		mainuploadResult.append(str);
	 	},	
	    error:function(){
			alert("에러입니다");
		}    
		
	});	
	
});
	
	// 파일 양식 관련 알림
let regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
let maxSize = 10485760; //10MB	
	
function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
		return true;		
	}
	

//입력 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
$("#productsubmit").on("click", function() {
	console.log("작동확인");
	var code1 = $("#product_type option:selected").val();
	var code2 = $("#product_category option:selected").val();
	var code3 = $("#product_maintext").val();
	var code4 = $("#product_subtext").val();
	var code5 = $("#product_size").val();
	var code6 = $("#product_color").val();
	var name = $("#product_name").val();
	var nameregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\s]{2,11}$/;
	var sizecolorregex = /[ㄱ-ㅎ|가-힣|a-z|A-Z|,|0-9]$/;
		
	if (code1 == "hidden"){
		swal("경고","대분류를 선택해주세요.","warning");
		return;
	}
	
	if (code2 == "hidden"){
		swal("경고","중분류를 선택해주세요.","warning");
		return;
	}
	
	var nameregex = nameregex.exec(name);
	if (nameregex == null) {
		swal("경고","제품명을 다시 확인해주세요.","warning");
		return;
	}

	if (code3.trim() == ''){
		swal("경고","메인 텍스트를 입력해주세요.","warning");
		return;
	}
	
	if (code4.trim() == ''){
		swal("경고","서브 텍스트를 입력해주세요.","warning");
		return;
	}
	
	var sizeregex = sizecolorregex.exec(code5);
	if (sizeregex == null){
		swal("경고","사이즈를 다시 확인해주세요.","warning");
		return;
	}
	
	var colorregex = sizecolorregex.exec(code6);
	if (colorregex == null){
		swal("경고","컬러를 다시 확인해주세요.","warning");
		return;
	}
	
	
	//빈칸 없을 때 제출.
	swal("등록 완료","성공적으로 제품 등록을 완료하였습니다.","success");
	$("#insertproduct").submit();
	
});
</script>

</body>
</html>