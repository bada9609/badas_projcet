<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%
request.setCharacterEncoding("utf-8");
String msg = request.getParameter("msg");
String url = request.getParameter("url");
%>
<script>
$(document).ready(function(){
	swal({
	  	title: "경고",
	  	text: "${msg}",
	  	icon: "error",
	  	button: "YES",
		}).then((value) => {
			location.href="${url}";
		});
});
</script>


