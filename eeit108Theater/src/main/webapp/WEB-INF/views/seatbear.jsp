<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>No Sidebar - Helios by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js"
	charset="UTF-8"></script>
<style>
.sold {
	background-color: red;
	color: white;
}

label {
	width: 25px;
	height: 25px;
}

div.justify-content-center {
	display: block;
	width: 400px;
}
</style>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!--         crossorigin="anonymous"></script> -->
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!--         crossorigin="anonymous"></script> -->
<!--     <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script> -->


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
			
			<hr>
			<div style="width:200px; height:200px;">
			</div>
				<div class="">   <!-- container w-50 mt-3	 -->
					<div class="">   <!-- row -->
 						<div class="">  <!-- col-1 -->
							<table>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
								<tr class="mh-100">
									<th>A</th>
								</tr>
							</table>
						</div>
						<div class="col-10">
							<form action="##">
								<div class="row justify-content-center">
									<label for="seatA1" class="sold"></label> <input
										type="checkbox" name="seat" id="seatA1" value="A1"> <label
										for="seatA2" title=""></label> <input type="checkbox"
										name="seat" id="seatA2" value="A2"> <label
										for="seatA3"></label> <input type="checkbox" name="seat"
										id="seatA3" value="A3"> <label for="seatA4"></label> <input
										type="checkbox" name="seat" id="seatA4" value="A4"> <label
										for="seatA5"></label> <input type="checkbox" name="seat"
										id="seatA5" value="A5"> <label for="seatA6"></label> <input
										type="checkbox" name="seat" id="seatA6" value="A6"> <label
										for="seatA7"></label> <input type="checkbox" name="seat"
										id="seatA7" value="A7"> <label for="seatA8"></label> <input
										type="checkbox" name="seat" id="seatA8" value="A8"> <label
										for="seatA9"></label> <input type="checkbox" name="seat"
										id="seatA9" value="A9"> <label for="seatA10"></label>
									<input type="checkbox" name="seat" id="seatA10" value="A10">
								</div>
								<div class="row justify-content-center">
									<label for="seatB1"></label> <input type="checkbox" name="seat"
										id="seatB1" value="B1"> <label for="seatB2"></label> <input
										type="checkbox" name="seat" id="seatB2" value="B2"> <label
										for="seatB3"></label> <input type="checkbox" name="seat"
										id="seatB3" value="B3"> <label for="seatB4"></label> <input
										type="checkbox" name="seat" id="seatB4" value="B4"> <label
										for="seatB5"></label> <input type="checkbox" name="seat"
										id="seatB5" value="B5"> <label for="seatB6"></label> <input
										type="checkbox" name="seat" id="seatB6" value="B6"> <label
										for="seatB7"></label> <input type="checkbox" name="seat"
										id="seatB7" value="B7"> <label for="seatB8"></label> <input
										type="checkbox" name="seat" id="seatB8" value="B8"> <label
										for="seatB9"></label> <input type="checkbox" name="seat"
										id="seatB9" value="B9"> <label for="seatB10"></label>
									<input type="checkbox" name="seat" id="seatB10" value="B10">
								</div>
								<div class="row justify-content-center">
									<label for="seatC1"></label> <input type="checkbox" name="seat"
										id="seatC1" value="C1"> <label for="seatC2"></label> <input
										type="checkbox" name="seat" id="seatC2" value="C2"> <label
										for="seatC3"></label> <input type="checkbox" name="seat"
										id="seatC3" value="C3"> <label for="seatC4"></label> <input
										type="checkbox" name="seat" id="seatC4" value="C4"> <label
										for="seatC5"></label> <input type="checkbox" name="seat"
										id="seatC5" value="C5"> <label for="seatC6"></label> <input
										type="checkbox" name="seat" id="seatC6" value="C6"> <label
										for="seatC7"></label> <input type="checkbox" name="seat"
										id="seatC7" value="C7"> <label for="seatC8"></label> <input
										type="checkbox" name="seat" id="seatC8" value="C8"> <label
										for="seatC9"></label> <input type="checkbox" name="seat"
										id="seatC9" value="C9"> <label for="seatC10"></label>
									<input type="checkbox" name="seat" id="seatC10" value="C10">
								</div>
								<div class="row justify-content-center">
									<label for="seatD1"></label> <input type="checkbox" name="seat"
										id="seatD1" value="D1"> <label for="seatD2"></label> <input
										type="checkbox" name="seat" id="seatD2" value="D2"> <label
										for="seatD3"></label> <input type="checkbox" name="seat"
										id="seatD3" value="D3"> <label for="seatD4"></label> <input
										type="checkbox" name="seat" id="seatD4" value="D4"> <label
										for="seatD5"></label> <input type="checkbox" name="seat"
										id="seatD5" value="D5"> <label for="seatD6"></label> <input
										type="checkbox" name="seat" id="seatD6" value="D6"> <label
										for="seatD7"></label> <input type="checkbox" name="seat"
										id="seatD7" value="D7"> <label for="seatD8"></label> <input
										type="checkbox" name="seat" id="seatD8" value="D8"> <label
										for="seatD9"></label> <input type="checkbox" name="seat"
										id="seatD9" value="D9"> <label for="seatD10"></label>
									<input type="checkbox" name="seat" id="seatD10" value="D10">
								</div>
								<div class="row justify-content-center">
									<label for="seatE1"></label> <input type="checkbox" name="seat"
										id="seatE1" value="E1"> <label for="seatE2"></label> <input
										type="checkbox" name="seat" id="seatE2" value="E2"> <label
										for="seatE3"></label> <input type="checkbox" name="seat"
										id="seatE3" value="E3"> <label for="seatE4"></label> <input
										type="checkbox" name="seat" id="seatE4" value="E4"> <label
										for="seatE5"></label> <input type="checkbox" name="seat"
										id="seatE5" value="E5"> <label for="seatE6"></label> <input
										type="checkbox" name="seat" id="seatE6" value="E6"> <label
										for="seatE7"></label> <input type="checkbox" name="seat"
										id="seatE7" value="E7"> <label for="seatE8"></label> <input
										type="checkbox" name="seat" id="seatE8" value="E8"> <label
										for="seatE9"></label> <input type="checkbox" name="seat"
										id="seatE9" value="E9"> <label for="seatE10"></label>
									<input type="checkbox" name="seat" id="seatE10" value="E10">
								</div>
								<div class="row justify-content-center">
									<label for="seatF1"></label> <input type="checkbox" name="seat"
										id="seatF1" value="F1"> <label for="seatF2"></label> <input
										type="checkbox" name="seat" id="seatF2" value="F2"> <label
										for="seatF3"></label> <input type="checkbox" name="seat"
										id="seatF3" value="F3"> <label for="seatF4"></label> <input
										type="checkbox" name="seat" id="seatF4" value="F4"> <label
										for="seatF5"></label> <input type="checkbox" name="seat"
										id="seatF5" value="F5"> <label for="seatF6"></label> <input
										type="checkbox" name="seat" id="seatF6" value="F6"> <label
										for="seatF7"></label> <input type="checkbox" name="seat"
										id="seatF7" value="F7"> <label for="seatF8"></label> <input
										type="checkbox" name="seat" id="seatF8" value="F8"> <label
										for="seatF9"></label> <input type="checkbox" name="seat"
										id="seatF9" value="F9"> <label for="seatF10"></label>
									<input type="checkbox" name="seat" id="seatF10" value="F10">
								</div>
								<div class="row justify-content-center">
									<label for="seatG1"></label> <input type="checkbox" name="seat"
										id="seatG1" value="G1"> <label for="seatG2"></label> <input
										type="checkbox" name="seat" id="seatG2" value="G2"> <label
										for="seatG3"></label> <input type="checkbox" name="seat"
										id="seatG3" value="G3"> <label for="seatG4"></label> <input
										type="checkbox" name="seat" id="seatG4" value="G4"> <label
										for="seatG5"></label> <input type="checkbox" name="seat"
										id="seatG5" value="G5"> <label for="seatG6"></label> <input
										type="checkbox" name="seat" id="seatG6" value="G6"> <label
										for="seatG7"></label> <input type="checkbox" name="seat"
										id="seatG7" value="G7"> <label for="seatG8"></label> <input
										type="checkbox" name="seat" id="seatG8" value="G8"> <label
										for="seatG9"></label> <input type="checkbox" name="seat"
										id="seatG9" value="G9"> <label for="seatG10"></label>
									<input type="checkbox" name="seat" id="seatG10" value="G10">
								</div>
								<input type="submit" value="送出">
							</form>
						</div>
						<div class="col-1"></div>
					</div>
				</div>



				<article id="main" class="special">
					<header>
						<h2>
							<a href="#">No Sidebar</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet</p>
					</header>
					<a href="#" class="image featured"><img src="images/frontend/pic06.jpg"
						alt="" /></a>
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
					<section>
						<header>
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
					</section>
					<section>
						<header>
							<h3>Augue euismod feugiat tempus</h3>
						</header>
						<p>Pretium tellus in euismod a integer sodales neque. Nibh
							quis dui quis mattis eget imperdiet venenatis feugiat. Neque
							primis ligula cum erat aenean tristique luctus risus ipsum
							praesent iaculis. Fermentum elit ut nunc urna volutpat donec
							cubilia commodo risus morbi. Lobortis vestibulum velit malesuada
							ante egestas odio nisl duis sociis purus faucibus morbi. Eget
							massa mus etiam sociis pharetra magna.</p>
					</section>
				</article>
				<hr />
				<div class="row">
					<article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="images/frontend/pic07.jpg"
							alt="" /></a>
						<header>
							<h3>
								<a href="#">Gravida aliquam penatibus</a>
							</h3>
						</header>
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="images/frontend/pic08.jpg"
							alt="" /></a>
						<header>
							<h3>
								<a href="#">Sed quis rhoncus placerat</a>
							</h3>
						</header>
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="images/frontend/pic09.jpg"
							alt="" /></a>
						<header>
							<h3>
								<a href="#">Magna laoreet et aliquam</a>
							</h3>
						</header>
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
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
		<script>
			$(function() {
				$("input[name='seat']").checkboxradio({
					icon : false
				});
				$("input").prop("checked", false);
				$("label").removeClass(
						"ui-checkboxradio-checked ui-state-active")
			});
		</script>
		<script type="text/javascript">
			var SelectedSeat = [];
			var MAX = 3;
			var labelChecked = "ui-checkboxradio-checked ";
			var labelActive = "ui-state-active ";
			var labelDisabled = "ui-checkboxradio-disabled "
			$(document).ready(
					function() {
						$("label.sold").addClass(labelDisabled);
						$('label[for^=seat]').filter("[class!='sold']").click(
								function() {
									$(this).addClass(labelDisabled);
									if (SelectedSeat.length < MAX) {
										SelectedSeat.push($(this).attr("for"));
									} else {
										$(
												"label[for='" + SelectedSeat[0]
														+ "']").removeClass(
												labelActive + labelChecked
														+ labelDisabled);
										$("#" + SelectedSeat[0]).prop(
												'checked', false);
										SelectedSeat.splice(0, 1);
										SelectedSeat.push($(this).attr("for"));
									}
									console.log(SelectedSeat);
									$("input[type='checkbox']:checked").each(
											function() {
												console.log($(this).val());
											});
									// $(this).checkboxradio("disabled");
								});
						$("label").mouseover(
								function() {
									$(this).attr("title",
											$(this).attr("for").substring(4));
								});
					});
		</script>
</body>
</html>