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
table {
	table-layout: fixed;
	word-wrap:break-word;
	
}

.title_width {
	white-space: nowrap;
	text-overflow: ellipsis;
}

</style>
</head>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>

		<div class="wrapper style1">
			<div class="container">
				<article id="main" class="special">
					<div class="row gtr-200"
						style="width: 1500px; height: 500px; border: 1px solid gray; border-radius: 25px;">
						<h3 style="font-size: 36px">${Article.title}</h3>
						<div style="width: 800px; height: 50px; font-size: 20px;">
							<p
								style="border: 1px solid gray; border-radius: 25px; text-align: center;">No.:${Article.no}
								發文者: ${Article.author.name} 分類: ${Article.tag} 發文時間:
								${Article.postTime}</p>
						</div>

						<div style="width: 900px; height: 450px; font-size: 30px">
							<pre class="title_width">${Article.content}</pre>
						</div>
					</div>
					<p>
						<c:choose>
							<c:when test="${LoginOK.no==Article.author.no}">
								<a href="<spring:url value='/edit?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">編輯</a>
							</c:when>
							<c:when test="${LoginOK.no!=Article.author.no}">

							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty LoginOK}">
								<a href="<spring:url value='/memberservice' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
							</c:when>
							<c:when test="${!empty LoginOK}">
								<a href="<spring:url value='/addReply?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty LoginOK}">
								<a href="<spring:url value='/memberservice' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">檢舉</a>
							</c:when>
							<c:when test="${!empty LoginOK}">
								<a href="<spring:url value='/addReport?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">檢舉</a>
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
							<hr class="first" />
						</fieldset>
					</form:form>
					<br>
					<div class="row">
						<c:forEach var='reply' items='${Replys}'>
							<div
								style="width: 1080px; height: 50px; font-size: 26px; margin: auto; padding: 15px 20px;">
								<p>${reply.author.name} 回覆時間:${reply.postTime}</p>
							</div>
							<c:choose>
								<c:when test="${reply.available==true}">
									<div
										style="width: 1080px; height: 150px; font-size: 26px; border: 1px solid gray; border-radius: 25px; margin: auto; padding: 15px 20px;">
										<pre class="title_width">${reply.content}</pre>
									</div>
								</c:when>
								<c:when test="${reply.available==false}">
									<div
										style="width: 1080px; height: 150px; font-size: 26px; border: 1px solid gray; border-radius: 25px; margin: auto; padding: 15px 20px;">
										<p>這篇回覆已經被封鎖</p>
									</div>
								</c:when>
							</c:choose>
							<p>
								<c:choose>
									<c:when test="${LoginOK.no==reply.author.no}">
										<a href="<spring:url value='/editReply?id=${reply.no}' />"
											class="btn btn-primary btn-lg" style="font-size: 26px">編輯</a>
									</c:when>
								</c:choose>
							</p>
							<form:form method='POST' modelAttribute="Reply"
								class='form-horizontal' enctype="multipart/form-data">
								<fieldset>
									<c:choose>
										<c:when test="${LoginOK.no!=Article.author.no}">
										</c:when>
										<c:when test="${LoginOK.no==Article.author.no}">
										<form:input id="articleString" readonly="true"
											path="articleString"
											value='${Article.noString=Article.no}' type='hidden'
											class='form:input-large' />
										<form:input id="rnoString" readonly="true"
											path="rnoString"
											value='${reply.rnoString=reply.no}' type='hidden'
											class='form:input-large' />
											<div class="form-group">
												<button type="submit" name="lockbutton" value="lock" style="font-size: 18px">封鎖</button>
											</div>
										</c:when>
									</c:choose>
									<hr class="first" />
								</fieldset>
							</form:form>
							<br>
						</c:forEach>
					</div>
					<hr class="first" />
					<p>
						<a
							href="<spring:url value='/MoviesForum/Articles?id=${Article.movie.no}' />"
							class="btn btn-default" style="font-size: 26px"> <span
							class="glyphicon-hand-left glyphicon"></span>返回
						</a>
					</p>
				</article>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
