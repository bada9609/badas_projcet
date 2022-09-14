<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>andrea cho shop</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	swal({
	  	title: "로그아웃",
	  	text: "",
	  	icon: "success",
	  	button: "YES",
		}).then((value) => {
			location.href="shopmemberloginform";
		});
});
</script>
</head>
<body>

</body>
</html>