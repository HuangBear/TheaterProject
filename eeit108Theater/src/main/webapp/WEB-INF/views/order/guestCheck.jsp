<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 購票記錄</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" />


<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>




<script>
	var tab = "Tab";
	var checked = false;
	var speed = 300;
	var cNow = 0;
	var unNow = 0;
	$(function() {
		$("#checkedTab").accordion({
			collapsible : true
		});
		$("#uncheckedTab").accordion({
			collapsible : true
		});
		$("#checkedTab").slideUp(0);
		//$("#checkedTab").slideUp(0);
		$(".tabCtrl").click(
				function() {
					var id = $(this).attr("id");
					if ((checked && id == "checked")
							|| (!checked && id == "unchecked")) {
						console.log("!!");

					} else {

						if (checked) {
							cNow = $("#checkedTab").accordion("option",
									"active");
							$("#checkedTab").accordion("option", "active",
									false);
							$("#checkedTab").slideUp(
									speed,
									function() {
										if (unNow == false) {
											$("#uncheckedTab").accordion(
													"option", "active", 0);
										} else {
											$("#uncheckedTab").accordion(
													"option", "active", unNow);
										}
										$("#uncheckedTab").slideDown(speed);
									});
						} else {
							unNow = $("#uncheckedTab").accordion("option",
									"active");
							$("#uncheckedTab").accordion("option", "active",
									false);
							$("#uncheckedTab").slideUp(
									speed,
									function() {
										if (cNow == false) {
											$("#checkedTab").accordion(
													"option", "active", 0);
										} else {
											$("#checkedTab").accordion(
													"option", "active", cNow);
										}
										$("#checkedTab").slideDown(speed);
									});
						}
						checked = !checked;
					}
				});
	});
</script>


<style>
.iconimg {
	height: 25px;
	width: 28px;
	vertical-align: middle;
}

.container a {
	cursor: pointer;
}

#button-group input {
	margin: 0 5%;
}

.errMsg {
	padding-left: 2%;
	color: red;
	opacity: 0.8;
}
</style>

</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="../header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-12" style="text-align: center">
						<h3>非會員查詢</h3>
						<p style="text-align: center">請輸入欲查詢訂單之相關資訊</p>
					</div>
					<div class="col-2"></div>
					<form class="col-8" action="<c:url value='/order/guest'/>" method="POST">
						<div class="row">
							<div class="col-12">
								<label for="email">信箱：</label>
								<input id="email" name="email" type="email" placeholder="請輸入訂票時輸入的信箱" pattern="^\w+@\w+\.[a-z]{2,}$" required/>
								<p class="errMsg">${errMsg.email} </p>
							</div>
							<div class="col-12" style="margin-top: 5%;">
								<label for="phone">電話：</label>
								<input id="phone" name="phone" type="text" placeholder="請輸入訂票時輸入的電話號碼" onKeyUp="value=value.replace(/\D/g,'')" onchange="value=value.replace(/\D/g,'')" maxlength="10" required/>
								<p class="errMsg">${errMsg.phone} </p>
							</div>
						</div>
						<div class="row" id="button-group" style="margin-top: 8%;">
							<div class="col-6" style="text-align: left">
								<a href="<c:url value='/memberservice'/>"><input type="button" value="登入/註冊"></a>
							</div>
							<div class="col-6" style="text-align: right">
								<input type="submit" value="查詢">
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

		<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	</div>
	<!-- Scripts -->
	<%-- 	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script> --%>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrolly.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrollex.min.js'/>"></script>
	<script src="<c:url value='/assets/js/browser.min.js'/>"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js'/>"></script>
	<script src="<c:url value='/assets/js/util.js'/>"></script>
	<script src="<c:url value='/assets/js/main.js'/>"></script>
</body>
</html>