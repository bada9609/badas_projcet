<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/homedoctor.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
<!-- 기본 BASE -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tp_showbuser").change(doctorshow);
		$("#tp_showDoctor").empty();
		$("#sub").click(function() { // 빈칸 경고메시지

		    if ($("#tp_title").val() == "") {
                swal("오류","제목을 입력해주세요","info");
                return false;
             } else {
                $("#tp_title").focus();
             }
             if ($("#d_class").val() == "") {
                swal("오류","진료과를 선택해주세요","info");
                return false;
             } else {
                $("#d_class").focus();
             }
             if ($("#d_name").val() == "") {
                swal("오류","담당의를 선택해주세요","info");
                return false;
             } else {
                $("#d_name").focus();
             }
             if ($("#tp_medicine").val() == "") {
                swal("오류","복용하시는 약을 입력해주세요","info");
                return false;
             } else {
                $("#tp_medicine").focus();
             }
             if ($("#tp_tem").val() == "") {
                swal("오류","체온을 입력해주세요","info");
                return false;
             } else {
                $("#tp_tem").focus();
             }
             if ($("#tp_content").val() == "") {
                swal("오류","증상을 입력해주세요","info");
                return false;
             } else {
                $("#tp_content").focus();
       }
             swal("성공","접수 되었습니다.","success");
		});
	});

	function doctorshow(c_class) { //과 선택후 의사 보여주기
		$("#tp_showDoctor").empty();
		var show = $("#tp_showbuser option:selected").val();
		document.getElementById("d_class").value = show; // 과선택시 밑 화면 출력
		$.ajax({
			type : "get",
			url : "doctors",
			data : {
				"c_class" : $("#tp_showbuser option:selected").val()
			},
			dataType : "json",
			success : function(doctors) {
				var list = doctors.datas;
				var str = "<option name='select' value = '선택하세요'>" + "선택하세요"
						+ "</option>";
				$(list).each(
						function(idx, objArr) {
							str += "<option value= '"+objArr.d_name+"'>"
									+ objArr["d_name"] + "</option>";
						});
				$("#tp_showDoctor").append(str);
				$("#tp_showDoctor").change(doctorselect); // 의사선택시 밑 화면 출력

			},
			error : function() {
				$("#tp_showDoctor").text("에러발생 ");
			}

		});
	}

	function doctorselect(d_name) {// 의사선택시 밑 화면 출력 and 의사번호 불러오기
		$.ajax({
			type : "get",
			url : "doctor_nos",
			data : {
				"d_name" : $("#tp_showDoctor> option:selected").val()
			},
			dataType : "json",
			success : function(doctorsnum) {
				var list = doctorsnum.ddatas;
				$(list).each(function(idx, objArr) {
					$("#tp_dn").val(objArr.d_number);
					var show5 = $("#tp_showDoctor> option:selected").val();
					document.getElementById("d_name").value = show5;
				});
			},
			error : function() {
				$("#tp_dn").text("에러발생 ");
			}
		});
	}
</script>
<style type="text/css">
input, textarea, select{
	 border: none;
	 background: transparent;
	 height: 30px
}
</style>
</head>
<body>
	<%@ include file="main_top.jsp"%>
	<br>
	<form action="insert" method="post">
		<input type="hidden" name="td_title" value="발급받은 진단서에서 확인하십시오">
		<input type="hidden" name="td_inter" value="발급받은 진단서에서 확인하십시오">
		<input type="hidden" name="td_content" value="발급받은 진단서에서 확인하십시오">
		<input type="hidden" name="td_medicine" value="발급받은 진단서에서 확인하십시오">
		<input type="hidden" name="td_check" value="발급하기">

<div class="tcontainer">
  <table border="1" class="responsive-table">
    <caption>홈닥터 신청서</caption>
    <thead>
      <tr>
            <th style="text-align: center">제목</th>
            <td colspan="3"><input type="text" id="tp_title"
               name="tp_title" placeholder="ex) 두통 문의"  style="width: 500px"></td>
         </tr>
         <tr>
            <th style="text-align: center">진료과</th>
            <td><select id="tp_showbuser" name="tp_showbuser">
                  <option name="first" value="0">선택하세요</option>
                  <c:forEach var="b" items="${classdatas}">
                     <option name="b_select" id="b_select" value="${b.c_class}">${b.c_class}</option>
                  </c:forEach>
            </select></td>

            <th style="text-align: center">담당의</th>
            <td><select id="tp_showDoctor" name="tp_showDoctor">
            </select></td>
         </tr>
         
         <tr>
            <th style="text-align: center">진료과</th>
            <td><input type="text" name="d_class" id="d_class" readonly></td>

            <th style="text-align: center">담당의</th>
            <td><input type="text" name="d_name" id="d_name" readonly></td>
         
         </tr>
         <tr>
            <th style="text-align: center">의사번호</th>
            <td><input type="text" name="tp_dn" id="tp_dn" readonly></td>

            <th style="text-align: center">환자번호</th>
            <td> <input type="text" name="tp_pn" id="tp_pn" value="${pdata.getP_number() }" readonly> 
            <input type="hidden" name="pid" id="pid" value="${p_id}"></td>
         </tr>
         
         <tr>
            <th style="text-align: center">환자명</th>
            <td><input type="text" name="p_name" id="p_name" value="${pdata.getP_name() }" readonly></td>
            <!-- 로그인한 환자 이름 자동으로 들어가도록 나중에 수정해야함 -->
            <th scope="col">생년월일</th>
            <td><input type="text" name="p_birth" id="p_birth" max="2020-10-16" value="${pdata.getP_birth() }" readonly></td>
            <!-- 로그인한 환자 생년월일 자동으로 들어가도록 나중에 수정해야함 -->
         </tr>
         <tr>
            <th style="text-align: center">복용약</th>
            <td><input type="text" name="tp_medicine" id="tp_medicine"
               placeholder="현재 복용중이신 약"></td>
            <th scope="col" style="text-align: center">체온</th>
            <td><input type="text" name="tp_tem" id="tp_tem"
               placeholder="ex) 36.5"></td>
         </tr>

         <tr>
            <th style="text-align: center">증상</th>
            <td colspan="3"><textarea style="width: 1000px" name="tp_content"
                  id="tp_content" placeholder="ex) 머리가 어지럽고 속이 답답하며 메슥거립니다."></textarea></td>
         </tr>
         <tr>
            <td colspan="4" style="text-align: center;"><input
               type="hidden" name="td_dn" value="${dto.td_dn }"> <input
               type="hidden" name="td_pn" value="${dto.td_pn }"> <input
               type="submit" value="등록" id="sub"> <input type="button"
               value="목록" onclick="location.href='tpboard?page=1'"></td>
 </tr>
    </thead>
  </table>
</div>
   <br>

	<!-- 하단 필수항목 -->
	<%@ include file="main_bottom.jsp"%>

	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>