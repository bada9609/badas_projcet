<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%
request.setCharacterEncoding("utf-8");
String msg = request.getParameter("msg");
String url = request.getParameter("url");

%>
<script>
alert("${msg }");
location.href="${url}";
</script>


