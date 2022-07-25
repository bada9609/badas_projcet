<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/homedoctor.css" rel="stylesheet">
<script type="text/javascript">
const result = confirm("정말 삭제하시겠습니까?");
	
if(result){
	location.replace("addelete?d_number=<%=request.getParameter("d_number")%>");
	
}else{
	location.replace('adedit');
}
</script>
</head>
<body>
삭제용
</body>
</html>