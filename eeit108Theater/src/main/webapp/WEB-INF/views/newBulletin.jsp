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
<style type="text/css">
.hid {
	/* 	visibility: hidden; */
	display: none;
}
</style>

</head>

<body class="left-sidebar is-preload">

	<div id="page-wrapper">
		<div id="header">
			<!--Header-->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main-->
		<div class="wrapper style1">

			<div class="container">

				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">

						<p>後台測試頁</p>


						<div class="row gtr-50">

							<div class="col-8">
								<h4>Nibh sed cubilia</h4>

							</div>

							<div class="col-8">
								<h4>Proin sed adipiscing</h4>

							</div>

							<div class="col-8">
								<h4>公告</h4>

							</div>

							<div class="col-8">
								<h4>Sed tempus fringilla</h4>

							</div>

							<div class="col-8">
								<h4>Malesuada fermentum</h4>

							</div>
						</div>


					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">

						<header>
							<h2>
								<a href="#">公告</a>
							</h2>
						</header>
						<form:form method='POST' modelAttribute="getNewBulletin" enctype="multipart/form-data">
							<div>
								<label>title</label>
								<form:input path="title" type="text" />
							</div>
							<div>
								<label>context</label>
								<form:textarea path="context" />
							</div>
							<div>
								<label for="from">From</label>
								<form:input type="text" id="from" name="from" path="startDate" />
								<label for="to">to</label>
								<form:input type="text" id="to" name="to" path="endDate" />
							</div>
							<div>
								<table>
									<tr>

										<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="單純公告，無任何優惠" value="0" /></td>
										<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="現金折扣" value="1" /></td>
										<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="票券折扣" value="2" /></td>

									</tr>
								</table>
							</div>
							<div class="form-row pr-3 pl-5">
								<div class=" col-md-1 pr-1 discountT hid" id="discountT_1">
									<label for="validationTextarea" class="blockquote text-center">買</label>
								</div>
								<div class=" col-md-3 pr-1 discountT hid" id="discountT_2">
									<input style="border-radius: 5px" type="text" class="form-control is-invalid " id="title" placeholder="輸入金額" required>
								</div>
								<div class=" col-md-1 pr-1 discountT hid" id="discountT_3">
									<label for="validationTextarea" class="blockquote text-center">送</label>
								</div>
								<div class=" col-md-3 pr-1 discountT hid" id="discountT_4">
									<input style="border-radius: 5px" type="text" class="form-control is-invalid " id="title" placeholder="輸入金額" required>
								</div>
							</div>

							<div class="form-row pr-3 pl-5">
								<div class="col-md-1 pr-1 discountP hid" id="discountP_1">
									<label for="validationTextarea" class="blockquote text-center">滿</label>
								</div>
								<div class="col-md-3 pr-1 discountP hid" id="discountP_2">
									<input style="border-radius: 5px" type="text" class="form-control is-invalid " id="title" placeholder="輸入金額" required>
								</div>
								<div class="col-md-1 pr-1 discountP hid" id="discountP_3">
									<label for="validationTextarea" class="blockquote text-center">送</label>
								</div>
								<div class="col-md-3 pr-1 discountP hid" id="discountP_4">
									<input style="border-radius: 5px" type="text" class="form-control is-invalid " id="title" placeholder="輸入金額" required>
								</div>
							</div>

							<div>
								<form:input style="border-radius: 5px" type="file" id="imgUrlString" path="imgUrlString" />
								<label for="validatedCustomFile">文宣上傳</label>

							</div>
							<div>
								<input id="btnAdd" type='submit' class='btn btn-primary'>
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
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		//    Datepicker
		$(function() {
			var set = {
				monthNames : ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
						"九月", "十月", "十一月", "十二月"],
				monthNamesShort : ["一", "二", "三", "四", "五", "六", "七", "八", "九",
						"十", "十一", "十二"],
				dayNames : ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
				dayNamesShort : ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
				dayNamesMin : ["日", "一", "二", "三", "四", "五", "六"],
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				dateFormat : "yy-mm-dd"
			}

			var dateFormat = "yy-mm-dd", from = $("#from").datepicker(set).on(
					"change", function() {
						to.datepicker("option", "minDate", getDate(this));
						console.log(this)
					}), to = $("#to").datepicker(set).on("change", function() {
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
		//	    discount by jQuery

		$(document).ready(function() {
			$("input[type='radio']").click(function() {
				var i = $(this).attr("value");
				// 				alert(i);
				switch (i) {
					case "0" :
						var o = "discount";
						break;
					case "1" :
						var o = "discountP";
						break;
					case "2" :
						var o = "discountT";
						break;
				}
				// 				alert(o);
				var targete = $("." + o);
				// 				$(".hid").not(targete).css("visibility", "hidden");
				// 				$(targete).css("visibility", "visible");
				$(".hid").not(targete).hide();
				$(targete).show();
			});
		});
	</script>
</body>

</html>