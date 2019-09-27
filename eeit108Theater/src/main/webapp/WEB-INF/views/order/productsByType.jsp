<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" /> -->
<title>Products By Type</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<style>
/* #btn-submit { */
/* 	transition: 0.5s ease; */
/* } */

/* #btn-submit:hover { */
/* 	transition: 0.5s ease; */
/* } */
</style>
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
	//var ticketCnt = parseInt("0");
	const maxTicket = parseInt("10");
	$(function() {
		$("#tabs").tabs();
		$("td>input").spinner({
			spin : function(event, ui) {
				if (ui.value > 10) {
					$(this).spinner("value", 0);
					return false;
				} else if (ui.value < 0) {
					$(this).spinner("value", 10);
					return false;
				}
			}
		});

		$(".item").change(function() {
			//console.log($(this).attr("id"));
			//console.log($(this).val());
			var pname = $(this).attr("id");
			var pquantity = $(this).val();
			$.ajax({
				url : "<c:url value='/order/orderList'/>",
				data : {
					name : pname,
					quantity : pquantity
				},
				type : "POST",
				success : function(data) {
					$("#orderItems").html(data);
				}
			});
		});
		$(".ticket").change(function() {
			var id = "#" + $(this).attr("id");
			var newCnt = parseInt($(this).val());
			var ticketCnt = 0;
			$.each($(".ticket"), function() {
				ticketCnt += parseInt($(this).val());
			});
			console.log("ticketCnt = " + ticketCnt);
			console.log("this id = " + id);
			console.log("this value = " + $(id).val());
			console.log(newCnt);
			if (ticketCnt > maxTicket) {
				alert("上限10");
				newCnt = maxTicket - (ticketCnt - newCnt);
				console.log("from " + $(id).val());
				$(id).val(newCnt);
				console.log("change to " + $(id).val());
				var pname = $(this).attr("id");
				var pquantity = $(this).val();
				$.ajax({
					url : "<c:url value='/order/orderList'/>",
					data : {
						name : pname,
						quantity : pquantity
					},
					type : "POST",
					success : function(data) {
						$("#orderItems").html(data);
					}
				});
				$("#ticketCnt").val(maxTicket);
			} else {
				$("#ticketCnt").val(ticketCnt);
			}
			if (parseInt($("#ticketCnt").val()) >= 1) {
				$("#btn-submit").removeClass("disabled");
				$("#btn-submit").prop("disabled", false);
			} else {
				$("#btn-submit").addClass("disabled");
				$("#btn-submit").prop("disabled", true);
			}
		});

	});
</script>
</head>
<body class="right-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="../header.jsp" />

		</div>
		<!-- Main -->
		<div class="wrapper style1">
			<div class="container">
				<form action="<c:url value='/order/seat'/>" method="POST">
					<div class="row">
						<div class="col-md-4 order-md-2 order-sm-1">
							<div>
								<table class="table border">
									<thead>
										<tr style="text-align: center" class="table-secondary">
											<th scope="col">會員</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty LoginOK}">
											<tr style="text-align: center">
												<td>尚未登入</td>
											</tr>
											<tr style="text-align: center">
												<td>
													<a href="<c:url value='/memberservice'/>">
														<button type="button">登入</button>
													</a>
												</td>
											</tr>
										</c:if>
										<c:if test="${not empty LoginOK}">
											<tr>
												<td>Hi: ${LoginOK.name}</td>
											</tr>
											<tr>
												<td>帳號: ${LoginOK.email}</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							<div class="mt-5">
								<table class="table border" id="orderList">
									<thead>
										<tr style="text-align: center" class="table-secondary">
											<th>Order List</th>
										</tr>
									</thead>
									<tbody id="orderItems">
										<!-- 										<tr> -->
										<!-- 											<td>primary</td> -->
										<!-- 										</tr> -->
										<c:forEach var='item' items="${order.orderItems}">
											<tr>
												<td>
													<div>${item.itemName}</div>
													<div class="float-right">${item.unitPrice}x${item.quantity}=${item.sumPrice}</div>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td>
												<div>
													<strong>Total</strong>
												</div>
												<div class="float-right">${order.totalPrice == null ? 0:order.totalPrice}</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-8 order-md-1 order-sm-2">
							<div id="movie-info" class="row mb-3">

								<div class="col-md-2 col-xs-4">
									<div>電影分級</div>
									<div>${order.timeTable.movie.rating}</div>
								</div>
								<div class="col-md-6 h2 col-xs-8">
									<div>${order.timeTable.movieName}</div>
									<div>${order.timeTable.movie.engMovieName}</div>
								</div>
								<div class="col-md-4 col-xs-12">
									<div>時間 ${order.timeTable.startDate} ${order.timeTable.startTime}</div>
									<div>影廳 ${order.timeTable.theater}</div>
								</div>
							</div>
							<div id="tabs">
								<ul>
									<li>
										<a href="#tabs-1">票種</a>
									</li>
									<li>
										<a href="#tabs-2">食物</a>
									</li>
									<li>
										<a href="#tabs-3">飲料</a>
									</li>
								</ul>
								<div id="tabs-1">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="w-50">票種</th>
												<th scope="col" class="w-30">價格</th>
												<th scope="col" class="w-20">數量</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ticket" items="${tickets}">
												<tr>
													<td>${ticket.name}</td>
													<td>$ ${ticket.price}</td>
													<td>
														<select class="item ticket custom-select" id="${ticket.name}" name="${ticket.name}">
															<option value="0" selected>0</option>
															<c:forEach var="index" begin="1" end="10">
																<option value="${index}">${index}</option>
															</c:forEach>
														</select>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<input type="text" class="" id="ticketCnt" name="ticketCnt" hidden="true" />
								</div>
								<div id="tabs-2">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="w-50">品項</th>
												<th scope="col" class="w-30">價格</th>
												<th scope="col" class="w-20">數量</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="food" items="${foods}">
												<tr>
													<td>${food.name}</td>
													<td>$ ${food.price}</td>
													<td>
														<select class="item custom-select" id="${food.name}" name="${food.name}">
															<option value="0" selected>0</option>
															<c:forEach var="index" begin="1" end="10">
																<option value="${index}">${index}</option>
															</c:forEach>
														</select>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="tabs-3">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="w-50">品項</th>
												<th scope="col" class="w-30">價格</th>
												<th scope="col" class="w-20">數量</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="drink" items="${drinks}">
												<tr>
													<td>${drink.name}</td>
													<td>$ ${drink.price}</td>
													<td>
														<%-- 												<input class="item" id="${drink.name}" name="${drink.name}"> --%>
														<select class="item custom-select" id="${drink.name}" name="${drink.name}">
															<option value="0" selected>0</option>
															<c:forEach var="index" begin="1" end="10">
																<option value="${index}">${index}</option>
															</c:forEach>
														</select>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div>
							<label for="rowCnt"></label>
							<input type="text" id="rowCnt" name="rowCnt" value="15">
						</div>
						<div>
							<label for="aZoneCnt"></label>
							<input type="text" id="aZoneCnt" name="aZoneCnt" value="5">
						</div>
						<div>
							<label for="bZoneCnt"></label>
							<input type="text" id="bZoneCnt" name="bZoneCnt" value="15">
						</div>
						<div>
							<label for="zoneNum"></label>
							<select id="zoneNum" name="zoneNum">
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>

					</div>
					<div class="row mt-5">
						<div class="col-md-12">
							<input id="btn-submit" class="btn float-right disabled" type="submit" value="Submit" disabled>
						</div>
					</div>
				</form>
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