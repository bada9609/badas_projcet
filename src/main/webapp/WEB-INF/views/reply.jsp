<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/tpboard.css" rel="stylesheet">
<!-- 기본 BASE -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sub").click(function() { // 빈칸 경고메시지
			if ($("#td_title").val() == "") {
				 swal("오류","진단명을 입력해주세요","info");
				return false;
			} else {
				$("#td_title").focus();
			}
			if ($("#td_inter").val() == "") {
				swal("오류","내원여부를 입력해주세요","info");
				return false;
			} else {
				$("#td_inter").focus();
			}
			if ($("#td_medicine").val() == "") {
				swal("오류","처방약을 입력해주세요","info");
				return false;
			} else {
				$("#td_medicine").focus();
			}
			if ($("#td_content").val() == "") {
				swal("오류","진단내용을 선택해주세요","info");
				return false;
			} else {
				$("#td_content").focus();
			}		
		});
	});

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
   <br>
   <form action="reply" method="post">
      <input type="hidden" name="page" value="${page}"> <input
         type="hidden" name="d_class" value="${data.d_class }"> <input
         type="hidden" name="d_name" value="${data.d_name }"> <input
         type="hidden" name="p_name" value="${data.p_name }"> <input
         type="hidden" name="p_birth" value="${data.p_birth }"> <input
         type="hidden" name="tp_medicine" value="${data.tp_medicine }">
      	<input type="hidden" name="tp_tem" value="${data.tp_tem }"> <input
         type="hidden" name="tp_content" value="${data.tp_content }">
         <input type="hidden" name="tp_pn" value="${data.tp_pn }">
         <input type="hidden" name="tp_dn" value="${data.tp_dn }">
         <input type="hidden" name="td_num" value="${data.tp_num }" readonly="readonly">
         <input type="hidden" name="td_check" value="발급완료">
         
         
         <input type="hidden" name="gnum" value="${data.gnum }">
         <input type="hidden" name="onum" value="${data.onum }">
         
         <h2 style="text-align: center;">환자 진료 신청서</h2>
 <div class="tcontainer">
         <table border="1" class="responsive-table">
            <thead>
               <tr>
                  <th width="15%" style="text-align: center">글번호</th>
                  <td width="35%">${data.tp_num }</td>
                  <th width="15%" >작성일</th>
                  <td width="35%">${data.tp_date }</td>

               </tr>

               <tr>
                  <th style="text-align: center">환자번호</th>
                  <td>${data.tp_pn }</td>
                  <th>의사번호</th>
                  <td>${data.tp_dn }</td>

               </tr>

               <tr>
                  <th style="text-align: center">진료과</th>
                  <td>${data.d_class }</td>
                  <th>담당의</th>
                  <td>${data.d_name }</td>
               </tr>

               <tr>
                  <th style="text-align: center">환자명</th>
                  <td>${data.p_name }</td>
                  <th>생년월일</th>
                  <td>${data.p_birth }</td>
               </tr>

               <tr>
                  <th style="text-align: center">복용약</th>
                  <td>${data.tp_medicine }</td>
                  <th>체온</th>
                  <td>${data.tp_tem }</td>
               </tr>

               <tr>
                  <th style="text-align: center">제목</th>
                  <td colspan="3">${data.tp_title }</td>
               </tr>

               <tr>
                  <th style="text-align: center">증상</th>
                  <td colspan="3">${data.tp_content }</td>
               </tr>

               <tr>
                  <td colspan="4" style="text-align: center;"><input
                     type="button" onclick="location.href='tdboard?page=1'" value="목록">
                  </td>
               </tr>

            </thead>
            </table>
            <br>
            <br>
            <br>
</div>
<div class="tcontainer">
     <table border="1" class="responsive-table">
    <thead>
         <h1 style="text-align: center;">진단서</h1>
         <tr>
            <th style="text-align: center">제목</th>
            <td><input type="text" name="tp_title" readonly="readonly"
               value="&nbsp;&nbsp;&nbsp;<b>▶[진단서 발급완료]:<b>${data.tp_title }"  style="width: 500px"></td>
         </tr>
         <tr>
            <th style="text-align: center">진단명</th>
            <td><input type="text" name="td_title" id="td_title"></td>
         </tr>
         <tr>
            <th style="text-align: center">내원여부</th>
            <td><input type="text" name="td_inter" id="td_inter"></td>
         </tr>
         <tr>
            <th style="text-align: center">처방약</th>
            <td><input type="text" name="td_medicine" id="td_medicine"></td>
         </tr>
         <tr>
            <th style="text-align: center">진단내용</th>
            <td><textarea style="width: 1000px" name="td_content" id="td_content"></textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;"><input
               type="submit" value="등록" id="sub"> <input type="button" value="목록"
               onclick="location.href='tdboard?page=1'"></td>
         </tr>
 </thead>
  </table>
</div>

   </form>

   <br>
   <!-- 하단 필수항목 -->
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>