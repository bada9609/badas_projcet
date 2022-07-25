<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오호병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="resources/css/appoint.css" rel="stylesheet">

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
<style type="text/css">
input, select{
	 border: none;
	 background: transparent;
	 height: 30px
}
</style>
</head>
<body>
   <!-- 상단 필수항목 -->
   <%@ include file="amain_top.jsp"%>
   <br><br><br>

   <br>
   <form id="signform" class="quick-reservation" action="doctorinsert"  method="POST">
      <div id="wrapper" class="container">
         <header class="quick-reservation__header">
            <h2 class="title">의사 아이디 생성</h2>
            <span></span> <span></span>
         </header>


         <div class="quick-reservation__form" style="text-align: center">
         <section class="form__content" style="text-align: left; margin-left: 35%">
         <label for="id">아이디</label> 
         <input type="text" id="d_id" name="d_id" placeholder="ID" style="margin-left: 30px; margin-right: 5px;"> 
            <input type="button" id="btnid" value="중복확인" style="width: 80px;">
         <div class="did regex"></div><br>

         <label for="pw">비밀번호</label> <input type="text" id="d_pw"
            name="d_pw" placeholder="PASSWORD" style="margin-left: 18px;">
         <div class="pw regex"></div><br>

         <label for="d_name">이름</label> <input type="text" id="d_name"
            name="d_name" placeholder="Name" style="margin-left: 42px;">
         <div class="name regex"></div><br>

         <label for="d_buser">진료과 </label> <select id="d_class" name="d_class" style="margin-left: 30px;">
            <option name="first" value="0" > 선택하세요</option>
            <c:forEach var="b" items="${buserdatas}">
               <option name="b_select" id="b_select" value="${b.c_class}">${b.c_class}</option>
            </c:forEach>
         </select> <div class="d_buser regex"></div><br>
         
         
         <label for="d_email">이메일 주소</label> <input type="email" id="d_email"
            name="d_email" placeholder="E-mail" style="margin-left: 3px;">
         <div class="email regex"></div><br>

         <label> 기타사항: </label><br><br>
         <textarea rows="10" cols="50" id="d_etc" name="d_etc">
            </textarea> <div></div><br><br>

         <div id="signup">
            <input type="button" name="signup" value="발급" id="signupbtn" disabled="disabled">
         </div>
      </div>
      </section>
      </div>

   </form>

   <script>
 //아이디 중복방지
	$('#btnid').click(function(){
	 $.ajax({
          type:"POST",
          url:"didcheck",
          data:{
                 "d_id":$('#d_id').val()
          },
          success:function(data){   
                 if($.trim(data)=="y"){
                    if($('#d_id').val()!='y'){ 
                   	 swal("사용가능","사용가능한 아이디입니다!","success");
                   	 $(".did.regex").html(null);
                   	 $("#signupbtn").removeAttr("disabled");
                    }
                   }else{
                    if($('#d_id').val()!="n"){
                   	 swal("사용불가","이미 사용중인 아이디입니다! 변경해주세요!","error");
                       $(".did.regex").html("아이디를 변경하세요");
   					$(".did.regex").css("color", "red");
   					$("#signupbtn").attr("disabled", "disabled");
   					return;
                        
                    }
                 }
              }          
         }) ;
       });

      $(function() {
         //비밀번호 유효성검사
         $("#d_pw").on("input", function() {
            var regex = /^[A-Za-z\d]{3,12}$/;
            var result = regex.exec($("#d_pw").val())

            if (result != null) {
               $(".pw.regex").html("");
            } else {
               $(".pw.regex").html("영어대소문자,숫자 3-11자리");
               $(".pw.regex").css("color", "red")
            }
         });

         //이름 유효성검사
         $("#d_name").on("input", function() {
            var regex = /[가-힣]{2,}/;
            var result = regex.exec($("#d_name").val());

            if (result != null) {
               $(".name.regex").html("");
            } else {
               $(".name.regex").html("한글만 입력 가능합니다.");
            }

         })

         //email유효성 검사
         $("#p_email").on("input", function() {
            var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
            var result = regex.exec($("#d_email").val());

            if (result != null) {
               $(".email.regex").html("");
            } else {
               $(".email.regex").html("올바른 이메일이 아닙니다");
            }
         })
         //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
         $("#signupbtn").on("click", function() {
            var id = $("#d_id").val();
            var pw = $("#d_pw").val();
            var name = $("#d_name").val();
            var email = $("#d_email").val();

            var idregex = /^[a-z][a-z\d]{4,11}$/;

            var nameregex = /[가-힣]{2,}/;
            var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

            var idregex = idregex.exec(id);
            if (idregex == null) {
               alert("아이디양식을 다시 확인해주세요");
               return;
            }

            var nameregex = nameregex.exec(name);
            if (nameregex == null) {
               alert("이름양식을 다시 확인해주세요");
               retrun;
            }

            var emailregex = emailregex.exec(email);
            if (emailregex == null) {
               alert("이메일양식을 다시 확인해주세요");
               retrun;
            }

            //빈칸 없을 때 제출.
            $("#signform").submit();

         })
      })
   </script>

   <!-- 하단 필수항목 -->
   <br><br><br>
   <%@ include file="amain_bottom.jsp"%>
   <script type="text/javascript" src="resources/js/main.js"></script>
   <script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>