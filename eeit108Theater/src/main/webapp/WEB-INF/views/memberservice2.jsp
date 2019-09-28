<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 會員中心</title>
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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="309951267841-3oupgh1elatdub7tc7f4iah7eorg5h31.apps.googleusercontent.com">




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
</style>


</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">
					<header>
						<h2>
							<a href="#">會員中心</a>
						</h2>

						<div class="sv1">
							<hr>
							<div class="sv3" id="loginview">
<!-- ----------------------------------------------------------------------------------------------							 -->
			<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>

								<img id="myImg"><br>

							    <p id="name"></p> 
							    
								<div id="status">
								
								</div>

                 <form action="googleMember" method="POST">
                 <input type=hidden id=registGoogleName name="registGoogleName" value="">
                 <input type=hidden id=registGoogleEmail name="registGoogleEmail" value="">
                 <input type=hidden id=registGoogleImg name="registGoogleImg" value="">
                 
                 <button type="submit" id="googleMemberSubmit" style="visibility:hidden">進入主頁</button>
                 </form>

			<script type="text/javascript">
			function onSignIn(googleUser) {
			// window.location.href='success.jsp';
				  var profile = googleUser.getBasicProfile();
				  var imagurl=profile.getImageUrl();
				  var name=profile.getName();
				  var email=profile.getEmail();
				
				  document.getElementById("myImg").src = imagurl;
				  document.getElementById("name").innerHTML = name;
				  document.getElementById("myP").style.visibility = "hidden";
				  document.getElementById("googleMemberSubmit").style.visibility = "visible";
				  
				  document.getElementById("registGoogleName").value = name;
				  document.getElementById("registGoogleEmail").value = email;

				  
			 }
				
			</script>
			
<!--  			<button onclick="myFunction()">Sign Out</button> -->

<!-- 			<script> -->
<!-- 			function myFunction() { -->
<!-- 			gapi.auth2.getAuthInstance().disconnect(); -->
<!--     		location.reload(); -->
<!-- 			} -->
<!-- 			</script> -->
 
 <button onclick="myFunction()">Sign Out</button>

			<script>
			function myFunction() {
			gapi.auth2.getAuthInstance().disconnect();
    		location.reload();
			}
			</script>
 
<!-- --------------------------------------------------------------------------------------							 -->
							
							</div>
						</div>
					</header>
				</article>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<!-- 引用jQuery-->


	<!--以下請放置到*.js檔-->
	<script type="text/javascript">
		
	</script>
</body>
</html>