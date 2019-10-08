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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" />

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>

<script type="text/javascript">
	$(function() {
		$("#accordion").accordion({
			collapsible : true
		});
	});

	$(function() {
		$("#tabs").tabs();
	});

	// 	$(document).ready(function() {         
	// 		$("#fm01").click(function() { 
	// 		$("#bd01").show(); 
	// 		$("#bd02").hide();
	// 		$("#bd03").hide();
	// 		$("#bd04").hide();
	// 		});

	// 		$("#fm02").click(function() { 
	// 		$("#bd02").show(); 
	// 		$("#bd01").hide();
	// 		$("#bd03").hide();
	// 		$("#bd04").hide();
	// 		});

	// 		$("#fm03").click(function() { 
	// 		$("#bd03").show(); 
	// 		$("#bd01").hide();
	// 		$("#bd02").hide();
	// 		$("#bd04").hide();
	// 		});

	// 		$("#fm04").click(function() { 
	// 		$("#bd04").show(); 
	// 		$("#bd01").hide();
	// 		$("#bd02").hide();
	// 		$("#bd03").hide();
	// 		});
	// 	});
</script>

<style type="text/css">
.forum {
	width: 800px;
	border: 1px solid gray;
	border-radius: 25px;
	margin: auto;
}

.forum1 ul li {
	display: inline;
}

.tb1 {
	text-align: center;
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
						<h3>
							<a href="#">電影 - 場外休憩區</a>
						</h3>
					</header>

					<div id="tabs"
						style="width: 1100px; margin: auto; text-align: center;">
						<ul>
							<li><a href="#tabs-1">Popularity - 人氣排行</a></li>
							<li><a href="#tabs-2">Now Showing - 現正熱映</a></li>
							<li><a href="#tabs-3">Coming Soon - 即將上映</a></li>
							<li><a href="#tabs-4">Off The Cinemas - 下檔電影</a></li>
						</ul>
						<div id="tabs-1">
							<table class="tbst">
								<tbody style="text-align: left;">
									<c:forEach var='Movie' items='${Movies}'>
										<tr>
											<td>${Movie.no}</td>
											<td><a
												href="<spring:url value='/MoviesForum/Articles?id=${Movie.no}' />"
												class="btn btn-primary btn-lg btn-block"
												style="font-size: 24px"> ${Movie.movieName} </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tabs-2">
							<table class="tbst">
								<tbody style="text-align: left;">
									<c:forEach var='ReleasedMovie' items='${ReleasedMovies}'>
										<tr>
											<td>${ReleasedMovie.no}</td>
											<td><a
												href="<spring:url value='/MoviesForum/Articles?id=${ReleasedMovie.no}' />"
												class="btn btn-primary btn-lg btn-block"
												style="font-size: 26px"> ${ReleasedMovie.movieName} </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tabs-3">
							<table class="tbst">
								<tbody style="text-align: left;">
									<c:forEach var='ComingMovie' items='${ComingMovies}'>
										<tr>
											<td>${ComingMovie.no}</td>
											<td><a
												href="<spring:url value='/MoviesForum/Articles?id=${ComingMovie.no}' />"
												class="btn btn-primary btn-lg btn-block"
												style="font-size: 26px"> ${ComingMovie.movieName} </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tabs-4">
							<table class="tbst">
								<tbody style="text-align: left;">
									<c:forEach var='OffMovie' items='${OffMovies}'>
										<tr>
											<td>${OffMovie.no}</td>
											<td><a
												href="<spring:url value='/MoviesForum/Articles?id=${OffMovie.no}' />"
												class="btn btn-primary btn-lg btn-block"
												style="font-size: 26px"> ${OffMovie.movieName} </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>