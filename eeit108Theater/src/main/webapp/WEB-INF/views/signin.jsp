<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 會員登入/註冊</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<style>
	.button{
	width:200px;
	height:40px;
	margin-left:20px;
	padding:0px;
	border: 2px solid #999999;
	background-color: #d0d0d0;
	font-size: 20px;
}

	.button1{
	width: 500px;
	height: 600px;
	margin:0px auto;

	margin-top:200px;
}

	.button2{
	width:200px;
	height:40px;
	margin:0px auto;
	border:2px solid #999999;
	padding:0px;
	background-color: #d0d0d0;
	font-size: 20px;
}

	.rigth1{
	margin-right:30px;
}

	.h11{
	text-align: center;
	margin:10px 0px 20px 0px;
}

	.text {
	width: 450px;
	height: 30px;
	background: #fff;
}
	
</style>

</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
<div id="header1">
		<!-- Header -->
		<jsp:include page="header.jsp" />
</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special"> <header>
				<h2>
					<a href="#">會員服務</a>
				</h2>
				<p>請輸入會員資料</p>
				</header> 
				
				<div class="button1">
					<a href="#"><img src="images/frontend/716ogo.png" alt=""   class="img"/></a>
						<div class="center">
							<button class="button" id="blogin" onclick="ShowL()">登入</button>
							<button class="button2" id="rlogin" onclick="ShowR()">註冊</button>
						</div>
				<div class="rigth1">
					<div id="login">
						<form method='POST' modelAttribute="managerBean"
							enctype="multipart/form-data">
							<h1  class="h11">會員登入</h1>
							<dl>
							<dd>
								<input id="account" path="account" class="text" type="text"
									placeholder="請輸入管理者帳號" tabindex="1" autocomplete="off"
									maxlength="50"  />     <!-- autofocus="autofocus" -->
							</dl>
							<dl>
							<dd>
								<input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 ( 英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<a><input id="submit" type="submit" value="登入"
									style="font-size: 20px; width: 450px; height: 60px;"></a>
							</dd>
							</dl>
								<input id="type" name="form" type='hidden' value='true' />
						</form>
					</div>

					<div id="register" style="display: none">
						<form method='POST' modelAttribute="managerBean"
							enctype="multipart/form-data">
							<h1 class="h11">會員註冊</h1>
							<dl>
							<dd>
								<input id="account" path="account" class="text" type="text"
									placeholder="請輸入管理者帳號" tabindex="1" autocomplete="off"
									maxlength="50"  />     <!-- autofocus="autofocus" -->
							</dl>
							<dl>
							<dd>
								<input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 ( 英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<input id="name" path="name" class="text"
									type="text" placeholder="請輸入名字" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<a><input id="submit" type="submit" value="登入"
									style="font-size: 20px; width: 450px; height: 60px;"></a>
							</dd>
							</dl>
								<input id="type" name="form" type='hidden' value='true' />
						</form>
					</div>
				</div>
				</div>	

				<section> <header>
				<h3>Ultrices tempor sagittis nisl</h3>
				</header>
				<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus
					ultrices porttitor sollicitudin imperdiet at pretium tellus in
					euismod a integer sodales neque. Nibh quis dui quis mattis eget
					imperdiet venenatis feugiat. Neque primis ligula cum erat aenean
					tristique luctus risus ipsum praesent iaculis. Fermentum elit
					fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium
					sodales porttitor lacus. Phasellus egestas odio nisl duis sociis
					purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
				<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean
					suspendisse nulla eget sed etiam parturient orci cursus nibh.
					Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim
					cras rutrum consectetur ut penatibus fermentum nibh erat malesuada
					varius.</p>
				</section> <section> <header>
				<h3>Augue euismod feugiat tempus</h3>
				</header>
				<p>Pretium tellus in euismod a integer sodales neque. Nibh quis
					dui quis mattis eget imperdiet venenatis feugiat. Neque primis
					ligula cum erat aenean tristique luctus risus ipsum praesent
					iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo
					risus morbi. Lobortis vestibulum velit malesuada ante egestas odio
					nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis
					pharetra magna.</p>
				</section> </article>
				<hr />
				<div class="row">
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic07.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Gravida aliquam penatibus</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic08.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Sed quis rhoncus placerat</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic09.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Magna laoreet et aliquam</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
				</div>
			</div>

		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp" />

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
</body>
</html>