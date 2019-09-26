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
		<hr
			style="height: 1px; border: solid; color: #333; background-color: #333;">
		<br>
		<section class="container">
			<div class="row" style="width: 1500px; height: 500px; border: solid;">
				<h3 style="font-size: 36px">${Article.title}</h3>
				<div class="thumbnail"
					style="width: 900px; height: 50px; font-size: 20px">
					<p>No.:${Article.no} 發文者: ${Article.author.name} 分類:
						${Article.tag} 發文時間: ${Article.postTime}</p>
				</div>
				<div style="width: 900px; height: 450px; font-size: 30px">
					<p>${Article.content}</p>
				</div>
			</div>
			<p>
				<c:choose>
					<c:when test="${LoginOK.no==Article.author.no}">
						<a href="<spring:url value='/edit?id=${Article.no}' />"
							class="btn btn-primary btn-lg" style="font-size: 26px">編輯</a>
					</c:when>
					<c:when test="${empty LoginOK}">
						<a href="<spring:url value='/memberservice' />"
							class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
					</c:when>
					<c:when test="${!empty LoginOK}">
						<a href="<spring:url value='/addReply?id=${Article.no}' />"
							class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
					</c:when>
				</c:choose>
			</p>
			<form:form method='POST' modelAttribute="LikeOrDislikeBean"
				class='form-horizontal' enctype="multipart/form-data">
				<fieldset>
					<c:choose>
						<c:when test="${empty LoginOK}">
						</c:when>
						<c:when test="${!empty LoginOK}">
							<div class="form-group">
								<form:input id="articleNoString" readonly="true"
									path="articleNoString"
									value='${LikeOrDislikeBean.articleNoString}' type='hidden'
									class='form:input-large' />
								<form:input id="member" path="member" readonly="true"
									value='${LoginOK.no}' type='hidden' class='form:input-large' />
								<button type="submit" name="button" value="like">like</button>
								<a>${Article.likeCount}</a>
								<button type="submit" name="button" value="dislike">dislike</button>
								<a>${Article.dislikeCount}</a>
							</div>
						</c:when>
					</c:choose>

				</fieldset>
			</form:form>
			<br>
			<div class="row">
				<c:forEach var='reply' items='${Article.replys}'>
					<div class="thumbnail" style="width: 900px; height: 50px">
						<p>發文者 : ${reply.author.name}</p>
					</div>

					<div class="thumbnail" style="width: 900px; height: 100px">
						<p>${reply.content}</p>
					</div>
					<p>
						<c:choose>
							<c:when test="${LoginOK.no==reply.author.no}">
								<a href="<spring:url value='/editReply?id=${reply.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">編輯</a>
							</c:when>
						</c:choose>
					</p>
					<br>
				</c:forEach>
			</div>

			<p>
				<a href="<spring:url value='/MoviesForum/Articles?id=${Article.movie.no}' />"
					class="btn btn-default" style="font-size: 26px"> <span
					class="glyphicon-hand-left glyphicon"></span>返回
				</a>
			</p>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
