<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}

p {
	margin: 0.5% 2%;
}
</style>
<script src="<c:url value='/js/order/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/order/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/order/popper.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/js/order/bootstrap.min.js'/>" crossorigin="anonymous"></script>
</head>
<body>
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="../header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row">
					<div class="col-12">
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
							<div class="col-md-7 h2 col-xs-8">
									<div><c:out value="(${order.timeTable.version})"/> ${order.timeTable.movieName}</div>
									<div><c:out value="(${order.timeTable.version})"/> ${order.timeTable.movie.engMovieName}</div>
								</div>
							<div class="col-md-3 col-xs-12">
								<div>時間 ${order.timeTable.startDate} ${order.timeTable.startTime}</div>
								<div>影廳 ${order.timeTable.theater}</div>
								<div>
									座位 ${order.seatsString}
								</div>
							</div>

						</div>
						<div>
							<table class="table border" style="border-radius: 10px">
								<thead>
									<tr class="table-warning">
										<th>
											<div class="h2">
												<strong>訂單編號 : ${order.orderId}</strong>
											</div>
											<small class="text-muted" style="font-size: 14px">以下為此次訂單詳細資訊，請妥善保存訂單編號及訂購人資料以便日後查詢該筆訂單</small>
										</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>
											<div>付款狀態</div>
											<c:choose>
												<c:when test="${order.paid}">
													<h3 style="text-align: right; color: green">付款成功</h3>
												</c:when>
												<c:otherwise>
													<h3 style="text-align: right; color: red">付款失敗</h3>
												</c:otherwise>
											</c:choose>

										</td>
									</tr>

									<tr>
										<td>
											<div>訂購人</div>

											<p>姓名: ${order.ownerName}</p>
											<p>Email: ${order.ownerEmail}</p>
											<p>電話: ${order.ownerPhone}</p>

										</td>
									</tr>
									<tr>
										<td>
											<div>商品明細</div>
											<c:forEach var='item' items="${order.orderItems}">
												<p>${item.itemName}</p>
												<p style="text-align: right;">${item.priceDetail}</p>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>
											<div>總計</div>
											<p>
												<strong style="text-align: center;">${order.totalPrice}</strong>
											</p>

										</td>
									</tr>
									<c:if test="${order.paid}">
										<tr>
											<td>
												<div>取票狀態</div>
												<p style="text-align: right; color: red">未取票</p>
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row justify-content-end">
					<div class="col-md-auto col-12-mobile">
						<a>
							<button class="">再次訂票</button>
						</a>
					</div>
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/index'/>">
							<button>回首頁</button>
						</a>
					</div>
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