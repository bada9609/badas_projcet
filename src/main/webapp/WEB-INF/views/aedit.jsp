<%@page import="org.springframework.web.servlet.view.RedirectView"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
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
<!-- 관리자 환자 수정 메인부분 -->
<body>
	<%@ include file="amain_top.jsp"%>
	<div class="inner-wrap2">
	<div class="tcontainer">
		<table class="responsive-table">
			<caption>환자 관리</caption>
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
					<th scope="col">폰번호</th>
					<th scope="col">생일</th>
					<th scope="col">기타</th>
					<th scope="col">관리</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${requestScope.aedit }">
					<tr>
						<td>${m.p_number}</td>
						<td>${m.p_id}</td>
						<td>${m.p_pw}</td>
						<td>${m.p_name}</td>
						<td>${m.p_gen}</td>
						<td>${m.p_email}</td>
						<td>${m.p_addr}</td>
						<td>${m.p_height}</td>
						<td>${m.p_weight}</td>
						<td>${m.p_tel}</td>
						<td>${m.p_birth}</td>
						<td>${m.p_etc}</td>
						<td><a href="aupdate?p_number=${m.p_number }">수정</a>/ <a
							href="adform?p_number=${m.p_number }">삭제</a></td>
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