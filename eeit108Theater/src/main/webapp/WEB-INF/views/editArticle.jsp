<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
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
.sv1 {
	width: 800px;
	border: 3px solid #AAAAAA;
	border-radius: 20px;
	margin: auto;
}

.sv3 {
	width: 640px;
	margin: auto;
}
.pre{
white-space:pre-wrap; /* css3.0 */
white-space:-moz-pre-wrap; /* Firefox */
white-space:-pre-wrap; /* Opera 4-6 */
white-space:-o-pre-wrap; /* Opera 7 */
word-wrap:break-word; /* Internet Explorer 5.5+ */
}
</style>
<title>editArticle</title>
</head>
<body>
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">
					<h2>
						<a href="#">編輯文章</a>
					</h2>
					<form:form method='POST' modelAttribute="ArticleBean"
						class='form-horizontal' enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<div class="col-lg-10">
									<form:input id="noString" readonly="true" path="noString"
										value='${Article.noString}' type='hidden'
										class='form:input-large' />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-lg-2 col-lg-4" for='title'>
									<a>Title</a>
								</label>
								<div class="col-lg-10">
									<form:input id="title" path="title" value='${Article.title}'
										type='text' class='form:input-large' />
								</div>
								<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
							</div>

							<div class="form-group">
								
								<div class="col-lg-10">
									<form:input id="postTimeString" readonly="true"
										path="postTimeString" value='${Article.postTimeString}'
										type='hidden' class='form:input-large' />
								</div>
							</div>

							<c:choose>
								<c:when test="${LoginOK.no>6}">
									<div class="form-group">
										<label class='control-label col-lg-2 col-lg-4' for="tag">
											<a>tag</a>
										</label>
										<div class='col-lg-10'>
											<form:select path="tag">
												<form:option value=" ">
													<a>select</a>
												</form:option>
												<form:options items="${tagList}" />
											</form:select>
										</div>
									</div>
								</c:when>
								<c:when test="${LoginOK.no<=6}">
									<div class="form-group">
										<label class='control-label col-lg-2 col-lg-4' for="tag">
											<a>tag</a>
										</label>
										<div class='col-lg-10'>
											<form:select path="tag">
												<form:option value=" ">
													<a>select</a>
												</form:option>
												<form:options items="${systagList}" />
											</form:select>
										</div>
									</div>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${LoginOK.no>6}">
									<div class="form-group">
										<label class='control-label col-lg-2 col-lg-4' for="type">
											<a>type</a>
										</label>
										<div class='col-lg-10'>
											<form:select path="typeString">
												<form:option value="${ATypeBean.typeName}">
												</form:option>
											</form:select>
										</div>
									</div>
								</c:when>
								<c:when test="${LoginOK.no<=6}">
									<div class="form-group">
										<label class='control-label col-lg-2 col-lg-4' for="type">
											<a>type</a>
										</label>
										<div class='col-lg-10'>
											<form:select path="typeString">
												<form:option value="">
													<a>select</a>
												</form:option>
												<form:options items="${aTypeList}" />
											</form:select>
										</div>
									</div>
								</c:when>
							</c:choose>

							<div class="form-group">
								<label class="control-label col-lg-2 col-lg-4" for='content'>
									<a>Content</a>
								</label>
								<div class="col-lg-10">
									<form:textarea id="content" path="content"
										value='${Article.content}' cols="40" rows="20"
										class='form:input-large' style="word-break:break-all" onKeyDown='if (this.value.length>=250){event.returnValue=false}' />
								</div>
								<a style="color: red;">${ErrMsg.ContentNull}${ErrMsg.ContentInsufficient}</a>
							</div>

							<div class="form-group">
								<div class="col-lg-10">
									<form:input id="likeCountString" readonly="true"
										path="likeCountString" value='${Article.likeCountString}'
										type='hidden' class='form:input-large' />
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10">
									<form:input id="dislikeCountString" readonly="true"
										path="dislikeCountString"
										value='${Article.dislikeCountString}' type='hidden'
										class='form:input-large' />
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10">
									<form:input id="authorString" readonly="true"
										path="authorString" value='${Article.authorString}'
										type='hidden' class='form:input-large' />
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10">
									<form:input id="movieString" readonly="true" path="movieString"
										value='${Article.movieString=MovieBean.no}' type='hidden'
										class='form:input-large' />
								</div>
							</div>


							<div class="form-group">
								<div class='col-lg-offset-2 col-lg-2'>
									<input id="btnefit" type='submit' class='btn btn-primary'
										value="Submit" />
								</div>
							</div>
						</fieldset>
					</form:form>
				</article>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>
