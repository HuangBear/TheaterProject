<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Article</title>
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
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>討論版</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
				<h3>${Article.title}</h3>
				<div class="thumbnail" style="width: 900px; height: 50px">
					<p>版號:${Article.no} 作者: ${Article.author.name} 分類: ${Article.tag} 發文時間: ${Article.postTime}</p>
				</div>
				<div class="thumbnail" style="width: 900px; height: 100px">
					<p>${Article.content}</p>
				</div>
		</div>
		<br>
		<div class="row">
			<c:forEach var='reply' items='${Article.replys}'>
				<div class="thumbnail" style="width: 900px; height: 50px">
					<p>發文者 : ${reply.author}</p>
				</div>

				<div class="thumbnail" style="width: 900px; height: 100px">
					<p>${reply.content}</p>
				</div>
				<br>
			</c:forEach>
		</div>
		<p>
			<a href="<spring:url value='/MoviesForum' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>返回
			</a>
			<a href="<spring:url value='/edit?id=${Article.no}' />"
    							class="btn btn-primary btn-lg" style="font-size: 16px">編輯</a>
		</p>
	</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
