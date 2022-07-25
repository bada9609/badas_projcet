<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/homedoctor.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">
</head>
<body>
   <%@ include file="main_top.jsp"%>
   <br>
   <form>
      <h2 style="text-align: center;">홈닥터 신청서</h2>
      <!-- css 적용---------------------------- -->
      <div class="tcontainer">
         <table border="1" class="responsive-table">
            <thead>
               <tr>
                  <th width="15%" style="text-align: center">글번호</th>
                  <td width="35%">${data.tp_num }</td>
                  <th width="15%">작성일</th>
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
                     type="button" onclick="location.href='tpboard?page=1'" value="목록">
                     <input type="button"
                     onclick="location.href='tpdform?tp_num=${data.tp_num }&page=${page}'"
                     value="삭제"></td>
               </tr>
            </thead>
         </table>
         <br> <br> <br>

         <table border="1" class="responsive-table">
            <h2 style="text-align: center;">진단서</h2>
            <thead>
               <tr>
                  <th width="15%" style="text-align: center;">진단명</th>
                  <td>${data.td_title }</td>
               </tr>
               <tr>
                  <th style="text-align: center;">내원여부</th>
                  <td>${data.td_inter }</td>
               </tr>
               <tr>
                  <th style="text-align: center;">처방약</th>
                  <td>${data.td_medicine }</td>
               </tr>
               <tr>
                  <th style="text-align: center;">진단결과</th>
                  <td colspan="2">${data.td_content }</td>
               </tr>
            </thead>
         </table>
      </div>
      <br> <br>
   </form>
   <br>
   <br>
   <!-- 하단 필수항목 -->
   <%@ include file="main_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>