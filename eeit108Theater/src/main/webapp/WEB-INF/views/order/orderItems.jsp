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
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}

.btn-danger {
	opacity: 0.85;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#identity").tabs();
	});
</script>
</head>
<body>
	<div class="container" style="width: 80%">
		<div class="row">
			<div class="col-md-3 order-md-2 order-sm-1">
				<table class="table border">
					<thead>
						<tr style="text-align: center">
							<th scope="col">會員資料</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Member Name: ${loginMember.name}</td>
						</tr>
						<tr>
							<td>Member Email: ${loginMember.email}</td>
						</tr>
						<tr>
							<td>Member Id: ${loginMember.memberId}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-9 order-md-1 order-sm-2">
				<div id="movie-info" class="row mb-3">
					<div class="col-md-2">
						<span>電影分級</span>
					</div>
					<div class="col-md-6">
						<h3>電影名稱 ${order.timeTable.movieName}</h3>
					</div>
					<div class="col-md-4">
						<div>時間 ${order.timeTable.startTime}</div>
						<div>影廳 ${order.timeTable.theater}</div>
						<div>
							座位
							<c:forEach var="seat" items="${seats}"> ${seat}</c:forEach>
						</div>
					</div>
				</div>
				<div>
					<table class="table border">
						<thead>
							<tr style="text-align: center">
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
									<div class="float-right"><b>${order.totalPrice}</b></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div id="identity">
						<div>
							<ul>
								<li style="border-top-left-radius: 20px;"><a href="#member">會員</a></li>
								<li style="border-top-right-radius: 20px;"><a href="#guest">非會員</a></li>
							</ul>
						</div>
						
						<form method="POST" action="<spring:url value='/order/pay?idType=0'/>">
							<div id="member">
								<div class="form-group">
									<label for="memberName">Name</label>
									<input type="text" class="form-control" id="memberName" name="memberName" aria-describedby="m-nameHelp" value="${loginMember.name}" readonly>
									<small id="m-nameHelp" class="form-text text-muted">會員姓名</small>
								</div>
								<div class="form-group">
									<label for="memberEmail">Email address</label>
									<input type="email" class="form-control" id="memberEmail" name="memberEmail" aria-describedby="m-emailHelp" value="${loginMember.email}"
										readonly>
									<small id="m-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small>
								</div>
								<div class="form-group">
									<label for="memberPhone">Phone number</label>
									<input type="text" class="form-control" id="memberPhone" name="memberPhone" aria-describedby="m-phoneHelp" value="${loginMember.phoneNum}"
										readonly>
									<small id="m-phoneHelp" class="form-text text-muted">作為查詢訂單時之驗證資訊</small>
								</div>
								<div class="form-group justify-content-center" style="text-align: center">
									<button class="btn btn-primary" type="submit">付款</button>
								</div>

							</div>
						</form>
						<form method="POST" action="order/pay?idType=1">
							<div id="guest">
								<div class="form-group">
									<label for="guestName">Name</label>
									<input type="text" class="form-control" id="guestName" name="guestName" aria-describedby="g-nameHelp"
										placeholder="Enter your name, please">
									<small id="g-nameHelp" class="form-text text-muted">請輸入訂購人姓名</small>
								</div>
								<div class="form-group">
									<label for="guestEmail">Email address</label>
									<input type="email" class="form-control" id="guestEmail" name="guestEmail" aria-describedby="g-emailHelp"
										placeholder="Enter your email, please">
									<small id="g-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small>
								</div>
								<div class="form-group">
									<label for="guestPhone">Phone number</label>
									<input type="text" class="form-control" id="guestPhone" name="guestPhone" aria-describedby="g-phoneHelp"
										placeholder="Enter your phone, please">
									<small id="g-phoneHelp" class="form-text text-muted">作為查詢訂單時之驗證資訊</small>
								</div>
								<div class="form-group justify-content-center" style="text-align: center">
									<button class="btn btn-primary" type="submit">付款</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-lg-2">
				<button class="btn btn-secondary" type="">上一步</button>
				<button class="btn btn-danger" style="color: white;">取消</button>
			</div>
		</div>
	</div>



</body>
</html>