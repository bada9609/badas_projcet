<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 적용 (main, menu) -->
<link href="resources/css/mainimage.css" rel="stylesheet">
<link href="resources/css/tpboard.css" rel="stylesheet">

</head>

<body>
   <%@ include file="amain_top.jsp"%>

   <div class="col-md-12">
      <div class="site">
         <%
            if (session.getAttribute("a_id") != null) {
         %>
         <h1 class="site__title"><%=session.getAttribute("a_id")%> 관리자
         </h1>
         <%
            } else {
         %>
         <h1 class="site__title">오호 병원에 오신 것을 환영합니다 :)</h1>
         <%
            }
         %>
         <h2 class="site__subtitle">관리자 페이지</h2>
         <!-- 슬라이드 -->
         <div class="section">
            <input type="radio" name="slide" id="slide01" checked> <input
               type="radio" name="slide" id="slide02"> <input type="radio"
               name="slide" id="slide03">
            <div class="slidewrap">

               <ul class="slidelist">
                  <!-- 슬라이드 영역 -->
                  <li class="slideitem"><a>
                         <img src="./resources/images/amain1.jpg" style="width:1200px;height:600px">
                  </a></li>
                  <li class="slideitem"><a>

                        <img src="./resources/images/amain2.jpg" style="width:1200px;height:600px">
                  </a></li>
                  <li class="slideitem"><a>

                         <img src="./resources/images/amain3.jpg" style="width:1200px;height:600px">
                  </a></li class="slideitem">

                  <!-- 좌,우 슬라이드 버튼 -->
                  <div class="slide-control">
                     <div>
                        <label for="slide03" class="left"></label> <label for="slide02"
                           class="right"></label>
                     </div>
                     <div>
                        <label for="slide01" class="left"></label> <label for="slide03"
                           class="right"></label>
                     </div>
                     <div>
                        <label for="slide02" class="left"></label> <label for="slide01"
                           class="right"></label>
                     </div>
                  </div>

               </ul>
               <!-- 페이징 -->
               <ul class="slide-pagelist">
                  <li><label for="slide01"></label></li>
                  <li><label for="slide02"></label></li>
                  <li><label for="slide03"></label></li>
               </ul>
            </div>


         </div>
         <br>
         <br>
         <br>
         <div class="site__box-link">
            <a class="btn btn--width" href="tpboard?page=1">온라인 진단 신청</a> <a
               class="btn btn--revert btn--width" href="appoint">방문 예약</a>
         </div>
      </div>
   </div>

   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

   <%@ include file="amain_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>


</body>
</html>