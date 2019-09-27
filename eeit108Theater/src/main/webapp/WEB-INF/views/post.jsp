<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 電影主題討論板</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous">  
</script>

<style>
	.post{border:1px solid gray;
			border-radius:25px;
			margin:25px;
			}
</style>


</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		
		<center><header><h2><a href="#">內容普普</a></h2></header></center>
		<div class="wrapper style1">		
			<div class="container" style="position:relative;">
				<div class="row gtr-200 post">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section> 
							<header><h3><a href="#">樓主</a></h3></header>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic10.jpg" alt="" /></a>
							</div>
							<div class="col-8">
								<h4>會員：Tom</h4>
								<p>發文數：8787篇</p>
								<p>精華文章：0篇</p>
							</div>
						</div>
						<a href="#" class="button">會員資訊</a>
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> 
							<p>ZZZZZZZZZZZZZZZZZZZZZ</p>
						</article>
					</div>
				</div>
				<br><br>
				<div class="row gtr-200 post">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section> 
							<header><h3><a href="#">1樓</a></h3></header>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic10.jpg" alt="" /></a>
							</div>
							<div class="col-8">
								<h4>會員：小池</h4>
								<p>發文數：9487篇</p>
								<p>精華文章：87篇</p>
							</div>						
						</div>
						<a href="#" class="button">會員資訊</a>
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> 
							<p>爽啦！</p>
						</article>
					</div>
				</div>
				<br><br>
				<div class="row gtr-200 post">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section> 
							<header><h3><a href="#">─ ─</a></h3></header>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic10.jpg" alt="" /></a>
							</div>
							<div class="col-8">
								<h4>會員：─ ─</h4>
								<p>發文數：─ ─篇</p>
								<p>精華文章：─ ─篇</p>
							</div>
						</div>
						<a href="#" class="button">請先登入會員</a>
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> 
							<input type="text">
							
							<textarea cols="30" rows="10"></textarea>
						</article>
					</div>
				</div>
				</div>
				
				
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