<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 電影討論區</title>
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
		$("#fm01").click(function() { 
		$("#bd01").show(); 
		$("#bd02").hide();
		$("#bd03").hide();
		$("#bd04").hide();
		});

		$("#fm02").click(function() { 
		$("#bd02").show(); 
		$("#bd01").hide();
		$("#bd03").hide();
		$("#bd04").hide();
		});
		
		$("#fm03").click(function() { 
		$("#bd03").show(); 
		$("#bd01").hide();
		$("#bd02").hide();
		$("#bd04").hide();
		});
		
		$("#fm04").click(function() { 
		$("#bd04").show(); 
		$("#bd01").hide();
		$("#bd02").hide();
		$("#bd03").hide();
		});
	});
</script>

<style type="text/css">
	
	.forum {width:800px;
		border:1px solid gray;
		border-radius:25px;
		margin:auto;
	}
	
	.forum1 ul li {display:inline;
			}
			
	.tb1{text-align:center;}		

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
				<article id="main" class="special"> <header>
				<h2>
					<a href="#">電影 - 場外休憩區</a>
				</h2>
				<p>請遵守相關法令及站務規定，共同維護優良討論風氣。</p>
				</header> 
				
				<div class="forum">
					<div class="forum1">
						<center>
							<ul>
								<li><a href="#" id="fm01">人氣排行</a></li>
								<li><a href="#" id="fm02">現正熱映</a></li>
								<li><a href="#" id="fm03">即將上映</a></li>
								<li><a href="#" id="fm04">下檔電影</a></li>
							</ul>
						</center>		
					</div>

				
					<hr>
				

						<div class="forum1" id="bd01" style="display:none">
						<table class="tb1" >
							<thead>
								<tr><th>編號</th><th>電影</th><th>人氣</th></tr>
							</thead>
							<tbody>
								<tr><td>01</td><td>牠 第二章</td><td>999</td></tr>
								<tr><td>02</td><td>航海王：奪寶爭霸戰</td><td>888</td></tr>
								<tr><td>03</td><td>全面攻佔 3：天使救援</td><td>777</td></tr>							
							</tbody>
						</table>
						</div>
						
						<div class="forum1" id="bd02" style="display:none">
						<table class="tb1"  >
							<thead>
								<tr><th>編號</th><th>電影</th><th>人氣</th></tr>
							</thead>
							<tbody>
								<tr><td>01</td><td>牠 第二章</td><td>999</td></tr>
								<tr><td>02</td><td>極限逃生</td><td>555</td></tr>
								<tr><td>03</td><td>大叔之愛電影版</td><td>333</td></tr>							
							</tbody>
						</table>
						</div>
						
						<div class="forum1" id="bd03" style="display:none">
						<table class="tb1"  >
							<thead>
								<tr><th>編號</th><th>電影</th><th>人氣</th></tr>
							</thead>
							<tbody>
								<tr><td>01</td><td>全面攻佔 3：天使救援</td><td>777</td></tr>
								<tr><td>02</td><td>NG你的人生</td><td>555</td></tr>
								<tr><td>03</td><td>我家有個開心農場</td><td>333</td></tr>							
							</tbody>
						</table>
						</div>
						
						<div class="forum1" id="bd04" style="display:none">
						<table class="tb1"  >
							<thead>
								<tr><th>編號</th><th>電影</th><th>人氣</th></tr>
							</thead>
							<tbody>
								<tr><td>01</td><td>航海王：奪寶爭霸戰</td><td>888</td></tr>
								<tr><td>02</td><td>玩命關頭：特別行動</td><td>555</td></tr>
								<tr><td>03</td><td>天氣之子</td><td>333</td></tr>							
							</tbody>
						</table>
						</div>
					</div>			

				
				<hr>
				<a href="#" class="image featured"><img src="images/frontend/pic06.jpg" alt="" /></a>
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
				<section> <header>
				<h3>Ultrices tempor sagittis nisl</h3>
				</header>
				<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus
					ultrices porttitor sollicitudin imperdiet at pretium tellus in
					euismod a integer sodales neque. Nibh quis dui quis mattis eget
					imperdiet venenatis feugiat. Neque primis ligula cum erat aenean
					tristique luctus risus ipsum praesent iaculis. Fermentum elit
					fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium
					sodales porttitor lacus. Phasellus egestas odio nisl duis sociis
					purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
				<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean
					suspendisse nulla eget sed etiam parturient orci cursus nibh.
					Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim
					cras rutrum consectetur ut penatibus fermentum nibh erat malesuada
					varius.</p>
				</section> <section> <header>
				<h3>Augue euismod feugiat tempus</h3>
				</header>
				<p>Pretium tellus in euismod a integer sodales neque. Nibh quis
					dui quis mattis eget imperdiet venenatis feugiat. Neque primis
					ligula cum erat aenean tristique luctus risus ipsum praesent
					iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo
					risus morbi. Lobortis vestibulum velit malesuada ante egestas odio
					nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis
					pharetra magna.</p>
				</section> </article>
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