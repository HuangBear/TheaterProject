<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products By Type</title>
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />


<style>
.previous {
	padding: 0.65em 3em;
	border-radius: 0.5em;
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
	const maxTicket = parseInt("10");
	var ticketCnt = 0;
	var chosenDiscount = ${empty chosenDiscount? 0 : chosenDiscount.no};
	$(function() {
		$.each($(".ticket"), function() {
			ticketCnt += parseInt($(this).val());
		});
		$("#ticketCnt").val(ticketCnt);
		if (parseInt($("#ticketCnt").val()) >= 1) {
			$("#btn-submit").removeClass("disabled");
			$("#btn-submit").prop("disabled", false);
		}
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
			var pname = $(this).attr("id");
			var pquantity = $(this).val();
			ticketCnt = 0;
			$.each($(".ticket"), function() {
				ticketCnt += parseInt($(this).val());
			});
			$.ajax({
				url : "<c:url value='/order/orderList'/>",
				data : {
					ticketCnt : ticketCnt,
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
			ticketCnt = 0;
			$.each($(".ticket"), function() {
				ticketCnt += parseInt($(this).val());
			});
			$("#ticketCnt").val(ticketCnt);
			if (ticketCnt > maxTicket) {
				alert("上限10");
				newCnt = maxTicket - (ticketCnt - newCnt);
				$("#ticketCnt").val(maxTicket);
				//console.log("from " + $(id).val());
				$(id).val(newCnt);
				//console.log("change to " + $(id).val());
				var pname = $(this).attr("id");
				var pquantity = $(this).val();
				var ticketCnt = $("#ticketCnt").val();
				$.ajax({
					url : "<c:url value='/order/orderList'/>",
					data : {
						name : pname,
						quantity : pquantity,
						ticketCnt : ticketCnt
					},
					type : "POST",
					success : function(data) {
						$("#orderItems").html(data);
					}
				});

			}
			if (parseInt($("#ticketCnt").val()) >= 1) {
				$("#btn-submit").removeClass("disabled");
				$("#btn-submit").prop("disabled", false);
			} else {
				$("#btn-submit").addClass("disabled");
				$("#btn-submit").prop("disabled", true);
			}
		});
		$("#discount"+chosenDiscount).prop("select", true);
		$("#chosenDiscount").change(function(){
			$.ajax({
				url : "<c:url value='/order/calDiscount'/>",
				data : {
					chosenDiscount : $("#chosenDiscount").val()
				},
				type : "POST",
				success : function(data){
					$("#orderItems").html(data);
				}
			});
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
								<table class="table border" style="text-align: center">
									<thead>
										<tr class="table-secondary">
											<th scope="col">會員</th>
										</tr>
									</thead>
									<tbody>
										<%-- 									if no login --%>
										<c:if test="${empty LoginOK}">
											<tr>
												<td>
													<div>尚未登入</div>
													<div style="opacity: 0.6;">
														趕快加入/登入會員<br>來享有會員專屬優惠吧！
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<a href="<c:url value='/memberservice'/>">
														<button type="button">登入/註冊</button>
													</a>
												</td>
											</tr>
										</c:if>
										<%-- 									if login --%>
										<c:if test="${not empty LoginOK}">
											<tr style="text-align: left">
												<td id="LoginOK">您好: ${LoginOK.name}</td>
											</tr>

											<%-- 									if no available discount --%>
											<c:if test="${empty discounts}">
												<tr>
													<td style="opacity: 0.6;">現在尚無優惠</td>
												</tr>
											</c:if>
											<%-- 									if there are available discounts --%>
											<c:if test="${not empty discounts}">
												<tr>
													<td>
														<select id="chosenDiscount" name="chosenDiscount">
															<option id="discount0" value="0" selected>無</option>
															<c:forEach var="discount" items="${discounts}">
																<option id="discount${discount.no}" value="${discount.no}">${discount.pay}${discount.discountTickBuy}${discount.discountPriceBuy}${discount.free}${discount.discountTickFree}${discount.discountPriceFree}</option>
															</c:forEach>
														</select>
													</td>
												</tr>
											</c:if>
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
										(
										<c:out value="${order.timeTable.version}" />
										) ${order.timeTable.movieName}
									</div>
									<div>
										(
										<c:out value="${order.timeTable.version}" />
										) ${order.timeTable.movie.engMovieName}
									</div>
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
														<c:if test="${not empty order.itemsMap[ticket.name]}">
															<select class="ticket item custom-select" id="${ticket.name}" name="${ticket.name}">
																<c:forEach var="index" begin="0" end="10">
																	<c:if test="${order.itemsMap[ticket.name].quantity == index}">
																		<option value="${index}" selected>${index}</option>
																	</c:if>
																	<c:if test="${order.itemsMap[ticket.name].quantity != index}">
																		<option value="${index}">${index}</option>
																	</c:if>
																</c:forEach>
															</select>
														</c:if>
														<c:if test="${empty order.itemsMap[ticket.name]}">
															<select class="ticket item custom-select" id="${ticket.name}" name="${ticket.name}">
																<option value="0" selected>0</option>
																<c:forEach var="index" begin="1" end="10">
																	<option value="${index}">${index}</option>
																</c:forEach>
															</select>
														</c:if>
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
											<c:forEach var="item" items="${foods}">
												<tr>
													<td>${item.name}</td>
													<td>$ ${item.price}</td>
													<td>
														<c:if test="${not empty order.itemsMap[ticket.name]}">
															<select class="item custom-select" id="${item.name}" name="${item.name}">
																<c:forEach var="index" begin="0" end="10">
																	<c:if test="${order.itemsMap[item.name].quantity == index}">
																		<option value="${index}" selected>${index}</option>
																	</c:if>
																	<c:if test="${order.itemsMap[item.name].quantity != index}">
																		<option value="${index}">${index}</option>
																	</c:if>
																</c:forEach>
															</select>
														</c:if>
														<c:if test="${empty order.itemsMap[item.name]}">
															<select class="item custom-select" id="${item.name}" name="${item.name}">
																<option value="0" selected>0</option>
																<c:forEach var="index" begin="1" end="10">
																	<option value="${index}">${index}</option>
																</c:forEach>
															</select>
														</c:if>
														<%-- 														<select class="item custom-select" id="${food.name}" name="${food.name}"> --%>
														<!-- 															<option value="0" selected>0</option> -->
														<%-- 															<c:forEach var="index" begin="1" end="10"> --%>
														<%-- 																<option value="${index}">${index}</option> --%>
														<%-- 															</c:forEach> --%>
														<!-- 														</select> -->
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
											<c:forEach var="item" items="${drinks}">
												<tr>
													<td>${item.name}</td>
													<td>$ ${item.price}</td>
													<td>
														<c:if test="${not empty order.itemsMap[ticket.name]}">
															<select class="item custom-select" id="${item.name}" name="${item.name}">
																<c:forEach var="index" begin="0" end="10">
																	<c:if test="${order.itemsMap[item.name].quantity == index}">
																		<option value="${index}" selected>${index}</option>
																	</c:if>
																	<c:if test="${order.itemsMap[item.name].quantity != index}">
																		<option value="${index}">${index}</option>
																	</c:if>
																</c:forEach>
															</select>
														</c:if>
														<c:if test="${empty order.itemsMap[item.name]}">
															<select class="item custom-select" id="${item.name}" name="${item.name}">
																<option value="0" selected>0</option>
																<c:forEach var="index" begin="1" end="10">
																	<option value="${index}">${index}</option>
																</c:forEach>
															</select>
														</c:if>
														<%-- 														<select class="item custom-select" id="${drink.name}" name="${drink.name}"> --%>
														<!-- 															<option value="0" selected>0</option> -->
														<%-- 															<c:forEach var="index" begin="1" end="10"> --%>
														<%-- 																<option value="${index}">${index}</option> --%>
														<%-- 															</c:forEach> --%>
														<!-- 														</select> -->
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row" hidden="true">
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
					<div class="row justify-content-between mt-5">
						<div class="col-md-auto col-12-mobile">
							<a href="<c:url value='/order/cancel'/>">
								<button id="previous" class="btn btn-danger previous" type="button">取消</button>
							</a>
						</div>
						<div class="col-md-auto col-12-mobile">
							<input id="btn-submit" class="btn disabled" type="submit" value="下一步" disabled>
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