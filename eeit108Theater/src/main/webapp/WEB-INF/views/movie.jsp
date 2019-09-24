<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<title>Products</title>
<style>
.an {
	display: block;
	border: solid 1px black;
	margin: auto;
	position: relative;
}

div {
	position: relative;
}
</style>
</head>

<body>
	<div>
		<header>
			<h1>現正熱映</h1>
		</header>
		<c:forEach var='releasedMovie' items='${releasedMovies}'>
			<div
				style='width: 130px; height: 310px; margin: 15px 8px 15px 8px; display: inline-block; text-align: center; border: 1px solid black; padding-top: 40px;'>
				<a href = "<c:url value = '/detail_${releasedMovie.no}' />">
					<img src="<c:url value = '/getPicture/${releasedMovie.no}'/>"
					style='width: 100px; height: 120px;'></a><br>
				<a href = "<c:url value = '/detail_${releasedMovie.no}' />">
					<b style='font-size: 16px;'>${releasedMovie.movieName}</b></a><br> 
				<b style='font-size: 16px'><fmt:formatDate pattern="yyyy-MM-dd"
						value="${releasedMovie.openingDate}" />上映</b><br> 
				<b style = 'font-size: 16px'>${releasedMovie.duration}</b>
			</div>
		</c:forEach>
	</div>
	<hr>
	<br>


	<div>
		<header>
			<h1>即將上映</h1>
		</header>
		<c:forEach var='comingMovie' items='${comingMovies}'>
			<div
				style='width: 130px; height: 310px; margin: 15px 8px 15px 8px; display: inline-block; text-align: center; border: 1px solid black; padding-top: 40px;'>
				<a href = "<c:url value = '/detail_${comingMovie.no}' />">
					<img src="<c:url value = '/getPicture/${comingMovie.no}'/>"
					style='width: 100px; height: 120px;'></a><br> 
				<a href = "<c:url value = '/detail_${comingMovie.no}' />">
					<b style='font-size: 16px;'>${comingMovie.movieName}</b></a><br> 
				<b style='font-size: 16px'><fmt:formatDate pattern="yyyy-MM-dd"
						value="${comingMovie.openingDate}" />上映</b><br>
				<b style = 'font-size: 16px'>${comingMovie.duration}</b>
			</div>
		</c:forEach>
	</div>


	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>