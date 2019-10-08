<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 影城介紹</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
</head>

<body class="no-sidebar is-preload">     <!-- class="no-sidebar is-preload" -->
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		
		<!-- Main -->
		<div class="wrapper style1">
			<div class="container">			
				<article id="main" class="special" style="width:75%;margin:auto;"> 
					<header><h2><a href="#">關於716</a></h2>
						<p>一個愛與包容的超優質影城</p>
					</header> 
						<a href="#" class="image featured"><img src="images/frontend/cinema.jpg" alt="" /></a>
						<p>716影城內有時髦前衛、聲光炫麗的裝潢，為全國第一座專門為放映電影而量身打造的建築設計，提供了由現成建築物改裝的傳統電影院無法擁有的舒適視聽空間。
						<br>
							世界上最棒的影廳之一的4DX影廳，於2019年獨家引進，打造『716影城』全台首座4DX影廳，帶給您世界級的最新影音感官全體驗效果。
							為滿足觀眾視聽至高無上的享受，716影城應用最新科技，為未來影城之設計規劃建立新規範，也為台灣的電影院史上樹立新的里程碑。
							出自名室內設計師之手的3間影廳院，皆具備超大型廣角弧形銀幕及球場座位排列的座椅，提供716影城之觀眾寬敞舒適、無障礙的空間，
							為全台唯一經過THX世界標準聲場環境認證的標準影廳，提供北台灣民眾世界級的影音享受。					
						<br>
							※本影城為方便消費者，亦設有無障礙空間。<br>
							●輪椅席(共46個席次)：第1、3-14廳-各3席，第2、15-18廳-各2席<br>
							●無障礙電梯：一樓服務台旁<br>
							●無障礙坡道：二樓服務台前<br>
							●無障礙停車位：地下停車場二樓<br>
							●無障礙廁所<br>
						<br>
							本據點共3座影廳  30席座位、2席無障礙座位，內含：<br>	
							1座4DX影廳 140個座位</p>
				</article>
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
</body>
</html>