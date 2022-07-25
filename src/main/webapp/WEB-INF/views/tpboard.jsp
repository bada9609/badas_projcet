<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<!-- 
  <link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/menu.css" rel="stylesheet">
 -->
<link href="resources/css/tpboard.css" rel="stylesheet">
<link href="resources/css/homedoctor.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<%
   if (session.getAttribute("p_id") == null) {
%>
<script type="text/javascript">
   alert("로그인 후 이용할 수 있습니다!");
   window.location.href = "login";
</script>
<%
   }
%>
</head>
<body>
   <%@ include file="main_top.jsp"%>
<div class="inner-wrap2">

   <!-- css 적용---------------------------- -->
   <div class="tcontainer">
      <table class="responsive-table">
         <h2 style="text-align: center">홈 닥터</h2>
         <div style="float: left;">
            <a href="tpboard?page=1">최근목록</a>&nbsp; <a href="tpboard_insert">홈닥터
               신청</a>
         </div>

         <thead>
            <tr>
               <th scope="col" style="text-align: center;">번호</th>
               <th scope="col">환자번호</th>
               <th scope="col">제목</th>
               <th scope="col">작성일</th>
               <th scope="col">상세보기</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="b" items="${data}">
               <tr>
                  <th scope="row" style="text-align: center;">${b.tp_num }</th>
                  <td data-title="Released">${b.tp_pn }</td>
                  <td data-title="Studio">${b.tp_title }</td>
                  <td data-title="Studio">${b.tp_date }</td>
                  <td data-title="Studio">${tab}
                  <a href="tpboard_detail?tp_num=${b.tp_num}&page=${page}">확인</a></td>

               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>

   <!-- ------------------------- -->
   <table>
      <!-- paging -->
      <tr style="text-align: center;">
         <td colspan="5"><c:forEach var="i" begin="1" end="${pageSu }">
               <c:if test="${i == page }">
                  <b>${i }</b>
               </c:if>
               <c:if test="${i != page }">
                  <a href="tpboard?page=${i}">${i}</a>
               </c:if>
            </c:forEach></td>
      </tr>

      <!-- search -->
      <tr style="text-align: center;">
         <td colspan="5"><br>
         <br>
            <form action="search" method="post">
               <select name="searchName">
                  <option value="tp_title" selected="selected">글제목</option>
               </select> <input type="text" name="searchValue"> <input
                  type="submit" value="검색">
            </form></td>
      </tr>
   </table>
   <br>
   <br>
   <br>
   <!-- 하단 필수항목 -->
   </div>
   
   <%@ include file="main_bottom.jsp"%>

   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>