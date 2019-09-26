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
		height: 600px;
	}
	#world img {
		width: 439.99px;
		height: 600px;
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
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<h3>即將上映   COMING SOON</h3>
				</article>
				<hr />
				<div class="row" id = "world">
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
								<br>
								<br>
							</h3>
						</header>
						<p>${comingMovie.engMovieName}<br>
						上映日期：<fmt:formatDate pattern="yyyy-MM-dd"
						value="${comingMovie.openingDate}" /></p>
						</article>
					</c:forEach>				
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