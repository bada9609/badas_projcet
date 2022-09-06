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

<!-- ================== BEGIN STYLE ================== -->
<!-- 공통 -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="/resources/assets/css/default/app.min.css" rel="stylesheet" />
<!-- 컴포넌트 |데이터피커|콤보박스|셀렉트박스| CSS -->
<link href="/resources/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="/resources/assets/plugins/ion-rangeslider/css/ion.rangeSlider.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/@danielfarrell/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
<link href="/resources/assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css" rel="stylesheet" />
<link href="/resources/assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet" />
<link href="/resources/assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-fontawesome.css" rel="stylesheet" />
<link href="/resources/assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet" />
<link href="/resources/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="/resources/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<!--웹에디터 -->
<link href="/resources/assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/abpetkov-powerange/dist/powerange.min.css" rel="stylesheet" />
<link href="/resources/assets/plugins/bootstrap3-wysihtml5-bower/dist/bootstrap3-wysihtml5.min.css" rel="stylesheet" />
<!-- ================== END STYLE ================== -->
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/admin/amain_side.jsp" %>
<div id="layoutSidenav_content">
<div id="content" class="content" style="margin-left: 0px ">
				<div class="panel-body panel-form">
					<!-- 작성 영역 -->
					<form class="form-horizontal form-bordered" action=updateProduct id="Productupdate" method="POST">
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품명<span class="text-danger">*</span></label>
							<div class="col-lg-3">
							<input type="text" class="form-control m-b-5" value="${product_data.product_name }" name="product_name">
							</div>
							<input type="hidden" name="product_id" id="product_id" value="${product_data.product_id }">
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">대분류 <br>
							카테고리</label>
							<div class="col-lg-3">
							<select class="form-control" id ="product_type" name ="product_type">
								<option value ="hidden">==선택하세요==</option>
								<option value="1">CLOTHINGS</option>
   								<option value="2">FOOTWEAR</option>
   								<option value="3">ACCESSORIES</option>
   								<option value="4">WOMEN</option>     
							</select>					
							</div>
							<label class="col-lg-2 col-form-label justify-content-lg-end">중분류 <br>
							 카테고리</label>
							 <div class="col-lg-3">
							 <select class="form-control" id ="product_category" name ="product_category">
							 	<option value ="hidden">==선택하세요==</option>
							 </select>	
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">가격</label>
							<div class="col-lg-3" id="str3">
								<input type="text" class="form-control m-b-5" value="${product_data.product_price }" name="product_price" >
							</div>
							<label class="col-lg-2 col-form-label justify-content-lg-end">등록일자</label>
							<div class="col-lg-3" id="str4">
								<input type="text" class="form-control m-b-5" value="${product_data.product_regdate }" disabled="disabled" >
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">등록된 <br> 메인이미지</label>
							<div class="col-lg-9" id="mainimage">
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">메인 이미지 등록 파일</label>
							<div class="col-lg-9" id="mainimagechange">
								<input type='file' class='form-control m-b-5' id='product_main_image'>
							</div>
						</div>
						<!-- //row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">등록된 <br> 서브이미지</label>
							<div class="col-lg-9" id="subimage">
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">서브 이미지 등록 파일</label>
							<div class="col-lg-9" id="subimagechange">
									<input type='file' class='form-control m-b-5' id='product_sub_image'>
							</div>
						</div>
						<div>
							<input type="hidden" id="product_imageYN" name="product_imageYN"  value = "N">
							<div id="mainimagedata"></div>
							<div id="subimagedata"></div>
							<div>
								<input type="hidden" id="main_use" name="main_use">
								<input type="hidden" id="sub_use" name="sub_use">
								<input type="hidden" id="mainDel" name="mainDel" value='N'>
								<input type="hidden" id="subDel" name="subDel" value='N'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">메인텍스트</label>
							<div class="col-lg-9">
							<textarea id="product_maintext" name="product_maintext" class="form-control" style="width:100%; border:1; overflow:visible; text-overflow:ellipsis;" placeholder="설명 텍스트">${product_data.product_maintext}</textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">서브텍스트</label>
							<div class="col-lg-9">
								<textarea id="product_subtext" name="product_subtext" class="form-control" style="width:100%; border:1; overflow:visible; text-overflow:ellipsis;" placeholder="설명 텍스트">${product_data.product_subtext}</textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품 사이즈</label>
							<div class="col-lg-3">
								<input type="text" id="product_size" name="product_size" class="form-control m-b-5" value="${product_data.product_size }">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품 컬러</label>
							<div class="col-lg-3">
								<input type="text" id="product_color" name="product_color" class="form-control m-b-5" value="${product_data.product_color }">
							</div>
						</div>
					</form>
					<!-- //작성 영역 -->
				</div>
			</div>
			<!-- end panel -->
			<!-- 버튼 영역 -->
			<div class="row justify-content-md-center">
				<button id="updatesubmit"type="button" class="btn btn-primary start">
					<i class="fa fa-fw fa-edit"></i>
					<span>편집</span>
				</button>
			</div>
			<!-- //버튼 영역 -->
		<!-- end #content -->
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	<!-- end page container -->
<!-- 공통 -->
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/js/theme/default.min.js"></script>
<!-- 컴포넌트 |데이터피커|콤보박스|셀렉트박스| CSS -->
<script src="/resources/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script src="/resources/assets/js/demo/table-manage-default.demo.js"></script>
<script src="/resources/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="/resources/assets/plugins/moment/min/moment.min.js"></script>
<script src="/resources/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="/resources/assets/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="/resources/assets/plugins/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="/resources/assets/plugins/jquery.maskedinput/src/jquery.maskedinput.js"></script>
<script src="/resources/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="/resources/assets/plugins/pwstrength-bootstrap/dist/pwstrength-bootstrap.min.js"></script>
<script src="/resources/assets/plugins/@danielfarrell/bootstrap-combobox/js/bootstrap-combobox.js"></script>
<script src="/resources/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/resources/assets/plugins/tag-it/js/tag-it.min.js"></script>
<script src="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/resources/assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="/resources/assets/plugins/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="/resources/assets/plugins/bootstrap-show-password/dist/bootstrap-show-password.js"></script>
<script src="/resources/assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
<script src="/resources/assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script src="/resources/assets/plugins/clipboard/dist/clipboard.min.js"></script>
<script src="/resources/assets/js/demo/form-plugins.demo.js"></script>
<script src="/resources/assets/plugins/switchery/switchery.min.js"></script>
<script src="/resources/assets/plugins/abpetkov-powerange/dist/powerange.min.js"></script>
<script src="/resources/assets/js/demo/form-slider-switcher.demo.js"></script>
<!--웹에디터 -->
<script src="/resources/assets/plugins/ckeditor/ckeditor.js"></script>
<!--검증 -->
<script src="/resources/assets/plugins/parsleyjs/dist/parsley.min.js"></script>
<script src="/resources/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="/resources/assets/js/demo/render.highlight.js"></script>
<!-- ================== END JS ================== -->
<script>
$(document).ready(function(){

	$("#product_type").val("${product_data.product_type}");
	function categoryCall(){
		$("#product_category").empty();
	$.ajax({
	         type:"get",
	         url:"product_category",
	         data:{"mp_code":$("#product_type option:selected").val()},
	         dataType:"json",
	         success:function(producttypelist){
	        	 var list =  producttypelist.datas;
	             	var str ="<option name='select' value = 'hidden' selected disabled hidden>"+"==선택하세요=="+"</option>";
	            		$(list).each(function(idx, objArr){
	               		str += "<option value='"+objArr.category_name+"'>"+objArr.category_name+"</option>";
	            		});
	            $("#product_category").append(str);
	            $("#product_category").val("${product_data.product_category}");
	         },
	         error:function(){
	            $("#product_category").text("에러발생 "); 
	         }
		});
	}
	categoryCall();
	$("#product_type").on("change", function(e){
		categoryCall();
	});
	
	   $.ajax({
	         type:"get",
	         url:"productdatashow",
	         data:{product_id:$("#product_id").val()},
	         dataType:"json",
	         success:function(productshowlist){
	        	 var list =  productshowlist.datas;
	             	var str5 = "";
	             	var str6 = "";
	             	var str7 = "";
	             	var str8 = "";
	             	var strm = "";
	             	var strs = "";
	            	$(list).each(function(idx, objArr){
	            		var fileCallPathMain = encodeURIComponent(objArr.product_mainfilepath + "/s_" + objArr.product_mainfileuuid + "_" + objArr.product_mainfilename);
	            		if(objArr.product_mainfilepath == null){
	            			str5 += "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
	            			$("#main_use").val('N');
	            		}else{
	            			str5 += "<div id='mainimagedelete' data-file='"+ fileCallPathMain +"'>"
	            			str5 += "<td>" + "<img width='50'; height='50'; src='/display?fileName=" + fileCallPathMain + "'>" + "</td>";
	            			str5 += "</div>";
	            			strm += "<input type='hidden' id='main_image_filename' name='main_image_filename' value='"+ objArr.product_mainfilename +"'>";
	    	 				strm += "<input type='hidden' id='main_image_uuid' name='main_image_uuid' value='"+ objArr.product_mainfileuuid +"'>";
	    	 				strm += "<input type='hidden' id='main_image_filepath' name='main_image_filepath' value='"+ objArr.product_mainfilepath +"'>";
							
	            			str6 += "<button type='button' class='btn btn-primary start' onclick='removeMainCheck();'>";
							str6 += "<i class='fa fa-fw fa-edit'></i>";
							str6 += "<span>"+"이미지 추가 /" + "수정 /" + "삭제" + "</span>";
							str6 += "</button>";
							$("#mainimagechange").empty().append(str6);
							$("#main_use").val('Y');
							$("#product_imageYN").val("Y");
	            		}  
	            		var fileCallPathSub = encodeURIComponent(objArr.product_subfilepath + "/s_" + objArr.product_subfileuuid + "_" + objArr.product_subfilename);
	            		if(objArr.product_subfilepath == null){
	            			str7 += "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
	            			$("#sub_use").val('N');
	            		}else{
	            			str7 += "<div id='subimagedelete' data-file='"+ fileCallPathSub +"'>"
	            			str7 += "<td>" + "<img width='50'; height='50'; src='/display?fileName=" + fileCallPathSub + "'>" + "</td>";
	            			str7 += "</div>";
	            			
	            			strs += "<input type='hidden' id='sub_image_filename' name='sub_image_filename' value='"+ objArr.product_subfilename +"'>";
	    	 				strs += "<input type='hidden' id='sub_image_uuid' name='sub_image_uuid' value='"+ objArr.product_subfileuuid +"'>";
	    	 				strs += "<input type='hidden' id='sub_image_filepath' name='sub_image_filepath' value='"+ objArr.product_subfilepath +"'>";
	            			
							str8 += "<button type='button' class='btn btn-primary start' onclick='removeSubCheck();'>";
							str8 += "<i class='fa fa-fw fa-edit'></i>";
							str8 += "<span>"+"이미지 추가 /" + "수정 /" + "삭제" + "</span>";
						    str8 += "</button>";
						    $("#subimagechange").empty().append(str8);
						    $("#sub_use").val('Y');
						    $("#product_imageYN").val("Y");
	            		}  

	            	 });
	            $("#mainimage").empty().append(str5);
	            $("#subimage").empty().append(str7);
	            $("#mainimagedata").empty().append(strm);
	            $("#subimagedata").empty().append(strs);
	         },
	         error:function(){
	            console.log("데이터 쪽 문제2");
	         }
		});
	   
	   
});

function yncheck() {
	   var mainUse = $("#main_use").val();
	   var subUse = $("#sub_use").val();
	   
		if(mainUse =="Y" || subUse == "Y"){
			$("#product_imageYN").val("Y");
		}else if (mainUse == "N" && subUse == "N"){
			$("#product_imageYN").val("N");
		}
}


// 메인 이미지 삽입 시
$("#mainimagechange").on("change", function(e){
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
			$("#main_use").val('Y');
			$("#mainDel").val('N');
	 		mainuploadResult.empty().append(str);
	 	},	
	    error:function(){
			alert("에러입니다");
		}    
		
	});	
	
});

//서브 이미지 호출 시
$("#subimagechange").on("change", function(e){
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
			$("#sub_use").val('Y');
			$("#subDel").val('N');
	 		mainuploadResult.empty().append(str);
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

function removeMainCheck() {
	if (confirm("이미지 수정 시 기존 이미지는 삭제 후 재등록 됩니다.") == true){//확인
		deleteMainFile();
		const maintag = "<input type='file' class='form-control m-b-5' id='product_main_image' name='product_main_image'>";
		$("#main_use").val('N');
		$("#mainDel").val('Y');
		let str = "";
		str += "<input type='hidden' id='main_image_filename' name='main_image_filename'>";
		str += "<input type='hidden' id='main_image_uuid' name='main_image_uuid>";
		str += "<input type='hidden' id='main_image_filepath' name='main_image_filepath'>";
		$("#mainimagedata").empty().append(str);
		$('#mainimagechange').empty().append(maintag);
	}else{   //취소
		return false;
		}

}

function removeSubCheck() {
	if (confirm("이미지 수정 시 기존 이미지는 삭제 후 재등록 됩니다.") == true){//확인
		deleteSubFile();
		const subtag = "<input type='file' class='form-control m-b-5' id='product_sub_image' name='product_sub_image'>";
		$("#sub_use").val('N');
		$("#subDel").val('Y');
		let str = "";
		str += "<input type='hidden' id='sub_image_filename' name='sub_image_filename'>";
		str += "<input type='hidden' id='sub_image_uuid' name='sub_image_uuid>";
		str += "<input type='hidden' id='sub_image_filepath' name='sub_image_filepath'>";
		$("#subimagedata").empty().append(str);
		$('#subimagechange').empty().append(subtag);
	}else{   //취소
		return false;
		}

}	 

function deleteMainFile(){
	
	let targetFile = $("#mainimagedelete").data("file");	
	console.log(targetFile);
	$.ajax({
		url: 'deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			let showdata = "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
			$("#mainimage").empty().append(showdata);
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
}	


function deleteSubFile(){
	
	let targetFile = $("#subimagedelete").data("file");	
	console.log(targetFile);
	$.ajax({
		url: 'deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			let subshowdata = "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
			$("#subimage").empty().append(subshowdata);
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
}	   

$("#updatesubmit").on("click", function() {
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

	yncheck();
	
	//빈칸 없을 때 제출.
	swal("등록 완료"," 수정을 완료하였습니다.","success");
	$("#Productupdate").submit();
	

});
</script>
</body>
</html>