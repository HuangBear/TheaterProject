<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<title>Left Sidebar - Helios by HTML5 UP</title>
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


						<!-- 						<hr class="first" /> -->
						<!-- 												<section> <header> -->
						<!-- 						<h3> -->
						<!-- 							<a href="#">Accumsan sed penatibus</a> -->
						<!-- 						</h3> -->
						<!-- 						</header> -->
						<!-- 						<p>Dolor sed fringilla nibh nulla convallis tique ante proin -->
						<!-- 							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus -->
						<!-- 							cubilia ultrices tempor sagittis tellus ante diam nec penatibus -->
						<!-- 							dolor cras magna tempus feugiat veroeros.</p> -->
						<!-- 						<footer> <a href="#" class="button">Learn More</a> </footer> </section> -->
						<!-- 						<hr /> -->
						<!-- 						<section> <header> -->
						<!-- 						<h3> -->
						<!-- 							<a href="#">Sed lorem etiam consequat</a> -->
						<!-- 						</h3> -->
						<!-- 						</header> -->
						<p>後台測試頁</p>


						<div class="row gtr-50">
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic10.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Nibh sed cubilia</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic11.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Proin sed adipiscing</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic12.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>公告</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic13.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Sed tempus fringilla</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic14.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Malesuada fermentum</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
						</div>
						<!-- 						<footer> <a href="#" class="button">Magna Adipiscing</a> -->
						<!-- 						</footer> -->
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> <header>
						<h2>
							<a href="#">公告</a>
						</h2>


						<form class="was-validated">
							<div class="mb-3">
								<label for="validationTextarea">title</label> <input type="text"
									class="form-control is-invalid" id="title" placeholder="輸入標題"
									required>
								<!-- 						<div class="invalid-feedback">輸入標題</div> -->
							</div>

							<div class="row mb-3">
								<div class="col">
									<label for="validationTextarea">StartDate</label><input
										type="date" class="form-control is-invalid" id="startDate"
										placeholder="輸入標題" required>
									<!-- <div class="invalid-feedback">輸入標題</div> -->
								</div>

								<div class="col">
									<label for="validationTextarea">EndDate</label><input
										type="date" class="form-control is-invalid" id="endDate"
										placeholder="輸入標題" required>
									<!-- <div class="invalid-feedback">輸入標題</div> -->

								</div>
							</div>
							<div class="mb-3">
								<label for="validationTextarea">Context</label>
								<textarea class="form-control is-invalid" id="context"
									placeholder="輸入公告內容，字數請勿大於300字" required></textarea>
								<!-- 						<div class="invalid-feedback"></div> -->
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customControlValidation1" required> <label
									class="custom-control-label" for="customControlValidation1">Check
									this custom checkbox</label>
								<div class="invalid-feedback">Example invalid feedback
									text</div>
							</div>

							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input"
									id="customControlValidation2" name="radio-stacked" required>
								<label class="custom-control-label"
									for="customControlValidation2">Toggle this custom radio</label>
							</div>
							<div class="custom-control custom-radio mb-3">
								<input type="radio" class="custom-control-input"
									id="customControlValidation3" name="radio-stacked" required>
								<label class="custom-control-label"
									for="customControlValidation3">Or toggle this other
									custom radio</label>
								<div class="invalid-feedback">More example invalid
									feedback text</div>
							</div>

							<div class="form-group">
								<select class="custom-select" required>
									<option value="">Open this select menu</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
								<div class="invalid-feedback">Example invalid custom
									select feedback</div>
							</div>

							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">Choose
									file...</label>
								<!-- 								<div class="invalid-feedback">Example invalid custom file -->
								<!-- 									feedback</div> -->
							</div>




						</form>
					</div>
				</div>
				<!-- 				<hr /> -->
				<!-- 				<div class="row"> -->
				<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
				<!-- 						class="image featured"><img src="images/pic07.jpg" alt="" /></a> -->
				<!-- 					<header> -->
				<!-- 					<h3> -->
				<!-- 						<a href="#">Gravida aliquam penatibus</a> -->
				<!-- 					</h3> -->
				<!-- 					</header> -->
				<!-- 					<p>Amet nullam fringilla nibh nulla convallis tique ante proin -->
				<!-- 						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus -->
				<!-- 						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer -->
				<!-- 						interdum.</p> -->
				<!-- 					</article> -->
				<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
				<!-- 						class="image featured"><img src="images/pic08.jpg" alt="" /></a> -->
				<!-- 					<header> -->
				<!-- 					<h3> -->
				<!-- 						<a href="#">Sed quis rhoncus placerat</a> -->
				<!-- 					</h3> -->
				<!-- 					</header> -->
				<!-- 					<p>Amet nullam fringilla nibh nulla convallis tique ante proin -->
				<!-- 						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus -->
				<!-- 						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer -->
				<!-- 						interdum.</p> -->
				<!-- 					</article> -->
				<!-- 					<article class="col-4 col-12-mobile special"> <a href="#" -->
				<!-- 						class="image featured"><img src="images/pic09.jpg" alt="" /></a> -->
				<!-- 					<header> -->
				<!-- 					<h3> -->
				<!-- 						<a href="#">Magna laoreet et aliquam</a> -->
				<!-- 					</h3> -->
				<!-- 					</header> -->
				<!-- 					<p>Amet nullam fringilla nibh nulla convallis tique ante proin -->
				<!-- 						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus -->
				<!-- 						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer -->
				<!-- 						interdum.</p> -->
				<!-- 					</article> -->
				<!-- 				</div> -->
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