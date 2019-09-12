<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>7-1 MOVIE 後台管理系統</title>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/flashcanvas.js"></script>
<script src="<%=request.getContextPath()%>/js/jSignature.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'
	rel='stylesheet' type='text/css'>
<!-- CSS reset -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<!-- Gem style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<!-- Modernizr -->
<script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

a:link, a:visited, a:hover, a:active {
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#hermitHome {
	color: white;
}

.w3-sidebar span {
	color: white;
	font-family: 'cwTeXYen', sans-serif;
}

.main-gallery {
	width: 100%;
	height: 50vh;
	background: url("images/main.jpg");
	background-position: center;
	background-size: cover;
	margin-top: 52px;
}

.w3-jumbo span {
	font-family: "Tangerine", serif;
}

.glfont {
	font-family: 'Pacifico', cursive;
}

.glcwTeXYen {
	font-family: 'cwTeXYen', sans-serif;
}

#button {
	padding: .5em 1em;
	text-decoration: none;
}

#footer {
	margin-top: 30px;
	margin-bottom: 0px;
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
	left: 0;
}

/* Shared */
.loginBtn {
	box-sizing: border-box;
	position: relative;
	width: 14em; /* - apply for fixed size */
	margin: 0.2em;
	padding: 0 15px 0 46px;
	border: none;
	text-align: center;
	line-height: 34px;
	white-space: nowrap;
	border-radius: 0.2em;
	font-size: 16px;
	color: #FFF;
}

.loginBtn:before {
	content: "";
	box-sizing: border-box;
	position: absolute;
	top: 0;
	left: 0;
	width: 34px;
	height: 100%;
}

.loginBtn:focus {
	outline: none;
}

.loginBtn:active {
	box-shadow: inset 0 0 0 32px rgba(0, 0, 0, 0.1);
}

/* Facebook */
.loginBtn--facebook {
	background-color: #4C69BA;
	background-image: linear-gradient(#4C69BA, #3B55A0);
	/*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
	text-shadow: 0 -1px 0 #354C8C;
}

.loginBtn--facebook:before {
	border-right: #364e92 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png')
		6px 6px no-repeat;
}

.loginBtn--facebook:hover, .loginBtn--facebook:focus {
	background-color: #5B7BD5;
	background-image: linear-gradient(#5B7BD5, #4864B1);
}

/* Google */
.loginBtn--google {
	/*font-family: "Roboto", Roboto, arial, sans-serif;*/
	background: #DD4B39;
}

.loginBtn--google:before {
	border-right: #BB3F30 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png')
		6px 6px no-repeat;
}

.loginBtn--google:hover, .loginBtn--google:focus {
	background: #E74B37;
}

.breadBox {
	width: 100%;
	display: block;
	box-sizing: border-box;
}

.breadBox .breadNav {
	width: 1200px;
	margin: auto;
	padding: 0;
}

.breadBox .breadNav .breadList, .conditionShow {
	float: left;
	margin: 0;
	padding: 0;
}

.breadBox .breadNav a {
	font-size: 13px;
	line-height: 55px;
}

.fa {
	display: inline-block;
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.conditionShow {
	margin-left: 15px;
	width: 867px;
}

.breadBox .breadNav span {
	font-size: 12px;
	color: #A3A3A3;
}

.conditionShow span {
	display: block;
	float: left;
	margin-top: 15px;
	margin-right: 10px;
	border: 1px solid #D4D4D4;
	padding: 0px 10px;
	padding-right: 0px;
	color: #666666;
}

nav.main-nav:hover {
	background-color: #d0d0d0;
}

.main-nav {
	width: 80px;
	height: 55px;
}

.main-nav ul {
	margin-left: 18px;
}
</style>
</head>
<body>
	<div class="w3-bar w3-black navbar-fixed-top glcwTeXYen"
		style="height: 40px">
		<button class="w3-button w3-dark-grey w3-xlarge w3-left"
			onclick="openLeftMenu()">&#9776;</button>
		<a href="<%=request.getContextPath()%>/index2"
			class="w3-bar-item w3-button w3-xlarge w3-left glfont"><span
			id="hermitHome">7-1 MOVIE</span></a>
		<!-- 如果有登入就不顯示 -->
		<c:if test="${empty logout}">
			<a href="<%=request.getContextPath()%>/EmpLogin"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">Login</span></a>
			<span class="w3-bar-item  w3-xlarge w3-right" id="hermitHome">|</span>
		</c:if>
		<!-- 如果有登入就顯示登出 -->
		<c:if test="${!empty logout}">

			<a href="<%=request.getContextPath()%>/EmpLogout"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">登出</span></a>
			<span class="w3-bar-item  w3-xlarge w3-right" id="hermitHome">|</span>
			<a
				href="<%=request.getContextPath()%>/memberbackstage/mem_back_index.jsp"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">${memberName}</span></a>
			<span style="margin-top: 8px;"
				class="w3-xlarge w3-right w3-margin-right" id="hermitHome">您好！</span>
		</c:if>

		<!-- inser more links here -->
		<!-- 如果有登入就不顯示 -->
		<%-- 	<c:if test="${empty LoginOK}"> --%>
		<!-- 			<a -->
		<!-- 				href="" -->
		<!-- 				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span -->
		<!-- 				id="hermitHome">員工註冊</span></a> -->
		<!-- 			<span class="w3-bar-item  w3-xlarge w3-right" id="hermitHome">|</span> -->
		<%-- 		</c:if> --%>
		<!-- 如果有登入就顯示登出 -->
		<c:if test="${!empty LoginOK}">
			<a href=""
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">員工登出</span></a>
			<a
				href="<%=request.getContextPath()%>/memberbackstage/mem_back_index.jsp"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">${LoginOK.memName}</span></a>
			<span style="margin-top: 8px;"
				class="w3-xlarge w3-right w3-margin-right" id="hermitHome">您好！</span>
		</c:if>

		<!-- inser more links here -->
		<!-- 如果有登入就不顯示 -->
		<%-- 		<c:if test="${empty LoginOK}"> --%>
		<!-- 			<nav class="main-nav"> -->
		<!-- 				<ul> -->
		<!-- 					<li><a class="cd-signin" href="#0" -->
		<!-- 						style="font-size: 24px; margin-top: 8px; border: none;">登入</a></li> -->
		<!-- 				</ul> -->
		<!-- 			</nav> -->
		<%-- 		</c:if> --%>


		
			<div
				class="w3-sidebar w3-bar-block w3-animate-left navbar-fixed-top w3-dark-gray"
				style="color: white; display: none; font-size: 20px; font-family: Microsoft JhengHei;"
				id="leftMenu">
				<button onclick='closeLeftMenu()'
					class="w3-bar-item w3-button w3-large">
					<span>Close &times</span>
				</button>
				<a href="<%=request.getContextPath()%>/index2"
					class="w3-bar-item w3-button"><span>首頁</span></a> <a href=""
					class="w3-bar-item w3-button" id=""><span>員工資料</span></a> <a
					href="" class="w3-bar-item w3-button" id="emp"><span>員工管理</span></a>
				<a href="" class="w3-bar-item w3-button" id=""><span>電影管理</span></a>
				<a href="" class="w3-bar-item w3-button" id=""><span>公告管理</span></a>
				<a href="" class="w3-bar-item w3-button" id=""><span>報表管理</span></a>
			</div>
	</div>

	<div id="top" class="masthead2" role="main"
		style="height: auto; padding-top: 80px; padding-bottom: 0">
		<div class="container" style="overflow: hidden">
			<span class="w3-jumbo glfont">7-1 後台管理系統<span>
		</div>
		<div class="row" style="height: 200px"></div>
	</div>

	<div class="w3-black w3-margin-bottom"
		style="height: 3vh; border-bottom-left-radius: 15px; border-bottom-right-radius: 3px;"></div>


	<section class="breadBox">
		<div class="breadNav clearfix">
			<div class="breadList" id="breadList">
				<a href="<%=request.getContextPath()%>/index2"
					style="color: black; padding: 0;">HOME</a> <i
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></i>&nbsp;&nbsp;
			</div>
			<div id="showSearch" class="conditionShow clearfix"></div>
		</div>
	</section>


	

	<script>
		function openLeftMenu() {
		    document.getElementById("leftMenu").style.display = "block";
		    
		}
		function closeLeftMenu() {
		    document.getElementById("leftMenu").style.display = "none";
		}

			
		$("#emp").click(function(event){
 			event.preventDefault();
			window.location= "<%=request.getContextPath()%>/empIndex_include2";
		})
			
			

			var leftMenu = $("#leftMenu");
			var path = "<%=request.getContextPath()%>";
	</script>

</body>
</html>