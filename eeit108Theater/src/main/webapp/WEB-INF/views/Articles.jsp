<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Articles</title>
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
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
	<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<hr style="height: 1px; border: solid; color: #333; background-color: #333;">
		<c:choose>
		<c:when test="${empty LoginOK}">
		<a href="<spring:url value='/memberservice' />" class="btn btn-primary btn-lg"
			style="font-size: 26px;">發文</a><BR>
		</c:when>
		<c:when test="${!empty LoginOK}">
		<a href="<spring:url value='/add' />" class="btn btn-primary btn-lg"
			style="font-size: 26px;">發文</a><BR>
		</c:when>
		</c:choose>

				<c:forEach var='Article' items='${Articles}'>
					<div class="col-sm-6 col-md-5" style="width: 900px; height: 90px;border: solid;margin: auto;">
									<a href="<spring:url value='/Article?id=${Article.no}' />"
										class="btn btn-primary btn-lg btn-block"
										style="font-size: 26px;"> <span
										class="glyphicon-info-sigh glyphicon"></span> ${Article.title}
										發文者 : ${Article.author.name}   發文時間: ${Article.postTime}
									</a>
					</div>
				</c:forEach>
			
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
