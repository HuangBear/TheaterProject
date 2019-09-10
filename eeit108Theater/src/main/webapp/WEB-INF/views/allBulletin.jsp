<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>Left Sidebar - Helios by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

<script>
	$(function() {
		var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
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
						<article id="main">
							<header>
								<h2>
									<a href="#">公告</a>
								</h2>
								<label for="from">From</label> <input type="text" id="from" name="from"> <label for="to">to</label> <input type="text" id="to" name="to">
							</header>
							<form class="was-validated mb-5">
								<div class="mb-3">
									<label for="validationTextarea">title</label> <input style="border-radius: 3px" type="text" class="form-control is-invalid" id="title"
										placeholder="輸入標題" required>
									<!-- 						<div class="invalid-feedback">輸入標題</div> -->
								</div>

								<div class="row pr-2 mb-3">
									<div class="col">
										<label for="validationTextarea">StartDate</label>
										<!-- 										<input -->
										<!-- 											type="date" class="form-control is-invalid" id="startDate" -->
										<!-- 											placeholder="輸入標題" required> -->
										<label for="from">From</label> <input type="text" id="from" name="from">
										<!-- <div class="invalid-feedback">輸入標題</div> -->
									</div>
									<div class="col pr-2 ">
										<label for="validationTextarea">EndDate</label>
										<!-- 										<input -->
										<!-- 											type="date" class="form-control is-invalid" id="endDate" -->
										<!-- 											placeholder="輸入標題" required> -->
										<label for="to">to</label> <input type="text" id="to" name="to">
										<!-- <div class="invalid-feedback">輸入標題</div> -->
									</div>
								</div>

								<div class="mb-3">
									<label for="validationTextarea">Context</label>
									<textarea style="border-radius: 3px" class="form-control is-invalid" id="context" placeholder="輸入公告內容，字數請勿大於300字" required></textarea>
									<!-- 						<div class="invalid-feedback"></div> -->
								</div>

								<div class="custom-control custom-checkbox mb-3">
									<input style="border-radius: 3px" type="checkbox" class="custom-control-input" id="customControlValidation1" required> <label
										class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label>
									<div class="invalid-feedback">Example invalid feedback text</div>
								</div>

								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required> <label
										class="custom-control-label" for="customControlValidation2">Toggle this custom radio</label>
								</div>

								<div class="custom-control custom-radio mb-3">
									<input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required> <label
										class="custom-control-label" for="customControlValidation3">Or toggle this other custom radio</label>
									<div class="invalid-feedback">More example invalid feedback text</div>
								</div>

								<div class="form-group">
									<select class="custom-select" required>
										<option value="">Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
									<div class="invalid-feedback">Example invalid custom select feedback</div>
								</div>

								<div class="custom-file">
									<input type="file" class="custom-file-input" id="validatedCustomFile" required> <label class="custom-file-label" for="validatedCustomFile">Choose
										file...</label>
									<!-- 								<div class="invalid-feedback">Example invalid custom file -->
									<!-- 									feedback</div> -->
								</div>
							</form>


							<div style="width: 60%">
								<table class="table table-striped  table-hover table-sm  table-responsive">
									<!-- 							style="word-break: break-all; word-wrap: break-all;"> -->
									<thead>
										<tr>
											<th scope="col" class="col-1">##</th>
											<th scope="col" class="col-4">標題</th>
											<th scope="col" colspan="2" class="col-4">優惠方案</th>
											<th scope="col" class="col-1">詳情</th>
											<th scope="col" class="col-1">修改</th>
											<th scope="col" class="col-1">刪除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='allBulletin' items='${allBulletin}'>
											<tr>
												<th scope="row">${allBulletin.no}</th>
												<th scope="row">${allBulletin.tittle}</th>
												<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-low-price-50.png"></td>
												<th scope="row">${allBulletin.context}</th>
												<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-document-50.png"></td>
												<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-edit-50.png"></td>
												<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-trash-50.png"></td>
											</tr>
										</c:forEach>



										<tr>
											<th scope="row">1</th>
											<td>慶開幕</td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-low-price-50.png"></td>
											<td>買三送一</td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-document-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-edit-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-trash-50.png"></td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>慶開幕2</td>

											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-pricing-50.png"></td>
											<td>滿千送百</td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-document-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-edit-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-trash-50.png"></td>
										</tr>
										<tr>

											<th scope="row">3
											<td>慶開幕3</td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-delete-50.png"></td>
											<td></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-document-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-edit-50.png"></td>
											<td><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-trash-50.png"></td>
										</tr>
									</tbody>
								</table>
							</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Scripts -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>



	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<!-- 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
</body>
</html>