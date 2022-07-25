<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>오호병원</title>
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/dappoint_list.css" rel="stylesheet">
<%
 if(session.getAttribute("d_id") == null) {
	 %>
	 <script type="text/javascript">
	 alert("로그인 후 이용할 수 있습니다!");
	 window.location.href = "login";
	 </script>
	 <%
 }
	 
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="dmain_top.jsp"%>
<div class="inner-wrap2">
<form action="appoint_update" method="post">
<input type="hidden" name="ap_num" value="${apdto.ap_num}"> <!-- 번호불러오는 친구여서 아무곳이나 있어도 좋아요 -->
<div class="tcontainer">
  <table class="responsive-table">
    <caption>환자예약관리</caption>
    <thead>
      <tr>
        <th scope="col">예약등록일</th>
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
      <tr>
        <th scope="row">${apdto.ap_date}</th>
        <td data-title="Released">${apdto.ap_pname }</td>
        <td data-title="Studio">${apdto.ap_tell }</td>
        <td data-title="Worldwide Gross">${apdto.ap_pbirth }</td>
        <td data-title="Domestic Gross">${apdto.ap_doctor_day }</td>
        <td data-title="Foreign Gross">${apdto.ap_doctor_time }</td>
		<td data-title="Budget">
		<select id="ap_state" name="ap_state">
		<option value="${apdto.ap_state}" disabled>
		<c:if test="${apdto.ap_state eq '1'}">
			예약 대기 중 
		</c:if>
		<c:if test="${apdto.ap_state eq '2'}">
			예약 확인
		</c:if>
		<c:if test="${apdto.ap_state eq '3'}">
			예약 취소
		</c:if>
		</option>
		<option value="1">예약 대기 중</option>
		<option value="2">예약 확인</option>
		<option value="3">예약 취소</option>
		</select>
        </td>
        
        <td data-title="Budget">
			<input type="submit" value="변경">
         </td>
      </tr>
    </tbody>
  </table>
</div>
</form>
</div>

	<%@ include file="dmain_bottom.jsp"%> 
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>