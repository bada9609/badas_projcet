<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
 if(session.getAttribute("d_id") == null) {
	 %>
	 <script type="text/javascript">
	 alert("로그인 후 이용할 수 있습니다!");
	 window.location.href = "dlogin";
	 </script>
	 <%
 }
%>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/dappoint_list.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
</head>
<body>
	<%@ include file="dmain_top.jsp"%>
	<div class="inner-wrap2">
<div class="tcontainer">
  <table class="responsive-table">
    <caption>환자예약관리</caption>
    <thead>
      <tr>
        <th scope="col">예약자명</th>
        <th scope="col">예약자전화번호</th>
        <th scope="col">예약자생년월일</th>
        <th scope="col">예약일</th>
        <th scope="col">예약시간</th>
        <th scope="col">예약상태</th>
        <th scope="col">예약상태수정</th>
      </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody>
    <c:forEach var="al" items="${apdata }">
      <tr>
        <th scope="row">${al.ap_pname }</th>
        <td data-title="Studio">${al.ap_tell }</td>
        <td data-title="Worldwide Gross">${al.ap_pbirth }</td>
        <td data-title="Domestic Gross">${al.ap_doctor_day }</td>
        <td data-title="Foreign Gross">${al.ap_doctor_time }</td>
        <c:set var="state" value="${al.ap_state}" />
        <td data-title="Budget">
			<c:if test="${state eq '1'}">
				예약 대기 중 
			</c:if>
			<c:if test="${state eq '2'}">
				예약 확인
			</c:if>
			<c:if test="${state eq '3'}">
				예약 취소
			</c:if>
        </td>
        <td data-title="Released">
			<a href="dappoint_up?ap_num=${al.ap_num}">변경</a>
        </td>
      </tr>
      <input type="hidden" id="ap_num" value="${al.ap_num}">
    </c:forEach>
    </tbody>
  </table>
</div>
</div>	

	<%@ include file="dmain_bottom.jsp"%> 
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>

</html>