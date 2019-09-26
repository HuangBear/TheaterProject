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
<title>editReply</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">
			    <a>Edit Reply</a>
			</h1>
		</div>
	</section>
	<hr	style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ReplyBean" class='form-horizontal'
		                  		 enctype="multipart/form-data">
			<fieldset>
			    <div class="form-group">
					<div class="col-lg-10">
						<form:input id="articleString" readonly="true" path="articleString" value='${ReplyBean.articleString}' type='text' class='form:input-large'/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<form:input id="noString" readonly="true" path="noString" value='${ReplyBean.noString}' type='text' class='form:input-large'/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-4" for='content'>
						<a>Content</a>  
					</label>
					<div class="col-lg-10">
						<form:textarea id="content" path="content" value='${ReplyBean.content}' cols="80" rows="20" class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<form:input id="postTimeString" readonly="true" path="postTimeString" value='${ReplyBean.postTimeString}' type='hidden' class='form:input-large' />
					</div>
				</div>
				<form:input id="author" path="author" readonly="true" value='${LoginOK.no}' type='hidden' class='form:input-large' />

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-2'>
						<input id="btnefit" type='submit' class='btn btn-primary'
							value="Submit" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
