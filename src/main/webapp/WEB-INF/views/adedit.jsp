<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<!-- css 필수항목 -->
<link href="resources/css/tpboard.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<%
	if (session.getAttribute("a_id") == null) {
%>
<script type="text/javascript">
	alert("로그인 후 이용할 수 있습니다!");
	window.location.href = "alogin";
</script>
<%
	}
%>
</head>
<body>
	<%@ include file="amain_top.jsp"%>
	<div class="inner-wrap2">
	<!-- 관리자 의사 리스트 출력 수정삭제 -->
	<div class="tcontainer">
		<table class="responsive-table">
			<caption>의사 관리</caption>
			<thead>
				<tr>
					<th scope="col">의사번호</th>
					<th scope="col">의사아이디</th>
					<th scope="col">의사비밀번호</th>
					<th scope="col">의사명</th>
					<th scope="col">진료과</th>
					<th scope="col">이메일</th>
					<th scope="col">기타</th>
					<th scope="col">관리</th>
				</tr>
				<c:forEach var="d" items="${ddata }">
				<tbody>
					<tr>
						<td>${d.d_number}</td>
						<td>${d.d_id}</td>
						<td>${d.d_pw}</td>
						<td>${d.d_name}</td>
						<td>${d.d_class}</td>
						<td>${d.d_email}</td>
						<td>${d.d_etc}</td>
						<td><a href="adupdate?d_number=${d.d_number }">수정</a>/ <a
							href="d_adform?d_number=${d.d_number }">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 하단 필수항목 -->
	</div>
	<%@ include file="amain_bottom.jsp"%>

	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/menu.js"></script>


</body>
</html>