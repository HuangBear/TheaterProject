<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 電影介紹</title>
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
	#hello img {
		height: 405px;
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

			<div id = 'hello' class="container">
				<article id="main" class="special"> 
				<!-- <header>
				<h2>
					<a href="#">No Sidebar</a>
				</h2>
				<p>Morbi convallis lectus malesuada sed fermentum dolore amet</p>
				</header> <a href="#" class="image featured"><img src="images/pic06.jpg"
					alt="" /></a>
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
				</section> --> 
				<h3>熱映中   NOW SHOWING</h3>
				</article>
				<hr />
				<article>
				<div class="row">
					<c:forEach var = 'releasedMovie' items = '${releasedMovies}'>
						<article class = "col-4 col-12-mobile special">
							<a href = "<c:url value = '/detail_${releasedMovie.no}' />" class="image featured">
								<img src="<c:url value = '/getPicture/${releasedMovie.no}'/>" >
							</a>
						<header>
							<h3>
								<a href = "<c:url value = '/detail_${releasedMovie.no}' />">
									${releasedMovie.movieName}
								</a>
							</h3>
						</header>
						<p>${releasedMovie.engMovieName}<br>
						上映日期：<fmt:formatDate pattern="yyyy-MM-dd"
						value="${releasedMovie.openingDate}" /></p>
						</article>
					</c:forEach>
<!-- 					<article class="col-4 col-12-mobile special"> <a href="detail" -->
<!-- 						class="image featured"><img src="images/frontend/now01.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="detail">牠 第二章</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>IT CHAPTER TWO <br> -->
<!-- 					        上映日期：2019/09/05</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/now02.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">航海王：奪寶爭霸戰</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>ONE PIECE STAMPEDE <br> -->
<!-- 					        上映日期：2019/08/21</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/now03.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">全面攻佔 3：天使救援</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>ANGEL HAS FALLEN <br> -->
<!-- 					        上映日期：2019/08/21</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/now04.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">玩命關頭：特別行動</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>FAST AND FURIOUS HOBBS AND SHAW <br> -->
<!-- 					         上映日期：2019/07/31</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/now05.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">大叔之愛電影版</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>OSSANS LOVE THE MOVIE <br> -->
<!-- 					        上映日期：2019/09/06</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/now06.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">極限逃生</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>EXIT <br> -->
<!-- 					        上映日期：2019/08/30</p> -->
<!-- 					</article> -->
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<h3>即將上映   COMING SOON</h3>
				</article>
				<hr />
				<div class="row">
				
					<c:forEach var = 'comingMovie' items = '${comingMovies}'>
						<article class = "col-4 col-12-mobile special">
							<a href = "<c:url value = '/detail_${comingMovie.no}' />">
								<img src="<c:url value = '/getPicture/${comingMovie.no}'/>">
							</a>
						<header>
							<h3>
								<a href = "<c:url value = '/detail_${comingMovie.no}' />">
									${comingMovie.movieName}
								</a>
							</h3>
						</header>
						<p>${comingMovie.engMovieName}<br>
						上映日期：<fmt:formatDate pattern="yyyy-MM-dd"
						value="${comingMovie.openingDate}" /></p>
						</article>
					</c:forEach>
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming01.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">NG你的人生</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>SNOWFLAKE <br> -->
<!-- 					        上映日期：2019/09/12</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming02.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">我家有個開心農場</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>THE BIGGEST LITTLE FARM <br> -->
<!-- 					        上映日期：2019/09/12</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming03.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">天氣之子</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>WEATHERING WITH YOU <br> -->
<!-- 					        上映日期：2019/09/12</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming04.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">星際救援</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>Ad Astra <br> -->
<!-- 					        上映日期：2019/09/20</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming05.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">返校</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>Detention <br> -->
<!-- 					        上映日期：2019/09/20</p> -->
<!-- 					</article> -->
<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
<!-- 						class="image featured"><img src="images/frontend/coming06.jpg" alt="" /></a> -->
<!-- 					<header> -->
<!-- 					<h3> -->
<!-- 						<a href="#">小丑</a> -->
<!-- 					</h3> -->
<!-- 					</header> -->
<!-- 					<p>Joker <br> -->
<!-- 					        上映日期：2019/10/03</p> -->
<!-- 					</article> -->
					
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