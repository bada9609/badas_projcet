<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mainimage.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/menu.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	swal({
    	title: "정말 구매결정을 하시겠습니까?",
    	text: "",
    	icon: "info",
    	buttons: ["아니요", "예"]
	}).then((YES) => {
   	 	if (YES) {
    	    location.replace("/mypage/orderconfirms?order_id=<%=request.getParameter("order_id")%>");     
    	}else{
        	location.replace('/mypage/myorder');
    	}
	});
});
</script>
</head>
<body>
<main>
</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>