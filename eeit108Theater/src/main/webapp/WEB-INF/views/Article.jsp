<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Article</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
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
			<button class="ef-btn ef-firework tippy-gpbp" onclick= type="button" id="gp_918900">
		</p>
	</section>
</body>
</html>
