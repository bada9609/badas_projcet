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
					<form class="form-horizontal form-bordered" action="/" name="wysihtml5" method="POST">
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품명<span class="text-danger">*</span></label>
							<div class="col-lg-3">
							<input type="text" class="form-control m-b-5" value="${product_data.product_name }" disabled>
							</div>
							<input type="hidden" id="product_id" value="${product_data.product_id }">
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">대분류 <br>
							카테고리</label>
							<div class="col-lg-3">
							<select class="form-control" id ="product_type" disabled>
								<option value="1">CLOTHINGS</option>
   								<option value="2">FOOTWEAR</option>
   								<option value="3">ACCESSORIES</option>
   								<option value="4">WOMEN</option>     
							</select>					
							</div>
							<label class="col-lg-2 col-form-label justify-content-lg-end">중분류 <br>
							 카테고리</label>
							<div class="col-lg-3" id="str2">
									
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">가격</label>
							<div class="col-lg-3" id="str3">
							</div>
							<label class="col-lg-2 col-form-label justify-content-lg-end">등록일자</label>
							<div class="col-lg-3" id="str4">
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">등록된 <br> 메인이미지</label>
							<div class="col-lg-9" id="str5">
								
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">메인 이미지 등록 파일</label>
							<div class="col-lg-9">
								<div class="input-group" id="str6">
									<!-- 선택된 파일 보여주기 -->
								</div>
							</div>
						</div>
						<!-- //row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">등록된 <br> 서브이미지</label>
							<div class="col-lg-9" id="str7">
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">서브 이미지 등록 파일</label>
							<div class="col-lg-9">
								<div class="input-group" id="str8">
									<!-- 선택된 파일 보여주기 -->
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">메인텍스트</label>
							<div class="col-lg-9" id="str9">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">서브텍스트</label>
							<div class="col-lg-9" id="str10">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품 사이즈</label>
							<div class="col-lg-3" id="str11">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-3 col-form-label">상품 컬러</label>
							<div class="col-lg-3" id="str12">
							</div>
						</div>
					</form>
					<!-- //작성 영역 -->
				</div>
			</div>
			<!-- end panel -->
			<!-- 버튼 영역 -->
			<div class="row justify-content-md-center">
				<button type="submit" class="btn btn-primary start" onclick="location.href='/admin/product/productupdate?product_id=${product_data.product_id }'">
					<i class="fa fa-fw fa-edit"></i>
					<span>편집</span>
				</button>
			</div>
			<!-- //버튼 영역 -->
		</div>
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
	
	   $.ajax({
	         type:"get",
	         url:"productdatashow",
	         data:{product_id:$("#product_id").val()},
	         dataType:"json",
	         success:function(productshowlist){
	        	 var list =  productshowlist.datas;
	             	var str2 = "";
	             	var str3 = "";
	             	var str4 = "";
	             	var str5 = "";
	             	var str6 = "";
	             	var str7 = "";
	             	var str8 = "";
	             	var str9 = "";
	             	var str10 = "";
	             	var str11 = "";
	             	var str12 = "";
	            	$(list).each(function(idx, objArr){
	            		$("#product_type").val(objArr.product_type);
	            		str2 += "<input type='text' class='form-control m-b-5' value='" + objArr.product_category + "'disabled>";
	            		str3 += "<input type='text' class='form-control m-b-5' value='" + objArr.product_price + "원" + "'disabled>";
	            		str4 += "<input type='text' class='form-control m-b-5' value='" + objArr.product_regdate + "'disabled>";	            		
	            		
	            		var fileCallPathMain = encodeURIComponent(objArr.product_mainfilepath + "/s_" + objArr.product_mainfileuuid + "_" + objArr.product_mainfilename);
	            		if(objArr.product_mainfilepath == null){
	            			str5 += "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
	            		}else{
	            			str5 += "<td>" + "<img width='50'; height='50'; src='/display?fileName=" + fileCallPathMain + "'>" + "</td>";
	            		}  
	            		if(objArr.product_mainfilename == null){
	            			str6 += "<input type='file' class='form-control' disabled>"
	            		}else{
		            		str6 += "<input type='text' class='form-control' value='" + objArr.product_mainfilename +  "'disabled>"
	            		}	
	            		var fileCallPathSub = encodeURIComponent(objArr.product_subfilepath + "/s_" + objArr.product_subfileuuid + "_" + objArr.product_subfilename);
	            		if(objArr.product_subfilepath == null){
	            			str7 += "<td>" + "<img width='50'; height='50'; src='/resources/images/kgb_d.jpg'>" + "</td>";
	            		}else{
	            			str7 += "<td>" + "<img width='50'; height='50'; src='/display?fileName=" + fileCallPathSub + "'>" + "</td>";
	            		} 
	            		if(objArr.product_subfilename == null){
	            			str8 += "<input type='file' class='form-control' disabled>"
	            		}else{
	            			str8 += "<input type='text' class='form-control' value='" + objArr.product_subfilename +  "'disabled>"
	            		}
	            		str9 += "<textarea class='form-control m-b-10' style='width:100%; border:1; overflow:visible; text-overflow:ellipsis;' disabled>"+objArr.product_maintext+"</textarea>";
	            		str10 += "<textarea class='form-control m-b-10' style='width:100%; border:1; overflow:visible; text-overflow:ellipsis;' disabled>"+objArr.product_subtext+ "</textarea>";
	            		str11 += "<input type='text' class='form-control m-b-5' value='" + objArr.product_size + "'disabled>";	
	            		str12 += "<input type='text' class='form-control m-b-5' value='" + objArr.product_color + "'disabled>";	
	            	 });
	            $("#str2").append(str2);
	            $("#str3").append(str3);
	            $("#str4").append(str4);
	            $("#str5").append(str5);
	            $("#str6").append(str6);
	            $("#str7").append(str7);
	            $("#str8").append(str8);
	            $("#str9").append(str9);
	            $("#str10").append(str10);
	            $("#str11").append(str11);
	            $("#str12").append(str12);
	         },
	         error:function(){
	            console.log("데이터 쪽 문제");
	         }
		});
});

</script>
</body>
</html>