<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>

<head>
	<title>Left Sidebar - Helios by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<noscript>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
	</noscript>

	<script>
		//	    discount
		document.addEventListener("DOMContentLoaded", function () {
			document.getElementsByClassName("discountT").addEventListener("change", discountT);
			document.getElementsByClassName("discountP").addEventListener("change", discountP);
			// 			document.getElementById("discountT").addEventListener("change",	discountT);
			// 			document.getElementById("discountP").addEventListener("change", discountP);
		});
		//	  discountT

		function discountT() {
			alert("a");
			// 			document.getElementById("discountT_1").style.visibility = "visible";
			// 			document.getElementById("discountT_2").style.visibility = "visible";
			// 			document.getElementById("discountT_3").style.visibility = "visible";
			// 			document.getElementById("discountT_4").style.visibility = "visible";
		}

		//    discountP
		function discountP() {
			alert("b");
			// 			document.getElementById("discountP_1").style.visibility = "visible";
			// 			document.getElementById("discountP_2").style.visibility = "visible";
			// 			document.getElementById("discountP_3").style.visibility = "visible";
			// 			document.getElementById("discountP_4").style.visibility = "visible";
		}
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
							</header>
							<form:form method='POST' modelAttribute="bookBean" class="was-validated mb-5"
								enctype="multipart/form-data">
								<div class="mb-2">
									<label for="validationTextarea" class="mb-1">公告標題</label> <input
										style="border-radius: 5px" type="text" class="form-control is-invalid"
										id="title" placeholder="輸入標題" required>
								</div>

								<div class="mb-3">
									<label for="validationTextarea" class="mb-1">公告內容</label>
									<textarea style="border-radius: 5px" class="form-control is-invalid" id="context"
										placeholder="輸入公告內容，字數請勿大於300字" required></textarea>
									<!-- 															<div class="invalid-feedback">自數少於300字</div> -->
								</div>
								<div class="form-row">
									<div class="form-group col-md-2 pr-1">
										<label for="from" class="blockquote text-center">起始日期</label>
									</div>
									<div class="form-group col-md-4 pr-1">
										<input type="text" style="border-radius: 5px"
											class="form-control form-control-sm is-invalid" id="from" name="from"
											required>
									</div>

									<div class="form-group col-md-2 pr-1">
										<label for="to" class="blockquote text-center">結束日期</label>
									</div>
									<div class="form-group col-md-4 pr-1">
										<input type="text" style="border-radius: 5px"
											class="form-control form-control-sm is-invalid" id="to" name="to" required>
									</div>
								</div>
								<div class="form-row pr-3 pl-5">
									<div class="form-group col-md-6 pr-1 custom-control  custom-radio">
										<input type="radio" class="custom-control-input " id="radio_1"
											name="radio-stacked" required> <label class="custom-control-label"
											for="radio_1">單純公告，無任何優惠</label>
									</div>

								</div>

								<div class="form-row pr-3 pl-5">
									<div class="form-group col-md-4 pr-1 custom-control  custom-radio ">
										<input type="radio" class="custom-control-input discountT" id="radio_2"
											name="radio-stacked" required> <label class="custom-control-label"
											for="radio_2">金額折扣</label>
									</div>
									<div class="form-group col-md-1 custom-control pr-1" id="discountT_1"
										style="visibility: hidden;">
										<label for="validationTextarea" class="blockquote text-center">滿</label>
									</div>
									<div class="form-group col-md-3 custom-control pr-1 " id="discountT_2"
										style="visibility: hidden;">
										<input style="border-radius: 5px" type="text" class="form-control is-invalid "
											id="title" placeholder="輸入金額" required>
									</div>
									<div class="form-group col-md-1 custom-control pr-1 " id="discountT_3"
										style="visibility: hidden;">
										<label for="validationTextarea" class="blockquote text-center">送</label>
									</div>
									<div class="form-group col-md-3 custom-control  pr-1 " id="discountT_4"
										style="visibility: hidden;">
										<input style="border-radius: 5px" type="text" class="form-control is-invalid "
											id="title" placeholder="輸入金額" required>
									</div>

								</div>

								<div class="form-row  pr-3 pl-5 ">
									<div class="form-group col-md-4 pr-1 custom-control custom-radio">
										<input type="radio" class="custom-control-input discountP" id="radio_3"
											name="radio-stacked" required> <label class="custom-control-label"
											for="radio_3">票券折扣</label>
									</div>
									<div class="form-group col-md-1 custom-control " id="discountP_1"
										style="visibility: hidden;">
										<label for="validationTextarea" class="blockquote text-center">買</label>
									</div>
									<div class="form-group col-md-3 custom-control " id="discountP_2"
										style="visibility: hidden;">
										<select class="custom-select " required>

											<option value="">請選擇</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
										</select>
									</div>
									<div class="form-group col-md-1 custom-control " id="discountP_3"
										style="visibility: hidden;">
										<label for="validationTextarea" class="blockquote text-center ">送</label>
									</div>
									<div class="form-group col-md-3 custom-control1 " id="discountP_4"
										style="visibility: hidden;">
										<select class="custom-select  " required>
											<option value="">請選擇</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>

								</div>

								<div class="custom-file mb-3">
									<input style="border-radius: 5px" type="file" class="custom-file-input"
										id="validatedCustomFile" required> <label class="custom-file-label"
										for="validatedCustomFile">文宣上傳</label>
								</div>
								<div class="form-row p-1">
									<button style="border-radius: 5px" type="button"
										class="btn btn-primary btn-lg btn-block ">送出公告</button>
								</div>
							</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Scripts -->

	<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>



	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



	<script>
		//    Datepicker
		$(function () {
			var set = {
				monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
					"九月", "十月", "十一月", "十二月"],
				monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九",
					"十", "十一", "十二"],
				dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
				dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
				dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
				defaultDate: "+1w",
				changeMonth: true,
				numberOfMonths: 1,
				dateFormat: "yy-mm-dd"
			}

			var dateFormat = "yy-mm-dd", from = $("#from").datepicker(set).on(
				"change", function () {
					to.datepicker("option", "minDate", getDate(this));
					console.log(this)
				}), to = $("#to").datepicker(set).on("change", function () {
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
</body>

</html>