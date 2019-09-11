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
	<div class="container">
		<div class="row">
			<table class="table">
				<caption>會員資料</caption>
				<thead>
					<tr>
						<th scope="col">姓名</th>
						<th scope="col">Email</th>
						<th scope="col">生分證字號</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${loginMember.memberName}</td>
						<td>${loginMember.email}</td>
						<td>${loginMember.memberId}</td>

					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">名稱</th>
						<th scope="col">單價</th>
						<th scope="col">數量</th>
						<th scope="col">小計</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="items" items="${orderItems}">
						<tr>
							<td>${items.itemName}</td>
							<td>$ ${items.unitPrice}</td>
							<td>${items.quantity}</td>
							<td>${items.sumPrice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">名稱</th>
						<th scope="col">單價</th>
						<th scope="col">數量</th>
						<th scope="col">小計</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="items" items="${order.orderItems}">
						<tr>
							<td>${items.itemName}</td>
							<td>$ ${items.unitPrice}</td>
							<td>${items.quantity}</td>
							<td>${items.sumPrice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>