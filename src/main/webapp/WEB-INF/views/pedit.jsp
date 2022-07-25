<%@page import="org.springframework.web.servlet.view.RedirectView"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/dappoint_list.css" rel="stylesheet">
<link href="resources/css/homedoctor.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
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
</head>
<!-- 환자 개인 수정 메인부분 -->
<body>
<%@ include file="main_top.jsp" %>
<div class="inner-wrap2">
<div class="tcontainer">
  <table class="responsive-table">
    <caption>개인정보수정</caption>
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">아이디</th>
        <th scope="col">비밀번호</th>
        <th scope="col">이름</th>
        <th scope="col">성별</th>
        <th scope="col">이메일</th>
        <th scope="col">주소</th>
        <th scope="col">키</th>
        <th scope="col">몸무게</th>
        <th scope="col">전화번호</th>
        <th scope="col">생일</th>
        <th scope="col">기타</th>
        <th scope="col">수정</th>
      </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody>
      <tr>
        <th scope="row">${pedit.p_number}</th>
        <td data-title="Released">${pedit.p_id}</td>
        <td data-title="Studio">${pedit.p_pw}</td>
        <td data-title="Worldwide Gross">${pedit.p_name}</td>
        <td data-title="Domestic Gross">${pedit.p_gen}</td>
        <td data-title="Foreign Gross">${pedit.p_email}</td>
        <td data-title="Foreign Gross">${pedit.p_addr}</td>
        <td data-title="Foreign Gross">${pedit.p_height}</td>
        <td data-title="Foreign Gross">${pedit.p_weight}</td>
        <td data-title="Foreign Gross">${pedit.p_tel}</td>
        <td data-title="Foreign Gross">${pedit.p_birth}</td>
        <td data-title="Foreign Gross">${pedit.p_etc}</td>
        <td data-title="Budget">
   <a href="update?p_number=${pedit.p_number }">수정</a>/
   <a href="pdform">탈퇴</a>   
        </td>
      </tr>
    </tbody>
  </table>
</div>
</div>
 <!-- 하단 필수항목 -->
<%@ include file="main_bottom.jsp" %>

<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>

</body>
</html>