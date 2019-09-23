<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 購票記錄</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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



<script>
  		$( function() {
    	$( "#accordion" ).accordion({
      		collapsible: true
   		});
  		} );
</script>


<style>
	.tbst{border:0;
			border-radius:10px;
			background-color:#F5F5F5;
	}
	
	.p{vertical-align:center;}
</style>

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
						<hr class="first" />
						
						<section> <header>
						<h3>
							<a href="#">購票記錄</a>
						</h3>
						</header>
						<p>8+9尚雷諾熊大寬元您好</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/ticket.png" alt="" /></a>
							</div>
							<div class="col-8" id="notdone">
								<br>
								<h3><a href="#">未取票</a></h3>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pickup.png" alt="" style="size:80%;"/></a>
							</div>
							<div class="col-8" id="done">
								<br>
								<h3><a href="#">已取票</a></h3>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic12.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4></h4>
								<p>Amet nullam fringilla nibh nulla convallis tique ante
									proin.</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic13.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4>Sed tempus fringilla</h4>
								<p>Amet nullam fringilla nibh nulla convallis tique ante
									proin.</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic14.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4>Malesuada fermentum</h4>
								<p>Amet nullam fringilla nibh nulla convallis tique ante
									proin.</p>
							</div>
						</div>
						<footer> <a href="#" class="button">會員資訊</a>
						</footer> </section>
					</div>
					
					
					
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main">
					<h3><a href="#">訂單清單</a></h3>					
					
					<div id="accordion">
  						<h3><td>01 - </td><td>2019/09/19</td><td>牠 第二章</td></tr></h3>
  						<div>
    						<table class="tbst">
								<thead style="background-color:#AAAAAA ; text-align:left; height:10px; ">
									<tr>
										<th style="width:200px;">訂單狀態：</th>
										<th style="width:800px;">訂單內容：</th>
									</tr>
								</thead>																
								<tbody style="padding:10px;">
									<tr>
										<td style="text-align:center;vertical-align:center;">											
											<p>未取票</p>
										</td>
										<td style="text-align:center;vertical-align:center;">
											<P>取票序號：</P>
											<p>訂票時間：</p>
											<p><img src="images/frontend/iconplace.png" style="height:25px; width:25px;"/>影廳：</p>
											<p><img src="images/frontend/iconfilm.png" style="height:25px; width:25px;"/>電影：</p>
											<p><img src="images/frontend/icontime.png" style="height:25px; width:25px;"/>場次：</p>
											<p><img src="images/frontend/iconmeal.png" style="height:25px; width:25px;"/>餐點：</p>
											<p><img src="images/frontend/iconpeople.png" style="height:25px; width:25px;"/>數量：</p>
											<p><img src="images/frontend/iconprice.png" style="height:25px; width:25px;"/>總計金額：</p>
										</td>
									</tr>
								</tbody>
							</table>
  						</div>
  						<h3><td>02 - </td><td>2019/09/19</td><td>第九分局</td></tr></h3>
  						<div>
    						<table class="tbst">
								<thead style="background-color:#AAAAAA ; text-align:left; height:10px; ">
									<tr>
										<th style="width:200px;">訂單狀態：</th>
										<th style="width:800px;">訂單內容：</th>
									</tr>
								</thead>																
								<tbody style="padding:10px;">
									<tr>
										<td style="text-align:center;">											
											<p>未取票</p>
										</td>
										<td>
											<P>取票序號：</P>
											<p>訂票時間：</p>
											<p>影廳：</p>
											<p>電影：</p>
											<p>場次：</p>
											<p>餐點：</p>
											<p>數量：</p>
											<p>總計金額：</p>
										</td>
									</tr>
								</tbody>
							</table>
  						</div>
  						<h3><tr><td>03 - </td><td>2019/08/31</td><td>航海王：奪寶爭霸戰</td></tr></h3>
 						<div>
    						<table class="tbst">
								<thead style="background-color:#AAAAAA ; text-align:left; height:10px; ">
									<tr>
										<th style="width:200px;">訂單狀態：</th>
										<th style="width:800px;">訂單內容：</th>
									</tr>
								</thead>																
								<tbody style="padding:10px;">
									<tr>
										<td style="text-align:center;">											
											<p>未取票</p>
										</td>
										<td>
											<P>取票序號：</P>
											<p>訂票時間：</p>
											<p>影廳：</p>
											<p>電影：</p>
											<p>場次：</p>
											<p>餐點：</p>
											<p>數量：</p>
											<p>總計金額：</p>
										</td>
									</tr>
								</tbody>
							</table>
  						</div>
  						<h3><tr><td>04 - </td><td>2019/07/27</td><td>全面攻佔 3：天使救援</td></tr></h3>
  						<div>
    						<table class="tbst">
								<thead style="background-color:#AAAAAA ; text-align:left; height:10px; ">
									<tr>
										<th style="width:200px;">訂單狀態：</th>
										<th style="width:800px;">訂單內容：</th>
									</tr>
								</thead>																
								<tbody style="padding:10px;">
									<tr>
										<td style="text-align:center;">											
											<p>未取票</p>
										</td>
										<td>
											<P>取票序號：</P>
											<p>訂票時間：</p>
											<p>影廳：</p>
											<p>電影：</p>
											<p>場次：</p>
											<p>餐點：</p>
											<p>數量：</p>
											<p>總計金額：</p>
										</td>
									</tr>
								</tbody>
							</table>
  						</div>
					</div>
						 
						<section> 
						<header><h3>Augue euismod feugiat tempus</h3></header>
						
						</section>
						
						<header>
						<h2>
							<a href="#">訂單內容</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/pic06.jpg" alt="" /></a>
						<p>Commodo id natoque malesuada sollicitudin elit suscipit.
							Curae suspendisse mauris posuere accumsan massa posuere lacus
							convallis tellus interdum. Amet nullam fringilla nibh nulla
							convallis ut venenatis purus lobortis. Auctor etiam porttitor
							phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum integer purus sapien. Nibh eleifend
							nulla nascetur pharetra commodo mi augue interdum tellus. Ornare
							cursus augue feugiat sodales velit lorem. Semper elementum
							ullamcorper lacinia natoque aenean scelerisque vel lacinia mollis
							quam sodales congue.</p>
						</article>
					</div>
				</div>
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
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>