<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-1 MOVIE 登入頁面</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/w3.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<!-- <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet"> -->
<!-- <link href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css" rel="stylesheet"> -->
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/flashcanvas.js"></script>
<script src="<%=request.getContextPath()%>/js/jSignature.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<!-- CSS reset -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<!-- Gem style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<!-- Modernizr -->
<script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

<script
	src="<%=request.getContextPath()%>/js/jquery.scrolling-tabs.min.js"></script>
<script type="text/javascript" src="js/jquery-equal-height.min.js"></script>
<style>
body {
	background-color: white;
}
#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 120px;
	}
</style>
</head>
<body style="background-color:#f5f5f5;" >
<div class="w3-bar w3-black navbar-fixed-top glcwTeXYen"
		style="height: 40px">
		<a href="EmpLogin"
			class="w3-bar-item w3-button w3-xlarge w3-left glfont"><span
			id="hermitHome">7-1 MOVIE</span></a>
			</div>

	<div id="top" class="masthead2" role="main"
		style="height:auto ; padding-top: 80px; padding-bottom: 0">
		<div class="container" style="overflow: hidden">
			<span class="w3-jumbo glfont">7-1 後台管理系統</span>
		</div>
	<div style="text-align: center;color: red;">
	<h4>${name}</h4>
	<h4>${welcome}</h4>
	<h6>${error}</h6>
	<h6>${reason}</h6>
	</div>
	<br>
		<form:form method="POST"  modelAttribute="employeeBean" >
  <div class="form-group" ><span></span><br>
  <!--     <label for="email">帳號</label> -->
    <form:input type="email" class="form-control" id="email" name="email" placeholder="Email" path="email" style="max-width:400px;margin: 0px auto;"/>
  </div>
  <div class="form-group">
<!--     <label for="password">密碼</label> -->
    <form:input type="password" class="form-control" id="password" placeholder="Password" path="password" style="max-width:400px;margin: 0px auto;"/>
  </div>


  <button type="submit" class="btn btn-default" >登入</button>
  <button type="reset" class="btn btn-default" >重填</button>
  
  
</form:form>

<br>
<div class="g-signin2" data-onsuccess="onSignIn" style="margin: 0px auto"></div>
<br>
		<div class="row" style="height: 200px"></div>
	</div>

	<div class="w3-black w3-margin-bottom"
		style="height: 3vh; border-bottom-left-radius: 15px; border-bottom-right-radius: 3px;"></div>
			
	<div class="container" style="margin-bottom: 150px;"></div>
	<footer class="w3-bottom w3-black container-fluid text-center">
		<div>
			<ul class="nav nav-pills w3-centered "
				style="display: flex; font-size: 13px; justify-content: center; position: static">
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">關於我們</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">免責聲明</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">服務條款</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">隱私權聲明</a></li>
			</ul>
		</div>

	</footer>

	<script>
		
	</script>
</body>
</html>