<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>7-1 Admin Login Form</title>
<link rel="stylesheet" href="bootstrap/logA/css/bootstrap.min.css">
<link rel="stylesheet" href="css/logA/Login-Form-Dark.css">
<link rel="stylesheet" href="css/logA/styles.css">
</head>
<body>
	<div class="login-dark">
		<form action='<spring:url value="/EmpLoginAction"/>' method="post">
			<h2 class="sr-only">Login Form</h2>
			
<%-- 			<c:if test ='${!empty error}'> --%>
<%-- 				<c:out value="<span>${error}</span>" escapeXml='false'/> --%>
<%-- 			</c:if> --%>
			<c:if test ='${!empty logout}'>
				<c:out value="<span>你已經登出</span>" escapeXml='false'/>
			</c:if>
			
			<div class="illustration">
				<img src="images/admin/716logo.png" style="width: 233px;">
			</div>
			<div class="form-group">
				<input class="form-control" type="text" name="username"
					placeholder="Email">
			</div>
			<div class="form-group">
				<input class="form-control" type="password" name="password"
					placeholder="Password">
			</div>
<!-- 			<div class="form-group"> -->
<!-- 				<p><input class="" type="checkbox" name="remember-me">記住我</p> -->
<!-- 			</div> -->
			<div class="form-group">
				<button class="btn btn-primary btn-block" type="submit">Log
					In</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<a class="forgot" href="#">Forgot your email or password?</a>
		</form>
	</div>
	<script src="js/logA/jquery.min.js"></script>
	<script src="bootstrap/logA/js/bootstrap.min.js"></script>
</body>
</html>