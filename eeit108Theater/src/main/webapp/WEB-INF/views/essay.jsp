<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 電影討論區</title>
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
	.estb{text-align:center;
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
				<article id="main" class="special"> 
					<header>
						<h2><a href="#">第九分局</a></h2>
						<p>地上辦不了的案 就交給地下的我們！</p>
					</header>
				
				<table class="estb">
					<thead style="border-bottom:1px solid gray;">
						<tr><th>編號</th><th>標題</th><th>人氣</th><th>最新回覆</th></tr>
					</thead>
					
					<tbody>
						<tr><td><b>01</b></td><td><a href="post">內容普普</a></td><td>231</td><td>2019/09/11</td></tr>
						<tr><td><b>02</b></td><td><a href="#">ZZZZ</td><td>109</td><td>2019/08/21</td></tr>
						<tr><td><b>03</b></td><td><a href="#">戰起來，戰起來</a></td><td>1,034</td><td>2019/09/25</td></tr>
						<tr><td><b>04</b></td><td><a href="#">澎恰恰好帥！</a></td><td>842</td><td>2019/09/23</td></tr>
						<tr><td><b>05</b></td><td><a href="#">女主角好正！</a></td><td>917</td><td>2019/09/24</td></tr>
					</tbody>
				
				</table>
				
				
				
				
				
				<a href="#" class="image featured"><img src="images/frontend/pic06.jpg" alt="" /></a>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit.
					Curae suspendisse mauris posuere accumsan massa posuere lacus
					convallis tellus interdum. Amet nullam fringilla nibh nulla
					convallis ut venenatis purus lobortis. Auctor etiam porttitor
					phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
					consequat integer interdum integer purus sapien. Nibh eleifend
					nulla nascetur pharetra commodo mi augue interdum tellus. Ornare
					cursus augue feugiat sodales velit lorem. Semper elementum
					ullamcorper lacinia natoque aenean scelerisque vel lacinia mollis
					quam sodales congue.</p>
				
				<section> 
					<header><h3>Ultrices tempor sagittis nisl</h3></header>
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
				</section> 
				<section> 
					<header><h3>Augue euismod feugiat tempus</h3></header>
				<p>Pretium tellus in euismod a integer sodales neque. Nibh quis
					dui quis mattis eget imperdiet venenatis feugiat. Neque primis
					ligula cum erat aenean tristique luctus risus ipsum praesent
					iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo
					risus morbi. Lobortis vestibulum velit malesuada ante egestas odio
					nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis
					pharetra magna.</p>
				</section> 
				</article>
				
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