<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<link href="/resources/css/mypage.css" rel="stylesheet">
<link href="/resources/css/mainimage.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/main_top.jsp"%>
<div class="wrap">
  <div class="shippingStatusContainer">
    <div class="title">
      주문/배송조회
    </div>
    <c:forEach var="datas" items="${datas }">
    <div class="status">     
      <div class="item">
        <div>
          <div class="number"><fmt:formatNumber value="${datas.payment_type1}" pattern="#,###" /></div>
          <div class="text">결제완료</div>
        </div>
        <div class="icon"></div>
      </div>     
      <div class="item">
        <div>
          <div class="green number"><fmt:formatNumber value="${datas.payment_type2}" pattern="#,###" /></div>
          <div class="text">배송중</div>
        </div>
        <div class="icon"></div>
      </div>     
      <div class="item">
        <div>
          <div class="green number"><fmt:formatNumber value="${datas.payment_type3}" pattern="#,###" /></div>
          <div class="text">구매확정</div>
        </div>
      </div>     
    </div>
    </c:forEach>
    
  </div>  
  <div class="listContainer">
    <a href="/mypage/myorder?page=1" class="item">
        <div class="icon">ii</div>
        <div class="text">주문목록<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">정보수정</div>
        <div class="right"> > </div>
    </a>
  </div>
  <div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">
          <span>내지갑</span>
          <span class="smallLight">
            <span>|</span>
            <span>보유 적립금</span>
          </span>          
        </div>   
        <c:forEach var="datas2" items="${datas2 }">             
        <div class="right">
          <span class="blct"><fmt:formatNumber value="${datas2.member_point}" pattern="#,###점" /></span>
          > </div>
        </c:forEach>
    </a>
  </div>
</div>
<%@ include file="/WEB-INF/views/main_bottom.jsp"%>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
</body>
</html>