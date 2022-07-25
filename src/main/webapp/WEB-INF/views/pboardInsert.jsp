<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호 병원</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file="main_top.jsp" %>

<form class="cf" id="insertPboard" action="insertPboard" method="post">
  <div class="half left cf">
    <input type="text" name="NAME" id="NAME" value="${pdata.getP_name()}">
    <input type="text" name="EMAIL" id="EMAIL" value="${pdata.getP_email()}">
    <input type="text" name="TELL" id="TELL" value="${pdata.getP_tel()}">
    <input type="hidden" name="REG_ID" id="REG_ID" value="${pdata.getP_id()}">
    <div id="ak">
    	<input type="text" name="PWD" id="PWD">비밀번호
  	</div>
  </div>
  <div class="half right cf">
  	<select name="CATEGORY_IDX" id="CATEGORY_IDX">
  		<option value="기타" selected="selected">기타</option>
  		<option value="건강">건강</option>
  		<option value="시설문의">시설문의</option>
  	</select>
  	<input type="text" name="TITLE" id="TITLE" placeholder="제목을 입력해주세요">
    <textarea name="CONTENT" id="CONTENT" placeholder="내용을 입력해주세요">
    </textarea>
	<input type="radio" name="pwdch" id="lock" value="lock" checked>
	<label>비밀번호 (O)</label>

	<input type="radio" name="pwdch" id="unlock" value ="unlock">
	<label>비밀번호 (X)</label>
	
  </div>  
  <input type="submit" value="Submit" id="submit">
</form>

<%@ include file="main_bottom.jsp" %>
<script type="text/javascript" src="resources/js/menu.js"></script>
<script type="text/javascript" src="resources/js/views/insertBoard.js"></script>
</body>
</html>