<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order Items</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}
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
	$(function() {
		$("#tab").tabs();
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
			<div class="container" style="width: 80%">
				<div class="row">
					<div class="col-md-4 order-md-2 order-sm-1">
						<div>
							<table class="table border">
								<thead>
									<tr style="text-align: center" class="table-secondary">
										<th>Member Info</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>帳號： ${LoginOK.email}</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
					<div class="col-md-8 order-md-1 order-sm-2">
						<div id="movie-info" class="row mb-2">
							<div class="col-md-2">
								<span>電影分級</span>
							</div>
							<div class="col-md-6 h2">電影名稱 ${order.timeTable.movieName}</div>
							<div class="col-md-4">
								<div>時間 ${order.timeTable.startTime}</div>
								<div>影廳 ${order.timeTable.theater}</div>
								<div>
									座位
									<c:forEach var="seat" items="${seats}"> ${seat}</c:forEach>
								</div>
							</div>
						</div>
						<div style="color: white; background-color: grey;" class="my-3 py-2">
							<div class="h2" style="text-align: center">訂單明細</div>
							<p style="text-align: center">請再次確認以下商品名稱、價格及數量</p>
						</div>
						<div>
							<table class="table border">
								<thead>
									<tr style="text-align: center" class="table-secondary">
										<th>Order List</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var='item' items="${order.orderItems}">
										<tr>
											<td>
												<div>${item.itemName}</div>
												<div class="float-right">${item.unitPrice}X${item.quantity}=${item.sumPrice}</div>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td>
											<div>
												<b>Total</b>
											</div>
											<div class="float-right">
												<b>${order.totalPrice}</b>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="color: white; background-color: grey;" class="my-3 py-2">
							<div class="h2" style="text-align: center">請選擇付款身份</div>
							<p style="text-align: center">欲以會員身份付款請先登入</p>
						</div>
						<div>
							<div id="tab">
								<div>
									<ul>
										<li style="border-top-left-radius: 20px;"><a href="#member">會員</a></li>
										<li style="border-top-right-radius: 20px;"><a href="#guest">非會員</a></li>
									</ul>
								</div>

								<form method="POST" action="<spring:url value='/order/pay?idType=0'/>">
									<div id="member">
										<div class="form-group">
											<label for="memberName">Name</label> <input type="text" class="form-control" id="memberName" name="memberName"
												aria-describedby="m-nameHelp" value="${LoginOK.name}" readonly> <small id="m-nameHelp"
												class="form-text text-muted">會員姓名</small>
										</div>
										<div class="form-group">
											<label for="memberEmail">Email address</label> <input type="email" class="form-control" id="memberEmail"
												name="memberEmail" aria-describedby="m-emailHelp" value="${LoginOK.email}" readonly> <small
												id="m-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small>
										</div>
										<div class="form-group">
											<label for="memberPhone">Phone number</label> <input type="text" class="form-control" id="memberPhone"
												name="memberPhone" aria-describedby="m-phoneHelp" value="${LoginOK.phoneNum}" readonly> <small
												id="m-phoneHelp" class="form-text text-muted">作為查詢訂單時之驗證資訊</small>
										</div>
										<div class="form-group" style="text-align: center">
											<button id="btn-submit" class="btn-primary" type="submit">確認付款</button>
										</div>

									</div>
								</form>
								<form method="POST" action="<spring:url value='order/pay?idType=1'/>">
									<div id="guest">
										<div class="form-group">
											<label for="guestName">Name</label> <input type="text" class="form-control" id="guestName" name="guestName"
												aria-describedby="g-nameHelp" placeholder="Enter your name, please"> <small id="g-nameHelp"
												class="form-text text-muted">請輸入訂購人姓名</small>
										</div>
										<div class="form-group">
											<label for="guestEmail">Email address</label> <input type="email" class="form-control" id="guestEmail"
												name="guestEmail" aria-describedby="g-emailHelp" placeholder="Enter your email, please"> <small
												id="g-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small>
										</div>
										<div class="form-group">
											<label for="guestPhone">Phone number</label> <input type="text" class="form-control" id="guestPhone" name="guestPhone"
												aria-describedby="g-phoneHelp" placeholder="Enter your phone, please"> <small id="g-phoneHelp"
												class="form-text text-muted">作為查詢訂單時之驗證資訊</small>
										</div>
										<div class="form-group" style="text-align: center">
											<button id="btn-submit" class="btn-primary" type="submit">確認付款</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-between mt-5">
					<div class="col-md-auto col-12-mobile">
						<a><button class="btn-secondary">上一步</button></a>
					</div>
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/index'/>"><button class="btn-danger">取消</button></a>
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