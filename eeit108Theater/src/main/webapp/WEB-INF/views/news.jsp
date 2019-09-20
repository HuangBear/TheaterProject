<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城公告</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<style>
	.p{text-color:red;
	  }
</style>
<!-- <script src="jquery-1.11.2.min.js"></script>-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {         
		$("#n1").click(function() { 
		$("#news01").show(); 
		$("#news02").hide();
		$("#news03").hide();
		$("#news04").hide();
		$("#news05").hide();        
		});

		$("#n2").click(function() { 
		$("#news02").show(); 
		$("#news01").hide();
		$("#news03").hide();
		$("#news04").hide();
		$("#news05").hide();        
		});
		
		$("#n3").click(function() { 
		$("#news03").show(); 
		$("#news01").hide();
		$("#news02").hide();
		$("#news04").hide();
		$("#news05").hide();        
		});
		
		$("#n4").click(function() { 
		$("#news04").show(); 
		$("#news01").hide();
		$("#news02").hide();
		$("#news03").hide();
		$("#news05").hide();        
		});
		
		$("#n5").click(function() { 
		$("#news05").show(); 
		$("#news01").hide();
		$("#news02").hide();
		$("#news03").hide();
		$("#news04").hide();        
		}) ;
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
						<hr class="first" />
						<section> <header>
						<h3>
							<a href="#">影城公告</a>
						</h3>
						</header>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic10.jpg"
									alt="" /></a>
							</div>
							<div class="col-8"> <a href="#" id="n1">
								<h4>2019/09/05</h4>
								<p>【大叔之愛】片尾告示</p></a>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic11.jpg"
									alt="" /></a>
							</div>
							<div class="col-8"><a href="#" id="n2">
								<h4>2019/08/29</h4>
								<p>【第九分局】片尾告示</p></a>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic12.jpg"
									alt="" /></a>
							</div>
							<div class="col-8"><a href="#" id="n3">
								<h4>2019/08/14</h4>
								<p>【驅魔使者】片尾公告</p></a>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic13.jpg"
									alt="" /></a>
							</div>
							<div class="col-8"><a href="#" id="n4">
								<h4>2019/06/15</h4>
								<p class="p">信用卡優惠影城現場購票公告</p></a>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic14.jpg"
									alt="" /></a>
							</div>
							<div class="col-8"><a href="#" id="n5">
								<h4>2019/03/13</h4>
								<p class="p">行動支付公告</p></a>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/pic14.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4>2016/09/01</h4>
								<p>影城觀影入場須知</p>
							</div>
						</div>
						</section>
					</div>
					
					<!--  class="col-8 col-12-mobile imp-mobile"-->
					<div class="col-8 col-12-mobile imp-mobile" id="news01">
						<article id="main"> <header>
						<h2>
							<a href="#">【大叔之愛】片尾告示</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/news01.jpg" alt="" /></a>
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
							fringilla consequat dis arcu. Pellentesque mus tempor vitae
							pretium sodales porttitor lacus. Phasellus egestas odio nisl duis
							sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra
							magna.</p>
						<p>Eleifend auctor turpis magnis sed porta nisl pretium.
							Aenean suspendisse nulla eget sed etiam parturient orci cursus
							nibh. Quisque eu nec neque felis laoreet diam morbi egestas.
							Dignissim cras rutrum consectetur ut penatibus fermentum nibh
							erat malesuada varius.</p>
						</section></article>
					</div>
					
					<div class="col-8 col-12-mobile imp-mobile" id="news02" style="display:none">
						<article id="main"> <header>
						<h2>
							<a href="#">【第九分局】片尾告示</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/news02.jpg" alt="" /></a>
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
							fringilla consequat dis arcu. Pellentesque mus tempor vitae
							pretium sodales porttitor lacus. Phasellus egestas odio nisl duis
							sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra
							magna.</p>
						<p>Eleifend auctor turpis magnis sed porta nisl pretium.
							Aenean suspendisse nulla eget sed etiam parturient orci cursus
							nibh. Quisque eu nec neque felis laoreet diam morbi egestas.
							Dignissim cras rutrum consectetur ut penatibus fermentum nibh
							erat malesuada varius.</p>
						</section></article>
					</div>
					
					<div class="col-8 col-12-mobile imp-mobile" id="news03" style="display:none">
						<article id="main"> <header>
						<h2>
							<a href="#">【驅魔使者】片尾公告</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/news03.jpg" alt="" /></a>
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
							fringilla consequat dis arcu. Pellentesque mus tempor vitae
							pretium sodales porttitor lacus. Phasellus egestas odio nisl duis
							sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra
							magna.</p>
						<p>Eleifend auctor turpis magnis sed porta nisl pretium.
							Aenean suspendisse nulla eget sed etiam parturient orci cursus
							nibh. Quisque eu nec neque felis laoreet diam morbi egestas.
							Dignissim cras rutrum consectetur ut penatibus fermentum nibh
							erat malesuada varius.</p>
						</section></article>
					</div>
					
					<div class="col-8 col-12-mobile imp-mobile" id="news04" style="display:none">
						<article id="main"> <header>
						<h2>
							<a href="#">信用卡優惠影城現場購票公告</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/news04.jpg" alt="" /></a>
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
							fringilla consequat dis arcu. Pellentesque mus tempor vitae
							pretium sodales porttitor lacus. Phasellus egestas odio nisl duis
							sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra
							magna.</p>
						<p>Eleifend auctor turpis magnis sed porta nisl pretium.
							Aenean suspendisse nulla eget sed etiam parturient orci cursus
							nibh. Quisque eu nec neque felis laoreet diam morbi egestas.
							Dignissim cras rutrum consectetur ut penatibus fermentum nibh
							erat malesuada varius.</p>
						</section></article>
					</div>
					
					<div class="col-8 col-12-mobile imp-mobile" id="news05" style="display:none">
						<article id="main"> <header>
						<h2>
							<a href="#">行動支付公告</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header> <a href="#" class="image featured"><img
							src="images/frontend/news05.jpg" alt="" /></a>
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
							fringilla consequat dis arcu. Pellentesque mus tempor vitae
							pretium sodales porttitor lacus. Phasellus egestas odio nisl duis
							sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra
							magna.</p>
						<p>Eleifend auctor turpis magnis sed porta nisl pretium.
							Aenean suspendisse nulla eget sed etiam parturient orci cursus
							nibh. Quisque eu nec neque felis laoreet diam morbi egestas.
							Dignissim cras rutrum consectetur ut penatibus fermentum nibh
							erat malesuada varius.</p>
						</section></article>
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
</body>
</html>