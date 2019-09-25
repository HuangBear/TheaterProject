<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 客服中心</title>
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
	
<script type="text/javascript">
	$(document).ready(function() {         
		$("#qa1").click(function() { 
			$("#qainput1").show(); 
			$("#qainput2").hide();
			$("#qainput3").hide();
			});

		$("#qa2").click(function() { 
			$("#qainput2").show(); 
			$("#qainput1").hide();
			$("#qainput3").hide();
			});
		
		$("#qa3").click(function() { 
			$("#qainput3").show(); 
			$("#qainput1").hide();
			$("#qainput2").hide();
			});
	});
</script>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<h3><a href="#">客服中心</a></h3>
						<p>716影城誠摯為您服務</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/suggestion.png" alt="" style="width:110px;height:82px;"/></a>
							</div>
							<div class="col-8">
								<p><p>
								<h4 id="qa1">顧客意見</h4>
								<p></p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic11.jpg" alt="" /></a>
							</div>
							<div class="col-8">
								<p></p>
								<h4 id="qa2">...</h4>
								<p></p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic12.jpg" alt="" /></a>
							</div>
							<div class="col-8">
								<p></p>
								<h4 id="qa3">...</h4>
								<p></p>
							</div>
						</div>
						<footer> <a href="index" class="button">回首頁</a></footer> </section>
					</div>
					
					
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main">
							<div id="qainput1">													
							<section><header><h3>意見反應</h3></header>
								<dl>
								<dd>
									<label for="name" style="text-align:left" >*會員帳號：</label>
									<input class="text" value="${LoginOK.name}" placeholder="請輸入會員帳號"  maxlength="50"  readonly/>     
								</dl>
								<dl>
								<dd>
									<label for="phoneNum" style="text-align:left">*意見分類：</label>
									<select name="請選擇電影名稱" style="width:300px;">
										<option>請選擇意見分類</option>
										<option>票務相關</option>
										<option>影城服務相關</option>
										<option>討論區相關</option>
      									<option>其他</option>
    								</select>
								</dl>
								<dl>
								<dd>
									<label for="email" style="text-align:left">&nbsp;&nbsp;訂票序號：</label>
									<input class="text" placeholder="請輸入訂票序號(如有需要)" maxlength="50" />
								</dl>
								<dl>
								<dd><label style="vertical-align:top">*內容：</label>
									<textarea cols="30" rows="10"></textarea>
								</dl>
							</section>
							</div>
							
							<div id="qainput2" style="display:none;">													
							<section><header><h3>申訴服務</h3></header>
								<dl>
								<dd>
									<label for="name" style="text-align:left">*會員帳號：</label>
									<input class="text" placeholder="請輸入會員帳號"  maxlength="50"  />     
								</dl>
								<dl>
								<dd>
									<label for="phoneNum" style="text-align:left">*申訴分類：</label>
									<select name="請選擇電影名稱" id="speed">
										<option>請選擇申訴分類</option>
										<option>影城服務相關</option>
										<option>討論區相關</option>
      									<option>其他</option>
    								</select>
								</dl>
								<dl>
								<dd><label style="vertical-align:top">*內容：</label>
									<textarea cols="30" rows="10"></textarea>
								</dl>
							</section>
							</div>	 
							<footer>
								<center> 
								<a href="#index" type="submit"  class="button">發送</a>
								<a href="#index" type="reset"  class="button">清除</a>	
							</footer>
						</article>
					</div>
				</div>
				
				<br><br><br>
				<hr />
				
				<div class="row">
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic07.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Gravida aliquam penatibus</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic08.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Sed quis rhoncus placerat</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic09.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Magna laoreet et aliquam</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
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
</body>
</html>