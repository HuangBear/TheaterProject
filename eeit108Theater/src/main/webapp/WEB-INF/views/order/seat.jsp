<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>選擇座位</title>
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.previous {
	padding: 0.65em 3em;
	border-radius: 0.5em;
}

/* .sold-label { */
/* 	background-color: rgb(255, 78, 78); */
/* 	border-color: rgb(255, 0, 0); */
/* 	opacity: 1; */
/* } */
label.sold {
	background-color: rgb(255, 78, 78);
	border-color: rgb(255, 0, 0);
	opacity: 1;
}

label.preserve {
            background-color: rgb(255, 214, 78);
            border-color: rgb(255, 196, 0);
            opacity: 1;
}

.table-seat tr {
	line-height: 30px;
}

td{
 width:25px;
}

.table-seat label {
	padding: 10px;
}

.side-bar {
	position: absolute;
	top: 0;
	height: 100%;
}

form label {
	margin: auto;
}
.ui-state-disabled{
	opacity:1;
}
#btn-submit {
	transition: 0.5s ease;
}
</style>
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="<c:url value='/js/order/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/order/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/order/popper.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/js/order/bootstrap.min.js'/>" crossorigin="anonymous"></script>

<script>
	var SelectedSeat = [];
	var MAX = ${order.ticketCnt};
	var labelChecked = "ui-checkboxradio-checked ";
	var labelActive = "ui-state-active ";
	var labelDisabled = "ui-checkboxradio-disabled "
	$(function() {
		$(".nullSeat").html("");
		$(".nullSeat").attr("title", "");
		$("input[name='seat']").checkboxradio({
			icon : false
		});
		$("input.notSale").checkboxradio({
			icon : false,
			disabled : true
		});

		$("input[name='seat']").filter("input[class != 'sold']").click(
				function() {
					var id = $(this).attr("id");
					if (SelectedSeat.indexOf(id) != -1) { //if this is in the selectedSeat, means that user don't want to select it now
						SelectedSeat.splice(SelectedSeat.indexOf(id), 1);
					} else {
						SelectedSeat.push($(this).attr("id"));
						if (SelectedSeat.length > MAX) {
							$("#" + SelectedSeat[0]).prop("checked", false);
							$("[for='" + SelectedSeat[0] + "']").removeClass(
									labelChecked + labelActive);
							SelectedSeat.splice(0, 1);
						}
					}
					if (SelectedSeat.length > MAX) {
						console.log("Something WRONG!!!");
					} else if (SelectedSeat.length == MAX) {
						$("#btn-submit").removeClass("disabled");
						$("#btn-submit").prop("disabled", false);
					} else {
						$("#btn-submit").addClass("disabled");
						$("#btn-submit").prop("disabled", true);
					}
				});
		$("#btn-submit").click(function() {
			$("#seatForm").submit();
		});

	});
</script>
</head>

<body class="right-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="../header.jsp" />

		</div>
		<!-- Main -->
		<div class="wrapper style1">
			<div class="container">
				<div class="row">
					<div class="col-md-4 order-md-2 order-sm-1">
						<jsp:include page="orderSidebar.jsp" />
					</div>
					<div class="col-md-8 order-md-1 order-sm-2">
						<form id="seatForm" action="<c:url value='/order/makeOrder'/>" method="POST">
							<div id="movie-info" class="row mb-3">
								<div class="col-md-2 col-xs-4">
									<div class="border rounded overflow-hidden">
										<c:choose>
											<c:when test="${order.timeTable.movie.rating == '普遍級'}">
												<div style="text-align: center; color: white" class="bg-success">G 0+</div>
											</c:when>
											<c:when test="${order.timeTable.movie.rating == '保護級'}">
												<div style="text-align: center; color: white" class="bg-primary">P 6+</div>
											</c:when>
											<c:when test="${order.timeTable.movie.rating == '輔導級'}">
												<div style="text-align: center; color: white" class="bg-warning">PG 12+</div>
											</c:when>
											<c:when test="${order.timeTable.movie.rating == '限制級'}">
												<div style="text-align: center; color: white" class="bg-warning">R 18+</div>
											</c:when>
										</c:choose>
										<div style="text-align: center;">${order.timeTable.movie.rating}</div>
									</div>
								</div>
								<div class="col-md-6 h3 col-xs-8">
									<div>
										<c:out value="(${order.timeTable.version})" />
										${order.timeTable.movieName}
									</div>
									<div style="opacity: 0.6;">
										<c:out value="(${order.timeTable.version})" />
										${order.timeTable.movie.engMovieName}
									</div>
								</div>
								<div class="col-md-4 col-xs-12">
									<div>時間 ${order.timeTable.startDate} ${order.timeTable.startTime}</div>
									<div>影廳 ${order.timeTable.theater}</div>
								</div>
							</div>
							<div style="color: white; background-color: grey;">
								<div class="h2" style="text-align: center">選擇座位</div>
								<c:if test="${not empty seatSoldErr}">
									<p style="text-align: center; color: red;">${seatSoldErr}</p>
								</c:if>
								<p style="text-align: center">請選擇${order.ticketCnt}個座位</p>
							</div>
<!-- 							<div class="overflow-auto"> -->
								<jsp:include page="theaterStatus.jsp"/>
<!-- 							</div> -->
						</form>
					</div>
				</div>
				<div class="row justify-content-between mt-5">
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/order/showProducts?time=${order.timeTable.no}'/>">
							<button class="btn btn-secondary previous" type="button">上一步</button>
						</a>
					</div>
					<div class="col-md-auto col-12-mobile">
						<input id="btn-submit" class="btn disabled" type="button" value="下一步" disabled>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	</div>
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