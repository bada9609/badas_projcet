<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<link href="resources/css/appoint.css" rel="stylesheet">
<%
 if(session.getAttribute("p_id") == null) {
    %>
    <script type="text/javascript">
    alert("로그인 후 이용할 수 있습니다!");
    window.location.href = "login";
    </script>
    <%
 }
%>

<!-- 기본 BASE -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

//의사, 과명 스크립트
</script>
<style type="text/css">
input, select{
	 border: none;
	 background: transparent;
	 height: 30px
}
</style>
</head>
<body>
<%@ include file="main_top.jsp" %>
<br><br><br><br>
<form class="quick-reservation" action="appinsert" method="post">
<div class="container">
   <header class="quick-reservation__header">
      <h2 class="title">
         방문 예약하기
      </h2>
         <span></span>
         <span></span>
   </header>
   
   <div class="quick-reservation__form">
      <section class="form__content">
         <div class="row-wrapper">
            <div class="ele first-name">
               <label for="adults">진료과</label>
               <select name="adults" id="ap_showbuser">
                  <option name="first" value="hide">==선택하세요==</option>
   					<c:forEach var="b" items="${classdatas}">
   					<option name="b_select" id="b_select" value="${b.c_class}">${b.c_class}</option>
   					</c:forEach>
               </select>
            </div>
            <div class="ele first-name">
               <label for="children">담당의</label>
               <select name="children" id="ap_showDoctor">
               </select>
            </div>
            <div class="ele first-name">
               <label for="rateType">날짜선택</label>
              <input type="date" id="ap_dday" name="ap_dday" min="2020-10-16">
            </div>
            <div class="ele first-name">
               <label for="Rooms">진료시간</label>
               <input type="time" id="ap_dtime" name="ap_dtime" value="09:00:00"min="09:00:00" max="18:00:00">
            </div>         
         </div>
         <div class="row-wrapper">  
            <div class="ele first-name">
               <label for="title">환자이름</label>
               <input type="text" readonly name="ap_pname" id="ap_pname" size="15" value="${pdata.getP_name()}" >
            </div>
            <div class="ele first-Name">
               <label for="lastName">연락처</label>
               <input type="text" readonly name="ap_tell" id="ap_tell" size="15" value="${pdata.getP_tel() }">
            </div> 
         <div class="ele last-name">
               <label for="lastName">생년월일</label>
               <input type="text" readonly name="ap_pbirth" id="ap_pbirth" size="15" value="${pdata.getP_birth() }">
            </div>     
         </div>
         
         <div class="row-wrapper">
            <div class="ele email-address">
               <label for="emailAddress">진료과</label>
               <input type="text" name="ap_buser_show" id="ap_buser_show" readonly>
            </div>
			<div class="ele email-address">
               <label for="emailAddress">담당의</label>
               <input type="text" name="ap_doctor_show" id="ap_doctor_show" >
            </div>
			<div class="ele email-address">
               <label for="emailAddress">진료일</label>
               <input type="text" name="ap_doctor_day" id="ap_doctor_day" readonly>
            </div>
			<div class="ele email-address">
               <label for="emailAddress">예약시간</label>
               <input type="text" name="ap_doctor_time" id="ap_doctor_time" readonly>
            </div>
            
            
         </div>
         
         <div class="row-wrapper more-options">
   			<div class="ele email-address">
               <label for="emailAddress">환자번호</label>
               <input type="text" name="ap_pno" id="ap_pno" value="${pdata.getP_number()}">
            </div>
   			<div class="ele email-address">
               <label for="emailAddress">의사번호</label>
               <input type="text" name="ap_dno" id="ap_dno" >
            </div> 
         </div>
         
      </section>
   </div>
   
   <footer class="form__footer">
      <div class="footer-wrapper">
         <input type="submit" id="submit" value="예약하기">
         <input type="button" value="목록" onclick="location.href='appoint_list'">
      </div>
   </footer>
</div>
   
</form>
<br><br><br><br>
<!-- 하단 필수항목 -->
<%@ include file="main_bottom.jsp" %>
<script type="text/javascript" src="resources/js/menu.js"></script>
<script type="text/javascript" src="resources/js/views/appoint.js"></script>
</body>
</html>



