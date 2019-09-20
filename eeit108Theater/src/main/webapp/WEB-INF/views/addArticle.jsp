<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>editArticle</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">
			    <a>edit Article</a>
			</h1>
		</div>
	</section>
	<hr	style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ArticleBean" class='form-horizontal'
		                  		 enctype="multipart/form-data">
			<fieldset>
			
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-4" for='title'>
					    <a>Title</a>
				    </label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type='text' class='form:input-large' />
					</div>
				</div>

<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-4" for='author'> -->
<!-- 						<a>Author</a> -->
<!-- 					</label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						 <form:input id="author" path="author" type='text' class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-4' for="tag">
						<a>tag</a> 
					</label>
					<div class='col-lg-10'>
						<form:select path="tag">
							<form:option value=" " >
							   <a>select</a>
							</form:option>
							<form:options items="${tagList}" />
						</form:select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-4" for='content'>
						<a>Content</a>  
					</label>
					<div class="col-lg-10">
						<form:textarea id="content" path="content" cols="80" rows="20" class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-2'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="Submit" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
