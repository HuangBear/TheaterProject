<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
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
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container" style="width: 80%">
		<div class="row">
			<div class="col-12">
				<div id="movie-info" class="row mb-3">
					<div class="col-md-2">
						<span>電影分級</span>
					</div>
					<div class="col-md-6">
						<h3>電影名稱 ${order.timeTable.movieName}</h3>
					</div>
					<div class="col-md-4">
						<div>時間 ${order.timeTable.startTime}</div>
						<div>片長${order.timeTable.duration}</div>
						<div>影廳 ${order.timeTable.theater}</div>
					</div>
				</div>
				<div>
					<table class="table border">
						<thead>
							<tr>
								<th>訂單資訊</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>訂購人姓名: ${order.ownerName}</td>
							</tr>
							<tr>
								<td>訂購人Email: ${order.ownerEmail}</td>
							</tr>
							<tr>
								<td>訂購人電話: ${order.ownerPhone}</td>
							</tr>
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
									<div>座位</div>
									<div class="float-right"><c:forEach var="seat" items="${order.seats}"> ${seat.seatString}</c:forEach></div>

								</td>
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
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-lg-2">
				<button class="btn btn-primary">回首頁</button>
				<button class="btn btn-primary">再次訂票</button>
			</div>
		</div>
	</div>


</body>
</html>