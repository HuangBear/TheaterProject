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
								<a href="#">NewBulletin</a>
							</h2>
						</header>
						<form:form method='POST' modelAttribute="getNewBulletin" enctype="multipart/form-data">
							<div>
								<label>title</label>
								<form:input path="title" type="text" placeholder="輸入標題,請勿超過30字" maxlength="35" value="${param.title}" />
								<div>
									<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
								</div>

							</div>
							<div>
								<label>context</label>
								<form:textarea path="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="350" value="${param.context}" />
								<div>
									<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
								</div>
							</div>
							<div>
								<label for="from">startDate</label>
								<form:input type="text" id="from" path="startDate" />
								<label for="to">endDate</label>
								<form:input type="text" id="to" path="endDate" />
								<div>
									<a style="color: red;">${ErrMsg.dateChoice}${ErrMsg.datePassOver}</a>
								</div>
							</div>
							<div>
								<a style="color: red;">${ErrMsg.radio}</a>
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
								<div class="col-md-4 pr-1 discountP hid">
									<a style="color: red;">${ErrMsg.discountP}</a>
								</div>
								<div class="col-md-1 pr-1 discountP hid">
									<label for="validationTextarea">滿</label>
								</div>
								<div class="col-md-3 pr-1 discountP hid">
									<form:input style="border-radius: 5px" type="text" path="discountPriceBuy" placeholder="消費金額" maxlength="4" value="${param.discountPriceBuy}" />
								</div>
								<div class="col-md-1 pr-1 discountP hid">
									<label for="validationTextarea">送</label>
								</div>
								<div class="col-md-3 pr-1 discountP hid">
									<form:input style="border-radius: 5px" type="text" path="discountPriceFree" placeholder="折扣金額" maxlength="4" value="${param.discountPriceFree}" />
								</div>
							</div>

							<div class="form-row pr-3 pl-5">
								<div class="col-md-4 pr-1 discountT hid">
									<a style="color: red;">${ErrMsg.discountT}</a>
								</div>
								<div class=" col-md-1 pr-1 discountT hid">
									<label>買</label>
								</div>

								<div class=" col-md-3 pr-1 discountT hid">
									<form:select class="custom-select " path="discountTickBuy" value="${param.discountTickBuy}">
										<form:option value="0">購買票數</form:option>
										<c:forEach begin="1" end="10" var="inputTB">
											<form:option value="${inputTB}">${inputTB}</form:option>
										</c:forEach>
									</form:select>
								</div>

								<div class=" col-md-1 pr-1 discountT hid">
									<label>送</label>
								</div>
								<div class=" col-md-3 pr-1 discountT hid">
									<form:select class="custom-select " path="discountTickFree" value="${param.discountTickFree}">
										<form:option value="0">贈送票數</form:option>
										<c:forEach begin="1" end="5" var="inputTF">
											<form:option value="${inputTF}">${inputTF}</form:option>
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="form-row pr-3 pl-5">
								<div class=" col-md pr-1 ">EmployeeId</div>
								<div class=" col-md pr-1 ">
									<form:input path="employeeId" type="text" value="2" />
								</div>
							</div>

							<div>
								<form:input style="border-radius: 5px" type="file" path="bulletinImage" />
								<label>文宣上傳</label>

							</div>
							<c:choose>
								<c:when test="${empty statusBulletin.no}">
									<div>
										<input id="btnAdd" type='submit' class='btn btn-primary'>
									</div>
								</c:when>
								<c:when test="${!empty statusBulletin.no}">
									<div>
										<input id="btnEdit" type='submit' class='btn btn-primary' value="送出編輯">
										<input id="btnReset" type='reset' class='btn btn-primary' value="取消編輯">
									</div>
								</c:when>
							</c:choose>



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
	<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
	<!-- 		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script> -->
	<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
	<!-- 		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		//    Datepicker
		$(function() {
			var dateFormat = "yy-mm-dd", from = $("#from").datepicker(
					{
						monthNamesShort : ["一", "二", "三", "四", "五", "六", "七",
								"八", "九", "十", "十一", "十二"],
						dayNamesMin : ["日", "一", "二", "三", "四", "五", "六"],
						defaultDate : "+1d",
						changeMonth : true,
						numberOfMonths : 1,
						dateFormat : "yy-mm-dd"
					}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
				console.log(this)
			}), to = $("#to").datepicker(
					{
						monthNamesShort : ["一", "二", "三", "四", "五", "六", "七",
								"八", "九", "十", "十一", "十二"],
						dayNamesMin : ["日", "一", "二", "三", "四", "五", "六"],
						defaultDate : "+1M",
						changeMonth : true,
						numberOfMonths : 1,
						dateFormat : "yy-mm-dd"
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