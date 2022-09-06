<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>andrea cho shop</title>
<link href="resources/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
	<div id="layoutAuthentication_content">
	<main>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
			<div class="card shadow-lg border-0 rounded-lg mt-5">
				<div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
				<div class="card-body">
					<form action="adminloginaction" method="post">
						<div class="form-floating mb-3">
							<input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="아이디입력" />
								<label for="inputEmail">아이디</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="admin_pw" name="admin_pw" type="password" placeholder="비밀번호입력" />
							<label for="inputPassword">비밀번호</label>
						</div>
						<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
							<a class="small" href="password.html">Forgot Password?</a>
							<button class="btn btn-primary" type="submit">로그인</button>
						</div>
					</form>
				</div>
				<div class="card-footer text-center py-3">
				<div class="small"><a href="admininsert">관리자 등록</a></div>
				</div>
			</div>
			</div>
		</div>
	</div>
	</main>
	</div>
	<div id="layoutAuthentication_footer">
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
		<div class="d-flex align-items-center justify-content-between small">
			<div class="text-muted">Copyright &copy; Your Website 2022</div>
		<div>
			<a href="#">Privacy Policy</a>
			&middot;
			<a href="#">Terms &amp; Conditions</a>
		</div>
		</div>
		</div>
	</footer>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/admin/scripts.js"></script>
   	<script type="text/javascript" src="resources/js/main.js"></script>
   	<script type="text/javascript" src="resources/js/menu.js"></script>
</body>
</html>