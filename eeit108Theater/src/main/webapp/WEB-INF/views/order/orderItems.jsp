<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order Items</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container" style="width: 80%">
		<form action="<c:url value='/order/seat'/>" method="POST">
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
							<div>座位
								<c:forEach var="seat" items="${seats}"> ${seat}</c:forEach>
							</div>
						</div>
					</div>
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
									<div class="float-right">${order.totalPrice}</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-auto float-right">
					<button class="btn btn-secondary" type="submit">確認</button>
					<a class="btn" href="<c:url value='/order/showProducts'/>">返回</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>